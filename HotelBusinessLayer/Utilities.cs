using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HotelDBApp;
using SendGrid;
using SendGrid.Helpers.Mail;
using System.Net.Http;
using System.Net.Mail;
using System.Configuration;


namespace HotelBusinessLayer
{
    public class Utilities
    {
        public static Dictionary<int, String> ProblemTypesList = new Dictionary<int, string>()
        {
            {1,"Housekeeping" },
            {2,"WiFi & Internet" },
            {3,"Maintenance" },
            {4,"Common Area" },
            {5,"Room" },
            {6,"Front Desk Staff" }
        };
        public static Dictionary<int, String> FeedbackOptionsList = new Dictionary<int, string>()
        {
            {0,"No Comments" },
            {1,"Works Great/ Satisfied with it" },
            {2,"Not Satisfied with it" },
            {3,"Something is broken" },
            
            {4,"Needs Immediate Attention" }
        };
        public static Boolean HasUserCheckedIn(Object session)
        {
            
            return session != null;
        }
        public static void SendEmail(Email email,bool isRating=false)
        {
            //SmtpClient smtpClient = new SmtpClient("localhost")
            //{
            //    Credentials = new System.Net.NetworkCredential("interns@valleyit.us", "Intern@123"),
                
            //    DeliveryMethod = SmtpDeliveryMethod.Network,
            //    EnableSsl = true
            //};
            //MailMessage mail = new MailMessage
            //{

            //    //Setting From , To and CC
            //    From = new MailAddress("interns@valleyit.us", "Experience Hotel App")
            //};
            //mail.To.Add(new MailAddress("interns@valleyit.us"));
            ////mail.CC.Add(new MailAddress("MyEmailID@gmail.com"));

            //smtpClient.Send(mail);
            Execute(email,isRating);
        }
        
        static void Execute(Email email,bool isRating)
        {
            
            var apiKey = System.Configuration.ConfigurationManager.AppSettings["apiKey"];
            var client = new SendGridClient(apiKey);
            var from = new EmailAddress("interns@valleyit.us", "Example User");
            var subject = "A Problem has been Reported";
            var to = new EmailAddress(email.ToAddress.Trim(), "Example User");
            var plainTextContent = email.Comments;
            var htmlContent = !isRating? String.Format("<strong>{0}---{1}</strong><p>Room No. {2}</p><p>Cust Last Name {3}</p><p>Checkout Date {4}</p><p>Description: {5}</p>", email.ProblemType,email.ProblemValue,email.RoomNo,email.CustName,email.CheckoutDate,email.Comments): String.Format("<strong>--A {0} Star Feedback Has been Reported</strong><p>Name: {1}</p><p>Customer Email: {2}</p><p>Checkout Date {3}</p><p>Description: {4}</p>", email.ProblemValue,email.CustName, email.UserEmail, email.CheckoutDate, email.Comments);
            var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
            var response = client.SendEmailAsync(msg);
        }
    }
}
