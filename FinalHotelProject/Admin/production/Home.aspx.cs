using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelDBApp;
using HotelBusinessLayer;
using System.Data;

namespace FinalHotelProject.Admin.production
{
    public partial class LinegraphComplaints : System.Web.UI.Page
    {
        HotelDBApp.Login logininfo;
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadItems();
            LoadRecentCommentsAtBottom();
        }
        private void LoadRecentCommentsAtBottom()
        {
            DataSet MainDs=Incedent.FetchProblems(logininfo.HotelId,10);
            DataSet CompleedProblemsDs = Incedent.FetchProblems(logininfo.HotelId, 0,1);
            /*DataRow[] FirstCommentDR = MainDs.Tables[0].AsEnumerable().Take(5).ToArray();
            DataRow[] SecondCommentDR = MainDs.Tables[0].AsEnumerable().Skip(5).ToArray();
            DataTable cloneTable = MainDs.Tables[0].Clone();
            DataTable FirstCommentdt = Utilities.AddRowsToTable(cloneTable,FirstCommentDR);
            DataTable SecondCommentdt = Utilities.AddRowsToTable(cloneTable,SecondCommentDR);*/
            RptRecentComments.DataSource = MainDs;
            RptRecentComments.DataBind();
            RptRecentComments2.DataSource = MainDs;
            RptRecentComments2.DataBind();
            RptCompleted.DataSource = CompleedProblemsDs;
            RptCompleted.DataBind();
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
                this.Master.HotelName = logininfo.HotelName;
                this.Master.UserName= logininfo.UserName;
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