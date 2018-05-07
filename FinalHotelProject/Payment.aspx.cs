using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelDBApp;

namespace FinalHotelProject
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            String id = TxtEmail.Text + Guid.NewGuid().ToString("N");
            HotelDBApp.Payment payment = new HotelDBApp.Payment() {Email= TxtEmail.Text,Id=id,URL= Request.Url.ToString().Substring(0, Request.Url.ToString().LastIndexOf('/')) + "/" };
            String paymentId=HotelDBApp.Payment.AddPayment(payment);
            Email email = CreateEmail(paymentId, payment.Email, payment.URL);
            SendEmail(email);
        }
        public  Email CreateEmail(String id, String email, String url)
        {
            String FormattedUrl = String.Format("{0}RegisterHotel.aspx?id={1}", url, id);
            return new Email() { Subject = "Confirm Registration", Body = String.Format("Please click here to register <a href='{0}'>{1}</a>",FormattedUrl,FormattedUrl), ToAddress = email };
        }
        public void SendEmail(Email email)
        {
            HotelBusinessLayer.Utilities.SendEmail(email);
        }


    }
}