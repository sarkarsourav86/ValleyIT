using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelBusinessLayer;

namespace FinalHotelProject.Admin.production
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            HotelDBApp.Login login = Utilities.ValidateLogin(new HotelDBApp.Login() { UserName = TxtUsername.Text, Password = TxtPwd.Text });
            if (login!=null)
            {
                //Store in session
            }
            else
            {
                //show error
            }
        }
    }
}