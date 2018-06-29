using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelDBApp;
using HotelBusinessLayer;
using System.Data;
namespace FinalHotelProject
{
    public partial class RegisterHotel : System.Web.UI.Page
    {
        String PaymentId;
        String PaymentEmail;
        
        private void MakeMainPanelInvisible(String message,String cssClass)
        {
            PnlMain.Visible = false;
            PnlError.Visible = true;
            PnlError.CssClass = cssClass;
            LblError.Text = message;
        }
        private String CreateLink(String id)
        {
            return String.Format("{0}Login.aspx?hotelid={1}",System.Configuration.ConfigurationManager.AppSettings["serverName"],id);
        }
        private Email CreateEmail(String subject,String toEmail,String body)
        {
            return new Email() { Body=body, Subject=subject, ToAddress=toEmail };
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!ValidateID())
            {

                MakeMainPanelInvisible("Your link has expired or you have already registered.", "notification alert-error spacer-t10");
            }
            else
            {
                HdnEmail.Value = TxtEmail.Text;
                if(!IsPostBack)
                    LoadFranchiseDdl();
            }
            
           
        }
        private void LoadFranchiseDdl()
        {
            DataSet ds = Hotel.FetchFranchise();

            DdlFranchise.DataSource = ds;
            DdlFranchise.DataBind();
            DdlFranchise.SelectedValue = "0";
        }
        private void LoadFranchiseBrandDdl(int id)
        {
            PnlBrand.Visible = true;
            DataSet ds=Hotel.FetchFranchiseBrand(id);
            
            DdlFranchiseBrands.DataSource = ds;
            DdlFranchiseBrands.DataBind();
            DdlFranchiseBrands.SelectedValue = "0";
        }
        private bool ValidateID()
        {
            PaymentId = GetID();
            if(!String.IsNullOrEmpty(PaymentId))
            {
                PaymentEmail= HotelDBApp.Hotel.ValidateHotelRegistration(PaymentId);
            }
            return !String.IsNullOrEmpty(PaymentId) && !String.IsNullOrEmpty(PaymentEmail) ? true : false;
        }
        private bool ValidateEmail()
        {
            return TxtPaymentEmail.Text.ToLower() == PaymentEmail.ToLower();
        }

