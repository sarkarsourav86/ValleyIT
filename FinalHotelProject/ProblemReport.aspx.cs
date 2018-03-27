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
        enum IncedentTypes
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
            CheckUserAndSetForm();
        }
        private void CheckUserAndSetForm()
        {
            if(Utilities.HasUserCheckedIn(Session["User"]))
            {
                PnlNoLoginBtnContainer.Visible = true;
                PnlLoginBtnContainer.Visible = false;
            }
        }
        private String GetUser()
        {
            //do some db operations
            return Session["User"]!=null? ((User)Session["User"]).UserID:String.Empty;
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
                feedbackValue = HdnCommon.Value;
            else if (incedent == IncedentTypes.FrontDesk)
                feedbackValue = HdnFrontdesk.Value;
            else if (incedent == IncedentTypes.Housekeeping)
                feedbackValue=HdnHousekeeping.Value;
            else if (incedent == IncedentTypes.Maintenance)
                feedbackValue = HdnMaintenance.Value;
            else if (incedent == IncedentTypes.Room)
                feedbackValue = HdnRoom.Value;
            else if (incedent == IncedentTypes.WiFiInternet)
                feedbackValue = HdnWifi.Value;
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
        protected void Submit_Click(object sender, EventArgs e)
        {
            InsertUserInfo();
            //send email
            InsertIntoDatabase();
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
        protected void LoginBtnSubmit_Click(object sender, EventArgs e)
        {
            //Send email
            InsertIntoDatabase();
        }
    }
}