using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelDBApp;

namespace FinalHotelProject
{
    public partial class Login : System.Web.UI.Page
    {
        User user;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user"]!=null)
            {
                TogglePanels(true);
            }
        }
        private void TogglePanels(bool ShouldHide)
        {
            PnlLogin.Visible = BtnCheckin.Visible = !ShouldHide;
             
        }
        protected void BtnCheckin_Click(object sender, EventArgs e)
        {
            user = new HotelDBApp.User() { LastName = TxtLastname.Text, CheckOutDate = ToDateTime(TxtDate.Text), Email = TxtEmail.Text, RoomNo = TxtRoom.Text, HotelID = "AK032" };
            String userId = HotelDBApp.User.InsertUserInfo(user);
            if (userId != String.Empty)
            {
                SetSession(userId);
                TogglePanels(true);
            }
        }
        private DateTime ToDateTime(String value)
        {
            DateTime result;
            DateTime.TryParse(value, out result);
            return result;
        }
        private void SetSession(String userId)
        {
            user.UserID = userId;
            Session["User"] = user;
        }
    }
}