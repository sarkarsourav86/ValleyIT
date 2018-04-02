﻿using System;
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
        public static Boolean HasUserCheckedIn(Object session)
        {
            
            return session != null;
        }
        public static void SendEmail()
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
            Execute();
        }
        static void Execute()
        {
            
            var apiKey = System.Configuration.ConfigurationManager.AppSettings["apiKey"];
            var client = new SendGridClient(apiKey);
            var from = new EmailAddress("interns@valleyit.us", "Example User");
            var subject = "Sending with SendGrid is Fun";
            var to = new EmailAddress("sarkarsourav86@gmail.com", "Example User");
            var plainTextContent = "and easy to do anywhere, even with C#";
            var htmlContent = "<strong>and easy to do anywhere, even with C#</strong>";
            var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
            var response = client.SendEmailAsync(msg);
        }
    }
}
