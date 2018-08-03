using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelDBApp;

namespace FinalHotelProject.Admin.production
{
    public partial class EditProblems : System.Web.UI.Page
    {
        HotelDBApp.Login logininfo;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            SetLoginInfo();
            SetFormValues();
        }
        private int GetProblemId()
        {
            string id = Request.QueryString["Id"];
            int.TryParse(id, out int result);
            return result;
        }
        private void SetFormValues()
        {
            List<object> result=Incedent.FetchProblemByIncedentAndHotelId(logininfo.HotelId, GetProblemId());
            User user=(User)result[0];
            Incedent incedent = (Incedent)result[1];
            LblIncedentId.Text = incedent.IncedentID;
            TxtDesc.Text = incedent.IncedentDescription;
            LblRoomNo.Text = incedent.RoomNo;
            LblTime.Text = incedent.IncedentTime.ToShortDateString();
            DdlIsResolved.SelectedValue = incedent.IsSolved ? "1" : "0";
            TxtEmail.Text = user.Email;
            TxtUname.Text = user.LastName;
            TxtPhone.Text = user.Phone;
        } 
        private void SetLoginInfo()
        {
            logininfo = (HotelDBApp.Login)Session["LoginInfo"];
        }
    }
}