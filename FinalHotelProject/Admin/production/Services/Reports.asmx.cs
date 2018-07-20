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
        
        [WebMethod]
        public HotelDBApp.ChartData GetReviews(string selection,String id)
        {
            DateTime end=DateTime.UtcNow; 
            DateTime start = DateTime.Now;
            String[] Labels= { };
            String LabelFormat = String.Empty;
            if (selection == "month")
            {
                start = DateTime.Now.AddMonths(-1);
                Labels= Enumerable.Range(1, end.Subtract(start).Days)
                          .Select(offset => start.AddDays(offset).ToShortDateString())
                          .ToArray();
                LabelFormat= "M/dd/yyyy";
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
            DataSet ds=Feedback.FetchFeedbackById(id, start, end);
            Dictionary<string, int> dicGood = new Dictionary<string, int>();
            Dictionary<string, int> dicBad = new Dictionary<string, int>();

            foreach (string label in Labels)
            {
                if (!String.IsNullOrEmpty(label))
                    dicGood[label] = ds.Tables[0].AsEnumerable().Where(x => DateTime.Parse(x["ReviewTime"].ToString()).ToString(LabelFormat) == label && int.Parse(x["Rating"].ToString()) > 3).Count();
                    dicBad[label]= ds.Tables[0].AsEnumerable().Where(x => DateTime.Parse(x["ReviewTime"].ToString()).ToString(LabelFormat) == label && int.Parse(x["Rating"].ToString()) <= 3).Count();
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
            return new HotelDBApp.ChartData() { Data = dicGood.Values.ToArray(),Data2=dicBad.Values.ToArray(), Labels = dicGood.Keys.ToArray() };


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
        
    }
}
