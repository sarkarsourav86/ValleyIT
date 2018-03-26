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
      <script type="text/javascript">

          jQuery(document).ready(function ($) {

              $("#TxtDate").datepicker({
                  
                  changeMonth: false,
                  numberOfMonths: 1,
                  prevText: '<i class="fa fa-chevron-left"></i>',
                  nextText: '<i class="fa fa-chevron-right"></i>',
                  onClose: function (selectedDate) {
                      $("#to").datepicker("option", "minDate", selectedDate);
                  }
              });

              

          });

      </script>
    <!--[if lte IE 9]>
    	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>    
        <script type="text/javascript" src="js/jquery.placeholder.min.js"></script>
    <![endif]-->    
    
    <!--[if lte IE 8]>
        <link type="text/css" rel="stylesheet" href="css/smart-forms-ie8.css">
    <![endif]-->
</head>
<body class="woodbg">

	<div class="smart-wrap">
    	<div class="smart-forms smart-container wrap-3">
        
        	<div class="form-header header-primary">
            	<h4><i class="fa fa-sign-in"></i>Check In</h4>
          </div><!-- end .form-header section -->
            
            <form id="form1" runat="server">
            	<div class="form-body">
                
                    <div class="spacer-b30">
                    	<div class="tagline"><span>Sign in  With </span></div><!-- .tagline -->
                    </div>                 
                
                	<div class="section">
                	<a href="yourstay.aspx" class="button btn-social  span-left"> <span><i class="fa fa-home"></i></span>How's Your Stay</a>
                    <a href="ProblemReport.aspx" class="button btn-social  span-left">  <span><i class="fa fa-ban"></i></span>Report a Problem</a>
                    <a href="places.html" class="button btn-social  span-left"> <span><i class="fa fa-location-arrow"></i></span>Nearby Restaurants</a>
                        <a href="#" class="button btn-social  span-left"> <span><i class="fa fa-phone"></i></span>Call Frontdesk</a>
                	</div><!-- end section -->
                    <asp:Panel ID="PnlLogin" runat="server">
                        <div class="spacer-t30 spacer-b30">
                    	    <div class="tagline"><span> OR  Login </span></div><!-- .tagline -->
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
                	
                    <asp:Button ID="BtnCheckin" runat="server" OnClick="BtnCheckin_Click" CssClass="button btn-primary" Text="Check In" />
                </div><!-- end .form-footer section -->
            </form>
            
        </div><!-- end .smart-forms section -->
    </div><!-- end .smart-wrap section -->
    
    <div></div><!-- end section -->

</body>
</html>
