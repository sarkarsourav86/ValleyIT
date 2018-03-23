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
        protected void Page_Load(object sender, EventArgs e)
        {
            
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
        private String GetUser()
        {
            //do some db operations
            return "AK032_1";
        }
        private String GetHotel()
        {
            //do some db operations
            return "AK032";
        }
        private Feedback CreateFeedback()
        {
            return new Feedback()
            {
                UserID = GetUser(),
                HotelID = GetHotel(),
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