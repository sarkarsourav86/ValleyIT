using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelDBApp
{
    public class DBOperations
    {
        static String con_str = ConfigurationManager.ConnectionStrings["ExperienceHotelApp"].ConnectionString;
        public static Object InsertAndReturn(SqlCommand cmd)
        {
            using (SqlConnection con = new SqlConnection(con_str))
            {
                con.Open();
                cmd.Connection = con;
                return cmd.ExecuteScalar();
            }
        }
        public static DataSet FetchDropDownValues(string dropDown)
        {
            Dictionary<string, string> dictDdl = new Dictionary<string, string>()
            {
                { "DdlFeedbackValue","select ID as value,FieldText as text from Feedback_options" },
                {"DdlIncedentType","select TypeID as value,Type as text from IncedentTypes" }
            };
            SqlCommand cmd = new SqlCommand(dictDdl[dropDown]);
            cmd.CommandType = CommandType.Text;
            DataSet ds = new DataSet();
            SqlDataAdapter da;
            using (SqlConnection con = new SqlConnection(con_str))
            {

                cmd.Connection = con;
                da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds;
            }
        }
        public static DataSet FetchValues(SqlCommand cmd)
        {
            DataSet ds=new DataSet();
            DataTable dt = new DataTable();
            SqlDataAdapter da;
            using (SqlConnection con = new SqlConnection(con_str))
            {
                
                cmd.Connection = con;
                da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds;
            }
        }
        public static SqlDataReader FetchValuesWithDataReader(SqlCommand cmd)
        {
            using (SqlConnection con = new SqlConnection(con_str))
            {
                con.Open();
                cmd.Connection = con;
                return cmd.ExecuteReader();
            }
        }
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
