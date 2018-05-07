using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;



namespace HotelDBApp
{
    public class Payment
    {
        public String Email { get; set; }
        public String Id { get; set; }
        public String URL { get; set; }
        public static String AddPayment(Payment payment)
        {
            SqlCommand cmd = new SqlCommand("spInsertPayment");
            cmd.Parameters.AddWithValue("@id", payment.Id);
            cmd.Parameters.AddWithValue("@email", payment.Email);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            String PaymentId=(String)DBOperations.InsertAndReturn(cmd);
            
            return PaymentId;
            
            
        }
        
        
    }
}
