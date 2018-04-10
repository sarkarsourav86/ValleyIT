using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Data;
using System.Data.SqlClient;
using System.Security.Principal;
using System.Threading;
using System.Net;
using System.Diagnostics;
using System.Collections;
using System.ComponentModel;
using System.Web.Mail;
using System.Web.Caching;
using System.IO;
using System.Net.Mail;
using HotelDBApp;

namespace FinalHotelProject
{
    public class Global : System.Web.HttpApplication
    {
        private System.ComponentModel.IContainer components = null;
        private const string DummyPageUrl = @"C:\Users\Valley1\Documents\ValleyIT\FinalHotelProject\MyDummyPage.aspx";
        private const string DummyCacheItemKey = "GagaGuguGigi";
        public Global()
        {
            //InitializeComponent();
        }
        private DataSet FetchUserEmails()
        {
            return Email.FetchEmails();
        }
        protected void Application_Start(object sender, EventArgs e)
        {
            //RegisterCacheEntry();
            DateTime startDate = DateTime.Now;
            DateTime endDate = startDate.AddMinutes(1);
            System.Timers.Timer myTimer = new System.Timers.Timer();
            // Set the Interval to 5 seconds (5000 milliseconds).
            
            myTimer.Interval = (endDate - startDate).TotalMilliseconds;
            myTimer.AutoReset = true;
            myTimer.Elapsed += new System.Timers.ElapsedEventHandler(myTimer_Elapsed);
            myTimer.Enabled = true;
        }
        public void myTimer_Elapsed(object source, System.Timers.ElapsedEventArgs e)
        {
           DoSomeEmailSendStuff();
        }
        private void RegisterCacheEntry()
        {
            // Prevent duplicate key addition
            if (null != HttpContext.Current.Cache[DummyCacheItemKey]) return;

            HttpContext.Current.Cache.Add(DummyCacheItemKey, "Test", null, DateTime.MaxValue,
                TimeSpan.FromMinutes(1), CacheItemPriority.NotRemovable,
                new CacheItemRemovedCallback(CacheItemRemovedCallback));
        }
        public void CacheItemRemovedCallback(
            string key,
            object value,
            CacheItemRemovedReason reason
            )
        {
            Debug.WriteLine("Cache item callback: " + DateTime.Now.ToString());

            // Do the service works
            DoWork();

            // We need to register another cache item which will expire again in one
            // minute. However, as this callback occurs without any HttpContext, we do not
            // have access to HttpContext and thus cannot access the Cache object. The
            // only way we can access HttpContext is when a request is being processed which
            // means a webpage is hit. So, we need to simulate a web page hit and then 
            // add the cache item.
            HitPage();
        }
        private void HitPage()
        {
            WebClient client = new WebClient();
            client.DownloadData(DummyPageUrl);
        }
        private void DoWork()
        {
            Debug.WriteLine("Begin DoWork...");
            Debug.WriteLine("Running as: " + WindowsIdentity.GetCurrent().Name);

            //DoSomeFileWritingStuff();
            //DoSomeDatabaseOperation();
            DoSomeEmailSendStuff();
            //DoSomeMSMQStuff();
            //ExecuteQueuedJobs();

            //Debug.WriteLine("End DoWork...");
        }
        private void DoSomeEmailSendStuff()
        {
            DataSet ds = FetchUserEmails();
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                try
                {
                    using (System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage())
                    {
                        mail.From = new System.Net.Mail.MailAddress("interns@valleyit.us");

                        // The important part -- configuring the SMTP client
                        SmtpClient smtp = new SmtpClient();
                        smtp.Port = 587;   // [1] You can try with 465 also, I always used 587 and got success
                        smtp.EnableSsl = true;
                        smtp.DeliveryMethod = SmtpDeliveryMethod.Network; // [2] Added this
                        smtp.UseDefaultCredentials = false; // [3] Changed this
                        smtp.Credentials = new NetworkCredential(mail.From.ToString(), "Intern@123");  // [4] Added this. Note, first parameter is NOT string.
                        smtp.Host = "smtp.gmail.com";

                        //recipient address
                        mail.To.Add(new MailAddress(item["Email"].ToString()));

                        //Formatted mail body
                        mail.IsBodyHtml = true;
                        String link = String.Format("FeedbackForm.aspx?hotelid={0}",item["HotelID"].ToString());
                        string st = String.Format("<p>Hi {0}. Thanks for staying with {1}.</p><p>Your feedback is valuable to us. Please spare a moment to provide your feedback for your stay at{2}</p><p>Please provide your feedback <a href={3}>here</a></p>",item["LastName"].ToString(), item["Property Name"].ToString(), item["Property Name"].ToString(),link);

                        mail.Body = st;
                        smtp.Send(mail);
                    }
                }
                catch (Exception x)
                {
                    Debug.WriteLine(x);
                }
            }
           
        }
        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            //String str = @"C:\Users\Valley1\Documents\ValleyIT\FinalHotelProject\MyDummyPage.aspx";
            //if (HttpContext.Current.Request.Url.ToString() == DummyPageUrl)
            //{
            //    // Add the item in cache and when succesful, do the work.
            //    RegisterCacheEntry();
            //}
           // if (@"C:\Users\Valley1\Documents\ValleyIT\FinalHotelProject\MyDummyPage.aspx" == DummyPageUrl)
           // {
                // Add the item in cache and when succesful, do the work.
               // RegisterCacheEntry();
           // }
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            Debug.WriteLine(Server.GetLastError());
        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
        }
    }
}