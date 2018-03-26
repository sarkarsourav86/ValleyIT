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
        Incedent incedent;
        enum IncedentTypes
        {
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
        private void LoadIncedentFromHiddenFields()
        {
            //incedent=new Incedent() { FeedbackValue= IncedentTypes.}
        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            BtnSubmit.Text = HdnRoom.Value;
        }
    }
}