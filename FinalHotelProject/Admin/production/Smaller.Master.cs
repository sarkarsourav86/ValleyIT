using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalHotelProject.Admin.production
{
    public partial class Smaller : System.Web.UI.MasterPage
    {
        public string HotelName
        {
            get
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
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}