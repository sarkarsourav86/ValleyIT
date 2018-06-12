using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelDBApp;

namespace FinalHotelProject
{
    public partial class Login : System.Web.UI.Page
    {
        User user=null;
        Hotel hotel=null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"]!=null)
            {
                TogglePanels(true);
            }
            SetHotelFromUrl();
            SetUrl();
            SetHotelName();
            SetRewards();
            SetPhoneNumber();

        }
        private void SetHotelName()
        {
            if(Session["Hotel"]!=null)
            {
               // LblHotelName.Text = ((Hotel)Session["Hotel"]).Brand;
            }
        }
        private void SetRewards()
        {
            if (Session["Hotel"] != null)
            {
                Hotel tempHotel = (Hotel)Session["Hotel"];
                if (!String.IsNullOrEmpty(tempHotel.RewardsLink))
                {
                    HypRewards.NavigateUrl = hotel != null ? hotel.RewardsLink : tempHotel.RewardsLink;
                    LitRewards.Text = hotel != null ? hotel.RewardsName : tempHotel.RewardsName;
                }
                else HypRewards.Visible = false;
                
            }
            
        }
        private void SetHotelFromUrl()
        {
            if (Session["Hotel"] == null)
            {
                String id = Request.QueryString["hotelid"] != null ? Request.QueryString["hotelid"] : String.Empty;
                /*if (Session["Hotel"] != null && Request.QueryString["hotelid"] != null)
                {
                    if (((Hotel)Session["Hotel"]).ID == Request.QueryString["hotelid"]) return;
                    else id = Request.QueryString["hotelid"]; 
                }
                else if (Session["Hotel"] != null && Request.QueryString["hotelid"] == null) return;
                else if (Session["Hotel"] == null && Request.QueryString["hotelid"] != null)
                {
                    id = Request.QueryString["hotelid"];
                }

                else if(Session["Hotel"] == null && Request.QueryString["hotelid"] == null)
                {
                    id = "EDF5189B07131AEED2449E8AAADE84CE4D828FD2A78E25FA7CD7DB8C26B8DB83";

                }*/

                hotel = Hotel.GetHotel(id);
                if (hotel == null)
                    PnlMain.Visible = false;
                else SetHotelInfo();
            }
        }
        private void SetUrl()
        {
            String ID = String.Empty;
            if((ID=Request.QueryString["hotelid"]) != null)
            {
                
                HypProblemReport.NavigateUrl = String.Format("{0}?hotelid={1}",HypProblemReport.NavigateUrl.Split('?')[0],ID);
                HypStay.NavigateUrl = String.Format("{0}?hotelid={1}", HypStay.NavigateUrl.Split('?')[0], ID);
                HypPlaces.NavigateUrl= String.Format("{0}?hotelid={1}", HypPlaces.NavigateUrl.Split('?')[0], ID);
                
                //Uri uri = new Uri("@"+HypProblemReport.NavigateUrl);
                //HypProblemReport.NavigateUrl=String.Format("{0}?hotelid={1}",uri.OriginalString.Replace(uri.Query, String.Empty),ID);
                //HypProblemReport.NavigateUrl = String.Format(HypProblemReport.NavigateUrl + "?hotelid={0}", ID);
                //Request.Url.GetLeftPart(UriPartial.Path) + "?hotelid={0}",id
                //uri = new Uri(HypStay.NavigateUrl);
                // HypStay.NavigateUrl= String.Format("{0}?hotelid={1}", uri.OriginalString.Replace(uri.Query, String.Empty), ID);
            }
        }
        private void SetPhoneNumber()
        {
            if(Session["Hotel"]!=null)
            {
                String number = ((Hotel)Session["Hotel"]).Phone;
                HypPhone.NavigateUrl = String.Format("tel://{0}", number);
                
            }
        }
        private void TogglePanels(bool ShouldHide)
        {
            PnlLogin.Visible = BtnCheckin.Visible = !ShouldHide;
             
        }
        private String GetHotelID()
        {
            String HotelID = null;
            if (Session["Hotel"] != null)
            {
                HotelID = ((Hotel)Session["Hotel"]).ID;
                //HypPhone.NavigateUrl = String.Format("tel://{0}", HotelID);
            }
            return HotelID;
        }
        protected void BtnCheckin_Click(object sender, EventArgs e)
        {
            user = new HotelDBApp.User() { LastName = TxtLastname.Text, CheckOutDate = ToDateTime(TxtDate.Text), Email = TxtEmail.Text, RoomNo = TxtRoom.Text, HotelID = GetHotelID()==null? "ND1": GetHotelID(),UserIdString=Guid.NewGuid().ToString("N") };
            int userId = HotelDBApp.User.InsertUserInfo(user);
            if (userId != -100)
            {
                SetSession(userId);
                TogglePanels(true);
            }
        }
        private DateTime ToDateTime(String value)
        {
            DateTime result;
            DateTime.TryParse(value, out result);
            return result;
        }
        private void SetSession(int userId)
        {
            user.UserID = userId;
            Session["User"] = user;
        }
        private void SetHotelInfo()
        {
            Session["Hotel"] = hotel;
        }
       
    }
}