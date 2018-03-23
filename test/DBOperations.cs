using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelDBApp
{
    public class DBOperations
    {
        static String con_str = ConfigurationManager.ConnectionStrings["ExperienceHotelApp"].ConnectionString;
        public static int UpdateOrInsert(SqlCommand cmd)
        {
            using (SqlConnection con = new SqlConnection(con_str))
            {
                con.Open();
                cmd.Connection = con;
                return cmd.ExecuteNonQuery();
            }
        }
    }
}
