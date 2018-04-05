using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace HotelDBApp
{
    public class Hotel
    {
        public String ID { get; set; }
        public String Brand { get; set; }
        public String Address_Line1 { get; set; }
        public String Address_Line2 { get; set; }
        public String City { get; set; }
        public String State { get; set; }
        public String PostalCode { get; set; }
        public String Phone { get; set; }
        public String Fax { get; set; }
        public String NumberofRooms { get; set; }
        public String GeneralManager { get; set; }
        public String ContactDescription { get; set; }
        public String ContactName { get; set; }
        public String Email { get; set; }
        public static Hotel GetHotel(String id)
        {
            //SqlCommand cmd = new SqlCommand("SELECT [Brand],[Property Name],[Property Address Line 1],[Property Address Line 2],[Property City],[Property State],[Property  Postal Code],[Property Telephone],[Property Fax],[Property Number of Rooms],[Property General Manager],[Property Contact Description],[Property Contact Name],[DummyEmail] from Hotel where [Property] = '"+ id+"'");
            SqlCommand cmd = new SqlCommand("spfetchHotel");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@hotelID", id);
            DataRow row = DBOperations.FetchValues(cmd).Tables[0].Rows[0];
            //SqlDataReader reader= cmd.ExecuteReader();
            Hotel hotel = new Hotel() { Email = row["DummyEmail"].ToString(), Phone = row["Property Telephone"].ToString(), ID = row["Property"].ToString(),Brand= row["Property Name"].ToString() };

            return hotel;
        }
    }
}
