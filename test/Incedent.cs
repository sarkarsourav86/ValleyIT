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
        enum IncedentTypes {
            Housekeeping=1,
            WiFiInternet,
            Maintenance,
            CommonArea,
            Room,
            FrontDesk
        }
        public String IncedentID { get; set; }
        public int IncedentType { get; set; }
        public String IncedentDescription { get; set; }
        public String RoomNo { get; set; }
        public String HotelID { get; set; }
        public DateTime IncedentTime { get; set; }
        public String UserID { get; set; }
        public int FeedbackValue { get; set; }
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

    }
}
