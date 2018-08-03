using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace HotelDBApp
{
    public class Incedent
    {
        
        public String IncedentID { get; set; }
        public String HashedHotelID { get; set; }
        public int IncedentType { get; set; }
        public string IncedentTypeStr { get; set; }
        public String IncedentDescription { get; set; }
        public String RoomNo { get; set; }
        public String HotelID { get; set; }
        public string Color { get; set; }
        public DateTime IncedentTime { get; set; }
        public Decimal UserID { get; set; }
        public int FeedbackValue { get; set; }
        public string FeedbackStr { get; set; }
        public bool IsSolved { get; set; }
        public static System.Data.DataSet GetProblemsCount(int hotelid,DateTime startDate,string sp)
        {
            SqlCommand cmd = new SqlCommand(sp);
            cmd.Parameters.AddWithValue("@hotelid", hotelid);
            cmd.Parameters.AddWithValue("@startdate", startDate);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            return DBOperations.FetchValues(cmd);
        }
        public static DataSet GetProblemsFromDateRange(int hotelid,DateTime start,DateTime end)
        {
            SqlCommand cmd = new SqlCommand("spFetchProblemsWithinDateRange");
            cmd.Parameters.AddWithValue("@hotelid", hotelid);
            cmd.Parameters.AddWithValue("@start", start);
            cmd.Parameters.AddWithValue("@end", end);
            cmd.CommandType= System.Data.CommandType.StoredProcedure;
            return DBOperations.FetchValues(cmd);
        }
        public static int ReportProblem(Incedent incedent)
        {
            SqlCommand cmd = new SqlCommand("spReportProblem");
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@IncedentType", incedent.IncedentType);
            cmd.Parameters.AddWithValue("@IncedentDescription", incedent.IncedentDescription);
            cmd.Parameters.AddWithValue("@RoomNo", incedent.RoomNo);
            cmd.Parameters.AddWithValue("@HotelID", incedent.HotelID);
            cmd.Parameters.AddWithValue("@IncedentTime", incedent.IncedentTime);
            cmd.Parameters.AddWithValue("@UserID", incedent.UserID);
            cmd.Parameters.AddWithValue("@FeedbackValue", incedent.FeedbackValue);
            return DBOperations.UpdateOrInsert(cmd);

        }
        
        public static System.Data.DataSet FetchProblems(int HotelId,int isRestricted=0,int isSolved=0)
        {
            SqlCommand cmd = new SqlCommand("spFetchProblemsByHotelId");
            cmd.Parameters.AddWithValue("@hotelid", HotelId);
            cmd.Parameters.AddWithValue("@top", isRestricted);
            cmd.Parameters.AddWithValue("@isResolved", isSolved);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            return DBOperations.FetchValues(cmd);
        }
        public static List<object> FetchProblemByIncedentAndHotelId(int hotelid,int userid)
        {
            SqlCommand cmd = new SqlCommand("spFetchSingleProblemByHotelandId");
            cmd.Parameters.AddWithValue("@hotelid", hotelid);
            cmd.Parameters.AddWithValue("@incedentId", userid);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            DataTable dt= DBOperations.FetchValues(cmd).Tables[0];
            Incedent incedent = new Incedent();
            User user = new User();
            List<object> result = null;
            if (dt.Rows.Count > 0)
            {

                incedent.IncedentID = dt.Rows[0]["Id"].ToString();
                incedent.IncedentType = int.Parse(dt.Rows[0]["Type"].ToString());
                incedent.IncedentDescription = dt.Rows[0]["Descrp"].ToString();
                incedent.RoomNo = dt.Rows[0]["Room"].ToString();
                incedent.IncedentTime = DateTime.Parse(dt.Rows[0]["Time"].ToString());
                incedent.FeedbackValue = int.Parse(dt.Rows[0]["FeedbackValue"].ToString());
                incedent.IsSolved = bool.Parse(dt.Rows[0]["IsResolved"].ToString());
                user.Email = dt.Rows[0]["Email"].ToString();
                user.LastName = dt.Rows[0]["name"].ToString();
                user.Phone = dt.Rows[0]["Phone"].ToString();
                result = new List<object>() { user, incedent };
            }
            return result;
        }
        public static object FetchPRoblemForReport(int hotelid,DateTime start,DateTime end)
        {
            SqlCommand cmd = new SqlCommand("spCountReports");
            cmd.Parameters.AddWithValue("@hotelid", hotelid);
            cmd.Parameters.AddWithValue("@startdate", start);
            cmd.Parameters.AddWithValue("@enddate", end);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            DataTable ds = DBOperations.FetchValues(cmd).Tables[0];
            
            
            return new
            {
                Problems = ds.Rows[0][0].ToString(),
                Stars = ds.Rows[0][1].ToString(),
                Users = ds.Rows[0][2].ToString()
            };
        }

    }
}
