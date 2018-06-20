using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
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
            else if(HasValidUserId())
            {
                SetSession(-999);
                TogglePanels(true);
            }
            SetHotelFromUrl();
            SetUrl();
            SetHotelName();
            SetRewards();
            SetPhoneNumber();

        }
        private bool HasValidUserId()
        {
            String id = Request.QueryString["user"]!=null? Request.QueryString["user"]:String.Empty;
            user = HotelDBApp.User.GetUserInfo(id);
            bool isValidQueryString = !String.IsNullOrEmpty(id);
            bool isValidId = user !=null ? true : false;
            return isValidQueryString && isValidId;
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
            user = new HotelDBApp.User() { LastName = TxtLastname.Text, CheckOutDate = ToDateTime(TxtDate.Text), Email = TxtEmail.Text, RoomNo = TxtRoom.Text, HotelID = GetHotelID()==null? "ND1": GetHotelID(),UserIdString=Guid.NewGuid().ToString("N"),Phone=TxtPhone.Text };
            int userId = HotelDBApp.User.InsertUserInfo(user);
            if (userId != -100)
            {
                SetSession(userId);
                TogglePanels(true);
                CreateEmailAndSend(user);
            }
        }
        private void CreateEmailAndSend(User user)
        {
            String hotellink = String.Format("{0}Login.aspx?hotelid={1}&user={2}", ConfigurationManager.AppSettings["serverName"], GetHotelID(),user.UserIdString);
            Email email= new Email()
            {
                Subject = "Registration Successful",
                ToAddress = user.Email,
                Body = String.Format("<!doctype html><html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><title>My GuestXp</title><link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\"><style> .checked {{ color: orange;}}a:link {{color: #0a79ea;text-decoration: none;}}a:visited {{color: #000000;text-decoration: none;}}a:link#tops {{color: #000000;text-decoration: none;}}body, td, th {{font-family: Arial, \"Helvetica Neue\", Helvetica, Gotham, sans-serif;font-style: normal;font-weight: normal;font-size: 14px;color: #000000;}}body {{margin-left: 10px;margin-top: 10px;margin-right: 10px;margin-bottom: 10px;background-color: #FFFFFF;}}.BODY {{border-bottom: 1px solid #e8eef2;border-left: 1px solid #e8eef2;border-right: 1px solid #e8eef2;border-top: 1px solid #e8eef2;}}.tableu {{border-bottom: 2px solid #F4CC1F;border-left: 2px solid #F4CC1F;border-right: 2px solid #F4CC1F;border-top: 2px solid #F4CC1F;}}</style></head><body><table bgcolor=\"#ffffff\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" border=\"0\" class=\"BODY\" width=\"600\"> <tr> <td align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\"> <tr> <td valign=\"top\"><a href=\"http://myguestxp.com/\"><img src=\"http://finalhotelproject20180523071047.azurewebsites.net/images/banner.jpg\" alt=\"Banner\" width=\"600\" height=\"407\" style=\"display:block\" title=\"Banner\"></a></td> </tr> </table> <table background=\"#FAF9F7\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\" bgcolor=\"#FAF9F7\"> <tbody> <tr> <td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">For choosing to stay with us. We know you had a lot of options and we appreciate you choosing us. <br />We would like to make your stay as comfortable as possible. If any problems arise during your stay, please click on this link to send us instant feedback and we will be glad to make it right. <br /><a href={0}>Click here</a><br/>Once again thank you for staying with us.<br/></td> </tr> </tbody> </table> <table background=\"#FAF9F7\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\" bgcolor=\"#FAF9F7\"> <tbody> <tr> <td bgcolor=\"#FAFAF8\" style=\"padding: 15px 25px 20px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">Thank you!<br />From Management.<br /></td> </tr> </tbody> </table> <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\" bgcolor=\"#1F4691\"> <tbody> <tr> <td bgcolor=\"#1F4691\" style=\"padding:10px 10px 10px 10px;text-align:center; line-height:22px; color: #FFFFFF\"> &copy; Copyright 2018 - MyGuestXp <br /></td> </tr> </tbody> </table></td> </tr></table></body></html>", hotellink)
            };
            HotelBusinessLayer.Utilities.SendEmail(email, false, null);
        }
        private DateTime ToDateTime(String value)
        {
            DateTime result;
            DateTime.TryParse(value, out result);
            return result;
        }
        private void SetSession(int userId)
        {
            if(userId!=-999)
                user.UserID = userId;
            Session["User"] = user;
        }
        private void SetHotelInfo()
        {
            Session["Hotel"] = hotel;
        }
       
    }
}