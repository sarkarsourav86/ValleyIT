using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelBusinessLayer;
using HotelDBApp;


namespace FinalHotelProject
{
   
    public partial class Yourstay : System.Web.UI.Page
    {
        HotelDBApp.Image image;
        Incedent problem;
        User user;
        Hotel hotel;
        ProblemReport1.IncedentTypes incedent = ProblemReport1.IncedentTypes.Room;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckUserAndSetForm();
            FetchHotelinfoFromDB();
            SetHotelName();
            SetHomeURL();
        }
        private void SetHomeURL()
        {
            HypHome.NavigateUrl = String.Format("/Login.aspx?hotelid={0}", hotel.ID);
        }
        private void SetHotelName()
        {
            if (Session["Hotel"] != null)
            {
                LblHotelName.Text = ((Hotel)Session["Hotel"]).Brand;
            }
        }
        private HotelDBApp.Image GetImage(String name)
        {
            System.IO.Stream upload = null;
            if ((upload = Request.Files[name].InputStream) != null && Request.Files[name].ContentLength > 0)
            {

                image = new HotelDBApp.Image() { UploadedImage = upload, Name = Request.Files[name].FileName };
            }

            return image;
        }
        private void FetchHotelinfoFromDB()
        {
            String ID = String.Empty;
            if(Session["Hotel"]!=null)
            {
                hotel = (Hotel)Session["Hotel"];
            }
            else if((ID = Request.QueryString["hotelid"]) != null)
            {
                hotel = Hotel.GetHotel(ID);
            }
            
        }
        private Decimal GetUser()
        {
            //do some db operations
            return Session["User"] != null ? ((User)Session["User"]).UserID : -100;
        }
        private String GetHotel()
        {
            String ID = String.Empty;
            //do some db operations
            //return Session["User"] != null ? ((User)Session["User"]).HotelID : String.Empty;
            if(Session["Hotel"]!=null)
            {
                ID = ((Hotel)Session["Hotel"]).ID;
            }
            else if((ID=Request.QueryString["hotelid"])==null)
                ID= "ND1";
            return ID;
        }
        private String GetRoomNo()
        {
            return Session["User"] != null ? ((User)Session["User"]).RoomNo : String.Empty;
        }
        private void LoadIncedentFromHiddenFields()
        {
            problem = new Incedent() { FeedbackValue = GetFeedbackValue(), IncedentType = Convert.ToInt32(incedent), HotelID = GetHotel(), UserID = GetUser(), IncedentDescription = GetAdditionalComments(), IncedentTime = DateTime.Now, RoomNo = GetRoomNo() };
        }
        private String GetAdditionalComments()
        {
            return Hdnroom_comment.Value;
        }
        private int GetFeedbackValue()
        {
            
            int.TryParse(HdnRoom.Value, out int res);
            return res;
        }
        private Hotel GetHotelObject()
        {
            return (Hotel)Session["Hotel"];
        }
        private User GetUserObject()
        {
            return Session["User"] != null ? ((User)Session["User"]) : null;
        }
        private void SendEmail()
        {
            Dictionary<int, String> FeedbackOptn = Utilities.ProblemTypesList;
            Dictionary<int, String> FeedbackValue = Utilities.FeedbackOptionsList;
            Email email = new Email();
            user = GetUserObject();
            if (problem != null)
            {
                
                hotel = GetHotelObject();
                email.ToAddress = hotel.Email;
                String name= user.LastName;
                String room = user.RoomNo;
                String problemtype = FeedbackOptn[problem.IncedentType];
                String problemvalue = FeedbackValue[problem.FeedbackValue];
                String checkout = user.CheckOutDate.ToShortDateString();
                String description = problem.IncedentDescription;
                String phone = user.Phone;
                String custemail = user.Email;
                String footer= System.Configuration.ConfigurationManager.AppSettings["emailfooter"];
                image = GetImage("file");
                email.Body = $"<!doctype html><html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><title>Reliable WiFi </title><style>a:link {{color: #0a79ea;text-decoration: none;}}a:visited {{color: #000000;text-decoration: none;}}a:link#tops {{color: #000000;text-decoration: none;}}body, td, th {{font-family: Arial, \"Helvetica Neue\", Helvetica, Gotham, sans-serif;font-style: normal;font-weight: normal;font-size: 14px;color: #000000;}}body {{margin-left: 10px;margin-top: 10px;margin-right: 10px;margin-bottom: 10px;background-color: #FFFFFF;}}.BODY {{border-bottom: 1px solid #e8eef2;border-left: 1px solid #e8eef2;border-right: 1px solid #e8eef2;border-top: 1px solid #e8eef2;}}.tableu {{border-bottom: 2px solid #F4CC1F;border-left: 2px solid #F4CC1F;border-right: 2px solid #F4CC1F;border-top: 2px solid #F4CC1F;}}</style></head><body><table bgcolor=\"#ffffff\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" border=\"0\" class=\"BODY\" width=\"600\"> <tr> <td align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\"> <tr> <td valign=\"top\"><a href=\"http://na414-41ac69.pages.infusionsoft.net/\"><img src=\"http://finalhotelproject20180523071047.azurewebsites.net/images/logohotel.png\" alt=\"Banner\" style=\"display:block\" title=\"Banner\"></a></td> </tr> </table> <table background=\"#FAF9F7\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\" bgcolor=\"#FAF9F7\"> <tbody><tr><td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\"><b>A problem has been reported</b></td></tr> <tr> <td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\"><b>{problemtype}:- {problemvalue}</b></td></tr><tr><td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">Room No:- {room}</td></tr><tr><td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">Customer LastName:- {name}</td></tr><tr><td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">Checkout date:- {checkout}</td></tr><tr><td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">Customer Email:- {custemail}</td></tr><tr><td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">Customer Phone:- <a href='tel://{phone}'>{phone}</a></td></tr><tr><td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">Description:- {description}</td></tr> </tbody> </table> <table background=\"#FAF9F7\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\" bgcolor=\"#FAF9F7\"> <tbody> <tr> <td bgcolor=\"#FAFAF8\" style=\"padding: 15px 25px 20px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">From Management.<br /></td> </tr> </tbody> </table> <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\" bgcolor=\"#1F4691\"> <tbody> <tr> <td bgcolor=\"#1F4691\" style=\"padding:10px 10px 10px 10px;text-align:center; line-height:22px; color: #FFFFFF\">{footer}</td> </tr> </tbody> </table></td> </tr></table></body></html>";
                email.Subject = string.Format("{0} - A Problem has been Reported",hotel.Brand);
                Utilities.SendEmail(email,false,image);
            }
        }
        private void CheckUserAndSetForm()
        {
            if (Utilities.HasUserCheckedIn(Session["User"]))
            {
                PnlModalContainer.Visible = false;
                PnlNoLoginBtnContainer.Visible = true;
                PnlLoginBtnContainer.Visible = false;
            }
        }
        private void SetSession(int ID)
        {
            user.UserID = ID;
            Session["User"] = user;
        }
        private void InsertIntoDatabase()
        {
            int feedbackValue = GetFeedbackValue();
            int result = 0;
            if (feedbackValue != 0)
            {
                LoadIncedentFromHiddenFields();
                result = Incedent.ReportProblem(problem);
                if (result > 0)
                {
                    PnlSuccessFailure.Visible = true;
                    PnlSuccessFailure.CssClass = "notification alert-success spacer-t10";
                    LblStatus.Text = "Your Problem has been recorded!";
                    //FormBody.Visible = false;
                }
                else
                {

                    PnlSuccessFailure.Visible = true;
                    PnlSuccessFailure.CssClass = "notification alert-error spacer-t10";
                    LblStatus.Text = "Something went wrong. Please try again!";
                }
            }
            else
            {
                PnlSuccessFailure.Visible = true;
                PnlSuccessFailure.CssClass = "notification alert-warning spacer-t10";
                LblStatus.Text = "Please select an option!";
            }
        }
        private void InsertUserInfo()
        {
            user = new User() { RoomNo = TxtRoom.Text, CheckOutDate = Convert.ToDateTime(TxtDate.Text), Email = TxtEmail.Text, HotelID = GetHotel(), LastName = TxtUserLastName.Text, UserIdString = Guid.NewGuid().ToString("N"),Phone=TxtPhone.Text };
            int userId = HotelDBApp.User.InsertUserInfo(user);
            if (userId != -100)
            {
                SetSession(userId);
            }
        }
        protected void NoLoginSubmit_Click(object sender, EventArgs e)
        {
            
            InsertIntoDatabase();
            SendEmail();
        }

        protected void LoginBtnSubmit_Click(object sender, EventArgs e)
        {
            InsertUserInfo();
            
            InsertIntoDatabase();
            SendEmail();
            CheckUserAndSetForm();
        }
    }
}