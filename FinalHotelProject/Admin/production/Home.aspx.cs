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
    public partial class LinegraphComplaints : System.Web.UI.Page
    {
        HotelDBApp.Login logininfo;
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadItems();
        }
        private void LoadUserStatus()
        {
            if (logininfo != null)
            {
                Dictionary<string, int> dict = Utilities.UserStatus(logininfo.HotelId);
                LblNumOfUsers.Text = dict["users"].ToString();
                LblNumOfGoodReviews.Text = dict["good"].ToString();
                LblNumOfBadReviews.Text = dict["bad"].ToString();
                LblCompleted.Text = dict["resolved"].ToString();
            }
            
        }
        private void LoadIncedents()
        {
            if(logininfo!=null)
            {
                
                RptIncedents.DataSource = Incedent.FetchProblems(logininfo.HotelId, 1);
                RptIncedents.DataBind();
            }
            
        }
        private void LoadItems()
        {
            logininfo = (HotelDBApp.Login)Session["LoginInfo"];
            if(logininfo!=null)
            {
                HdnHotelId.Value = logininfo.HotelId.ToString();
                LoadIncedents();
                LoadUserStatus();
            }
            
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            LoadIncedents();
        }

        protected void Timer0_Tick(object sender, EventArgs e)
        {
            LoadUserStatus();
        }
    }
}