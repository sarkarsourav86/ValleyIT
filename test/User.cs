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
        public static int InsertUserInfo(User user)
        {
            SqlCommand cmd = new SqlCommand("spInsertUser");
            
            cmd.Parameters.AddWithValue("@LastName", user.LastName);
            cmd.Parameters.AddWithValue("@RoomNo", user.RoomNo);
            cmd.Parameters.AddWithValue("@CheckOutDate", user.CheckOutDate);
            cmd.Parameters.AddWithValue("@Email", user.Email);
            cmd.Parameters.AddWithValue("@HotelID", user.HotelID);
            cmd.CommandType = CommandType.StoredProcedure;
            return DBOperations.UpdateOrInsert(cmd);
        }
    }
}
