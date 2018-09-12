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
        public decimal Amount { get; set; }
        public DateTime PaymentDate { get; set; }
        public DateTime SubscriptionStartDate { get; set; }
        public DateTime SubscriptionEndDate { get; set; }
        public String HotelId { get; set; }
        public static DateTime GetExpiryDate(string id)
        {
            SqlCommand cmd = new SqlCommand("spGetExpiryDate");
            cmd.Parameters.AddWithValue("@hotelid", id);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            Object result = DBOperations.InsertAndReturn(cmd);
            if (result != null)
            {
                return DateTime.Parse(result.ToString());
            }
            else return DateTime.MinValue;
            
        } 
        public static String AddPayment(Payment payment)
        {
            SqlCommand cmd = new SqlCommand("spInsertPayment");
            cmd.Parameters.AddWithValue("@id", payment.Id);
            cmd.Parameters.AddWithValue("@email", payment.Email);
            cmd.Parameters.AddWithValue("@amount", payment.Amount);
            cmd.Parameters.AddWithValue("@paymentdate", payment.PaymentDate);
            cmd.Parameters.AddWithValue("@expirydate", payment.SubscriptionEndDate);
            if(!string.IsNullOrEmpty(payment.HotelId))
            {
                cmd.Parameters.AddWithValue("@hotelid", payment.HotelId);
            }
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            String PaymentId=(String)DBOperations.InsertAndReturn(cmd);
            
            return PaymentId;
            
            
        }
        
        
    }
}
