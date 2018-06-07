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
                email.CustName = user.LastName;
                email.RoomNo = user.RoomNo;
                email.ProblemType = FeedbackOptn[problem.IncedentType];
                email.ProblemValue = FeedbackValue[problem.FeedbackValue];
                email.CheckoutDate = user.CheckOutDate;
                email.Comments = problem.IncedentDescription;
                image = GetImage("file");
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
        private void SetSession(Decimal ID)
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
            user = new User() { RoomNo = TxtRoom.Text, CheckOutDate = Convert.ToDateTime(TxtDate.Text), Email = TxtEmail.Text, HotelID = GetHotel(), LastName = TxtUserLastName.Text, UserIdString = Guid.NewGuid().ToString("N") };
            Decimal userId = HotelDBApp.User.InsertUserInfo(user);
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