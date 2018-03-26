<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeedbackForm.aspx.cs" Inherits="FinalHotelProject.FeedbackForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Smart Forms - Feedback Form </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" type="text/css"  href="css/smart-forms.css">
    <link rel="stylesheet" type="text/css"  href="css/font-awesome.min.css">
    <script src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        function fillHiddenFields() {
            var value = $("input:radio[name='room']:checked").val();
            $('#HdnRoom').val(value);
            value = $("input:radio[name='frontdesk']:checked").val();
            $('#HdnFrontdesk').val(value);
            value = $("input:radio[name='reservation']:checked").val();
            $('#HdnReservation').val(value);
            value = $("input:radio[name='housekeeping']:checked").val();
            $('#HdnHousekeeping').val(value);
            value = $("input:radio[name='breakfast']:checked").val();
            $('#HdnBreakfast').val(value);
            value = $("input:radio[name='wifi']:checked").val();
            $('#HdnWifi').val(value);
            value = $("input:radio[name='maintenance']:checked").val();
            $('#HdnMaintenance').val(value);
            value = $("input:radio[name='pool']:checked").val();
            $('#HdnPool').val(value);
            value = $("input:radio[name='common']:checked").val();
            $('#HdnCommon').val(value);
            value = $("input:radio[name='parking']:checked").val();
            $('#HdnParking').val(value);
            value = $("input:radio[name='product-rate']:checked").val();
            $('#HdnRating').val(value);
        }
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
            	<h4><i class="fa fa-rocket"></i>Your feedback</h4>
          </div><!-- end .form-header section -->
            
            <form id="feedback" runat="server">
                <asp:HiddenField ID="HdnRoom" runat="server"></asp:HiddenField>
                <asp:HiddenField ID="HdnFrontdesk" runat="server"></asp:HiddenField>
                <asp:HiddenField ID="HdnReservation" runat="server"></asp:HiddenField>
                <asp:HiddenField ID="HdnHousekeeping" runat="server"></asp:HiddenField>
                <asp:HiddenField ID="HdnBreakfast" runat="server"></asp:HiddenField>
                <asp:HiddenField ID="HdnWifi" runat="server"></asp:HiddenField>
                <asp:HiddenField ID="HdnMaintenance" runat="server"></asp:HiddenField>
                <asp:HiddenField ID="HdnPool" runat="server"></asp:HiddenField>
                <asp:HiddenField ID="HdnCommon" runat="server"></asp:HiddenField>
                <asp:HiddenField ID="HdnParking" runat="server"></asp:HiddenField>
                <asp:HiddenField ID="HdnRating" runat="server"></asp:HiddenField>
                <asp:Panel runat="server" Visible="false" ID="PnlSuccessFailure">
                    
                            <p><asp:Label ID="LblStatus" runat="server"></asp:Label></p>
                                                              
                        
                </asp:Panel>
                <asp:Panel ID="PnlFieldContainer" runat="server">
            	<div class="form-body">
                
                	<div class="frm-row">
                        <div class="spacer-b30">
                    	    <div class="tagline"><span>Your Room</span></div><!-- .tagline -->
                        </div> 
                        <div class="section">
                            <div class="option-group field">
                            	<div class="smart-option-group smart-option-list group-vertical"> 
                                       
                                    <label for="room_1" class="option">
                                        <input type="radio" name="room" id="room_1" value="1">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Works Great/ Satisfied with it
                                            </span>                                  
                                        </span>
                                    </label>
                                    
                                    <label for="room_2" class="option">
                                        <input type="radio" name="room" id="room_2" value="2">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Not Satisfied with it
                                            </span>                                  
                                        </span>                  
                                    </label>                            
                                    
                                    <label for="room_3" class="option">
                                        <input type="radio" name="room" id="room_3" value="3">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Something is broken
                                            </span>                                  
                                        </span>               
                                    </label>
                                    <label for="room_4" class="option">
                                        <input type="radio" name="room" id="room_4" value="4">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Needs Immediate Attention
                                            </span>                                  
                                        </span>               
                                    </label>
                                </div><!--  smart-option-group -->   
                            </div>
                        </div><!-- end section -->
                        
                        <!-- end section --> 
                                                                   
                    </div><!-- end frm-row section -->
                    
                	<div class="frm-row">
                        <div class="spacer-b30">
                    	    <div class="tagline"><span>Frondesk Staff</span></div><!-- .tagline -->
                        </div> 
                        <div class="section">
                            <div class="option-group field">
                            	<div class="smart-option-group smart-option-list group-vertical"> 
                                       
                                    <label for="frontdesk_1" class="option">
                                        <input type="radio" name="frontdesk" id="frontdesk_1" value="1">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Works Great/ Satisfied with it
                                            </span>                                  
                                        </span>
                                    </label>
                                    
                                    <label for="frontdesk_2" class="option">
                                        <input type="radio" name="frontdesk" id="frontdesk_2" value="2">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Not Satisfied with it
                                            </span>                                  
                                        </span>                  
                                    </label>                            
                                    
                                    <label for="frontdesk_3" class="option">
                                        <input type="radio" name="frontdesk" id="frontdesk_3" value="3">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Something is broken
                                            </span>                                  
                                        </span>               
                                    </label>
                                    <label for="frontdesk_4" class="option">
                                        <input type="radio" name="frontdesk" id="frontdesk_4" value="4">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Needs Immediate Attention
                                            </span>                                  
                                        </span>               
                                    </label>
                                </div><!--  smart-option-group -->   
                            </div>
                        </div><!-- end section -->
                        
                        <!-- end section --> 
                                                                   
                    </div><!-- end section -->                    
                    
                	<div class="frm-row">
                        <div class="spacer-b30">
                    	    <div class="tagline"><span>Reservations</span></div><!-- .tagline -->
                        </div> 
                        <div class="section">
                            <div class="option-group field">
                            	<div class="smart-option-group smart-option-list group-vertical"> 
                                       
                                    <label for="reservation_1" class="option">
                                        <input type="radio" name="reservation" id="reservation_1" value="1">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Works Great/ Satisfied with it
                                            </span>                                  
                                        </span>
                                    </label>
                                    
                                    <label for="reservation_2" class="option">
                                        <input type="radio" name="reservation" id="reservation_2" value="2">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Not Satisfied with it
                                            </span>                                  
                                        </span>                  
                                    </label>                            
                                    
                                    <label for="reservation_3" class="option">
                                        <input type="radio" name="reservation" id="reservation_3" value="3">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Something is broken
                                            </span>                                  
                                        </span>               
                                    </label>
                                    <label for="reservation_4" class="option">
                                        <input type="radio" name="reservation" id="reservation_4" value="4">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Needs Immediate Attention
                                            </span>                                  
                                        </span>               
                                    </label>
                                </div><!--  smart-option-group -->   
                            </div>
                        </div><!-- end section -->
                        
                        <!-- end section --> 
                                                                   
                    </div><!-- end section -->                    
                    <div class="frm-row">
                        <div class="spacer-b30">
                    	    <div class="tagline"><span>Housekeeping</span></div><!-- .tagline -->
                        </div> 
                        <div class="section">
                            <div class="option-group field">
                            	<div class="smart-option-group smart-option-list group-vertical"> 
                                       
                                    <label for="housekeeping_1" class="option">
                                        <input type="radio" name="housekeeping" id="housekeeping_1" value="1">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Works Great/ Satisfied with it
                                            </span>                                  
                                        </span>
                                    </label>
                                    
                                    <label for="housekeeping_2" class="option">
                                        <input type="radio" name="housekeeping" id="housekeeping_2" value="2">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Not Satisfied with it
                                            </span>                                  
                                        </span>                  
                                    </label>                            
                                    
                                    <label for="housekeeping_3" class="option">
                                        <input type="radio" name="housekeeping" id="housekeeping_3" value="3">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Something is broken
                                            </span>                                  
                                        </span>               
                                    </label>
                                    <label for="housekeeping_4" class="option">
                                        <input type="radio" name="housekeeping" id="housekeeping_4" value="4">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Needs Immediate Attention
                                            </span>                                  
                                        </span>               
                                    </label>
                                </div><!--  smart-option-group -->   
                            </div>
                        </div><!-- end section -->
                        
                        <!-- end section --> 
                                                                   
                    </div>
                	<div class="frm-row">
                        <div class="spacer-b30">
                    	    <div class="tagline"><span>Breakfast</span></div><!-- .tagline -->
                        </div> 
                        <div class="section">
                            <div class="option-group field">
                            	<div class="smart-option-group smart-option-list group-vertical"> 
                                       
                                    <label for="breakfast_1" class="option">
                                        <input type="radio" name="breakfast" id="breakfast_1" value="1">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Works Great/ Satisfied with it
                                            </span>                                  
                                        </span>
                                    </label>
                                    
                                    <label for="breakfast_2" class="option">
                                        <input type="radio" name="breakfast" id="breakfast_2" value="2">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Not Satisfied with it
                                            </span>                                  
                                        </span>                  
                                    </label>                            
                                    
                                    <label for="breakfast_3" class="option">
                                        <input type="radio" name="breakfast" id="breakfast_3" value="3">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Something is broken
                                            </span>                                  
                                        </span>               
                                    </label>
                                    <label for="breakfast_4" class="option">
                                        <input type="radio" name="breakfast" id="breakfast_4" value="4">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Needs Immediate Attention
                                            </span>                                  
                                        </span>               
                                    </label>
                                </div><!--  smart-option-group -->   
                            </div>
                        </div><!-- end section -->
                        
                        <!-- end section --> 
                                                                   
                    </div><!-- end section --> 
                    
                    <div class="frm-row">
                        <div class="spacer-b30">
                    	    <div class="tagline"><span>WiFi & Internet</span></div><!-- .tagline -->
                        </div> 
                        <div class="section">
                            <div class="option-group field">
                            	<div class="smart-option-group smart-option-list group-vertical"> 
                                       
                                    <label for="wifi_1" class="option">
                                        <input type="radio" name="wifi" id="wifi_1" value="1">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Works Great/ Satisfied with it
                                            </span>                                  
                                        </span>
                                    </label>
                                    
                                    <label for="wifi_2" class="option">
                                        <input type="radio" name="wifi" id="wifi_2" value="2">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Not Satisfied with it
                                            </span>                                  
                                        </span>                  
                                    </label>                            
                                    
                                    <label for="wifi_3" class="option">
                                        <input type="radio" name="wifi" id="wifi_3" value="3">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Something is broken
                                            </span>                                  
                                        </span>               
                                    </label>
                                    <label for="wifi_4" class="option">
                                        <input type="radio" name="wifi" id="wifi_4" value="4">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Needs Immediate Attention
                                            </span>                                  
                                        </span>               
                                    </label>
                                </div><!--  smart-option-group -->   
                            </div>
                        </div><!-- end section -->
                        
                        <!-- end section --> 
                                                                   
                    </div><!-- end section -->
                    
                	<div class="frm-row">
                        <div class="spacer-b30">
                    	    <div class="tagline"><span>Maintenance</span></div><!-- .tagline -->
                        </div> 
                        <div class="section">
                            <div class="option-group field">
                            	<div class="smart-option-group smart-option-list group-vertical"> 
                                       
                                    <label for="maintenance_1" class="option">
                                        <input type="radio" name="maintenance" id="maintenance_1" value="1">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Works Great/ Satisfied with it
                                            </span>                                  
                                        </span>
                                    </label>
                                    
                                    <label for="maintenance_2" class="option">
                                        <input type="radio" name="maintenance" id="maintenance_2" value="2">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Not Satisfied with it
                                            </span>                                  
                                        </span>                  
                                    </label>                            
                                    
                                    <label for="maintenance_3" class="option">
                                        <input type="radio" name="maintenance" id="maintenance_3" value="3">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Something is broken
                                            </span>                                  
                                        </span>               
                                    </label>
                                    <label for="maintenance_4" class="option">
                                        <input type="radio" name="maintenance" id="maintenance_4" value="4">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Needs Immediate Attention
                                            </span>                                  
                                        </span>               
                                    </label>
                                </div><!--  smart-option-group -->   
                            </div>
                        </div><!-- end section -->
                        
                        <!-- end section --> 
                                                                   
                    </div><!-- end section -->
                    <div class="frm-row">
                        <div class="spacer-b30">
                    	    <div class="tagline"><span>Pool</span></div><!-- .tagline -->
                        </div> 
                        <div class="section">
                            <div class="option-group field">
                            	<div class="smart-option-group smart-option-list group-vertical"> 
                                       
                                    <label for="pool_1" class="option">
                                        <input type="radio" name="pool" id="pool_1" value="1">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Works Great/ Satisfied with it
                                            </span>                                  
                                        </span>
                                    </label>
                                    
                                    <label for="pool_2" class="option">
                                        <input type="radio" name="pool" id="pool_2" value="2">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Not Satisfied with it
                                            </span>                                  
                                        </span>                  
                                    </label>                            
                                    
                                    <label for="pool_3" class="option">
                                        <input type="radio" name="pool" id="pool_3" value="3">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Something is broken
                                            </span>                                  
                                        </span>               
                                    </label>
                                    <label for="pool_4" class="option">
                                        <input type="radio" name="pool" id="pool_4" value="4">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Needs Immediate Attention
                                            </span>                                  
                                        </span>               
                                    </label>
                                </div><!--  smart-option-group -->   
                            </div>
                        </div><!-- end section -->
                        
                        <!-- end section --> 
                                                                   
                    </div>
                    <div class="frm-row">
                        <div class="spacer-b30">
                    	    <div class="tagline"><span>Common Area</span></div><!-- .tagline -->
                        </div> 
                        <div class="section">
                            <div class="option-group field">
                            	<div class="smart-option-group smart-option-list group-vertical"> 
                                       
                                    <label for="common_1" class="option">
                                        <input type="radio" name="common" id="common_1" value="1">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Works Great/ Satisfied with it
                                            </span>                                  
                                        </span>
                                    </label>
                                    
                                    <label for="common_2" class="option">
                                        <input type="radio" name="common" id="common_2" value="2">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Not Satisfied with it
                                            </span>                                  
                                        </span>                  
                                    </label>                            
                                    
                                    <label for="common_3" class="option">
                                        <input type="radio" name="common" id="common_3" value="3">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Something is broken
                                            </span>                                  
                                        </span>               
                                    </label>
                                    <label for="common_4" class="option">
                                        <input type="radio" name="common" id="common_4" value="4">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Needs Immediate Attention
                                            </span>                                  
                                        </span>               
                                    </label>
                                </div><!--  smart-option-group -->   
                            </div>
                        </div><!-- end section -->
                        
                        <!-- end section --> 
                                                                   
                    </div>
                    <div class="frm-row">
                        <div class="spacer-b30">
                    	    <div class="tagline"><span>Security & Parking</span></div><!-- .tagline -->
                        </div> 
                        <div class="section">
                            <div class="option-group field">
                            	<div class="smart-option-group smart-option-list group-vertical"> 
                                       
                                    <label for="parking_1" class="option">
                                        <input type="radio" name="parking" id="parking_1" value="1">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Works Great/ Satisfied with it
                                            </span>                                  
                                        </span>
                                    </label>
                                    
                                    <label for="parking_2" class="option">
                                        <input type="radio" name="parking" id="parking_2" value="2">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Not Satisfied with it
                                            </span>                                  
                                        </span>                  
                                    </label>                            
                                    
                                    <label for="parking_3" class="option">
                                        <input type="radio" name="parking" id="parking_3" value="3">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Something is broken
                                            </span>                                  
                                        </span>               
                                    </label>
                                    <label for="parking_4" class="option">
                                        <input type="radio" name="parking" id="parking_4" value="4">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> Needs Immediate Attention
                                            </span>                                  
                                        </span>               
                                    </label>
                                </div><!--  smart-option-group -->   
                            </div>
                        </div><!-- end section -->
                        
                        <!-- end section --> 
                                                                   
                    </div>
                    <div class="spacer spacer-b20"></div> 
                    
                    <div class="section">
                    
                        <span class="rating block">
                        
                            <span class="lbl-text" style="font-size:x-large">Rate Your Hotel</span>
                            
                            <input class="rating-input" id="five-stars" type="radio" value="5"  name="product-rate">
                            
                            <label class="rating-star" for="five-stars"><i class="fa fa-star"></i></label>
                            
                            <input class="rating-input" value="4" id="four-stars" type="radio"  name="product-rate">
                            <label class="rating-star" for="four-stars"><i class="fa fa-star"></i></label>
                            
                            <input class="rating-input" id="three-stars" value="3" type="radio"  name="product-rate">
                            <label class="rating-star" for="three-stars"><i class="fa fa-star"></i></label>
                            
                            <input class="rating-input" id="two-stars" value="2" type="radio"  name="product-rate">
                            <label class="rating-star" for="two-stars"><i class="fa fa-star"></i></label>
                            
                            <input class="rating-input" id="one-star" value="1" type="radio"  name="product-rate">
                            <label class="rating-star" for="one-star"><i class="fa fa-star"></i></label>
                        
                        </span>
                        
                        
                        
                          
                                                       
                    </div><!-- end  section -->
                    
                    <div class="spacer spacer-b25"></div> 
                    
                   
                                                                                                                                      
                    
                </div><!-- end .form-body section -->
                <div class="form-footer">
                	
                    <asp:Button CssClass="button btn-primary" OnClick="Submit_Click" Text="Submit Feedback" runat="server" ID="Submit" OnClientClick="fillHiddenFields()" />
                </div><!-- end .form-footer section -->
                </asp:Panel>
            </form>
            
        </div><!-- end .smart-forms section -->
    </div><!-- end .smart-wrap section -->
    
    <div></div><!-- end section -->

</body>
</html>
