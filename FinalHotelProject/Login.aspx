<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FinalHotelProject.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title> Smart Forms - Login </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" type="text/css"  href="css/smart-forms.css">    
    <link rel="stylesheet" type="text/css"  href="css/font-awesome.min.css">
      <script src="js/jquery-1.9.1.min.js"></script>
      <script src="js/jquery-ui-custom.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/additional-methods.min.js"></script>
      <script type="text/javascript">

          jQuery(document).ready(function ($) {
              $("#form1").validate({
                  errorClass: "state-error",
                  validClass: "state-success",
                  errorElement: "em",
                  rules: {
                      TxtLastname: {
                          required: true
                      },
                      TxtRoom: {
                          required: true
                      },
                      TxtEmail: {
                          required: true,
                          email: true
                      },
                      TxtDate: {
                          required: true
                      }

                  },
                  messages: {

                      TxtLastname: {
                          required: 'Please enter your last name.'
                      },
                      TxtRoom: {
                          required: 'Please enter your room number.'
                      },
                      TxtEmail: {
                          required: 'Please enter your email id'

                      },
                      TxtDate: {
                          required: 'Please enter checkout date'
                      }
                  },
                  highlight: function (element, errorClass, validClass) {
                      $(element).closest('.field').addClass(errorClass).removeClass(validClass);
                  },
                  unhighlight: function (element, errorClass, validClass) {
                      $(element).closest('.field').removeClass(errorClass).addClass(validClass);
                  },
                  errorPlacement: function (error, element) {
                      if (element.is(":radio") || element.is(":checkbox")) {
                          element.closest('.option-group').after(error);
                      }
                      else {
                          error.insertAfter(element.parent());
                      }
                  }
              });
              $("#TxtDate").datepicker({
                  
                  changeMonth: false,
                  numberOfMonths: 1,
                  prevText: '<i class="fa fa-chevron-left"></i>',
                  nextText: '<i class="fa fa-chevron-right"></i>',
                  minDate: 0,
                  onClose: function (selectedDate) {
                      $("#to").datepicker("option", "minDate", selectedDate);
                  }
              });

              

          });

      </script>
    <style>
        .links {
            color:black;
            text-decoration: none;
        }
        .links:hover {
            color:white;
            
        }
    </style>
    <!--[if lte IE 9]>
    	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>    
        <script type="text/javascript" src="js/jquery.placeholder.min.js"></script>
    <![endif]-->    
    
    <!--[if lte IE 8]>
        <link type="text/css" rel="stylesheet" href="css/smart-forms-ie8.css">
    <![endif]-->
</head>
<body class="darkbg">

	<div class="smart-wrap">
    	<div class="smart-forms smart-container wrap-3">
        
        	<div class="form-header header-primary">

            	<h4><img src="images/online.png" /><span style="margin-left:5px;margin-top:-5px;">You Are Online</span><%--<asp:Label runat="server" ID="LblHotelName"></asp:Label>--%></h4>
                <a class="links" href="http:/www.choicehotels.com">choicehotels.com</a>/ <a class="links" href="http:/www.wyndham.com">wyndham.com</a>
                
          </div><!-- end .form-header section -->
            
            <form id="form1" runat="server">
            	<div class="form-body">
                
                                    
                
                	<div class="section">
                	
                        <asp:HyperLink runat="server" ID="HypStay" NavigateUrl="yourstay.aspx" CssClass="button btn-social  span-left"><span><i class="fa fa-home"></i></span>How's Your Stay</asp:HyperLink>
                        <asp:HyperLink runat="server" ID="HypProblemReport" NavigateUrl="ProblemReport.aspx" CssClass="button btn-social  span-left"><span><i class="fa fa-ban"></i></span>Report a Problem</asp:HyperLink>
                        <asp:HyperLink runat="server" ID="HypPlaces" NavigateUrl="places.html" CssClass="button btn-social  span-left"><span><i class="fa fa-location-arrow"></i></span>Nearby Restaurants</asp:HyperLink>
                        <asp:HyperLink runat="server" ID="HypPhone" NavigateUrl="~/Web.config" CssClass="button btn-social  span-left"><span><i class="fa fa-phone"></i></span>Call Frontdesk</asp:HyperLink>
                	</div><!-- end section -->
                    <asp:Panel ID="PnlLogin" runat="server">
                        <div class="spacer-t30 spacer-b30">
                    	    <div class="tagline"><span>Tell Us About Your Experience</span></div><!-- .tagline -->
                        </div>
                        <div class="section">
                            <asp:SqlDataSource ID="SqlDataSourceHotel" ConnectionString="Data Source=DESKTOP-8346GUH\SQLEXPRESS;Initial Catalog=ExperienceHotelApp;Integrated Security=True" SelectCommand="select [Property Name]+' ('+[Property State]+')' as text,[Property] as id from Hotel" runat="server"></asp:SqlDataSource>
                            <asp:DropDownList AutoPostBack="true" DataTextField="text" DataValueField="id" ID="DdlHotels" OnSelectedIndexChanged="DdlHotels_SelectedIndexChanged" DataSourceID="SqlDataSourceHotel" Width="200" runat="server"></asp:DropDownList>
                        </div>
                        <div class="section">
                            <label class="field prepend-icon">
                            
                                <asp:TextBox runat="server" ID="TxtLastname" CssClass="gui-input" placeholder="Enter Lastname"></asp:TextBox>
                                <span class="field-icon"><i class="fa fa-user"></i></span>  
                            </label>
                        </div><!-- end section -->                    
                    
                	    <div class="section">
                    	    <label class="field prepend-icon">
                        	
                                <asp:TextBox runat="server" ID="TxtRoom" CssClass="gui-input" placeholder="Enter Room Number"></asp:TextBox>
                                <span class="field-icon"><i class="fa fa-bed"></i></span>  
                            </label>
                        </div><!-- end section --> 
                        <div class="section">
                            <label class="field prepend-icon">
                            
                                <asp:TextBox runat="server" ID="TxtDate" CssClass="gui-input" placeholder="Enter Checkout date"></asp:TextBox>
                                <span class="field-icon"><i class="fa fa-calendar"></i></span>
                            </label>
                        </div>
                        <div class="section">
                            <label class="field prepend-icon">
                            
                                <asp:TextBox runat="server" ID="TxtEmail" CssClass="gui-input" placeholder="Your Email Address"></asp:TextBox>
                                <span class="field-icon"><i class="fa fa-envelope"></i></span>
                            </label>
                        </div>
                    
                	<!-- end section -->                                                           
                   </asp:Panel> 
                </div><!-- end .form-body section -->
                <div class="form-footer">
                	
                    <asp:Button ID="BtnCheckin" runat="server" OnClick="BtnCheckin_Click" CssClass="button btn-primary" Text="Submit" />
                </div><!-- end .form-footer section -->
            </form>
            
        </div><!-- end .smart-forms section -->
    </div><!-- end .smart-wrap section -->
    
    <div></div><!-- end section -->

</body>
</html>
