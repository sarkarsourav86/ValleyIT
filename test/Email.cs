﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace HotelDBApp
{
    public class Email
    {
        public String ToAddress { get; set; }
        public String CustName { get; set; }
        public String RoomNo { get; set; }
        public String ProblemType { get; set; }
        public String ProblemValue { get; set; }
        public String Comments { get; set; }
        public DateTime CheckoutDate { get; set; }
        public String UserEmail { get; set; }
        public String Subject { get; set; }
        public String Body { get; set; }
        public String ProblemText { get; set; }
        public String Phone { get; set; }
        public static DataSet FetchEmails()
        {
            SqlCommand cmd = new SqlCommand("SpFetchUserstoSendEmail");
            cmd.CommandType = CommandType.StoredProcedure;
            return DBOperations.FetchValues(cmd);
        }
        public static bool ValidateAdminEmailId(string emailid)
        {
            SqlCommand cmd = new SqlCommand("select count(*) from PropertyAdmins where UserName=@emailid");
            cmd.Parameters.AddWithValue("@emailid", emailid);
            cmd.CommandType = CommandType.Text;
            return Convert.ToInt16(DBOperations.InsertAndReturn(cmd).ToString())>0;
        }
    }
    
}
