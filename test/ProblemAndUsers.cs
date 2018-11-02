using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelDBApp
{
    public class ProblemAndUsers
    {
        public string RoomNo { get; set; }
        public string Problem { get; set; }
        public string Feedback { get; set; }
        public string Description { get; set; }
        public DateTime IncedentTime { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public DateTime Checkout { get; set; }
        public DateTime Checkin { get; set; }
        public static List<ProblemAndUsers> GetProblemAndUsers(string hotelid)
        {
            int.TryParse(hotelid, out int res);
            SqlCommand cmd = new SqlCommand("spRptProblemswithUsers");
            cmd.Parameters.AddWithValue("@hotelid", res);
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet ds = DBOperations.FetchValues(cmd);
            List<ProblemAndUsers> list = new List<ProblemAndUsers>();
            if (ds != null)
            {
                DataTable dt = ds.Tables[0];
                foreach (DataRow dr in dt.Rows)
                {
                    list.Add(
                        new ProblemAndUsers()
                        {
                            RoomNo = dr.Field<string>("RoomNo"),
                            Problem = dr.Field<string>("Problem"),
                            Feedback = dr.Field<string>("feedback"),
                            Email = dr.Field<string>("Email"),
                            Phone = dr.Field<string>("Phone"),
                            Description = dr.Field<string>("IncedentDescription"),
                            Username = dr.Field<string>("LastName"),
                            IncedentTime = dr.Field<DateTime>("IncedentTime"),
                            Checkout= dr.Field<DateTime>("CheckOutDate"),
                            Checkin= dr.Field<DateTime>("CheckInDate")
                        }
                    );
                }
            }
            return list;
        }
    }
}
