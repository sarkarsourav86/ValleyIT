using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
namespace HotelDBApp
{
    public class Admin
    {
        public int ID { get; set; }
        public String HotelId { get; set; }
        public String UserName { get; set; }
        public String Role { get; set; }
        public String Password { get; set; }
        public static int AddAdmin(Admin admin)
        {
            SqlCommand cmd = new SqlCommand("spInsertAdmin");
            cmd.Parameters.AddWithValue("@username",admin.UserName);
            cmd.Parameters.AddWithValue("@password", admin.Password);
            cmd.Parameters.AddWithValue("@hotelid", admin.HotelId);
            cmd.Parameters.AddWithValue("@role", admin.Role);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            return DBOperations.UpdateOrInsert(cmd);
        }
    }
}
