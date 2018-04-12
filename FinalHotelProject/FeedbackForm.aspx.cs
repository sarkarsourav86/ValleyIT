using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelDBApp;

namespace FinalHotelProject
{
    public partial class FeedbackForm : System.Web.UI.Page
    {
        Hotel hotel;
        User user;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!(HasValidUserId() && HasValidHotelId()))
            {
                PnlFieldContainer.Visible = false;
            }
            else
            {
                hotel = GetHotel();
                //user = GetUser();
                SetSearchCriteria();
            }
        }
        private void SetSearchCriteria()
        {
           if(hotel!=null) HdnPlacetoSearch.Value = String.Format("{0},{1},{2},{3}", hotel.Brand, hotel.City, hotel.State, hotel.PostalCode);
        }
        private bool HasValidUserId()
        {
            return Request.QueryString["hotelid"] != null;
        }
        private bool HasValidHotelId()
        {
            return Request.QueryString["user"] != null;
        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            Submit.Text = HdnRating.Value;
            Feedback feedback = CreateFeedback();
            if(Feedback.InsertFeedback(feedback)>0)
            {
                PnlFieldContainer.Visible = false;
                PnlSuccessFailure.Visible = true;
                PnlSuccessFailure.CssClass = "notification alert-success spacer-t10";
                LblStatus.Text = "Thanks for your feedback!";
            }
            else
            {
                PnlSuccessFailure.Visible = true;
                PnlSuccessFailure.CssClass = "notification alert-error spacer-t10";
                LblStatus.Text = "Something went wrong. Please try again!";
            }
            
        }
        private String GetUserId()
        {
            return Request.QueryString["user"];
        }
        private String GetHotelId()
        {
            return Request.QueryString["hotelid"];
        }
        private User GetUser()
        {
            String userID = GetUserId();
            return HotelDBApp.User.GetUserInfo(userID);
            //do some db operations
            //return Request.QueryString["user"];
        }
        private Hotel GetHotel()
        {
            String hotelId = GetHotelId();
            return Hotel.GetHotel(hotelId);
            //do some db operations
            //return Request.QueryString["hotelid"];
        }
        private Feedback CreateFeedback()
        {
            return new Feedback()
            {
                UserID = GetUserId(),
                HotelID = GetHotelId(),
                BreakfastFeedback = Convert.ToInt16(HdnBreakfast.Value),
                CommonFeedback= Convert.ToInt16(HdnCommon.Value),
                FrontDeskFeedback=Convert.ToInt16(HdnFrontdesk.Value),
                HotelRating=Convert.ToInt16(HdnRating.Value),
                HousekeepingFeedback=Convert.ToInt16(HdnHousekeeping.Value),
                MaintenanceFeedback=Convert.ToInt16(HdnMaintenance.Value),
                ParkingFeedback=Convert.ToInt16(HdnParking.Value),
                PoolFeedback=Convert.ToInt16(HdnPool.Value),
                ReservationFeedback=Convert.ToInt16(HdnReservation.Value),
                RoomFeedback=Convert.ToInt16(HdnRoom.Value),
                WiFiFeedback=Convert.ToInt16(HdnWifi.Value)
            };
        }
    }
}