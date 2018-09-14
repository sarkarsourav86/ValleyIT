using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalHotelProject.Admin.production
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        public string HotelName
        {   get
            {
                return LblHotelName.Text;
            }
            set
            {
                LblHotelName.Text = value;
            }
        }
        public string UserName
        {
            get
            {
                return LblUserName.Text;
            }
            set
            {
                LblTopUserName.Text = value;
                LblUserName.Text = value;
            }
        }
        private void SetHyperlink()
        {
            HotelDBApp.Login login = (HotelDBApp.Login)Session["LoginInfo"];
            HypPaymentLink.NavigateUrl = string.Format("http://theguestxp.com/payment.aspx?HotelId={0}", login.LongHotelId);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            SetHyperlink();
        }
    }
}