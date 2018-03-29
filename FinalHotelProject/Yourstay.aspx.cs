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
        Incedent problem;
        User user;
        ProblemReport1.IncedentTypes incedent = ProblemReport1.IncedentTypes.Room;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckUserAndSetForm();
        }
        private String GetUser()
        {
            //do some db operations
            return Session["User"] != null ? ((User)Session["User"]).UserID : String.Empty;
        }
        private String GetHotel()
        {
            //do some db operations
            //return Session["User"] != null ? ((User)Session["User"]).HotelID : String.Empty;
            return "AK032";
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
        private void CheckUserAndSetForm()
        {
            if (Utilities.HasUserCheckedIn(Session["User"]))
            {
                PnlNoLoginBtnContainer.Visible = true;
                PnlLoginBtnContainer.Visible = false;
            }
        }
        private void SetSession(String ID)
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
            user = new User() { RoomNo = TxtRoom.Text, CheckOutDate = Convert.ToDateTime(TxtDate.Text), Email = TxtEmail.Text, HotelID = GetHotel(), LastName = TxtUserLastName.Text };
            String userId = HotelDBApp.User.InsertUserInfo(user);
            if (userId != String.Empty)
            {
                SetSession(userId);
            }
        }
        protected void NoLoginSubmit_Click(object sender, EventArgs e)
        {
            InsertIntoDatabase();
        }

        protected void LoginBtnSubmit_Click(object sender, EventArgs e)
        {
            InsertUserInfo();
            InsertIntoDatabase();
            CheckUserAndSetForm();
        }
    }
}