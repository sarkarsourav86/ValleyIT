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
        private void LoadIncedentFromHiddenFields(int feedbackValue)
        {
            problem = new Incedent() { FeedbackValue = feedbackValue, IncedentType = Convert.ToInt32(incedent), HotelID = GetHotel(), UserID = GetUser(), IncedentDescription = additionalComments, IncedentTime = DateTime.Now, RoomNo = GetRoomNo() };
        }
        private void CheckUserAndSetForm()
        {
            if (Utilities.HasUserCheckedIn(Session["User"]))
            {
                PnlNoLoginBtnContainer.Visible = true;
                PnlLoginBtnContainer.Visible = false;
            }
        }
    }
}