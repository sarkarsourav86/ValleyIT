using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelDBApp;
namespace FinalHotelProject
{
    public partial class RegisterHotel : System.Web.UI.Page
    {
        String PaymentId;
        String PaymentEmail;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!ValidateID())
            {
                PnlMain.Visible = false;
                PnlError.Visible = true;
                PnlError.CssClass = "notification alert-error spacer-t10";
                LblError.Text = "Your link has expired or you have already registered.";
                
            }
            else
            {
                HdnEmail.Value = TxtEmail.Text;
            }
            
           
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
            return HdnEmail.Value == PaymentEmail;
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
                PaymentId=PaymentId
            };
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
    }
}