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
            String server = System.Configuration.ConfigurationManager.AppSettings["serverName"];
            String FormattedUrl = String.Format("{0}RegisterHotel.aspx?id={1}", url, id);
            String Step8 = String.Format("<p><h3>Please click here to register <a href='{0}'>{1}</a></h3></p>", FormattedUrl, FormattedUrl);
            
            String Step1 = String.Format("<p>Step 1. Click on the Hotel Registration Link you received in your email.</p>{1}",server, Step8);
            String Step2 = String.Format("<p>Step 2. Select Your Franchise (Choice, Hilton, Marriott, etc.) or pick Independent if you are not affiliated with any franchise.</p><img src='{0}images/email/2.png' />",server);
            String Step3 = String.Format("<p>Step 3. Enter your hotel name. The field should auto populate once you start typing it. Use Chrome browser preferably. Verify the address before you accept the option provided.</p><img src='{0}images/email/3.png' />",server);
            String Step4 = String.Format("<p>Step 4. Enter the same email address you have used for payment.</p><img src='{0}images/email/4.png' />",server);
            String Step5 = String.Format("<p>Step 5. Enter the FRONT DESK phone number.</p><img src='{0}images/email/5.png' />",server);
            String Step6 = String.Format("<p>Step 6. Enter name of billing manager or contact.</p><img src='{0}images/email/6.png' />",server);
            String Step7 = String.Format("<p>Step 7. Click on Register to submit the form.</p><img src='{0}images/email/7.png' />",server);
            
            
            return new Email()
            {
                Subject = "Confirm Registration",
                Body = $"{Step1}{Step2}{Step3}{Step4}{Step5}{Step6}{Step7}",
                ToAddress = email };
        }
        public void SendEmail(Email email)
        {
            HotelBusinessLayer.Utilities.SendEmail(email);
        }


    }
}