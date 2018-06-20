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
            return HdnEmail.Value.ToLower() == PaymentEmail.ToLower();
        }

        public String GetID()
        {
            return Request.QueryString["id"];
        }
        private String[] FormatAddress(String address)
        {
            int length = address.Split(',').Length;
            String firstLine= address;
            String city = address.Split(',')[length - 3].Trim();
            String state= address.Split(',')[length - 2].Trim().Split(' ')[0];
            String zip= address.Split(',')[length - 2].Trim().Split(' ')[1];
            String country = address.Split(',')[length-1].Trim();
            return new String[] { firstLine, city, state,zip,country };

        }
        private HotelDBApp.Hotel CreateHotel()
        {
            String [] address=FormatAddress(HdnAddress.Value);
            return new HotelDBApp.Hotel() {
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
            };
        }
        private void SendEmail(String linkId,String toAddress)
        {


            String body = String.Format("<p>Here is the unique link for your hotel <a href={0}>{0}</a></p>. <p>This link will be for the name of the hotel registered. To avoidconfusing your guests please don’t use the link for any other hotel.</p><p>Please give this unique link to your IT person or WiFi/HSIA Vendor to put this link as the redirect page orlanding page.</p><p>Once that is done you will start receiving instant feedback to the email you registered with.</p>", CreateLink(linkId)); 
            //String body = String.Format("<h3>Your hotel link is <a href={0}>{0}</a></h3>",CreateLink(linkId));
            
            String subject = "Your Hotel Link";
            Utilities.SendEmail(CreateEmail(subject, toAddress, body));
        }
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            if(ValidateEmail())
            {
                HotelDBApp.Hotel hotel = CreateHotel();
                if(Hotel.RegisterHotel(hotel)>0)
                {
                    PnlError.Visible = true;
                    PnlError.CssClass = "notification alert-success spacer-t10";
                    LblError.Text = "Your hotel has been registered!";
                    PnlMain.Visible = false;
                    //Utilities.SendEmail()
                    SendEmail(hotel.ID,hotel.Email);
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