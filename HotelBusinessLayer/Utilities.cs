using HotelDBApp;
using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net.Mail;
using System.Data;


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
            {6,"Front Desk Staff" },
            {7,"Food Area" },
            {8,"Spa/Fitness" },
            {9,"Parking Area" }
        };
        public static Dictionary<int, String> FeedbackOptionsList = new Dictionary<int, string>()
        {
            {0,"No Comments" },
            {1,"Everything is Great/ Very Satisfied" },
            {2,"Not Satisfied" },
            {3,"Something is broken" },
            
            {4,"Needs Immediate Attention" }
        };
        public static DataTable AddRowsToTable(DataTable dt,DataRow[] rows)
        {
            //DataTable dt = new DataTable();
           
            foreach (DataRow row in rows)
            {
                dt.ImportRow(row);
            }
            return dt;
        }
        public static string GetTripAdvisorLink(string url)
        {
            try
            {
                string start = "https://www.tripadvisor.com/";
                string middle = "UserReviewEdit";
                string Url2ndpart = url.Split('/')[3];
                string[] stringSeparators = new string[] { "-Reviews-" };
                string[] result = Url2ndpart.Split(stringSeparators, StringSplitOptions.None);
                string[] stringSeparators2 = new string[] { "Hotel_Review" };
                string id = result[0].Split(stringSeparators2, StringSplitOptions.None)[1];
                string newUrl = string.Format("{0}UserReviewEdit{1}-{2}", start, id, result[1]);
                return newUrl;
            }
            catch(Exception e)
            {
                return string.Empty;
            }
            
        }
        public static Login ValidateLogin(Login login)
        {
            Login returnedLogin = null;
            SqlCommand cmd = new SqlCommand("spValidateLogin");
            cmd.Parameters.AddWithValue("@username", login.UserName);
            cmd.Parameters.AddWithValue("@password", login.Password);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            DataTable dt = DBOperations.FetchValues(cmd).Tables[0];
            if (dt.Rows.Count > 0)
            {
                returnedLogin = new Login() { UserName = login.UserName, Password = login.Password, Role = dt.Rows[0]["Role"].ToString(), HotelId = int.Parse(dt.Rows[0]["PropertyId"].ToString()), HotelName= dt.Rows[0]["Name"].ToString(),LongHotelId= dt.Rows[0]["LongId"].ToString() };
            }
            //int.TryParse(DBOperations.InsertAndReturn(cmd).ToString(),out int res);
            return returnedLogin;
        }
        public static Boolean HasUserCheckedIn(Object session)
        {
            
            return session != null;
        }
        public static String MakePassword()
        {
            int length = 8;
            Random random = new Random();
            const string chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
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
        public static Dictionary<string,int> UserStatus(int HotelId)
        {
            SqlCommand cmd = new SqlCommand("spFetchUserStatus");
            cmd.Parameters.AddWithValue("@hotelid", HotelId);
            cmd.CommandType = CommandType.StoredProcedure;
            DataRow dr=DBOperations.FetchValues(cmd).Tables[0].Rows[0];
            return new Dictionary<string, int>() { {"users",int.Parse(dr["Users"].ToString()) },{"good", int.Parse(dr["Good"].ToString()) }, { "bad", int.Parse(dr["Bad"].ToString()) }, { "resolved", int.Parse(dr["Resolved"].ToString()) } };
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
                    smtp.Host = "smtp-mail.outlook.com";

                    //recipient address
                    mail.To.Add(new MailAddress(email.ToAddress));

                    //Formatted mail body
                    mail.IsBodyHtml = true;
                    mail.Subject= String.IsNullOrEmpty(email.Subject) ? "A Problem has been Reported": email.Subject;
                    //String link = String.Format("FeedbackForm.aspx?hotelid={0}", item["HotelID"].ToString());
                    string st = !isRating ? String.Format("<strong>{0}---{1}</strong><p>Room No. {2}</p><p>Cust Last Name {3}</p><p>Checkout Date {4}</p><p>Cust Email {5}</p><p>Cust Phone {6}</p><p>Description: {7}</p>", email.ProblemType, email.ProblemValue, email.RoomNo, email.CustName, email.CheckoutDate,email.UserEmail,email.Phone, email.Comments) : String.Format("<strong>--A {0} Star Feedback Has been Reported</strong><p>Name: {1}</p><p>Customer Email: {2}</p><p>Customer Phone: {6}</p><p>Checkout Date {3}</p><p>Problem Type: {4}</p><p>Description: {5}</p>", email.ProblemValue, email.CustName, email.UserEmail, email.CheckoutDate,email.ProblemText, email.Comments,email.Phone);
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
