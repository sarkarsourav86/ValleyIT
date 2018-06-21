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
            String name = user.LastName;
            String room = user.RoomNo;
            String star = HdnRating.Value;
            String anyproblem = HdnProblemTypeText.Value;
            String checkout = user.CheckOutDate.ToShortDateString();
            String description = TxtComments.Text;
            String phone = user.Phone;
            String custemail = user.Email;
            String footer = System.Configuration.ConfigurationManager.AppSettings["emailfooter"];
            String body = $"<!doctype html><html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><title>Reliable WiFi </title><style>a:link {{color: #0a79ea;text-decoration: none;}}a:visited {{color: #000000;text-decoration: none;}}a:link#tops {{color: #000000;text-decoration: none;}}body, td, th {{font-family: Arial, \"Helvetica Neue\", Helvetica, Gotham, sans-serif;font-style: normal;font-weight: normal;font-size: 14px;color: #000000;}}body {{margin-left: 10px;margin-top: 10px;margin-right: 10px;margin-bottom: 10px;background-color: #FFFFFF;}}.BODY {{border-bottom: 1px solid #e8eef2;border-left: 1px solid #e8eef2;border-right: 1px solid #e8eef2;border-top: 1px solid #e8eef2;}}.tableu {{border-bottom: 2px solid #F4CC1F;border-left: 2px solid #F4CC1F;border-right: 2px solid #F4CC1F;border-top: 2px solid #F4CC1F;}}</style></head><body><table bgcolor=\"#ffffff\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" border=\"0\" class=\"BODY\" width=\"600\"> <tr> <td align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\"> <tr> <td valign=\"top\"><a href=\"http://na414-41ac69.pages.infusionsoft.net/\"><img src=\"http://finalhotelproject20180523071047.azurewebsites.net/images/logohotel.png\" alt=\"Banner\" style=\"display:block\" title=\"Banner\"></a></td> </tr> </table> <table background=\"#FAF9F7\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\" bgcolor=\"#FAF9F7\"> <tbody><tr><td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\"><b>A {star} Star Review Has Been Submitted</b></td></tr><tr><td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">Problem Type:- {anyproblem}</td></tr><tr><td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">Customer LastName:- {name}</td></tr><tr><td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">Checkout date:- {checkout}</td></tr><tr><td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">Customer Email:- {custemail}</td></tr><tr><td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">Customer Phone:- {phone}</td></tr><tr><td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">Description:- {description}</td></tr> </tbody> </table> <table background=\"#FAF9F7\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\" bgcolor=\"#FAF9F7\"> <tbody> <tr> <td bgcolor=\"#FAFAF8\" style=\"padding: 15px 25px 20px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">From Management.<br /></td> </tr> </tbody> </table> <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\" bgcolor=\"#1F4691\"> <tbody> <tr> <td bgcolor=\"#1F4691\" style=\"padding:10px 10px 10px 10px;text-align:center; line-height:22px; color: #FFFFFF\"> {footer}</td> </tr> </tbody> </table></td> </tr></table></body></html>";
            Email email = new Email() { Body=body,Subject="A Review Has Been Submitted", Comments=TxtComments.Text, CheckoutDate=user.CheckOutDate,CustName=user.LastName,ToAddress=hotel.Email,ProblemValue=HdnRating.Value,UserEmail=user.Email,ProblemText= HdnProblemTypeText.Value,Phone=user.Phone };

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