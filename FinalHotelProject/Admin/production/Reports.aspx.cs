using System;
using HotelDBApp;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using System.IO;

namespace FinalHotelProject.Admin.production
{
    public partial class Reports : System.Web.UI.Page
    {
        HotelDBApp.Login logininfo;
        protected void Page_Load(object sender, EventArgs e)
        {
            SetLoginInfo();
            SetHiddenField();
        }
        private void SetLoginInfo()
        {
            logininfo = (HotelDBApp.Login)Session["LoginInfo"];
        }
        private void SetHiddenField()
        {
            if (logininfo != null)
            {
                HdnHotelId.Value = logininfo.HotelId.ToString();
                
                this.Master.HotelName = logininfo.HotelName;
                this.Master.UserName = logininfo.UserName.Split('@')[0];
            }
        }

        protected void BtnDownload_Click(object sender, EventArgs e)
        {
            string val = DdlReport.SelectedValue;
            if (val == "1")
            {
                //do problem with users
                DownloadUserAndProblemInfo();
            }
            else if (val == "2")
            {
                DownloadUserInfo();
            }
            else if (val == "3")
            {
                //problems
                DownloadProblems();
            }
        }
        private void DownloadProblems()
        {
            List<Incedent> problemList = HotelDBApp.Incedent.GetIncedents(HdnHotelId.Value);

            ExcelPackage excel = new ExcelPackage();
            var workSheet = excel.Workbook.Worksheets.Add("Sheet1");
            workSheet.TabColor = System.Drawing.Color.Black;
            workSheet.DefaultRowHeight = 12;
            //Header of table  
            //  
            workSheet.Row(1).Height = 20;
            workSheet.Row(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            workSheet.Row(1).Style.Font.Bold = true;
            workSheet.Cells[1, 1].Value = "RoomNo";
            workSheet.Cells[1, 2].Value = "Problem";
            workSheet.Cells[1, 3].Value = "Feedback";
            workSheet.Cells[1, 4].Value = "IncedentDescription";
            workSheet.Cells[1, 5].Value = "IncedentTime";
            

            //Body of table  
            //  
            int recordIndex = 2;
            foreach (var user in problemList)
            {
                workSheet.Cells[recordIndex, 1].Value = user.RoomNo;
                workSheet.Cells[recordIndex, 2].Value = user.IncedentTypeStr;
                workSheet.Cells[recordIndex, 3].Value = user.FeedbackStr;
                workSheet.Cells[recordIndex, 4].Value = user.IncedentDescription;
                workSheet.Cells[recordIndex, 5].Value = user.IncedentTime.ToShortDateString();
                
                recordIndex++;
            }
            workSheet.Column(1).AutoFit();
            workSheet.Column(2).AutoFit();
            workSheet.Column(3).AutoFit();
            workSheet.Column(4).AutoFit();
            workSheet.Column(5).AutoFit();
           
            string excelName = "ProblemsInfo";
            using (var memoryStream = new MemoryStream())
            {
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment; filename=" + excelName + ".xlsx");
                excel.SaveAs(memoryStream);
                memoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }
        private void DownloadUserAndProblemInfo()
        {
            List<ProblemAndUsers> userList = HotelDBApp.ProblemAndUsers.GetProblemAndUsers(HdnHotelId.Value);

            ExcelPackage excel = new ExcelPackage();
            var workSheet = excel.Workbook.Worksheets.Add("Sheet1");
            workSheet.TabColor = System.Drawing.Color.Black;
            workSheet.DefaultRowHeight = 12;
            //Header of table  
            //  
            workSheet.Row(1).Height = 20;
            workSheet.Row(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            workSheet.Row(1).Style.Font.Bold = true;
            workSheet.Cells[1, 1].Value = "RoomNo";
            workSheet.Cells[1, 2].Value = "Problem";
            workSheet.Cells[1, 3].Value = "Feedback";
            workSheet.Cells[1, 4].Value = "IncedentDescription";
            workSheet.Cells[1, 5].Value = "IncedentTime";
            workSheet.Cells[1, 6].Value = "Customer Name";
            workSheet.Cells[1, 7].Value = "Customer Email";
            workSheet.Cells[1, 8].Value = "Customer Phone";
            workSheet.Cells[1, 9].Value = "Customer CheckoutDate";
            workSheet.Cells[1, 10].Value = "Customer CheckInDate";
           
            //Body of table  
            //  
            int recordIndex = 2;
            foreach (var user in userList)
            {
                workSheet.Cells[recordIndex, 1].Value = user.RoomNo;
                workSheet.Cells[recordIndex, 2].Value = user.Problem;
                workSheet.Cells[recordIndex, 3].Value = user.Feedback;
                workSheet.Cells[recordIndex, 4].Value = user.Description;
                workSheet.Cells[recordIndex, 5].Value = user.IncedentTime.ToShortDateString();
                workSheet.Cells[recordIndex, 6].Value = user.Username;
                workSheet.Cells[recordIndex, 7].Value = user.Email;
                workSheet.Cells[recordIndex, 8].Value = user.Phone;
                workSheet.Cells[recordIndex, 9].Value = user.Checkout.ToShortDateString();
                workSheet.Cells[recordIndex, 10].Value = user.Checkin.ToShortDateString();
                recordIndex++;
            }
            workSheet.Column(1).AutoFit();
            workSheet.Column(2).AutoFit();
            workSheet.Column(3).AutoFit();
            workSheet.Column(4).AutoFit();
            workSheet.Column(5).AutoFit();
            workSheet.Column(6).AutoFit();
            workSheet.Column(7).AutoFit();
            workSheet.Column(8).AutoFit();
            workSheet.Column(9).AutoFit();
            workSheet.Column(10).AutoFit();
            string excelName = "UserAndProblemsInfo";
            using (var memoryStream = new MemoryStream())
            {
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment; filename=" + excelName + ".xlsx");
                excel.SaveAs(memoryStream);
                memoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }
        private void DownloadUserInfo()
        {
            List<User> userList = HotelDBApp.User.ReturnUsers(HdnHotelId.Value);

            ExcelPackage excel = new ExcelPackage();
            var workSheet = excel.Workbook.Worksheets.Add("Sheet1");
            workSheet.TabColor = System.Drawing.Color.Black;
            workSheet.DefaultRowHeight = 12;
            //Header of table  
            //  
            workSheet.Row(1).Height = 20;
            workSheet.Row(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            workSheet.Row(1).Style.Font.Bold = true;
            workSheet.Cells[1, 1].Value = "CustomerID";
            workSheet.Cells[1, 2].Value = "Customer Name";
            workSheet.Cells[1, 3].Value = "Customer Email";
            workSheet.Cells[1, 4].Value = "Customer Phone";
            workSheet.Cells[1, 5].Value = "Customer CheckIn";
            workSheet.Cells[1, 6].Value = "Customer CheckOut";
            workSheet.Cells[1, 7].Value = "Room Number";
            //Body of table  
            //  
            int recordIndex = 2;
            foreach (var user in userList)
            {
                workSheet.Cells[recordIndex, 1].Value = user.UserID.ToString();
                workSheet.Cells[recordIndex, 2].Value = user.LastName;
                workSheet.Cells[recordIndex, 3].Value = user.Email;
                workSheet.Cells[recordIndex, 4].Value = user.Phone;
                workSheet.Cells[recordIndex, 5].Value = user.CheckInDate.ToShortDateString();
                workSheet.Cells[recordIndex, 6].Value = user.CheckOutDate.ToShortDateString();
                workSheet.Cells[recordIndex, 7].Value = user.RoomNo;
                recordIndex++;
            }
            workSheet.Column(1).AutoFit();
            workSheet.Column(2).AutoFit();
            workSheet.Column(3).AutoFit();
            workSheet.Column(4).AutoFit();
            workSheet.Column(5).AutoFit();
            workSheet.Column(6).AutoFit();
            workSheet.Column(7).AutoFit();
            string excelName = "UserInfo";
            using (var memoryStream = new MemoryStream())
            {
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment; filename=" + excelName + ".xlsx");
                excel.SaveAs(memoryStream);
                memoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }
    }
}