using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelDBApp;

namespace FinalHotelProject.Admin.production
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        string ResetId = String.Empty;
        private string GetResetId()
        {
            return Request.QueryString["Resetid"]==null?string.Empty: Request.QueryString["Resetid"];
        }
        private bool MatchPasswords()
        {
            return TxtNewPassword.Text == TxtConfirmNewPassword.Text;
        }
        private void ResetPasswordInDatabase(Password password)
        {
           if(Password.UpdatePassword(password))
            {
                ShowLabel(PnlAlert, "alert alert-success alert-dismissible fade in", "Your password has been successfully updated", LblStatus, true);
            }
           else
            {
                ShowLabel(PnlAlert, "alert alert-error alert-dismissible fade in", "Either the entered email is wrong or your password reset link has expired", LblStatus, true);
            }
            
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            ResetId=GetResetId();
        }
        private void ShowLabel(Panel pnl,string cssclass,string text,Label lbl,bool visible)
        {
            if (visible)
            {
                pnl.Visible = true;
                pnl.CssClass = cssclass;
                lbl.Text = text;

            }
            else pnl.Visible=false;
            
        }
        protected void BtnResetPassword_Click(object sender, EventArgs e)
        {
            if (MatchPasswords())
            {
                
                Password password = new Password()
                {
                    Email = TxtEmailId.Text,
                    NewPassword = TxtNewPassword.Text,
                    ResetId = ResetId
                };
                ResetPasswordInDatabase(password);
            }
            else
            {
                ShowLabel(PnlAlert, "alert alert-error alert-dismissible fade in", "Password Don't Match", LblStatus, true);
                
            }
            
        }
    }
}