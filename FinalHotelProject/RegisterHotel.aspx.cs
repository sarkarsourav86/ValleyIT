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
            }
            else
            {
                HdnEmail.Value = PaymentEmail;
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
            String firstLine= address.Split(',')[0].Trim();
            String city = address.Split(',')[1].Trim();
            String state= address.Split(',')[2].Trim().Split(' ')[0];
            String zip= address.Split(',')[2].Trim().Split(' ')[1];
            String country = address.Split(',')[3].Trim();
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
                Brand = HdnPlaceName.Value
                
            };
        }
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            if(ValidateEmail())
            {
                HotelDBApp.Hotel hotel = CreateHotel();
                int id=Hotel.RegisterHotel(hotel);

            }
        }
    }
}