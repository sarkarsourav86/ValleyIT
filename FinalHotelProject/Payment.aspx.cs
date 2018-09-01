﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AuthorizeNet.Api.Controllers;
using AuthorizeNet.Api.Contracts.V1;
using AuthorizeNet.Api.Controllers.Bases;
using HotelDBApp;

namespace FinalHotelProject
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GenerateYears();
        }
        private void GenerateYears()
        {
            DdlExpiry.Items.Clear();
            int currentYear = DateTime.Now.Year;
            for(int i = currentYear; i <= currentYear + 14; i++)
            {
                DdlExpiry.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
        }
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            String id = TxtEmail.Text + Guid.NewGuid().ToString("N");
            HotelDBApp.Payment payment = new HotelDBApp.Payment() {Email= TxtEmail.Text,Id=id,URL= Request.Url.ToString().Substring(0, Request.Url.ToString().LastIndexOf('/')) + "/" };
            String paymentId=HotelDBApp.Payment.AddPayment(payment);
            Email email = CreateEmail(paymentId, payment.Email, payment.URL);
            SendEmail(email);
        }
        public  Email CreateEmail(String id, String email, String url)
        {
            String server = System.Configuration.ConfigurationManager.AppSettings["serverName"];
            String FormattedUrl = String.Format("{0}RegisterHotel.aspx?id={1}", url, id);
            String Step8 = String.Format("<p><h3>Please click here to register <a href='{0}'>{1}</a></h3></p>", FormattedUrl, FormattedUrl);
            
            String Step1 = String.Format("<p>Step 1. Click on the Hotel Registration Link you received in your email.</p>{1}",server, Step8);
            String Step2 = String.Format("<p>Step 2. Select Your Franchise (Choice, Hilton, Marriott, etc.) or pick Independent if you are not affiliated with any franchise.</p><img src='{0}images/email/2.png' />",server);
            String Step3 = String.Format("<p>Step 3. Enter your hotel name. The field should auto populate once you start typing it. Use Chrome browser preferably. Verify the address before you accept the option provided.</p><img src='{0}images/email/3.png' />",server);
            String Step4 = String.Format("<p>Step 4. Enter the same email address you have used for payment.</p><img src='{0}images/email/4.png' />",server);
            String Step5 = String.Format("<p>Step 5. Enter the FRONT DESK phone number.</p><img src='{0}images/email/5.png' />",server);
            String Step6 = String.Format("<p>Step 6. Enter name of billing manager or contact.</p><img src='{0}images/email/6.png' />",server);
            String Step7 = String.Format("<p>Step 7. Click on Register to submit the form.</p><img src='{0}images/email/7.png' />",server);
            String Step9 = String.Format("<p>After your property is registered, you'll receive a unique link. This link will be for the name of the hotel registered. To avoid confusing your guests please don’t use the link for any other hotel.</p>");
            String Step10 = String.Format("<p>Please give this unique link to your IT person or WiFi/HSIA Vendor to put this link as the redirect page or landing page.</p>");
            String Step11 = "<p>Once that is done you will start receiving instant feedback to the email you registered with.</p>";
            return new Email()
            {
                Subject = "Confirm Registration",
                Body = $"{Step1}{Step2}{Step3}{Step4}{Step5}{Step6}{Step7}{Step9}{Step10}{Step11}",
                ToAddress = email };
        }
        public void SendEmail(Email email)
        {
            HotelBusinessLayer.Utilities.SendEmail(email);
        }
        public static ANetApiResponse Run(String ApiLoginID, String ApiTransactionKey, decimal amount)
        {
            Console.WriteLine("Charge Credit Card Sample");

            ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.SANDBOX;

            // define the merchant information (authentication / transaction id)
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
            {
                name = ApiLoginID,
                ItemElementName = ItemChoiceType.transactionKey,
                Item = ApiTransactionKey,
            };

            var creditCard = new creditCardType
            {
                cardNumber = "4111111111111111",
                expirationDate = "0725",
                cardCode = "123"
            };

            var billingAddress = new customerAddressType
            {
                firstName = "John",
                lastName = "Doe",
                address = "123 My St",
                city = "OurTown",
                zip = "98004"
            };

            //standard api call to retrieve response
            var paymentType = new paymentType { Item = creditCard };

            // Add line Items
            var lineItems = new lineItemType[2];
            lineItems[0] = new lineItemType { itemId = "1", name = "t-shirt", quantity = 2, unitPrice = new Decimal(15.00) };
            lineItems[1] = new lineItemType { itemId = "2", name = "snowboard", quantity = 1, unitPrice = new Decimal(450.00) };

            var transactionRequest = new transactionRequestType
            {
                transactionType = transactionTypeEnum.authCaptureTransaction.ToString(),    // charge the card

                amount = amount,
                payment = paymentType,
                billTo = billingAddress,
                lineItems = lineItems
            };

            var request = new createTransactionRequest { transactionRequest = transactionRequest };

            // instantiate the controller that will call the service
            var controller = new createTransactionController(request);
            controller.Execute();

            // get the response from the service (errors contained if any)
            var response = controller.GetApiResponse();

            // validate response
            if (response != null)
            {
                if (response.messages.resultCode == messageTypeEnum.Ok)
                {
                    if (response.transactionResponse.messages != null)
                    {
                        Console.WriteLine("Successfully created transaction with Transaction ID: " + response.transactionResponse.transId);
                        Console.WriteLine("Response Code: " + response.transactionResponse.responseCode);
                        Console.WriteLine("Message Code: " + response.transactionResponse.messages[0].code);
                        Console.WriteLine("Description: " + response.transactionResponse.messages[0].description);
                        Console.WriteLine("Success, Auth Code : " + response.transactionResponse.authCode);
                    }
                    else
                    {
                        Console.WriteLine("Failed Transaction.");
                        if (response.transactionResponse.errors != null)
                        {
                            Console.WriteLine("Error Code: " + response.transactionResponse.errors[0].errorCode);
                            Console.WriteLine("Error message: " + response.transactionResponse.errors[0].errorText);
                        }
                    }
                }
                else
                {
                    Console.WriteLine("Failed Transaction.");
                    if (response.transactionResponse != null && response.transactionResponse.errors != null)
                    {
                        Console.WriteLine("Error Code: " + response.transactionResponse.errors[0].errorCode);
                        Console.WriteLine("Error message: " + response.transactionResponse.errors[0].errorText);
                    }
                    else
                    {
                        Console.WriteLine("Error Code: " + response.messages.message[0].code);
                        Console.WriteLine("Error message: " + response.messages.message[0].text);
                    }
                }
            }
            else
            {
                Console.WriteLine("Null Response.");
            }

            return response;
        }


    }
}