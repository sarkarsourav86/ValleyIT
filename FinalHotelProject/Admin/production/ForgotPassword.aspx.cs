using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelDBApp;
using HotelBusinessLayer;

namespace FinalHotelProject.Admin.production
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private string CreatePasswordResetLink()
        {
            return string.Format("https://theguestxp.com/Admin/production/Forgotpassword.aspx?Resetid={0}", Guid.NewGuid().ToString("N"));
        }
        private Email CreateEmail()
        {
            return new Email()
            {
                ToAddress = TxtEmail.Text.Trim(),
                Subject = "MyGuestXp - Password Reset Link",
                Body =string.Format("Your password reset link is here <a href='{0}'>{0}</a>",CreatePasswordResetLink())
            };
        }
        private bool ValidateEmailId(string emailId)
        {
            return Email.ValidateAdminEmailId(emailId);
        }
        protected void BtnRequest_Click(object sender, EventArgs e)
        {
            if (ValidateEmailId(TxtEmail.Text))
            {
                Email email = CreateEmail();
                Utilities.SendEmail(email);
            }
            else
            {

            }
            
            
        }
    }
}