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
        //private const string DummyPageUrl = @"C:\Users\Valley1\Documents\ValleyIT\FinalHotelProject\MyDummyPage.aspx";
        String server = System.Configuration.ConfigurationManager.AppSettings["serverName"];
        //private  string DummyPageUrl = String.Format("{0}MyDummyPage.aspx", server);
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
            //TimeZoneInfo timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Pacific SA Standard Time");

            //DateTime newDateTime = TimeZoneInfo.ConvertTime(existingDateTime, timeZoneInfo);
            
            DateTime startDate = DateTime.Now;
            DateTime endDate = startDate.AddDays(1);
            //DateTime endDate = startDate.AddSeconds(5);
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
            String DummyPageUrl= String.Format("{0}MyDummyPage.aspx", server);
            WebClient client = new WebClient();
            client.DownloadData(DummyPageUrl);
        }
        private void DoWork()
        {
            Debug.WriteLine("Begin DoWork...");
            Debug.WriteLine("Running as: " + WindowsIdentity.GetCurrent().Name);

            //DoSomeFileWritingStuff();
            //DoSomeDatabaseOperation();
            //DoSomeEmailSendStuff();
            //DoSomeMSMQStuff();
            //ExecuteQueuedJobs();

            //Debug.WriteLine("End DoWork...");
        }
        private void DoSomeEmailSendStuff()
        {
            DataSet ds = FetchUserEmails();
            //String server= System.Configuration.ConfigurationManager.AppSettings["serverName"];
            String from = System.Configuration.ConfigurationManager.AppSettings["emailId"];
            String password = System.Configuration.ConfigurationManager.AppSettings["password"];
            foreach (DataRow item in ds.Tables[0].Rows)
            {
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
                        smtp.Credentials = new NetworkCredential(mail.From.ToString(), password);  // [4] Added this. Note, first parameter is NOT string.
                        smtp.Host = "smtp-mail.outlook.com";

                        //recipient address
                        mail.To.Add(new MailAddress(item["Email"].ToString()));

                        //Formatted mail body
                        mail.IsBodyHtml = true;
                        String URL= server;
                        //String URL = host;
                        String linkBad = String.Format("{0}FeedbackForm.aspx?hotelid={1}&user={2}&star=", URL,item["Property"].ToString(),item["UserIdString"].ToString());
                        String linkbad1 = String.Format("{0}1", linkBad);
                        String linkbad2 = String.Format("{0}2", linkBad);
                        String linkbad3 = String.Format("{0}3", linkBad);
                        
                        String linkGood =String.Format("https://search.google.com/local/writereview?placeid={0}",item["PlaceId"].ToString());
                        //string st = String.Format("<p>Hi {0}. Thanks for staying with {1}.</p><p>Your feedback is valuable to us. Please spare a moment to provide your feedback for your stay at{2}</p><p>Please provide your feedback <a href={3}>here</a></p>",item["LastName"].ToString(), item["Property Name"].ToString(), item["Property Name"].ToString(),link);
                        //String st="< !doctype html >< html >< head >< meta http - equiv = \"Content-Type\" content = \"text/html; charset=utf-8\" >< title > Reliable WiFi </ title >< style > a:link {color: #0a79ea;text-decoration: none;}a:visited {color: #000000;text-decoration: none;}a:link#tops {color: #000000;text-decoration: none;}body, td, th {font-family: Arial, "Helvetica Neue", Helvetica, Gotham, sans-serif;font-style: normal;font-weight: normal;font-size: 14px;color: #000000;}body {margin-left: 10px;margin-top: 10px;margin-right: 10px;margin-bottom: 10px;background-color: #FFFFFF;}.BODY {border-bottom: 1px solid #e8eef2;border-left: 1px solid #e8eef2;border-right: 1px solid #e8eef2;border-top: 1px solid #e8eef2;}.tableu {border-bottom: 2px solid #F4CC1F;border-left: 2px solid #F4CC1F;border-right: 2px solid #F4CC1F;border-top: 2px solid #F4CC1F;}</style></head><body><table bgcolor="#ffffff" cellpadding="0" cellspacing="0" align="center" border="0" class="BODY" width="600"> <tr> <td align="center"><table cellpadding="0" cellspacing="0" border="0"> <tr> <td valign="top"><a href="http://na414-41ac69.pages.infusionsoft.net/"><img src="images/banner.jpg" alt="Banner" width="600" height="407" style="display:block" title="Banner"></a></td> </tr> </table> <table background="#FAF9F7" cellpadding="0" cellspacing="0" border="0" width="600" bgcolor="#FAF9F7"> <tbody> <tr> <td bgcolor="#FAFAF8" style="padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;">For staying with us. Your feedback is important to help us serve you better next time. <br />Please rate your stay.<br /></td> </tr> </tbody> </table><table cellpadding="0" cellspacing="0" border="0"> <tr> <td bgcolor="#FAFAF8" valign="top"><a href="http://na414-41ac69.pages.infusionsoft.net/"><img src="images/stars.gif" alt="stars" width="600" height="67" style="display:block" title="stars"></a></td> </tr> </table> <table background="#FAF9F7" cellpadding="0" cellspacing="0" border="0" width="600" bgcolor="#FAF9F7"> <tbody> <tr> <td bgcolor="#FAFAF8" style="padding: 15px 25px 20px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;">Thank you!<br />From Management.<br /></td> </tr> </tbody> </table> <table cellpadding="0" cellspacing="0" border="0" width="600" bgcolor="#1F4691"> <tbody> <tr> <td bgcolor="#1F4691" style="padding:10px 10px 10px 10px;text-align:center; line-height:22px; color: #FFFFFF"> &copy; Copyright 2017 - Reliable WiFi <br /></td> </tr> </tbody> </table></td> </tr></table></body></html>"
                        //String dummyserver = "http://www.bisoncomputing.com/";
                        String st = String.Format("<!doctype html><html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><title>My GuestXp</title><link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\"><style> .checked {{ color: orange;}}a:link {{color: #0a79ea;text-decoration: none;}}a:visited {{color: #000000;text-decoration: none;}}a:link#tops {{color: #000000;text-decoration: none;}}body, td, th {{font-family: Arial, \"Helvetica Neue\", Helvetica, Gotham, sans-serif;font-style: normal;font-weight: normal;font-size: 14px;color: #000000;}}body {{margin-left: 10px;margin-top: 10px;margin-right: 10px;margin-bottom: 10px;background-color: #FFFFFF;}}.BODY {{border-bottom: 1px solid #e8eef2;border-left: 1px solid #e8eef2;border-right: 1px solid #e8eef2;border-top: 1px solid #e8eef2;}}.tableu {{border-bottom: 2px solid #F4CC1F;border-left: 2px solid #F4CC1F;border-right: 2px solid #F4CC1F;border-top: 2px solid #F4CC1F;}}</style></head><body><table bgcolor=\"#ffffff\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" border=\"0\" class=\"BODY\" width=\"600\"> <tr> <td align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\"> <tr> <td valign=\"top\"><a href=\"http://myguestxp.com/\"><img src=\"http://finalhotelproject20180523071047.azurewebsites.net/images/banner.jpg\" alt=\"Banner\" width=\"600\" height=\"407\" style=\"display:block\" title=\"Banner\"></a></td> </tr> </table> <table background=\"#FAF9F7\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\" bgcolor=\"#FAF9F7\"> <tbody> <tr> <td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">For staying with us, {0}. Your feedback is important to help us serve you better next time. <br />Please rate your stay at {1}.<br /></td> </tr> </tbody> </table><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\"> <tr> <td bgcolor=\"#FAFAF8\" valign=\"top\"><a href={3} target=\"_blank\"><img src=\"http://finalhotelproject20180523071047.azurewebsites.net/images/1.jpg\" alt=\"stars\" width=\"60\" height=\"67\" style=\"display:block\" title=\"stars\"></a></td><td bgcolor=\"#FAFAF8\" valign=\"top\"><a href={4} target=\"_blank\"><img src=\"http://finalhotelproject20180523071047.azurewebsites.net/images/1.jpg\" alt=\"stars\" width=\"60\" height=\"67\" style=\"display:block\" title=\"stars\"></a></td><td bgcolor=\"#FAFAF8\" valign=\"top\"><a href={5} target=\"_blank\"><img src=\"http://finalhotelproject20180523071047.azurewebsites.net/images/1.jpg\" alt=\"stars\" width=\"60\" height=\"67\" style=\"display:block\" title=\"stars\"></a></td><td bgcolor=\"#FAFAF8\" valign=\"top\"><a href={6} target=\"_blank\"><img src=\"http://finalhotelproject20180523071047.azurewebsites.net/images/1.jpg\" alt=\"stars\" width=\"60\" height=\"67\" style=\"display:block\" title=\"stars\"></a></td><td bgcolor=\"#FAFAF8\" valign=\"top\"><a href={6} target=\"_blank\"><img src=\"http://finalhotelproject20180523071047.azurewebsites.net/images/1.jpg\" alt=\"stars\" width=\"60\" height=\"67\" style=\"display:block\" title=\"stars\"></a></td> </tr> </table> <table background=\"#FAF9F7\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\" bgcolor=\"#FAF9F7\"> <tbody> <tr> <td bgcolor=\"#FAFAF8\" style=\"padding: 15px 25px 20px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">Thank you!<br />From Management.<br /></td> </tr> </tbody> </table> <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\" bgcolor=\"#1F4691\"> <tbody> <tr> <td bgcolor=\"#1F4691\" style=\"padding:10px 10px 10px 10px;text-align:center; line-height:22px; color: #FFFFFF\"> &copy; Copyright 2018 - MyGuestXp <br /></td> </tr> </tbody> </table></td> </tr></table></body></html>", item["LastName"].ToString(), item["Property Name"].ToString(), item["Property Name"].ToString(), linkbad1, linkbad2, linkbad3, linkGood);
                        //String st = String.Format("<!doctype html><html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><title>My GuestXp</title><link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\"><style> .checked {{ color: orange;}}a:link {{color: #0a79ea;text-decoration: none;}}a:visited {{color: #000000;text-decoration: none;}}a:link#tops {{color: #000000;text-decoration: none;}}body, td, th {{font-family: Arial, \"Helvetica Neue\", Helvetica, Gotham, sans-serif;font-style: normal;font-weight: normal;font-size: 14px;color: #000000;}}body {{margin-left: 10px;margin-top: 10px;margin-right: 10px;margin-bottom: 10px;background-color: #FFFFFF;}}.BODY {{border-bottom: 1px solid #e8eef2;border-left: 1px solid #e8eef2;border-right: 1px solid #e8eef2;border-top: 1px solid #e8eef2;}}.tableu {{border-bottom: 2px solid #F4CC1F;border-left: 2px solid #F4CC1F;border-right: 2px solid #F4CC1F;border-top: 2px solid #F4CC1F;}}</style></head><body><table bgcolor=\"#ffffff\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" border=\"0\" class=\"BODY\" width=\"600\"> <tr> <td align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\"> <tr> <td valign=\"top\"><a href=\"http://na414-41ac69.pages.infusionsoft.net/\"><img src=\"{5}images/banner.jpg\" alt=\"Banner\" width=\"600\" height=\"407\" style=\"display:block\" title=\"Banner\"></a></td> </tr> </table> <table background=\"#FAF9F7\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\" bgcolor=\"#FAF9F7\"> <tbody> <tr> <td bgcolor=\"#FAFAF8\" style=\"padding: 10px 25px 10px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">For staying with us, {0}. Your feedback is important to help us serve you better next time. <br />Please rate your stay at {1}.<br /></td> </tr> </tbody> </table><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\"> <tr> <td bgcolor=\"#FAFAF8\" valign=\"top\"><a href={3} target=\"_blank\"><img src=\"{5}images/1.jpg\" alt=\"stars\" width=\"60\" height=\"67\" style=\"display:block\" title=\"stars\"></a></td><td bgcolor=\"#FAFAF8\" valign=\"top\"><a href={3} target=\"_blank\"><img src=\"{5}images/1.jpg\" alt=\"stars\" width=\"60\" height=\"67\" style=\"display:block\" title=\"stars\"></a></td><td bgcolor=\"#FAFAF8\" valign=\"top\"><a href={3} target=\"_blank\"><img src=\"{5}images/1.jpg\" alt=\"stars\" width=\"60\" height=\"67\" style=\"display:block\" title=\"stars\"></a></td><td bgcolor=\"#FAFAF8\" valign=\"top\"><a href={4} target=\"_blank\"><img src=\"{5}images/1.jpg\" alt=\"stars\" width=\"60\" height=\"67\" style=\"display:block\" title=\"stars\"></a></td><td bgcolor=\"#FAFAF8\" valign=\"top\"><a href={4} target=\"_blank\"><img src=\"{5}images/1.jpg\" alt=\"stars\" width=\"60\" height=\"67\" style=\"display:block\" title=\"stars\"></a></td> </tr> </table> <table background=\"#FAF9F7\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\" bgcolor=\"#FAF9F7\"> <tbody> <tr> <td bgcolor=\"#FAFAF8\" style=\"padding: 15px 25px 20px 25px; text-align: center; color: #000000; font-size: 24px; background-color: #FAFAF8;\">Thank you!<br />From Management.<br /></td> </tr> </tbody> </table> <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\" bgcolor=\"#1F4691\"> <tbody> <tr> <td bgcolor=\"#1F4691\" style=\"padding:10px 10px 10px 10px;text-align:center; line-height:22px; color: #FFFFFF\"> &copy; Copyright 2017 - Reliable WiFi <br /></td> </tr> </tbody> </table></td> </tr></table></body></html>", item["LastName"].ToString(), item["Property Name"].ToString(), item["Property Name"].ToString(), linkBad,linkGood, dummyserver);
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
    class FirstRequestInitialisation
    {
        private static string host = null;

        private static Object s_lock = new Object();

        // Initialise only on the first request
        public static string Initialise(HttpContext context)
        {
            if (string.IsNullOrEmpty(host))
            {
                lock (s_lock)
                {
                    if (string.IsNullOrEmpty(host))
                    {
                        Uri uri = HttpContext.Current.Request.Url;
                        host = uri.Scheme + Uri.SchemeDelimiter + uri.Host + ":" + uri.Port;
                    }
                }
            }

            return host;
        }
    }
}