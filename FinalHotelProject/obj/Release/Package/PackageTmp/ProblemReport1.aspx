<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProblemReport1.aspx.cs" Inherits="FinalHotelProject.ProblemReport" ClientIDMode="Static" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Smart Forms - Contact Form </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="css/smart-forms.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link href="css/smart-addons.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.formShowHide.min.js"></script>
    <script src="js/smartforms-modal.min.js"></script>
    <script src="js/jquery-ui-custom.min.js"></script>
    <script type="text/javascript">
		jQuery(document).ready(function($){
            $('[data-smartmodal-close]').on('click', function (e) {
                console.log('in here')
                e.preventDefault();
                var smartInactiveModal = $(this).attr('data-smartmodal-close');
                $(smartInactiveModal).removeClass('smartforms-modal-visible');
                $('body').removeClass('smartforms-modal-scroll');
            });
            $('.smartfm-ctrl').formShowHide();
            $("#TxtCalendar").datepicker({
                defaultDate: "+1w",
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
        <script type="text/javascript" src="js/jquery.placeholder.min.js"></script>
    <![endif]-->
    <!--[if lte IE 8]>
        <link type="text/css" rel="stylesheet" href="css/smart-forms-ie8.css">
    <![endif]-->
</head>
<body class="woodbg">

    <div class="smart-wrap">
        <div class="smart-forms smart-container wrap-2">

            <div class="form-header header-primary">
                <h4><i class="fa fa-eye-slash"></i>Report A Problem</h4>
            </div><!-- end .form-header section -->

            <form id="contact" runat="server">
                <div id="smart-modal1" class="smartforms-modal" role="alert">
                    <div class="smartforms-modal-container">
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
                                                
                                                <asp:TextBox ID="TxtLastname" placeholder="Enter Lastname" CssClass="gui-input" runat="server"></asp:TextBox>
                                                <span class="field-icon"><i class="fa fa-user"></i></span>
                                            </label>
                                        </div><!-- end section -->

                                        <div class="section">
                                            <label class="field prepend-icon">
                                                
                                                <asp:TextBox ID="TxtRoomNo" placeholder="Enter Room Number" CssClass="gui-input" runat="server"></asp:TextBox>
                                                <span class="field-icon"><i class="fa fa-bed"></i></span>
                                            </label>
                                        </div><!-- end section -->
                                        <div class="section">
                                            <label class="field prepend-icon">
                                                
                                                <asp:TextBox ID="TxtCalendar" placeholder="Enter Checkout date" CssClass="gui-input" runat="server"></asp:TextBox>
                                                <span class="field-icon"><i class="fa fa-calendar"></i></span>
                                            </label>
                                        </div>
                                        <div class="section">
                                            <label class="field prepend-icon">
                                                
                                                <asp:TextBox ID="TxtEmail" placeholder="Your Email Address" CssClass="gui-input" runat="server"></asp:TextBox>
                                                <span class="field-icon"><i class="fa fa-envelope"></i></span>
                                            </label>
                                        </div>
                                            
                                            <div class="smartforms-modal-footer">
                                                
                                                <asp:Button ID="BtnFinalSubmit" runat="server" Text="Report" CssClass="button btn-primary" />
                                            </div><!-- end .form-footer section -->
                                        
                                    </div><!-- end .form-body section -->
                                </div><!-- end .smart-forms section -->
                            </div><!-- end .smart-wrap section -->
                        </div><!-- .smartforms-modal-body -->
                    </div><!-- .smartforms-modal-container -->
                </div>
                <div class="form-body">

                    <!-- end .frm-row section -->

                    

                    <!-- end section -->

                    <!-- .hiddenbox -->

                    <!-- .hiddenbox -->

                    <!-- .hiddenbox -->

                    <div class="spacer-b10">
                        <p class="small-text fine-grey">Please select type of problem </p>
                    </div><!-- end section -->

                    <div class="section colm colm6">
                        <label class="field select">
                            <select name="problemtypes" id="problemtypes">
                                <option value="" selected>--Select--</option>
                                <option value="Credit Card" class="smartfm-ctrl" data-show-id="ctr_housekeeping" >Housekeeping</option>
                                <option value="Check" class="smartfm-ctrl" data-show-id="ctr_internet">WiFi &amp; Internet</option>
                                <option value="Other" class="smartfm-ctrl" data-show-id="ctr_maintenance">Maintenance</option>
                                <option value="Other" class="smartfm-ctrl" data-show-id="ctr_common">Common Area</option>
                                <option value="Other" class="smartfm-ctrl" data-show-id="ctr_room">My Room</option>
                                <option value="Other" class="smartfm-ctrl" data-show-id="ctr_frontdesk">Front Desk Staff</option>
                            </select>
                            
                            <i class="arrow double"></i>
                        </label>
                    </div><!-- end section -->
                    
                    <div id="ctr_housekeeping" class="hiddenbox">

                        <div class="frm-row">
                            <div class="section colm colm12">

                                <div class="option-group field">
                                    <div class="smart-option-group smart-option-list group-vertical">
                                        <asp:RadioButtonList  ID="RadioHousekeeping" runat="server">
                                            <asp:ListItem Value="1">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                      Works Great / Satisfied with it
                                                </span>
                                            </span></asp:ListItem>
                                            <asp:ListItem Value="2">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                     Not Satisfied with it
                                                </span>
                                            </span></asp:ListItem>
                                            <asp:ListItem Value="3">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                     Something is Broken
                                                </span>
                                            </span></asp:ListItem>
                                            <asp:ListItem Value="4">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                     Needs Immediate Attention
                                                </span>
                                            </span></asp:ListItem>   
                                            
                                             
                                        </asp:RadioButtonList>
                                        <label for="TxtHousekeeping" class="field-label">Other Comments</label>
                                        <label class="field prepend-icon">
                                            
                                            <asp:TextBox CssClass="gui-textarea" TextMode="MultiLine" ID="TxtHousekeeping" runat="server"></asp:TextBox>
                                            <span class="field-icon"><i class="fa fa-comments"></i></span>
                                            <span class="input-hint">Please help us by telling more about the problem.</span>
                                        </label>
                                    </div><!--  smart-option-group -->
                                </div><!-- end .option-group section -->

                            </div>
                        </div><!-- end frm-row section -->
                        <!-- end section -->
                        <!-- end frm-row section -->
                    </div>
                    <div id="ctr_internet" class="hiddenbox">

                        <div class="frm-row">
                            <div class="section colm colm12">

                                <div class="option-group field">
                                    <div class="smart-option-group smart-option-list group-vertical">
                                        <asp:RadioButtonList  ID="RadioInternet" runat="server">
                                            <asp:ListItem Value="1">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                      Works Great / Satisfied with it
                                                </span>
                                            </span></asp:ListItem>
                                            <asp:ListItem Value="2">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                     Not Satisfied with it
                                                </span>
                                            </span></asp:ListItem>
                                            <asp:ListItem Value="3">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                     Something is Broken
                                                </span>
                                            </span></asp:ListItem>
                                            <asp:ListItem Value="4">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                     Needs Immediate Attention
                                                </span>
                                            </span></asp:ListItem>   
                                            
                                             
                                        </asp:RadioButtonList>
                                        <label for="TxtInternet" class="field-label">Other Comments</label>
                                        <label class="field prepend-icon">
                                            
                                            <asp:TextBox CssClass="gui-textarea" TextMode="MultiLine" ID="TxtInternet" runat="server"></asp:TextBox>
                                            <span class="field-icon"><i class="fa fa-comments"></i></span>
                                            <span class="input-hint"> Please help us by telling more about the problem.</span>
                                        </label>
                                    </div><!--  smart-option-group -->
                                </div><!-- end .option-group section -->

                            </div>
                        </div><!-- end frm-row section -->
                        <!-- end section -->
                        <!-- end frm-row section -->
                    </div>
                    <div id="ctr_maintenance" class="hiddenbox">

                        <div class="frm-row">
                            <div class="section colm colm12">

                                <div class="option-group field">
                                    <div class="smart-option-group smart-option-list group-vertical">
                                        <asp:RadioButtonList  ID="RadioMaintenance" runat="server">
                                            <asp:ListItem Value="1">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                      Works Great / Satisfied with it
                                                </span>
                                            </span></asp:ListItem>
                                            <asp:ListItem Value="2">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                     Not Satisfied with it
                                                </span>
                                            </span></asp:ListItem>
                                            <asp:ListItem Value="3">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                     Something is Broken
                                                </span>
                                            </span></asp:ListItem>
                                            <asp:ListItem Value="4">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                     Needs Immediate Attention
                                                </span>
                                            </span></asp:ListItem>   
                                            
                                             
                                        </asp:RadioButtonList>
                                        <label for="TxtMaintenance" class="field-label">Other Comments</label>
                                        <label class="field prepend-icon">
                                            
                                            <asp:TextBox CssClass="gui-textarea" TextMode="MultiLine" ID="TxtMaintenance" runat="server"></asp:TextBox>
                                            <span class="field-icon"><i class="fa fa-comments"></i></span>
                                            <span class="input-hint"> Please help us by telling more about the problem.</span>
                                        </label>
                                    </div><!--  smart-option-group -->
                                </div><!-- end .option-group section -->

                            </div>
                        </div><!-- end frm-row section -->
                        <!-- end section -->
                        <!-- end frm-row section -->
                    </div>
                    <div id="ctr_common" class="hiddenbox">

                        <div class="frm-row">
                            <div class="section colm colm12">

                                <div class="option-group field">
                                    <div class="smart-option-group smart-option-list group-vertical">
                                        <asp:RadioButtonList  ID="RadioCommon" runat="server">
                                           <asp:ListItem Value="1">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                      Works Great / Satisfied with it
                                                </span>
                                            </span></asp:ListItem>
                                            <asp:ListItem Value="2">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                     Not Satisfied with it
                                                </span>
                                            </span></asp:ListItem>
                                            <asp:ListItem Value="3">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                     Something is Broken
                                                </span>
                                            </span></asp:ListItem>
                                            <asp:ListItem Value="4">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                     Needs Immediate Attention
                                                </span>
                                            </span></asp:ListItem> 
                                            
                                             
                                        </asp:RadioButtonList>
                                        <label for="TxtCommon" class="field-label">Other Comments</label>
                                        <label class="field prepend-icon">
                                            
                                            <asp:TextBox CssClass="gui-textarea" TextMode="MultiLine" ID="TxtCommon" runat="server"></asp:TextBox>
                                            <span class="field-icon"><i class="fa fa-comments"></i></span>
                                            <span class="input-hint"> Please help us by telling more about the problem.</span>
                                        </label>
                                    </div><!--  smart-option-group -->
                                </div><!-- end .option-group section -->

                            </div>
                        </div><!-- end frm-row section -->
                        <!-- end section -->
                        <!-- end frm-row section -->
                    </div>
                    <div id="ctr_room" class="hiddenbox">

                        <div class="frm-row">
                            <div class="section colm colm12">

                                <div class="option-group field">
                                    <div class="smart-option-group smart-option-list group-vertical">
                                        <asp:RadioButtonList  ID="RadioRoom" runat="server">
                                            <asp:ListItem Value="1">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                      Works Great / Satisfied with it
                                                </span>
                                            </span></asp:ListItem>
                                            <asp:ListItem Value="2">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                     Not Satisfied with it
                                                </span>
                                            </span></asp:ListItem>
                                            <asp:ListItem Value="3">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                     Something is Broken
                                                </span>
                                            </span></asp:ListItem>
                                            <asp:ListItem Value="4">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                     Needs Immediate Attention
                                                </span>
                                            </span></asp:ListItem> 
                                            
                                             
                                        </asp:RadioButtonList>
                                        <label for="TxtRoom" class="field-label">Other Comments</label>
                                        <label class="field prepend-icon">
                                            
                                            <asp:TextBox CssClass="gui-textarea" TextMode="MultiLine" ID="TxtRoom" runat="server"></asp:TextBox>
                                            <span class="field-icon"><i class="fa fa-comments"></i></span>
                                            <span class="input-hint"> Please help us by telling more about the problem.</span>
                                        </label>
                                    </div><!--  smart-option-group -->
                                </div><!-- end .option-group section -->

                            </div>
                        </div><!-- end frm-row section -->
                        <!-- end section -->
                        <!-- end frm-row section -->
                    </div>
                    <div id="ctr_frontdesk" class="hiddenbox">

                        <div class="frm-row">
                            <div class="section colm colm12">

                                <div class="option-group field">
                                    <div class="smart-option-group smart-option-list group-vertical">
                                        <asp:RadioButtonList  ID="RadioFrontdesk" runat="server">
                                            <asp:ListItem Value="1">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                      Works Great / Satisfied with it
                                                </span>
                                            </span></asp:ListItem>
                                            <asp:ListItem Value="2">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                     Not Satisfied with it
                                                </span>
                                            </span></asp:ListItem>
                                            <asp:ListItem Value="3">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                     Something is Broken
                                                </span>
                                            </span></asp:ListItem>
                                            <asp:ListItem Value="4">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                     Needs Immediate Attention
                                                </span>
                                            </span></asp:ListItem>  
                                            
                                             
                                        </asp:RadioButtonList>
                                        <label for="TxtFrontdesk" class="field-label">Other Comments</label>
                                        <label class="field prepend-icon">
                                            
                                            <asp:TextBox CssClass="gui-textarea" TextMode="MultiLine" ID="TxtFrontdesk" runat="server"></asp:TextBox>
                                            <span class="field-icon"><i class="fa fa-comments"></i></span>
                                            <span class="input-hint"> Please help us by telling more about the problem.</span>
                                        </label>
                                    </div><!--  smart-option-group -->
                                </div><!-- end .option-group section -->

                            </div>
                        </div><!-- end frm-row section -->
                        <!-- end section -->
                        <!-- end frm-row section -->
                    </div>
                </div><!-- end .form-body section -->
                <div class="smartforms-px smart-forms">
                    
                </div>
                <div class="form-footer">
                    <a href="#" data-smart-modal="#smart-modal1" class="button btn-primary smartforms-modal-trigger">Continue</a>
                    
                </div><!-- end .form-footer section -->
            </form>
            
        </div><!-- end .smart-forms section -->
    </div><!-- end .smart-wrap section -->

    <div></div><!-- end section -->

</body>
</html>
