﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelDBApp;

namespace FinalHotelProject
{
    public partial class FeedbackForm : System.Web.UI.Page
    {
        Hotel hotel;
        User user;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!(HasValidUserId() && HasValidHotelId()))
            {
                PnlFieldContainer.Visible = false;
            }
            else
            {
                hotel = GetHotel();
                user = GetUser();
                SetSearchCriteria();
            }
        }
        private void SetSearchCriteria()
        {
            if (hotel != null) HdnPlacetoSearch.Value = hotel.PlaceId;
        }
        private bool HasValidUserId()
        {
            String id = Request.QueryString["user"];
            bool isValidQueryString= Request.QueryString["user"] != null;
            bool isValidId = HotelDBApp.User.ValidateUserId(id)>0?true:false;
            return isValidQueryString && isValidId;
        }
        private bool HasValidHotelId()
        {
            return Request.QueryString["hotelid"] != null;
        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            Submit.Text = HdnRating.Value;
            Feedback feedback = CreateFeedback();
            if (feedback == null)
            {
                PnlSuccessFailure.Visible = true;
                PnlSuccessFailure.CssClass = "notification alert-error spacer-t10";
                LblStatus.Text = "Something went wrong. Please try again!";
            }
            else if(Feedback.InsertFeedback(feedback)>0)
            {
                Sendemail();
                PnlFieldContainer.Visible = false;
                PnlSuccessFailure.Visible = true;
                PnlSuccessFailure.CssClass = "notification alert-success spacer-t10";
                LblStatus.Text = "Thanks for your feedback!";
            }
            else
            {
                PnlSuccessFailure.Visible = true;
                PnlSuccessFailure.CssClass = "notification alert-error spacer-t10";
                LblStatus.Text = "Something went wrong. Please try again!";
            }
            
        }
        private String GetUserId()
        {
            return Request.QueryString["user"];
        }
        private String GetHotelId()
        {
            return Request.QueryString["hotelid"];
        }
        private User GetUser()
        {
            String userID = Request.QueryString["user"];
            return HotelDBApp.User.GetUserInfo(userID);
            //do some db operations
            //return Request.QueryString["user"];
        }
        private Hotel GetHotel()
        {
            String hotelId = GetHotelId();
            return Hotel.GetHotel(hotelId);
            //do some db operations
            //return Request.QueryString["hotelid"];
        }
        private void Sendemail()
        {
            Email email = new Email() { Subject="A Review Has Been Submitted", Comments=TxtComments.Text, CheckoutDate=user.CheckOutDate,CustName=user.LastName,ToAddress=hotel.Email,ProblemValue=HdnRating.Value,UserEmail=user.Email };
            HotelBusinessLayer.Utilities.SendEmail(email,true);
        }
        private Feedback CreateFeedback()
        {
            
            User user = GetUser();
            if (user != null)
            {
                return new Feedback()
                {
                    UserID = user.UserID,
                    HotelID = GetHotelId(),
                    BreakfastFeedback = 0,
                    CommonFeedback = 0,
                    FrontDeskFeedback = 0,
                    HotelRating = Convert.ToInt16(HdnRating.Value),
                    HousekeepingFeedback = 0,
                    MaintenanceFeedback = 0,
                    ParkingFeedback = 0,
                    PoolFeedback = 0,
                    ReservationFeedback = 0,
                    RoomFeedback = 0,
                    WiFiFeedback = 0,
                    Comments = TxtComments.Text
                };
            }
            else return null;
            
        }
    }
}