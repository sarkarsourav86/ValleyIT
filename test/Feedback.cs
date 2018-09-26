using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using HotelDBApp;

namespace HotelDBApp
{
    public class Feedback
    {
        public String FeedbackID { get; set; }
        public String HotelID { get; set; }
        public int UserID { get; set; }
        public int RoomFeedback { get; set; }
        public int FrontDeskFeedback { get; set; }
        public int ReservationFeedback { get; set; }
        public int HousekeepingFeedback { get; set; }
        public int BreakfastFeedback { get; set; }
        public int WiFiFeedback { get; set; }
        public int MaintenanceFeedback { get; set; }
        public int PoolFeedback { get; set; }
        public int CommonFeedback { get; set; }
        public int ParkingFeedback { get; set; }
        public int HotelRating { get; set; }
        public int ProblemType { get; set; }
        public String Comments { get; set; }
        public String AboutUs { get; set; }
        public static int InsertFeedback(Feedback feedback)
        {
            SqlCommand cmd = new SqlCommand("spInsertFeedback");
            cmd.Parameters.AddWithValue("@HotelId", feedback.HotelID);
            cmd.Parameters.AddWithValue("@UserId", feedback.UserID);
            cmd.Parameters.AddWithValue("@RoomFeedback", feedback.RoomFeedback);
            cmd.Parameters.AddWithValue("@FrontDeskFeedback", feedback.FrontDeskFeedback);
            cmd.Parameters.AddWithValue("@ReservationFeedback", feedback.ReservationFeedback);
            cmd.Parameters.AddWithValue("@HousekeepingFeedback", feedback.HousekeepingFeedback);
            cmd.Parameters.AddWithValue("@BreakfastFeedback", feedback.BreakfastFeedback);
            cmd.Parameters.AddWithValue("@WiFiFeedback", feedback.WiFiFeedback);
            cmd.Parameters.AddWithValue("@MaintenanceFeedback", feedback.MaintenanceFeedback);
            cmd.Parameters.AddWithValue("@PoolFeedback", feedback.PoolFeedback);
            cmd.Parameters.AddWithValue("@CommonFeedback", feedback.CommonFeedback);
            cmd.Parameters.AddWithValue("@ParkingFeedback", feedback.ParkingFeedback);
            cmd.Parameters.AddWithValue("@HotelRating", feedback.HotelRating);
            cmd.Parameters.AddWithValue("@comments", feedback.Comments);
            cmd.Parameters.AddWithValue("@problemtype", feedback.ProblemType);
            cmd.Parameters.AddWithValue("@aboutus", feedback.AboutUs); 
            cmd.CommandType = CommandType.StoredProcedure;
            return DBOperations.UpdateOrInsert(cmd);

        }
        public static DataSet FetchFeedbackById(string hotelId,DateTime start,DateTime end)
        {
            if (!string.IsNullOrEmpty(hotelId))
            {
                SqlCommand cmd = new SqlCommand("spFetchReviewWithIdandDate");
                cmd.Parameters.AddWithValue("@hotelid", int.Parse(hotelId));
                cmd.Parameters.AddWithValue("@start", start);
                cmd.Parameters.AddWithValue("@end", end);
                cmd.CommandType = CommandType.StoredProcedure;
                return DBOperations.FetchValues(cmd);
            }
            else return null;
            
        }
    }
}
