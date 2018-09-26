using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using HotelDBApp;
using System.Data;
using System.Globalization;
using System.Web.Script.Serialization;
using Newtonsoft.Json;

namespace FinalHotelProject.Admin.production.Services
{
    /// <summary>
    /// Summary description for Reports
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Reports : System.Web.Services.WebService
    {
        private Dictionary<string, string> dict = new Dictionary<string, string>() { { "feedback", "spFetchFeedbackForDonut" }, { "problem", "spFetchProblemsForDonut" } };
        private Dictionary<string, DateTime[]> dictDaeTimeMapping = new Dictionary<string, DateTime[]>()
        {
            { "month",new DateTime[]{DateTime.Now.AddMonths(-1), DateTime.Now } },
            { "week",new DateTime[]{DateTime.Now.AddDays(-7), DateTime.Now } },
            { "year",new DateTime[]{DateTime.Now.AddYears(-1), DateTime.Now } }
        };
        [WebMethod]
        public HotelDBApp.ChartData GetReviews(string selection,String id)
        {
            dynamic MyLabels = GetLabels(selection);
            DataSet ds=Feedback.FetchFeedbackById(id, MyLabels.Start, MyLabels.End);
            Dictionary<string, int> dicGood = new Dictionary<string, int>();
            Dictionary<string, int> dicBad = new Dictionary<string, int>();
            if (!string.IsNullOrEmpty(id))
            {
                foreach (string label in MyLabels.Labels)
                {
                    if (!String.IsNullOrEmpty(label))
                    {
                        dicGood[label] = ds.Tables[0].AsEnumerable().Where(x => DateTime.Parse(x["ReviewTime"].ToString()).ToString(MyLabels.LabelFormat) == label && int.Parse(x["Rating"].ToString()) > 3).Count();
                        dicBad[label] = ds.Tables[0].AsEnumerable().Where(x => DateTime.Parse(x["ReviewTime"].ToString()).ToString(MyLabels.LabelFormat) == label && int.Parse(x["Rating"].ToString()) <= 3).Count();
                    }

                    //dicGood[label] = (from row in ds.Tables[0].AsEnumerable()
                    //where DateTime.Parse(row["ReviewTime"].ToString()).ToString(LabelFormat) == label
                    //select row).Count();
                }
                /*Dictionary<string, string[]> result = new Dictionary<string, string[]>()
                {
                    {"data",dic.Values.ToArray() },
                    {"label",dic.Keys.ToArray() }
                };*/
                //HotelDBApp.ChartData data=new HotelDBApp.ChartData() { Data = dic.Values.ToArray(), Labels = dic.Keys.ToArray() };

                //return new JavaScriptSerializer().Serialize(data);
                return new HotelDBApp.ChartData() { Data = dicGood.Values.ToArray(), Data2 = dicBad.Values.ToArray(), Labels = dicGood.Keys.ToArray() };
            }
            else return null;
            


        }
        
        [WebMethod]
        public HotelDBApp.ChartData GetProblemsDonut(string id,string selection)
        {
            return donutHelper(id, selection, dict["problem"]);
        }
        [WebMethod]
        public HotelDBApp.ChartData GetFeedbackDonut(string id, string selection)
        {
            return donutHelper(id, selection, dict["feedback"]);
        }
        private ChartData donutHelper(string id, string selection,string storedProc)
        {
            DateTime startdate = DateTime.Now;
            if (selection == "month")
            {
                startdate = DateTime.Now.AddMonths(-1);
            }
            int.TryParse(id, out int res);
            DataTable dt = Incedent.GetProblemsCount(res, startdate, storedProc).Tables[0];
            ChartData data = new ChartData()
            {
                Colors = dt.AsEnumerable().Select((x) => x["color"].ToString()).ToArray(),
                Labels = dt.AsEnumerable().Select((x) => x["type"].ToString()).ToArray(),
                Data = dt.AsEnumerable().Select((x) => int.Parse(x["count"].ToString())).ToArray()
            };
            return data;
        }
        [WebMethod]
        public List<Incedent> GetProblems(string id)
        {
            DataSet ds = null;
            if (int.TryParse(id,out int convertedId))
            {
                ds = Incedent.FetchProblems(convertedId);
            }
            List<Incedent> incedents = ds.Tables[0].AsEnumerable()
                .Select(x =>
                new Incedent()
                {
                    RoomNo = x["RoomNo"].ToString(),
                    IncedentTime = DateTime.Parse(x["IncedentTime"].ToString()),
                    IncedentTypeStr = x["Type"].ToString(),
                    FeedbackStr = x["Problem"].ToString(),
                    IncedentDescription = x["IncedentDescription"].ToString(),
                    IsSolved = bool.Parse(x["IsResolved"].ToString()),
                    IncedentID=x["IncedentID"].ToString()
                }).ToList<Incedent>();
            //string result = JsonConvert.SerializeObject(DatatableToDictionary(ds, "Title"), Newtonsoft.Json.Formatting.Indented);
            return incedents;
        }
        [WebMethod]
        public dynamic GetProblemsStarCounts(string id,string selection)
        {
            int.TryParse(id, out int hotelid);
            if (dictDaeTimeMapping.Keys.Contains(selection))
            {
                DateTime end = dictDaeTimeMapping[selection][1];
                DateTime start = dictDaeTimeMapping[selection][0];
                return Incedent.FetchPRoblemForReport(hotelid, start, end);
            }
            else return null;

        }
        [WebMethod]
        public dynamic GetProblemsCountForAPeriod(string id,string selection)
        {
            dynamic MyLabels = GetLabels(selection);
            int.TryParse(id, out int hotelid);
            DataSet ds = Incedent.GetProblemsFromDateRange(hotelid, MyLabels.Start,MyLabels.End);
            Dictionary<string, int> dictMappedDateAndProblems = new Dictionary<string, int>();

            foreach (string label in MyLabels.Labels)
            {
                if (!String.IsNullOrEmpty(label))
                {
                    int count = ds.Tables[0].AsEnumerable().Where(x => x.Field<DateTime>("date").ToString(MyLabels.LabelFormat) == label).Select(x => x.Field<int>("count")).Count();
                    int numberToBeAdded = count == 0 ? 0 : ds.Tables[0].AsEnumerable().Where(x => x.Field<DateTime>("date").ToString(MyLabels.LabelFormat) == label).Select(x => x.Field<int>("count")).First();
                    dictMappedDateAndProblems.Add(label, numberToBeAdded);

                    //int? count = ds.Tables[0].AsEnumerable().Where(x => DateTime.Parse(x["date"].ToString()).ToString(MyLabels.LabelFormat) == label).Select(x => x.Field<int>("count")).First();
                    //dictMappedDateAndProblems[label] = count!=null?int.Parse(count.ToString()):0;
                    //dicBad[label] = ds.Tables[0].AsEnumerable().Where(x => DateTime.Parse(x["ReviewTime"].ToString()).ToString(MyLabels.LabelFormat) == label && int.Parse(x["Rating"].ToString()) <= 3).Count();
                }

                //dicGood[label] = (from row in ds.Tables[0].AsEnumerable()
                //where DateTime.Parse(row["ReviewTime"].ToString()).ToString(LabelFormat) == label
                //select row).Count();
            }
            return new ChartData()
            {
                Labels =dictMappedDateAndProblems.Keys.ToArray(),
                Data = dictMappedDateAndProblems.Values.ToArray()
            };
        }
        private dynamic GetLabels(string selection)
        {
            DateTime end = DateTime.UtcNow;
            DateTime start = DateTime.Now;
            String[] Labels = { };
            String LabelFormat = String.Empty;
            if (selection == "month")
            {
                start = DateTime.Now.AddMonths(-1);
                Labels = Enumerable.Range(1, end.Subtract(start).Days)
                          .Select(offset => start.AddDays(offset).ToShortDateString())
                          .ToArray();
                LabelFormat = "M/dd/yyyy";
            }
            else if (selection == "week")
            {
                start = DateTime.UtcNow.AddDays(-7);
                Labels = Enumerable.Range(1, end.Subtract(start).Days)
                          .Select(offset => start.AddDays(offset).ToShortDateString())
                          .ToArray();
                LabelFormat = "M/dd/yyyy";
            }
            else if (selection == "year")
            {
                start = DateTime.UtcNow.AddYears(-1);
                Labels = CultureInfo.CurrentCulture.DateTimeFormat.MonthNames;
                LabelFormat = "MMMM";
            }
            return new
            {
                Start = start,
                End = end,
                Labels = Labels,
                LabelFormat = LabelFormat
            };
        }
    }
}
