<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Yourstay.aspx.cs" Inherits="FinalHotelProject.Yourstay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Your Stay - MyGuestXp </title>
    <link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="plugins/dropify/css/dropify.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="css/smart-forms.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link href="css/smart-addons.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.formShowHide.min.js"></script>
    <script src="js/smartforms-modal.min.js"></script>
    <script src="js/jquery-ui-custom.min.js"></script>
    <script src="js/additional-methods.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/Validation.js"></script>
    <script src="plugins/dropify/js/dropify.min.js"></script>
    <script type="text/javascript">
        
        jQuery(document).ready(function ($) {
            validateForm();
            $('[data-smartmodal-close]').on('click', function (e) {
                
                e.preventDefault();
                var smartInactiveModal = $(this).attr('data-smartmodal-close');
                $(smartInactiveModal).removeClass('smartforms-modal-visible');
                $('body').removeClass('smartforms-modal-scroll');
            });
            $('.smartfm-ctrl').formShowHide();
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
    <script type="text/javascript">
        function fillHiddenFields() {
            var value = $("input:radio[name='room']:checked").val();
            $('#HdnRoom').val(value);
            value = $('#room_comment').val();
            
            $('#Hdnroom_comment').val(value);
            
        }
    </script>
    <!--[if lte IE 9]>   
        <script type="text/javascript" src="js/jquery.placeholder.min.js"></script>
    <![endif]-->    
    
    <!--[if lte IE 8]>
        <link type="text/css" rel="stylesheet" href="css/smart-forms-ie8.css">
    <![endif]-->
</head>
<body class="darkbg">

	<div class="smart-wrap">
    	<div class="smart-forms smart-container wrap-2">
        
        	<div class="form-header header-primary">
                <img src="images/logohotel.png" />
            	<h4>My Room Feedback - <asp:Label ID="LblHotelName" runat="server"></asp:Label> </h4>
                
            </div><!-- end .form-header section -->
            <ul class="breadcrumb">
                
                <li><asp:HyperLink ID="HypHome" runat="server">Home</asp:HyperLink></li>
                <li>Your Stay</li>
            </ul>
            <form id="form1" runat="server" enctype="multipart/form-data">
                
            	<div id="smart-modal1" class="smartforms-modal" role="alert">
                    
                    <asp:HiddenField ID="HdnRoom" runat="server"></asp:HiddenField>
                    
                    <asp:HiddenField ID="Hdnroom_comment" runat="server"></asp:HiddenField>
                    

                    
                    <asp:Panel runat="server" ID="PnlModalContainer" CssClass="smartforms-modal-container">
                        <div class="smartforms-modal-header">
                            <h3>Please Fill in the Details</h3>
                            <a href="#" class="smartforms-modal-close">&times;</a>
                        </div><!-- .smartforms-modal-header -->
                        <div class="smartforms-modal-body">
                            <div class="smart-wrap">
                                <div class="smart-forms smart-container wrap-full">
                                    <div class="form-body">
                                        
                                        <div class="section">
                                            <label class="field prepend-icon">
                                                
                                                <asp:TextBox ID="TxtUserLastName" runat="server" CssClass="gui-input" placeholder="Enter lastname"></asp:TextBox>
                                                <span class="field-icon"><i class="fa fa-user"></i></span>
                                            </label>
                                        </div><!-- end section -->

                                        <div class="section">
                                            <label class="field prepend-icon">
                                                
                                                <asp:TextBox ID="TxtRoom" runat="server" CssClass="gui-input" placeholder="Enter Room Number"></asp:TextBox>
                                                <span class="field-icon"><i class="fa fa-bed"></i></span>
                                            </label>
                                        </div><!-- end section -->
                                        <div class="section">
                                            <label class="field prepend-icon">
                                                
                                                <asp:TextBox ID="TxtDate" runat="server" CssClass="gui-input" placeholder="Enter Checkout date"></asp:TextBox>
                                                <span class="field-icon"><i class="fa fa-calendar"></i></span>
                                            </label>
                                        </div>
                                        <div class="section">
                                            <label class="field prepend-icon">
                                                
                                                <asp:TextBox ID="TxtEmail" runat="server" CssClass="gui-input" placeholder="Your Email Address"></asp:TextBox>
                                                <span class="field-icon"><i class="fa fa-envelope"></i></span>
                                            </label>
                                        </div>
                                            
                                            <div class="smartforms-modal-footer">
                                                
                                                <asp:Button OnClientClick="fillHiddenFields()"  runat="server" ID="LoginSubmit" OnClick="LoginBtnSubmit_Click" CssClass="button btn-primary" Text="Send" />
                                                
                                            </div><!-- end .form-footer section -->
                                        
                                    </div><!-- end .form-body section -->
                                </div><!-- end .smart-forms section -->
                            </div><!-- end .smart-wrap section -->
                        </div><!-- .smartforms-modal-body -->
                    </asp:Panel><!-- .smartforms-modal-container -->
                    
                </div><!-- end .form-body section -->
                <asp:Panel runat="server" Visible="false" ID="PnlSuccessFailure">
                    
                            <p><asp:Label ID="LblStatus" runat="server"></asp:Label></p>
                                                              
                        
                    </asp:Panel>
                <asp:Panel runat="server" ID="FormBody" CssClass="form-body">

                    <!-- end .frm-row section -->

                    

                    <!-- end section -->

                    <!-- .hiddenbox -->

                    <!-- .hiddenbox -->

                    <!-- .hiddenbox -->
                    
                    

                    <!-- end section -->
                    
                    
                    <!-- .hiddenbox -->

                    <!-- .hiddenbox -->
                    <div id="ctr_room" class="hiddenbox">

                        <div class="frm-row">
                            <div class="section colm colm12">

                                <div class="option-group field">
                                    <div class="smart-option-group smart-option-list group-vertical">
                                        <label for="room_0" class="option">
                                        <input type="radio" checked name="room" id="room_0" value="0">
                                        <span class="smart-option smart-radio">
                                            <span class="smart-option-ui"> 
                                            	<i class="iconc"></i> No Comments
                                            </span>                                  
                                        </span>
                                    </label>
                                        <label for="room_1" class="option">
                                            <input type="radio" name="room" id="room_1" value="1">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i> Everything is Great/ Very Satisfied
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
                                        <div class="form-group">
                                            <label for="exampleInputFile" class="field-label">Upload Image</label>
                                            <input type="file" name="file" class="dropify" data-allowed-file-extensions="jpg JPG jpeg png" data-height="100" data-max-file-size="2M">
                                            <p class="help-block">Upload .jpg or .png files</p>
                                        </div>
                                    </div><!--  smart-option-group -->
                                    
                                </div><!-- end .option-group section -->
                                <label for="room_comment" class="field-label">Additional Comments</label>
                                        <label class="field prepend-icon">
                                            <textarea class="gui-textarea" id="room_comment"></textarea>
                                            <span class="field-icon"><i class="fa fa-comments"></i></span>
                                            <span class="input-hint"> Please leave a comment to help us serve you better</span>
                                        </label>
                            </div>
                        </div><!-- end frm-row section -->
                        <!-- end section -->
                        <!-- end frm-row section -->
                    </div>
                    
                    <!-- .hiddenbox -->

                    <!-- end section -->

                    <!-- end section -->

                    <!-- end .notification section -->

                    <!-- end .notification section -->

                    <!-- end .notification section -->

                    <!-- end .notification section -->

                </asp:Panel>
                
                	
                    <asp:Panel ID="PnlLoginBtnContainer" runat="server">
                <div class="form-footer">
                    <a href="#" onclick="validateForm()" data-smart-modal="#smart-modal1" class="button btn-primary smartforms-modal-trigger">Report</a>
                    
                    
                </div><!-- end .form-footer section -->
                </asp:Panel>
                <asp:Panel ID="PnlNoLoginBtnContainer" Visible="false" runat="server">
                
                   <div class="form-footer">
                    <asp:Button ID="NoLoginBtnSubmit" OnClientClick="fillHiddenFields()" OnClick="NoLoginSubmit_Click"  CssClass="button btn-primary" runat="server" Text="REPORT " />
                    </div>
                
                </asp:Panel>
                
            </form>
            
        </div><!-- end .smart-forms section -->
    </div><!-- end .smart-wrap section -->
    
    <div></div><!-- end section -->
    <script type="text/javascript">
        $('.dropify').dropify({
            messages: {
                'default': 'Drag and drop a file here or click',
                'replace': 'Drag and drop or click to replace',
                'remove': 'Remove',
                'error': 'Ooops, something wrong happended.'
            }
        });
    </script>
</body>
</html>
