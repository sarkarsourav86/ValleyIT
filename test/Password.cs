using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelDBApp
{
    public class Password
    {
        public string ResetId { get; set; }
        public string Email { get; set; }
        public string NewPassword { get; set; }
        public static bool AddPasswordResetReqToDB(string email,string id)
        {
            SqlCommand cmd = new SqlCommand("spInsertPasswordResetRequest");
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@resetcode", id);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            return DBOperations.UpdateOrInsert(cmd)>0?true:false;
        }
        public static bool UpdatePassword(Password password)
        {
            SqlCommand cmd = new SqlCommand("spUpdatePassword");
            cmd.Parameters.AddWithValue("@email", password.Email);
            cmd.Parameters.AddWithValue("@resetcode", password.ResetId);
            cmd.Parameters.AddWithValue("@password", password.NewPassword);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            return int.Parse(DBOperations.InsertAndReturn(cmd).ToString()) > 0 ? true : false;
        }
    }
}
