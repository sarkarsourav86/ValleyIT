using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalHotelProject.Admin.production
{
    public partial class ReportedProblems : System.Web.UI.Page
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
            }
        }
    }
}