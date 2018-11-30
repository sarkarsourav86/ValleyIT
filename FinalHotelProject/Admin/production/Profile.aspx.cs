using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelDBApp;

namespace FinalHotelProject.Admin.production
{
    public partial class Profile : System.Web.UI.Page
    {
        HotelDBApp.Login logininfo;
        protected void Page_Load(object sender, EventArgs e)
        {
            SetLoginInfo();
            SetHiddenField();
        }
        private void SetLoginInfo()
        {
            logininfo = (HotelDBApp.Login)Session["LoginInfo"];
        }
        private void SetHiddenField()
        {
            if (logininfo != null)
            {
                HdnHotelId.Value = logininfo.HotelId.ToString();

                this.Master.HotelName = logininfo.HotelName;
                this.Master.UserName = logininfo.UserName.Split('@')[0];
            }
        }

        protected void BtnUpdateProfilePicture_Click(object sender, EventArgs e)
        {
            HttpPostedFile file = FileProfilePhoto.PostedFile;
            if(file.ContentLength>0)
            {
                Stream stream = file.InputStream;
                BinaryReader reader = new BinaryReader(stream);
                byte[] bytes=reader.ReadBytes((int)stream.Length);
                UserProfile.UpdateProfilePicture(bytes, logininfo.UserName);
            }
        }
        private void ShowLabelStatus(string message,string cssClass,Panel panel,Literal lit)
        {
            Dictionary<string, string> css = new Dictionary<string, string>() { { "success", "alert alert-success alert-dismissible fade in" },{"fail", "alert alert-danger alert-dismissible fade in" } };
            panel.Visible = true;
            panel.CssClass = css[cssClass];
            lit.Text = message;
        }
        protected void BtnUpdatePassword_Click(object sender, EventArgs e)
        {
            //get the old password
            string oldpwd = Password.GetPassword(logininfo.UserName);
            string TypedOldPassword = TxtOldPwd.Text;
            string NewPassword = TxtNewPwd.Text;
            string ConfirmNewPassword = TxtConfirmPwd.Text;
            bool isOldPwdMatch = (oldpwd==TypedOldPassword);
            bool isNewPwdMatch = (NewPassword == ConfirmNewPassword);
            if (!isOldPwdMatch)
            {
                ShowLabelStatus("The old password doesn't match with the typed one", "fail",PnlPwdChangeStatus, LitLabelText);
                return;
            }
            if (!isNewPwdMatch)
            {
                ShowLabelStatus("New password and confirm paswword don't match", "fail", PnlPwdChangeStatus, LitLabelText);
                return;
            }
            string username = logininfo.UserName;
            if(Password.UpdatePasswordFromProfile(username, NewPassword) > 0)
            {
                ShowLabelStatus("Your password has been successfully updated", "success", PnlPwdChangeStatus, LitLabelText);
            }
            //get the new
            //get the confirm new
        }

        protected void BtnAddUser_Click(object sender, EventArgs e)
        {
            string NewPassword = TxtPassword.Text;
            string ConfirmNewPassword = TxtConfirmPassword.Text;
            bool doPasswordsMatch = NewPassword == ConfirmNewPassword;
            if (!doPasswordsMatch)
            {
                ShowLabelStatus("New password and confirm paswword don't match", "fail",PnlAddUserStatus,LitAddUserStatus);
                return;
            }
        }
    }
}