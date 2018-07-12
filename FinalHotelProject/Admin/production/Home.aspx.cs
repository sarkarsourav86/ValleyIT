using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelDBApp;

namespace FinalHotelProject.Admin.production
{
    public partial class LinegraphComplaints : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadIncedents();
        }
        private void LoadIncedents()
        {
            HotelDBApp.Login logininfo = (HotelDBApp.Login)Session["LoginInfo"];
            if(logininfo!=null)
            {
                RptIncedents.DataSource= Incedent.FetchProblems(logininfo.HotelId, 1);
                RptIncedents.DataBind();
            }
            
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            LoadIncedents();
        }
    }
}