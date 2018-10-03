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
        string id = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private string CreatePasswordResetLink()
        {
            id = Guid.NewGuid().ToString("N");
            return string.Format("https://theguestxp.com/Admin/production/ResetPassword.aspx?Resetid={0}", id);
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
        private bool SendRequestToDatabase()
        {
            if (ValidateEmailId(TxtEmail.Text))
            {
                PnlValidEmail.Visible = false;
                Email email = CreateEmail();
                Utilities.SendEmail(email);
             
                return Password.AddPasswordResetReqToDB(TxtEmail.Text, id);
            }
            else
            {
                PnlValidEmail.Visible = true;
                return false;
            }
            
        }
        private void ShowLabel(Panel pnl, string cssclass, string text, Label lbl, bool visible)
        {
            if (visible)
            {
                pnl.Visible = true;
                pnl.CssClass = cssclass;
                lbl.Text = text;

            }
            else pnl.Visible = false;

        }
        private bool ValidateEmailId(string emailId)
        {
            return Email.ValidateAdminEmailId(emailId);
        }
        protected void BtnRequest_Click(object sender, EventArgs e)
        {
            if(SendRequestToDatabase())
            {
                ShowLabel(PnlAlert, "alert alert-success alert-dismissible fade in", "Your Password Reset Link has been Emailed to you.", LblStatus, true);
            }
            else
            {
                //ShowLabel(PnlAlert, "alert alert-error alert-dismissible fade in", "Your Email wasn't found in our system.", LblStatus, true);
            }



        }
    }
}