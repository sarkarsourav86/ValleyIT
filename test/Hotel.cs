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
        public String StringID { get; set; }
        public String Brand { get; set; }
        public String BrandName { get; set; }
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
        public String Country { get; set; }
        public String GMEmail { get; set; }
        
        public String LatLong { get; set; }
        public String PlaceId { get; set; }
        public String PaymentId { get; set; }
        public String RewardsName { get; set; }
        public int Franchise { get; set; }
        public String FranchiseName { get; set; }
        public int FranchiseBrand { get; set; }
        public String FranchiseBrandName { get; set; }
        public String RewardsLink { get; set; }
        public string TripAdvisorLink { get; set; }
       
        public static Hotel GetHotel(String id)
        {
            //SqlCommand cmd = new SqlCommand("SELECT [Brand],[Property Name],[Property Address Line 1],[Property Address Line 2],[Property City],[Property State],[Property  Postal Code],[Property Telephone],[Property Fax],[Property Number of Rooms],[Property General Manager],[Property Contact Description],[Property Contact Name],[DummyEmail] from Hotel where [Property] = '"+ id+"'");
            SqlCommand cmd = new SqlCommand("spfetchHotel");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@hotelID", id);
            DataTable table = DBOperations.FetchValues(cmd).Tables[0];
            DataRow row = null;
            Hotel hotel = null;
            if (table.Rows.Count==1)
            {
                row = table.Rows[0];
                
                hotel = new Hotel() { Email = row["Email"].ToString(),PlaceId= row["PlaceId"].ToString(), Phone = row["Property Telephone"].ToString(), ID = row["Property"].ToString(), Brand = row["Property Name"].ToString(), City = row["Property City"].ToString(), State = row["Property State"].ToString(), PostalCode = row["PostalCode"].ToString(),StringID= row["Property1"].ToString(),LatLong=row["LatLong"].ToString(),FranchiseName=row["Name"].ToString(),RewardsName= row["RewardsName"].ToString(), RewardsLink=row["RewardsLink"].ToString() };
            }
               
            //SqlDataReader reader= cmd.ExecuteReader();


            return hotel;
        }
        public static String ValidateHotelRegistration(String id)
        {
            SqlCommand cmd = new SqlCommand("spValidateHotelRegistration");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
            return (String)DBOperations.InsertAndReturn(cmd);
        }
        public static DataSet FetchFranchise()
        {
            SqlCommand cmd = new SqlCommand("spFetchFranchise");
            cmd.CommandType = CommandType.StoredProcedure;
            return DBOperations.FetchValues(cmd);
        }
        public static DataSet FetchFranchiseBrand(int id)
        {
            SqlCommand cmd = new SqlCommand("spFetchFranchiseBrands");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@franchiseId",id);
            return DBOperations.FetchValues(cmd);
        }
        public static string ValidateHotel(string hotelid)
        {
            SqlCommand cmd = new SqlCommand("spValidateHotel");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@hotelid", hotelid);
            return Convert.ToString(DBOperations.InsertAndReturn(cmd));
        }
        public static int RegisterHotel(Hotel hotel)
        {
            SqlCommand cmd = new SqlCommand("spRegisterHotel");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@hotelid", hotel.ID);
            cmd.Parameters.AddWithValue("@hotelname", hotel.Brand);
            cmd.Parameters.AddWithValue("@hotelemail", hotel.Email);
            cmd.Parameters.AddWithValue("@hotelphone", hotel.Phone);
            cmd.Parameters.AddWithValue("@address1", hotel.Address_Line1);
            
            cmd.Parameters.AddWithValue("@country", hotel.Country);
            cmd.Parameters.AddWithValue("@zip", hotel.PostalCode);
            cmd.Parameters.AddWithValue("@city", hotel.City);
            cmd.Parameters.AddWithValue("@state", hotel.State);
            cmd.Parameters.AddWithValue("@managername", hotel.GeneralManager);
            cmd.Parameters.AddWithValue("@placeid", hotel.PlaceId);
            cmd.Parameters.AddWithValue("@coordinates", hotel.LatLong);
            cmd.Parameters.AddWithValue("@paymentid", hotel.PaymentId);
            cmd.Parameters.AddWithValue("@franchiseId", hotel.Franchise);
            cmd.Parameters.AddWithValue("@franchiseBrandId", hotel.FranchiseBrand);
            cmd.Parameters.AddWithValue("@tripadvisorlink", hotel.TripAdvisorLink);
            return Convert.ToInt16(DBOperations.InsertAndReturn(cmd));
             
        }
    }
}
