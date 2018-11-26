using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalHotelProject.Admin.production
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        Dictionary<string, HotelDBApp.Login> hotelDict;
        public string HotelName
        {   get
            {
                return LblHotelName.Text;
            }
            set
            {
                LblHotelName.Text = value;
            }
        }
        public string UserName
        {
            get
            {
                return LblUserName.Text;
            }
            set
            {
                LblTopUserName.Text = value;
                LblUserName.Text = value;
            }
        }
        private void SetHyperlink()
        {
            HotelDBApp.Login login = (HotelDBApp.Login)Session["LoginInfo"];
            if(login!=null) HypPaymentLink.NavigateUrl = string.Format("http://theguestxp.com/payment.aspx?HotelId={0}", login.LongHotelId);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(!Page.IsPostBack) AddHotelChoice();
            SetProfilePicture();
            SetHyperlink();
        }
        private void SetProfilePicture()
        {
            string email = ((HotelDBApp.Login)Session["LoginInfo"]).UserName;
            byte[] bytearray=HotelDBApp.UserProfile.GetProfilePhotoById(email);
            string strBase64 = Convert.ToBase64String(bytearray);
            ImgProfile.ImageUrl = string.Format("data:Image/png;base64,{0}", strBase64);
            ImgLogout.ImageUrl= string.Format("data:Image/png;base64,{0}", strBase64);
        }
        private void AddHotelChoice()
        {
            hotelDict = (Dictionary<string, HotelDBApp.Login>)Session["Hotels"];
            if (hotelDict != null)
            {
                DdlHotels.Items.Clear();
                foreach (string item in hotelDict.Keys)
                {
                    DdlHotels.Items.Add(new ListItem(hotelDict[item].HotelName, item));
                }
                DdlHotels.SelectedValue = ((HotelDBApp.Login)Session["LoginInfo"]).HotelId.ToString();
            }
            else DdlHotels.Visible = false;

        }
        protected void OnIndexChange(object sender, EventArgs e)
        {
            hotelDict = (Dictionary<string, HotelDBApp.Login>)Session["Hotels"];
            HotelDBApp.Login login = hotelDict[DdlHotels.SelectedValue];
            Session["LoginInfo"] = login;
            Response.Redirect("Home.aspx");
        }
        protected void LinkLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Abandon();

            // clear authentication cookie
            HttpCookie cookie1 = new HttpCookie(FormsAuthentication.FormsCookieName, "");
            cookie1.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie1);

            // clear session cookie (not necessary for your current problem but i would recommend you do it anyway)
            SessionStateSection sessionStateSection = (SessionStateSection)WebConfigurationManager.GetSection("system.web/sessionState");
            HttpCookie cookie2 = new HttpCookie(sessionStateSection.CookieName, "");
            cookie2.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie2);

            FormsAuthentication.RedirectToLoginPage();
        }

        protected void DdlHotels_SelectedIndexChanged(object sender, EventArgs e)
        {
            Dictionary<string, HotelDBApp.Login> hotelDict = (Dictionary<string, HotelDBApp.Login>)Session["Hotels"];
            Session["LoginInfo"] = hotelDict[DdlHotels.SelectedValue];
            //Request.red
        }
    }
}