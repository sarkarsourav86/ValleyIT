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
        int star;
        protected void Page_Load(object sender, EventArgs e)
        {
            bool userid = HasValidUserId();
            bool hotelid = HasValidHotelId();
            
            if (!(userid && hotelid))
            {
               
                PnlFieldContainer.Visible = false;
                ShowError("This link has expired");
            }
            else
            {
                hotel = GetHotel();
                user = GetUser();
                SetSearchCriteria();
                if(ShouldRedirectBasedonStars())
                {
                    SubmitFeedback(true);
                    Response.Redirect(Request.QueryString["navigateURL"]);
                }
            }
        }
        private bool ShouldRedirectBasedonStars()
        {
            
            int.TryParse(Request.QueryString["star"], out int star);
            this.star = star;
            return star >= 4 ? true : false;
        }
        private void SetSearchCriteria()
        {
            if (hotel != null) HdnPlacetoSearch.Value = hotel.PlaceId;
        }
        private bool HasValidUserId()
        {
            String id = Request.QueryString["user"]!=null? Request.QueryString["user"] :String.Empty;
            bool isValidQueryString= !String.IsNullOrEmpty(id);
            bool isValidId = HotelDBApp.User.ValidateUserId(id,true)>0?true:false;
            return isValidQueryString && isValidId;
        }
        private bool HasValidHotelId()
        {
            return Request.QueryString["hotelid"] != null;
        }
        private void SubmitFeedback(bool isQuick=false)
        {
            
            
            Feedback feedback = CreateFeedback();
            if (isQuick)
            {
                Feedback.InsertFeedback(feedback);
            }
            else
            {
                HotelDBApp.Image image = GetImage("review_file");
                if (feedback == null)
                {
                    ShowError("Something went wrong. Please try again!");
                }
                else if (Feedback.InsertFeedback(feedback) > 0)
                {
                    Sendemail(image);
                    PnlFieldContainer.Visible = false;
                    PnlSuccessFailure.Visible = true;
                    PnlSuccessFailure.CssClass = "notification alert-success spacer-t10";
                    LblStatus.Text = "Thanks for your feedback!";
                }
                else
                {

                    ShowError("Something went wrong. Please try again!");
                }
            }
            
        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            SubmitFeedback();
        }
        private void ShowError(String message)
        {
            PnlSuccessFailure.Visible = true;
            PnlSuccessFailure.CssClass = "notification alert-error spacer-t10";
            LblStatus.Text = message;
        }
        private HotelDBApp.Image GetImage(String name)
        {
            System.IO.Stream upload = null;
            HotelDBApp.Image image = null;
            if ((upload = Request.Files[name].InputStream) != null && Request.Files[name].ContentLength > 0)
            {

                image = new HotelDBApp.Image() { UploadedImage = upload, Name = Request.Files[name].FileName };
            }

            return image;
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
            String userID = Request.QueryString["user"];
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
        private void Sendemail(HotelDBApp.Image image)
        {
            Email email = new Email() { Subject="A Review Has Been Submitted", Comments=TxtComments.Text, CheckoutDate=user.CheckOutDate,CustName=user.LastName,ToAddress=hotel.Email,ProblemValue=HdnRating.Value,UserEmail=user.Email,ProblemText= HdnProblemTypeText.Value,Phone=user.Phone };
            HotelBusinessLayer.Utilities.SendEmail(email,true,image);
        }
        private Feedback CreateFeedback()
        {
            
            User user = GetUser();
            if (user != null)
            {
                return new Feedback()
                {
                    UserID = user.UserID,
                    HotelID = GetHotelId(),
                    BreakfastFeedback = 0,
                    CommonFeedback = 0,
                    FrontDeskFeedback = 0,
                    HotelRating = int.TryParse(HdnRating.Value,out int res)? res: star,
                    HousekeepingFeedback = 0,
                    MaintenanceFeedback = 0,
                    ParkingFeedback = 0,
                    PoolFeedback = 0,
                    ReservationFeedback = 0,
                    RoomFeedback = 0,
                    WiFiFeedback = 0,
                    ProblemType = int.TryParse(HdnRating.Value, out res) ? res : 0,
                    Comments = TxtComments.Text,
                    AboutUs=HdnAbout.Value
                };
            }
            else return null;
            
        }
    }
}