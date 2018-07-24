using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;


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
        
        public static System.Data.DataSet FetchProblems(int HotelId,int isRestricted=0)
        {
            SqlCommand cmd = new SqlCommand("spFetchProblemsByHotelId");
            cmd.Parameters.AddWithValue("@hotelid", HotelId);
            cmd.Parameters.AddWithValue("@top", isRestricted);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            return DBOperations.FetchValues(cmd);
        }

    }
}
