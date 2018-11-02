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
    public partial class Smaller : System.Web.UI.MasterPage
    {
        public string HotelName
        {
            get
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
            if (login != null) HypPaymentLink.NavigateUrl = string.Format("http://theguestxp.com/payment.aspx?HotelId={0}", login.LongHotelId);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            SetHyperlink();
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
    }
}