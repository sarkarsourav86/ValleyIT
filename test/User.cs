using System;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace HotelDBApp
{
    public class User
    {
        public String UserID { get; set; }
        public String LastName { get; set; }
        public String RoomNo { get; set; }
        public DateTime CheckOutDate { get; set; }
        public String Email { get; set; }
        public String HotelID { get; set; }
        public static String InsertUserInfo(User user)
        {
            SqlCommand cmd = new SqlCommand("spInsertUser");
            
            cmd.Parameters.AddWithValue("@LastName", user.LastName);
            cmd.Parameters.AddWithValue("@RoomNo", user.RoomNo);
            cmd.Parameters.AddWithValue("@CheckOutDate", user.CheckOutDate);
            cmd.Parameters.AddWithValue("@Email", user.Email);
            cmd.Parameters.AddWithValue("@HotelID", user.HotelID);
            cmd.CommandType = CommandType.StoredProcedure;
            return DBOperations.InsertAndReturn(cmd);
            
        }
        public static User GetUserInfo(String ID)
        {
            SqlCommand cmd = new SqlCommand("spFetchUsers");
            cmd.Parameters.AddWithValue("@id", ID);
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet ds=DBOperations.FetchValues(cmd);
            DataRow row = null;
            User user = null;
            if (ds.Tables[0].Rows.Count == 1)
            {
                row = ds.Tables[0].Rows[0];
                user = new User() { UserID = ID, LastName = row["LastName"].ToString(), RoomNo = row["RoomNo"].ToString(), CheckOutDate = Convert.ToDateTime(row["CheckOutDate"]),Email=row["Email"].ToString(),HotelID=row["HotelID"].ToString() };
            }
            return user;
        }
    }
}
