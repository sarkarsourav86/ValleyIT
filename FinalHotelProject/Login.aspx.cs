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
        User user=null;
        Hotel hotel=null;
        protected void Page_Load(object sender, EventArgs e)
        {
            SetPhoneNumber();
            if (Session["user"]!=null)
            {
                TogglePanels(true);
            }
        }
        private void SetPhoneNumber()
        {
            if(Session["Hotel"]!=null)
            {
                String number = ((Hotel)Session["Hotel"]).Phone;
                HypPhone.NavigateUrl = String.Format("tel://{0}", number);
            }
        }
        private void TogglePanels(bool ShouldHide)
        {
            PnlLogin.Visible = BtnCheckin.Visible = !ShouldHide;
             
        }
        private String GetHotelID()
        {
            String HotelID = null;
            if (Session["Hotel"] != null)
            {
                HotelID = ((Hotel)Session["Hotel"]).ID;
                HypPhone.NavigateUrl = String.Format("tel://{0}", HotelID);
            }
            return HotelID;
        }
        protected void BtnCheckin_Click(object sender, EventArgs e)
        {
            user = new HotelDBApp.User() { LastName = TxtLastname.Text, CheckOutDate = ToDateTime(TxtDate.Text), Email = TxtEmail.Text, RoomNo = TxtRoom.Text, HotelID = GetHotelID()==null? "AK032": GetHotelID() };
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
        private void SetHotelInfo()
        {
            Session["Hotel"] = hotel;
        }
        protected void DdlHotels_SelectedIndexChanged(object sender, EventArgs e)
        {
            String id = DdlHotels.SelectedValue;
            hotel = Hotel.GetHotel(id);
            SetHotelInfo();
            string url = String.Format(Request.Url.GetLeftPart(UriPartial.Path) + "?hotelid={0}",id);
            Response.Redirect(url, true);
            
        }
    }
}