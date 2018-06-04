using HotelDBApp;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Mail;


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
            {1,"Everything is Great/ Very Satisfied" },
            {2,"Not Satisfied" },
            {3,"Something is broken" },
            
            {4,"Needs Immediate Attention" }
        };
        public static Boolean HasUserCheckedIn(Object session)
        {
            
            return session != null;
        }
        public static void SendEmail(Email email,bool isRating=false,HotelDBApp.Image image=null)
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
            Execute(email,isRating,image);
        }
        
        static void Execute(Email email,bool isRating, HotelDBApp.Image image)
        {

            /*var apiKey = System.Configuration.ConfigurationManager.AppSettings["apiKey"];
            var client = new SendGridClient(apiKey);
            var from = new EmailAddress("interns@valleyit.us", "Example User");
            var subject = "A Problem has been Reported";
            var to = new EmailAddress(email.ToAddress.Trim(), "Example User");
            var plainTextContent = email.Comments;
            var htmlContent = !isRating? String.Format("<strong>{0}---{1}</strong><p>Room No. {2}</p><p>Cust Last Name {3}</p><p>Checkout Date {4}</p><p>Description: {5}</p>", email.ProblemType,email.ProblemValue,email.RoomNo,email.CustName,email.CheckoutDate,email.Comments): String.Format("<strong>--A {0} Star Feedback Has been Reported</strong><p>Name: {1}</p><p>Customer Email: {2}</p><p>Checkout Date {3}</p><p>Description: {4}</p>", email.ProblemValue,email.CustName, email.UserEmail, email.CheckoutDate, email.Comments);
            var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
            var response = client.SendEmailAsync(msg);*/
            String from = System.Configuration.ConfigurationManager.AppSettings["emailId"];
            String password= System.Configuration.ConfigurationManager.AppSettings["password"];
            try
            {
                using (System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage())
                {
                    mail.From = new System.Net.Mail.MailAddress(from);

                    // The important part -- configuring the SMTP client
                    SmtpClient smtp = new SmtpClient();
                    smtp.Port = 587;   // [1] You can try with 465 also, I always used 587 and got success
                    smtp.EnableSsl = true;
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network; // [2] Added this
                    smtp.UseDefaultCredentials = false; // [3] Changed this
                    smtp.Credentials = new System.Net.NetworkCredential(mail.From.ToString(), password);  // [4] Added this. Note, first parameter is NOT string.
                    smtp.Host = "smtp.gmail.com";

                    //recipient address
                    mail.To.Add(new MailAddress(email.ToAddress));

                    //Formatted mail body
                    mail.IsBodyHtml = true;
                    mail.Subject= String.IsNullOrEmpty(email.Subject) ? "A Problem has been Reported": email.Subject;
                    //String link = String.Format("FeedbackForm.aspx?hotelid={0}", item["HotelID"].ToString());
                    string st = !isRating ? String.Format("<strong>{0}---{1}</strong><p>Room No. {2}</p><p>Cust Last Name {3}</p><p>Checkout Date {4}</p><p>Description: {5}</p>", email.ProblemType, email.ProblemValue, email.RoomNo, email.CustName, email.CheckoutDate, email.Comments) : String.Format("<strong>--A {0} Star Feedback Has been Reported</strong><p>Name: {1}</p><p>Customer Email: {2}</p><p>Checkout Date {3}</p><p>Description: {4}</p>", email.ProblemValue, email.CustName, email.UserEmail, email.CheckoutDate, email.Comments);
                    if (image != null)
                    {
                        System.Net.Mail.Attachment attachment;
                        attachment = new System.Net.Mail.Attachment(image.UploadedImage,image.Name);
                        mail.Attachments.Add(attachment);
                    }
                    
                    mail.Body = String.IsNullOrEmpty(email.Body)? st : email.Body;
                    smtp.Send(mail);
                }
            }
            catch (Exception x)
            {
                Debug.WriteLine(x);
            }
        }
        
    }
}
