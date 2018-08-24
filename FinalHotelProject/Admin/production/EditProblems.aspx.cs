using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelDBApp;
using System.Data;

namespace FinalHotelProject.Admin.production
{
    public partial class EditProblems : System.Web.UI.Page
    {
        HotelDBApp.Login logininfo;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            SetLoginInfo();
            if (!Page.IsPostBack)
            {
                SetFormValues();
                SetLabels();
                LoadDropdowns(DdlFeedbackValue);
                LoadDropdowns(DdlIncedentType);
            }
            
        }
        private void LoadDropdowns(DropDownList ddl)
        {
            DataSet ds=DBOperations.FetchDropDownValues(ddl.ID);
            ddl.DataSource = ds;
            ddl.DataValueField = "value";
            ddl.DataTextField = "text";
            ddl.DataBind();
            


        }
        private void SetLabels()
        {
            this.Master.UserName = logininfo.UserName.Split('@')[0];
            this.Master.HotelName = logininfo.HotelName;
        }
        private int GetProblemId()
        {
            string id = Request.QueryString["Id"];
            int.TryParse(id, out int result);
            return result;
        }
        private void SetFormValues()
        {
            List<object> result=Incedent.FetchProblemByIncedentAndHotelId(logininfo.HotelId, GetProblemId());
            if (result != null)
            {
                User user = (User)result[0];
                Incedent incedent = (Incedent)result[1];
                LblIncedentId.Text = incedent.IncedentID;
                TxtDesc.Text = incedent.IncedentDescription;
                LblRoomNo.Text = incedent.RoomNo;
                LblTime.Text = incedent.IncedentTime.ToShortDateString();
                DdlIsResolved.SelectedValue = incedent.IsSolved ? "1" : "0";
                DdlIncedentType.SelectedValue = incedent.IncedentType.ToString();
                DdlFeedbackValue.SelectedValue = incedent.FeedbackValue.ToString();
                TxtEmail.Text = user.Email;
                TxtUname.Text = user.LastName;
                TxtPhone.Text = user.Phone;
            }
            
        } 
        private void SetLoginInfo()
        {
            logininfo = (HotelDBApp.Login)Session["LoginInfo"];
        }
        private Incedent GetIncedentFromUpdatedValues()
        {
            Incedent incedent = new Incedent()
            {
                IncedentIDNum = int.Parse(LblIncedentId.Text),
                IncedentDescription = TxtDesc.Text,
                IncedentType=int.Parse(DdlIncedentType.SelectedValue),
                FeedbackValue=int.Parse(DdlFeedbackValue.SelectedValue),
                IsSolved=int.Parse(DdlIsResolved.SelectedValue)==1?true:false

            };
            return incedent;
        }
        private void ShowLabel(string message,string status)
        {
            Dictionary<string, string> dicLabels = new Dictionary<string, string>()
            {
                {"success","alert alert-success alert-dismissible fade in" },
                {"error","alert alert-danger alert-dismissible fade in" }
            };
            PnlStatus.Visible = true;
            PnlStatus.CssClass = dicLabels[status];
            LblStatus.Text = message;
        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (Incedent.UpdateProblem(GetIncedentFromUpdatedValues())>0)
            {
                ShowLabel("The Problem has been successfully updated!", "success");
            }
            else
            {
                ShowLabel("Something went wrong!", "error");
            }
            
        }
    }
}