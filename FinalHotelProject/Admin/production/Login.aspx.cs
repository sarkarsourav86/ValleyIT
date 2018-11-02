using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelBusinessLayer;
using System.Web.Security;

namespace FinalHotelProject.Admin.production
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void AddCookie(HotelDBApp.Login login)
        {
            FormsAuthentication.SetAuthCookie(login.UserName, false);
            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, login.UserName, DateTime.Now, DateTime.Now.AddMinutes(60), false, login.Role);
            HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(ticket));
            Response.Cookies.Add(cookie);
        }
        private void SetSession(HotelDBApp.Login login)
        {
            Session["LoginInfo"] = login;
        }
        private void ReturnToUrl()
        {
            String returnURL = Request.QueryString["ReturnUrl"];
            if (returnURL != null)
            {
                Response.Redirect(returnURL);
            }
            else
            {
                Response.Redirect("Home.aspx");
            }
        }
        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            List<HotelDBApp.Login> login = Utilities.ValidateLogin(new HotelDBApp.Login() { UserName = TxtUsername.Text, Password = TxtPwd.Text });
            if (login.Count==1)
            {
                //Store in session
                
                AddCookie(login[0]);
                SetSession(login[0]);
                ReturnToUrl();
                
            }
            else if(login.Count>1)
            {
                Dictionary<string, HotelDBApp.Login> hotelDict = new Dictionary<string, HotelDBApp.Login>();
                foreach (HotelDBApp.Login item in login)
                {
                    hotelDict.Add(item.HotelId.ToString(), item);
                }
                Session["Hotels"] = hotelDict;
                AddCookie(login[0]);
                SetSession(login[0]);
                ReturnToUrl();
                //PnlLogin.Visible = false;
                //PnlAfterLogin.Visible = true;
                //foreach (HotelDBApp.Login item in login)
                //{
                //    LinkButton link = new LinkButton();
                //    link.+=
                //    PnlAfterLogin.Controls.Add(new LinkButton() { Text = item.HotelName });
                //}

                //show error
            }
        }
    }
}