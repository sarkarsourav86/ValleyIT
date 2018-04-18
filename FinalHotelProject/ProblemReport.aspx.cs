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
    public partial class ProblemReport1 : System.Web.UI.Page
    {
        User user;
        String additionalComments;
        Incedent problem;
        Hotel hotel;
        System.IO.Stream uploadedFile=null;
        HotelDBApp.Image image;
        public enum IncedentTypes
        {
            none=0,
            Housekeeping = 1,
            WiFiInternet,
            Maintenance,
            CommonArea,
            Room,
            FrontDesk
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            SetHotelFromUrl();
            CheckUserAndSetForm();
            SetHotelName();
        }
        private void SetHotelName()
        {
            if (Session["Hotel"] != null)
            {
                LblHotelName.Text = ((Hotel)Session["Hotel"]).Brand;
            }
        }
        private void SetHotelFromUrl()
        {
            String id;
            if (Session["Hotel"] != null && Request.QueryString["hotelid"] != null)
            {
                if (((Hotel)Session["Hotel"]).ID == Request.QueryString["hotelid"]) return;
            }
            if (Request.QueryString["hotelid"] != null)
            {
                id = Request.QueryString["hotelid"];
            }

            else
            {
                id = "AK032";

            }

            hotel = Hotel.GetHotel(id);
            SetHotelInfo();
        }
        private void SetHotelInfo()
        {
            Session["Hotel"] = hotel;
        }
        private Hotel GetHotelObject()
        {
            return (Hotel)Session["Hotel"];
        }
        private void CheckUserAndSetForm()
        {
            if(Utilities.HasUserCheckedIn(Session["User"]))
            {
                PnlModalContainer.Visible = false;
                PnlNoLoginBtnContainer.Visible = true;
                PnlLoginBtnContainer.Visible = false;
            }
        }
        private String GetUser()
        {
            //do some db operations
            return Session["User"]!=null? ((User)Session["User"]).UserID:String.Empty;
        }
        private User GetUserObject()
        {
            return Session["User"] != null ? ((User)Session["User"]) : null;
        }
        private String GetHotel()
        {
            //do some db operations
            return Session["Hotel"] != null ? ((Hotel)Session["Hotel"]).ID : String.Empty;
            //return "AK032";
        }
        private String GetRoomNo()
        {
            return Session["User"] != null ? ((User)Session["User"]).RoomNo : String.Empty;
        }
        private void LoadIncedentFromHiddenFields(IncedentTypes incedent,int feedbackValue)
        {
            problem=new Incedent() { FeedbackValue = feedbackValue, IncedentType = Convert.ToInt32(incedent), HotelID = GetHotel(), UserID = GetUser(), IncedentDescription = additionalComments, IncedentTime=DateTime.Now,RoomNo=GetRoomNo() };
        }
        private IncedentTypes GetIncedentType()
        {
            IncedentTypes incedent;
            //Response.Write(this.Page.Controls[0].ID);
            if (HdnProblemType.Value == ((int)IncedentTypes.Housekeeping).ToString())
            {
                incedent = IncedentTypes.Housekeeping;
                additionalComments = Hdnhousekeeping_comment.Value;
            }
            else if (HdnProblemType.Value == ((int)IncedentTypes.FrontDesk).ToString()) {
                incedent = IncedentTypes.FrontDesk;
                additionalComments = Hdnfrontdesk_comment.Value;
            }
                
            else if (HdnProblemType.Value == ((int)IncedentTypes.CommonArea).ToString())
            {
                incedent = IncedentTypes.CommonArea;
                additionalComments = Hdncommon_comment.Value;
            }
                
            else if (HdnProblemType.Value == ((int)IncedentTypes.Maintenance).ToString())
            {
                incedent = IncedentTypes.Maintenance;
                additionalComments = Hdnmaintain_comment.Value;
            }
                
            else if (HdnProblemType.Value == ((int)IncedentTypes.Room).ToString())
            {
                incedent = IncedentTypes.Room;
                additionalComments = Hdnroom_comment.Value;
            }
                
            else if (HdnProblemType.Value == ((int)IncedentTypes.WiFiInternet).ToString())
            {
                incedent = IncedentTypes.WiFiInternet;
                additionalComments = Hdninternet_comment.Value;
            }
                
            else incedent = IncedentTypes.none;
            return incedent;
        }
        private int GetFeedbackValue(IncedentTypes incedent)
        {
            String feedbackValue = String.Empty;
            if (incedent == IncedentTypes.CommonArea)
            {
                feedbackValue = HdnCommon.Value;
                image = GetImage("common_file");
            }
                
            else if (incedent == IncedentTypes.FrontDesk)
            {
                feedbackValue = HdnFrontdesk.Value;
                image = GetImage("frontdesk_file");
            }
                
            else if (incedent == IncedentTypes.Housekeeping)
            {
                feedbackValue = HdnHousekeeping.Value;
                image = GetImage("housekeeping_file");
            }
                
            else if (incedent == IncedentTypes.Maintenance)
            {
                feedbackValue = HdnMaintenance.Value;
                image = GetImage("maintain_file");
            }
                
            else if (incedent == IncedentTypes.Room)
            {
                feedbackValue = HdnRoom.Value;
                image = GetImage("room_file");
            }
                
            else if (incedent == IncedentTypes.WiFiInternet)
            {
                feedbackValue = HdnWifi.Value;
                image = GetImage("internet_file");
            }
                
            return Convert.ToInt32(feedbackValue);
        }
        private void SetSession(String ID)
        {
            user.UserID = ID;
            Session["User"] = user;
        }
        private void InsertUserInfo()
        {
            user = new User() { RoomNo = TxtRoom.Text, CheckOutDate = Convert.ToDateTime(TxtDate.Text), Email = TxtEmail.Text, HotelID = GetHotel(), LastName = TxtUserLastName.Text };
            String userId=HotelDBApp.User.InsertUserInfo(user);
            if (userId != String.Empty)
            {
                SetSession(userId);
            }
        }
        private void SendEmail()
        {
            
            Dictionary<int, String> FeedbackOptn = Utilities.ProblemTypesList;
            Dictionary<int, String> FeedbackValue = Utilities.FeedbackOptionsList;
            Email email = new Email();
            user = GetUserObject();
            if(problem!=null)
            {
                hotel = GetHotelObject();
                email.ToAddress = hotel.Email;
                email.CustName = user.LastName;
                email.RoomNo = user.RoomNo;
                email.ProblemType = FeedbackOptn[problem.IncedentType];
                email.ProblemValue = FeedbackValue[problem.FeedbackValue];
                email.CheckoutDate = user.CheckOutDate;
                email.Comments = problem.IncedentDescription;
                Utilities.SendEmail(email,false,image);
            }
        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            InsertUserInfo();
            //send email
            
            InsertIntoDatabase();
            SendEmail();
            CheckUserAndSetForm();


        }
        private void InsertIntoDatabase()
        {
            int feedbackValue = 0;
            int result = 0;
            IncedentTypes incedent = GetIncedentType();
            if (incedent != IncedentTypes.none)
            {
                feedbackValue = GetFeedbackValue(incedent);
                if(feedbackValue!=0)
                {
                    LoadIncedentFromHiddenFields(incedent, feedbackValue);
                    result = Incedent.ReportProblem(problem);
                    if (result > 0)
                    {
                        PnlSuccessFailure.Visible = true;
                        PnlSuccessFailure.CssClass = "notification alert-success spacer-t10";
                        LblStatus.Text = "Your Problem has been recorded!";
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
        }
        private HotelDBApp.Image GetImage(String name)
        {
            System.IO.Stream upload = null;
            if((upload= Request.Files[name].InputStream)!=null && Request.Files[name].ContentLength>0)
            {
                
                image = new HotelDBApp.Image() { UploadedImage=upload,Name= Request.Files[name].FileName};
            }
                
            return image;
        }
        protected void LoginBtnSubmit_Click(object sender, EventArgs e)
        {
            //Send email
            InsertIntoDatabase();
            SendEmail();
        }
    }
}