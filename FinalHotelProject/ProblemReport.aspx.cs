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
            return "AK032_1";
        }
        private String GetHotel()
        {
            //do some db operations
            return "AK032";
        }
        private String GetRoomNo()
        {
            return "102";
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
                feedbackValue=HdnFrontdesk.Value;
            else if (incedent == IncedentTypes.Maintenance)
                feedbackValue = HdnMaintenance.Value;
            else if (incedent == IncedentTypes.Room)
                feedbackValue = HdnRoom.Value;
            else if (incedent == IncedentTypes.WiFiInternet)
                feedbackValue = HdnWifi.Value;
            return Convert.ToInt32(feedbackValue);
        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            
            int feedbackValue = 0;
            int result = 0;
            IncedentTypes incedent = GetIncedentType();
            if(incedent!=IncedentTypes.none)
            {
                feedbackValue= GetFeedbackValue(incedent);
                LoadIncedentFromHiddenFields(incedent, feedbackValue);
                result=Incedent.ReportProblem(problem);
                if(result>0)
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
            
        }

        protected void LoginBtnSubmit_Click(object sender, EventArgs e)
        {

        }
    }
}