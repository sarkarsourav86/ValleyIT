﻿using System;
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

        protected void BtnUpdatePassword_Click(object sender, EventArgs e)
        {
            //get the old password
            string oldpwd = Password.GetPassword(logininfo.UserName);
            string TypedOldPassword = TxtOldPwd.Text;
            string NewPassword = TxtNewPwd.Text;
            string ConfirmNewPassword = TxtConfirmPassword.Text;
            bool isOldPwdMatch = (oldpwd==TypedOldPassword);
            bool isNewPwdMatch = (NewPassword == ConfirmNewPassword);
            
            //get the new
            //get the confirm new
        }
    }
}