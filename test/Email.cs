using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace HotelDBApp
{
    public class Email
    {
        public String ToAddress { get; set; }
        public String CustName { get; set; }
        public String RoomNo { get; set; }
        public String ProblemType { get; set; }
        public String ProblemValue { get; set; }
        public String Comments { get; set; }
        public DateTime CheckoutDate { get; set; }
        public static DataSet FetchEmails()
        {
            SqlCommand cmd = new SqlCommand("SpFetchUserstoSendEmail");
            cmd.CommandType = CommandType.StoredProcedure;
            return DBOperations.FetchValues(cmd);
        }
    }
    
}