        public String GetID()
        {
            return Request.QueryString["id"];
        }
        private String[] FormatAddress(String address)
        {
            try
            {
                int length = address.Split(',').Length;
                String firstLine = address;
                String city = address.Split(',')[length - 3].Trim();
                String state = address.Split(',')[length - 2].Trim().Split(' ')[0];
                String zip = address.Split(',')[length - 2].Trim().Split(' ')[1];
                String country = address.Split(',')[length - 1].Trim();
                return new String[] { firstLine, city, state, zip, country };
            }
            catch(Exception ex)
            {
                return null;
            }

        }
        private HotelDBApp.Hotel CreateHotel()
        {
            String [] address=FormatAddress(HdnAddress.Value);
            return address!=null? new HotelDBApp.Hotel() {
                Email = HdnEmail.Value,
                Address_Line1 = address[0],
                City = address[1],
                State = address[2],
                PostalCode = address[3],
                Country = address[4],
                LatLong = HdnLatLong.Value,
                PlaceId = HdnPlaceId.Value,
                ID = HdnId.Value + Guid.NewGuid().ToString("N"),
                GeneralManager = TxtGm.Text,
                Phone = TxtPhone.Text,
                Brand = HdnPlaceName.Value,
                PaymentId = PaymentId,
                Franchise = int.Parse(DdlFranchise.SelectedValue),
                FranchiseBrand = DdlFranchiseBrands.Visible ? int.Parse(DdlFranchiseBrands.SelectedValue) : 0
            }:null;
        }
        private HotelDBApp.Admin CreateNewAdmin(Hotel hotel)
        {
            return new HotelDBApp.Admin() { UserName=hotel.Email,HotelId=hotel.ID,Password=Utilities.MakePassword(),Role="SuperAdmin"};
        }
        private void SendEmail(String linkId,String[] toAddress, HotelDBApp.Admin admin)
        {
            String footer = System.Configuration.ConfigurationManager.AppSettings["emailfooter"];
            String link = String.Format(" <a href={0}>{0}</a>", CreateLink(linkId));
            //String body = $"<!doctype html><html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><title>Reliable WiFi </title><style>a:link {{color: #0a79ea;text-decoration: none;}}a:visited {{color: #000000;text-decoration: none;}}a:link#tops {{color: #000000;text-decoration: none;}}body, td, th {{font-family: Arial, \"Helvetica Neue\", Helvetica, Gotham, sans-serif;font-style: normal;font-weight: normal;font-size: 14px;color: #000000;}}body {{margin-left: 10px;margin-top: 10px;margin-right: 10px;margin-bottom: 10px;background-color: #FFFFFF;}}.BODY {{border-bottom: 1px solid #e8eef2;border-left: 1px solid #e8eef2;border-right: 1px solid #e8eef2;border-top: 1px solid #e8eef2;}}.tableu {{border-bottom: 2px solid #F4CC1F;border-left: 2px solid #F4CC1F;border-right: 2px solid #F4CC1F;border-top: 2px solid #F4CC1F;}}</style></head><body><table bgcolor=\"#ffffff\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" border=\"0\" class=\"BODY\" width=\"600\"> <tr> <td align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\"> <tr> <td valign=\"top\"><a href=\"http://na414-41ac69.pages.infusionsoft.net/\"><img src=\"http://finalhotelproject20180523071047.azurewebsites.net/images/logohotel.png\" alt=\"Banner\" style=\"display:block\" title=\"Banner\"></a></td> </tr> </table> <table background=\"#FAF9F7\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\" bgcolor=\"#FAF9F7\"> <tbody><tr><td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\"><b>Here is the unique link of your hotel {link}</b></td></tr><tr><td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">This link will be for the name of the hotel registered. To avoidconfusing your guests please don’t use the link for any other hotel.</td></tr><tr><td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">Please give this unique link to your IT person or WiFi/HSIA Vendor to put this link as the redirect page orlanding page.</td></tr><tr><td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">Once that is done you will start receiving instant feedback to the email you registered with.</td></tr> </tbody> </table> <table background=\"#FAF9F7\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\" bgcolor=\"#FAF9F7\"> <tbody> <tr> <td bgcolor=\"#FAFAF8\" style=\"padding: 15px 25px 20px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">From Management.<br /></td> </tr> </tbody> </table> <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\" bgcolor=\"#1F4691\"> <tbody> <tr> <td bgcolor=\"#1F4691\" style=\"padding:10px 10px 10px 10px;text-align:center; line-height:22px; color: #FFFFFF\"> {footer}</td> </tr> </tbody> </table></td> </tr></table></body></html>";
            String body = $"<!doctype html><html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><title>Reliable WiFi </title><style>a:link {{color: #0a79ea;text-decoration: none;}}a:visited {{color: #000000;text-decoration: none;}}a:link#tops {{color: #000000;text-decoration: none;}}body, td, th {{font-family: Arial, \"Helvetica Neue\", Helvetica, Gotham, sans-serif;font-style: normal;font-weight: normal;font-size: 14px;color: #000000;}}body {{margin-left: 10px;margin-top: 10px;margin-right: 10px;margin-bottom: 10px;background-color: #FFFFFF;}}.BODY {{border-bottom: 1px solid #e8eef2;border-left: 1px solid #e8eef2;border-right: 1px solid #e8eef2;border-top: 1px solid #e8eef2;}}.tableu {{border-bottom: 2px solid #F4CC1F;border-left: 2px solid #F4CC1F;border-right: 2px solid #F4CC1F;border-top: 2px solid #F4CC1F;}}</style></head><body><table bgcolor=\"#ffffff\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" border=\"0\" class=\"BODY\" width=\"600\"> <tr> <td align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\"> <tr> <td valign=\"top\"><a href=\"http://na414-41ac69.pages.infusionsoft.net/\"><img src=\"http://finalhotelproject20180523071047.azurewebsites.net/images/logohotel.png\" alt=\"Banner\" style=\"display:block\" title=\"Banner\"></a></td> </tr> </table> <table background=\"#FAF9F7\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\" bgcolor=\"#FAF9F7\"> <tbody><tr><td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\"><b>Here is the unique link of your hotel {link}</b></td></tr><tr><td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">This link will be for the name of the hotel registered. To avoidconfusing your guests please don’t use the link for any other hotel.</td></tr><tr><td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">Please give this unique link to your IT person or WiFi/HSIA Vendor to put this link as the redirect page orlanding page.</td></tr><tr><td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">Once that is done you will start receiving instant feedback to the email you registered with.</td></tr><tr><td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">Your Admin Panel Link:- Working on it </td></tr><tr><td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">Your Admin Panel Username:- {admin.UserName}</td></tr><tr><td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">Your Admin Panel Password:- {admin.Password}</td></tr> </tbody> </table> <table background=\"#FAF9F7\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\" bgcolor=\"#FAF9F7\"> <tbody> <tr> <td bgcolor=\"#FAFAF8\" style=\"padding: 15px 25px 20px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">From Management.<br /></td> </tr> </tbody> </table> <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\" bgcolor=\"#1F4691\"> <tbody> <tr> <td bgcolor=\"#1F4691\" style=\"padding:10px 10px 10px 10px;text-align:center; line-height:22px; color: #FFFFFF\"> {footer}</td> </tr> </tbody> </table></td> </tr></table></body></html>";
            //String body = String.Format("<h3>Your hotel link is <a href={0}>{0}</a></h3>",CreateLink(linkId));

            String subject = "Your Hotel Link";
            foreach (String address in toAddress)
            {
                Utilities.SendEmail(CreateEmail(subject, address, body));
            }
            
        }
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            if(ValidateEmail())
            {
                HotelDBApp.Hotel hotel = CreateHotel();
                if (hotel == null)
                {
                    PnlError.Visible = true;
                    PnlError.CssClass = "notification alert-error spacer-t10";
                    LblError.Text = "The Address Provided was Wrong. Please re-type it and select one from the drop-down!";
                    place.Text = String.Empty;
                }
                else if(Hotel.RegisterHotel(hotel)>0)
                {
                    PnlError.Visible = true;
                    PnlError.CssClass = "notification alert-success spacer-t10";
                    LblError.Text = "Your hotel has been registered!";
                    PnlMain.Visible = false;
                    //Utilities.SendEmail()
                    HotelDBApp.Admin admin = CreateNewAdmin(hotel);
                    HotelDBApp.Admin.AddAdmin(admin);
                    
                    SendEmail(hotel.ID,new String[] { hotel.Email,TxtPaymentEmail.Text }, admin);
                }
                else
                {

                    PnlError.Visible = true;
                    PnlError.CssClass = "notification alert-error spacer-t10";
                    LblError.Text = "Email already exists.";
                    place.Text = String.Empty;
                }

            }
            else
            {
                PnlError.Visible = true;
                PnlError.CssClass = "notification alert-error spacer-t10";
                LblError.Text = "Please use the email address you used for making the payment!";
                place.Text = String.Empty;
            }
        }

        protected void DdlFranchise_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            int.TryParse(DdlFranchise.SelectedValue, out int selectedVal);
            if (selectedVal != 0)
                LoadFranchiseBrandDdl(selectedVal);
            else
                PnlBrand.Visible = false;
        }
    }
}