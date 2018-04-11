<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProblemReport.aspx.cs" Inherits="FinalHotelProject.ProblemReport1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Smart Forms - Contact Form </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="css/smart-forms.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link href="css/smart-addons.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.formShowHide.min.js"></script>
    <script src="js/smartforms-modal.min.js"></script>
    <script src="js/jquery-ui-custom.min.js"></script>
    <script src="js/additional-methods.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {

            $("#form1").validate({
                errorClass: "state-error",
                validClass: "state-success",
                errorElement: "em",
                rules: {
                    TxtUserLastName: {
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
                    },


                },
                messages: {

                    TxtUserLastName: {
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
                    },

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
                onClose: function (selectedDate) {
                    $("#to").datepicker("option", "minDate", selectedDate);
                }
            });

        });
    </script>
    <script type="text/javascript">

        function fillHiddenFields() {
            console.log('came here');
            var value = $("input:radio[name='room']:checked").val();
            $('#HdnRoom').val(value);
            value = $("input:radio[name='helpdesk']:checked").val();
            $('#HdnFrontdesk').val(value);

            value = $("input:radio[name='housekeeping']:checked").val();
            $('#HdnHousekeeping').val(value);

            value = $("input:radio[name='internet']:checked").val();
            $('#HdnWifi').val(value);
            value = $("input:radio[name='maintain']:checked").val();
            $('#HdnMaintenance').val(value);

            value = $("input:radio[name='common']:checked").val();
            $('#HdnCommon').val(value);
            value = $('#problemtypes').val();

            $('#HdnProblemType').val(value);
            value = $('#housekeeping_comment').val();
            $('#Hdnhousekeeping_comment').val(value);
            value = $('#internet_comment').val();
            $('#Hdninternet_comment').val(value);
            value = $('#maintain_comment').val();
            $('#Hdnmaintain_comment').val(value);
            value = $('#common_comment').val();
            $('#Hdncommon_comment').val(value);
            value = $('#room_comment').val();
            $('#Hdnroom_comment').val(value);
            value = $('#frontdesk_comment').val();
            $('#Hdnfrontdesk_comment').val(value);


        }
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
                <h4><i class="fa fa-eye-slash"></i>Report A Problem -
                    <asp:Label runat="server" ID="LblHotelName"></asp:Label></h4>

            </div>
            <!-- end .form-header section -->
            <ul class="breadcrumb">
                <li><a href="/Login.aspx">Home</a></li>
                
                <li>Report a Problem</li>
            </ul>
            <form id="form1" runat="server">
                <div id="smart-modal1" class="smartforms-modal" role="alert">
                    <asp:HiddenField ID="HdnProblemType" runat="server"></asp:HiddenField>

                    <asp:HiddenField ID="HdnRoom" runat="server"></asp:HiddenField>

                    <asp:HiddenField ID="HdnFrontdesk" runat="server"></asp:HiddenField>

                    <asp:HiddenField ID="HdnHousekeeping" runat="server"></asp:HiddenField>

                    <asp:HiddenField ID="HdnWifi" runat="server"></asp:HiddenField>

                    <asp:HiddenField ID="HdnMaintenance" runat="server"></asp:HiddenField>

                    <asp:HiddenField ID="HdnCommon" runat="server"></asp:HiddenField>

                    <asp:HiddenField ID="Hdnhousekeeping_comment" runat="server"></asp:HiddenField>
                    <asp:HiddenField ID="Hdninternet_comment" runat="server"></asp:HiddenField>
                    <asp:HiddenField ID="Hdnmaintain_comment" runat="server"></asp:HiddenField>
                    <asp:HiddenField ID="Hdncommon_comment" runat="server"></asp:HiddenField>
                    <asp:HiddenField ID="Hdnroom_comment" runat="server"></asp:HiddenField>
                    <asp:HiddenField ID="Hdnfrontdesk_comment" runat="server"></asp:HiddenField>

                    <asp:Panel runat="server" ID="PnlModalContainer" CssClass="smartforms-modal-container">

                        <div class="smartforms-modal-header">
                            <h3>Please Fill in the Details</h3>
                            <a href="#" class="smartforms-modal-close">&times;</a>
                        </div>
                        <!-- .smartforms-modal-header -->
                        <div class="smartforms-modal-body">
                            <div class="smart-wrap">
                                <div class="smart-forms smart-container wrap-full">
                                    <div class="form-body">

                                        <div class="section">
                                            <label class="field prepend-icon">

                                                <asp:TextBox ID="TxtUserLastName" runat="server" CssClass="gui-input" placeholder="Enter lastname"></asp:TextBox>
                                                <span class="field-icon"><i class="fa fa-user"></i></span>
                                            </label>
                                        </div>
                                        <!-- end section -->

                                        <div class="section">
                                            <label class="field prepend-icon">

                                                <asp:TextBox ID="TxtRoom" runat="server" CssClass="gui-input" placeholder="Enter Room Number"></asp:TextBox>
                                                <span class="field-icon"><i class="fa fa-bed"></i></span>
                                            </label>
                                        </div>
                                        <!-- end section -->
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

                                            <asp:Button OnClientClick="fillHiddenFields()" OnClick="Submit_Click" runat="server" ID="NoLoginSubmit" CssClass="button btn-primary" Text="Send" />

                                        </div>
                                        <!-- end .form-footer section -->

                                    </div>
                                    <!-- end .form-body section -->
                                </div>
                                <!-- end .smart-forms section -->
                            </div>
                            <!-- end .smart-wrap section -->
                        </div>
                        <!-- .smartforms-modal-body -->
                    </asp:Panel>
                    <!-- .smartforms-modal-container -->
                </div>
                <div class="form-body">

                    <!-- end .frm-row section -->



                    <!-- end section -->

                    <!-- .hiddenbox -->

                    <!-- .hiddenbox -->

                    <!-- .hiddenbox -->
                    <asp:Panel runat="server" Visible="false" ID="PnlSuccessFailure">

                        <p>
                            <asp:Label ID="LblStatus" runat="server"></asp:Label></p>


                    </asp:Panel>
                    <div class="spacer-b10">
                        <p class="small-text fine-grey">Please select type of problem </p>
                    </div>
                    <!-- end section -->

                    <div class="section colm colm6">
                        <label class="field select">
                            <select name="problemtypes" id="problemtypes">
                                <option value="0" selected>--Select--</option>
                                <option value="1" class="smartfm-ctrl" data-show-id="ctr_housekeeping">Housekeeping</option>
                                <option value="2" class="smartfm-ctrl" data-show-id="ctr_internet">WiFi &amp; Internet</option>
                                <option value="3" class="smartfm-ctrl" data-show-id="ctr_maintain">Maintenance</option>
                                <option value="4" class="smartfm-ctrl" data-show-id="ctr_common">Common Area</option>
                                <option value="5" class="smartfm-ctrl" data-show-id="ctr_room">My Room</option>
                                <option value="6" class="smartfm-ctrl" data-show-id="ctr_frontdesk">Front Desk Staff</option>
                            </select>
                            <i class="arrow double"></i>
                        </label>
                    </div>
                    <!-- end section -->
                    <div id="ctr_housekeeping" class="hiddenbox">

                        <div class="frm-row">
                            <div class="section colm colm12">

                                <div class="option-group field">
                                    <div class="smart-option-group smart-option-list group-vertical">
                                        <label for="housekeeping_0" class="option">
                                            <input type="radio" checked name="housekeeping" id="housekeeping_0" value="0">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>No Comments
                                                </span>
                                            </span>
                                        </label>
                                        <label for="housekeeping_1" class="option">
                                            <input type="radio" name="housekeeping" id="housekeeping_1" value="1">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Works Great/ Satisfied with it
                                                </span>
                                            </span>
                                        </label>

                                        <label for="housekeeping_2" class="option">
                                            <input type="radio" name="housekeeping" id="housekeeping_2" value="2">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Not Satisfied with it
                                                </span>
                                            </span>
                                        </label>

                                        <label for="housekeeping_3" class="option">
                                            <input type="radio" name="housekeeping" id="housekeeping_3" value="3">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Something is broken
                                                </span>
                                            </span>
                                        </label>
                                        <label for="housekeeping_4" class="option">
                                            <input type="radio" name="housekeeping" id="housekeeping_4" value="4">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Needs Immediate Attention
                                                </span>
                                            </span>
                                        </label>
                                        <label for="housekeeping_comment" class="field-label">Additional Comments</label>
                                        <label class="field prepend-icon">
                                            <textarea class="gui-textarea" id="housekeeping_comment"></textarea>
                                            <span class="field-icon"><i class="fa fa-comments"></i></span>
                                            <span class="input-hint">Please leave a comment to help us serve you better</span>
                                        </label>
                                    </div>
                                    <!--  smart-option-group -->
                                </div>
                                <!-- end .option-group section -->

                            </div>
                        </div>
                        <!-- end frm-row section -->
                        <!-- end section -->
                        <!-- end frm-row section -->
                    </div>
                    <div id="ctr_internet" class="hiddenbox">

                        <div class="frm-row">
                            <div class="section colm colm12">

                                <div class="option-group field">
                                    <div class="smart-option-group smart-option-list group-vertical">
                                        <label for="internet_0" class="option">
                                            <input type="radio" checked name="internet" id="internet_0" value="0">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>No Comments
                                                </span>
                                            </span>
                                        </label>
                                        <label for="internet_1" class="option">
                                            <input type="radio" name="internet" id="internet_1" value="1">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Works Great/ Satisfied with it
                                                </span>
                                            </span>
                                        </label>

                                        <label for="internet_2" class="option">
                                            <input type="radio" name="internet" id="internet_2" value="2">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Not Satisfied with it
                                                </span>
                                            </span>
                                        </label>

                                        <label for="internet_3" class="option">
                                            <input type="radio" name="internet" id="internet_3" value="3">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Something is broken
                                                </span>
                                            </span>
                                        </label>
                                        <label for="internet_4" class="option">
                                            <input type="radio" name="internet" id="internet_4" value="4">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Needs Immediate Attention
                                                </span>
                                            </span>
                                        </label>
                                        <label for="internet_comment" class="field-label">Additional Comments</label>
                                        <label class="field prepend-icon">
                                            <textarea class="gui-textarea" id="internet_comment"></textarea>
                                            <span class="field-icon"><i class="fa fa-comments"></i></span>
                                            <span class="input-hint">Please leave a comment to help us serve you better</span>
                                        </label>
                                    </div>
                                    <!--  smart-option-group -->
                                </div>
                                <!-- end .option-group section -->

                            </div>
                        </div>
                        <!-- end frm-row section -->
                        <!-- end section -->
                        <!-- end frm-row section -->
                    </div>
                    <div id="ctr_maintain" class="hiddenbox">

                        <div class="frm-row">
                            <div class="section colm colm12">

                                <div class="option-group field">
                                    <div class="smart-option-group smart-option-list group-vertical">
                                        <label for="maintain_0" class="option">
                                            <input type="radio" checked name="maintain" id="maintain_0" value="0">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>No Comments
                                                </span>
                                            </span>
                                        </label>
                                        <label for="maintain_1" class="option">
                                            <input type="radio" name="maintain" id="maintain_1" value="1">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Works Great/ Satisfied with it
                                                </span>
                                            </span>
                                        </label>

                                        <label for="maintain_2" class="option">
                                            <input type="radio" name="maintain" id="maintain_2" value="2">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Not Satisfied with it
                                                </span>
                                            </span>
                                        </label>

                                        <label for="maintain_3" class="option">
                                            <input type="radio" name="maintain" id="maintain_3" value="3">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Something is broken
                                                </span>
                                            </span>
                                        </label>
                                        <label for="maintain_4" class="option">
                                            <input type="radio" name="maintain" id="maintain_4" value="4">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Needs Immediate Attention
                                                </span>
                                            </span>
                                        </label>
                                        <label for="maintain_comment" class="field-label">Additional Comments</label>
                                        <label class="field prepend-icon">
                                            <textarea class="gui-textarea" id="maintain_comment"></textarea>
                                            <span class="field-icon"><i class="fa fa-comments"></i></span>
                                            <span class="input-hint">Please leave a comment to help us serve you better</span>
                                        </label>
                                    </div>
                                    <!--  smart-option-group -->
                                </div>
                                <!-- end .option-group section -->

                            </div>
                        </div>
                        <!-- end frm-row section -->
                        <!-- end section -->
                        <!-- end frm-row section -->
                    </div>
                    <!-- .hiddenbox -->

                    <div id="ctr_common" class="hiddenbox">

                        <div class="frm-row">
                            <div class="section colm colm12">

                                <div class="option-group field">
                                    <div class="smart-option-group smart-option-list group-vertical">
                                        <label for="common_0" class="option">
                                            <input type="radio" checked name="common" id="common_0" value="0">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>No Comments
                                                </span>
                                            </span>
                                        </label>
                                        <label for="common_1" class="option">
                                            <input type="radio" name="common" id="common_1" value="1">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Works Great/ Satisfied with it
                                                </span>
                                            </span>
                                        </label>

                                        <label for="common_2" class="option">
                                            <input type="radio" name="common" id="common_2" value="2">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Not Satisfied with it
                                                </span>
                                            </span>
                                        </label>

                                        <label for="common_3" class="option">
                                            <input type="radio" name="common" id="common_3" value="3">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Something is broken
                                                </span>
                                            </span>
                                        </label>
                                        <label for="common_4" class="option">
                                            <input type="radio" name="common" id="common_4" value="4">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Needs Immediate Attention
                                                </span>
                                            </span>
                                        </label>
                                        <label for="common_comment" class="field-label">Additional Comments</label>
                                        <label class="field prepend-icon">
                                            <textarea class="gui-textarea" id="common_comment"></textarea>
                                            <span class="field-icon"><i class="fa fa-comments"></i></span>
                                            <span class="input-hint">Please leave a comment to help us serve you better</span>
                                        </label>
                                    </div>
                                    <!--  smart-option-group -->
                                </div>
                                <!-- end .option-group section -->

                            </div>
                        </div>
                        <!-- end frm-row section -->
                        <!-- end section -->
                        <!-- end frm-row section -->
                    </div>
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
                                                    <i class="iconc"></i>No Comments
                                                </span>
                                            </span>
                                        </label>
                                        <label for="room_1" class="option">
                                            <input type="radio" name="room" id="room_1" value="1">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Works Great/ Satisfied with it
                                                </span>
                                            </span>
                                        </label>

                                        <label for="room_2" class="option">
                                            <input type="radio" name="room" id="room_2" value="2">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Not Satisfied with it
                                                </span>
                                            </span>
                                        </label>

                                        <label for="room_3" class="option">
                                            <input type="radio" name="room" id="room_3" value="3">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Something is broken
                                                </span>
                                            </span>
                                        </label>
                                        <label for="room_4" class="option">
                                            <input type="radio" name="room" id="room_4" value="4">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Needs Immediate Attention
                                                </span>
                                            </span>
                                        </label>
                                        <label for="room_comment" class="field-label">Additional Comments</label>
                                        <label class="field prepend-icon">
                                            <textarea class="gui-textarea" id="room_comment"></textarea>
                                            <span class="field-icon"><i class="fa fa-comments"></i></span>
                                            <span class="input-hint">Please leave a comment to help us serve you better</span>
                                        </label>
                                    </div>
                                    <!--  smart-option-group -->
                                </div>
                                <!-- end .option-group section -->

                            </div>
                        </div>
                        <!-- end frm-row section -->
                        <!-- end section -->
                        <!-- end frm-row section -->
                    </div>
                    <div id="ctr_frontdesk" class="hiddenbox">

                        <div class="frm-row">
                            <div class="section colm colm12">

                                <div class="option-group field">
                                    <div class="smart-option-group smart-option-list group-vertical">
                                        <label for="frontdesk_0" class="option">
                                            <input type="radio" checked name="helpdesk" id="frontdesk_0" value="0">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>No Comments
                                                </span>
                                            </span>
                                        </label>
                                        <label for="frontdesk_1" class="option">
                                            <input type="radio" name="helpdesk" id="frontdesk_1" value="1">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Works Great/ Satisfied with it
                                                </span>
                                            </span>
                                        </label>

                                        <label for="frontdesk_2" class="option">
                                            <input type="radio" name="helpdesk" id="frontdesk_2" value="2">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Not Satisfied with it
                                                </span>
                                            </span>
                                        </label>

                                        <label for="frontdesk_3" class="option">
                                            <input type="radio" name="helpdesk" id="frontdesk_3" value="3">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Something is broken
                                                </span>
                                            </span>
                                        </label>
                                        <label for="frontdesk_4" class="option">
                                            <input type="radio" name="helpdesk" id="frontdesk_4" value="4">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Needs Immediate Attention
                                                </span>
                                            </span>
                                        </label>
                                        <label for="frontdesk_comment" class="field-label">Additional Comments</label>
                                        <label class="field prepend-icon">
                                            <textarea class="gui-textarea" id="frontdesk_comment"></textarea>
                                            <span class="field-icon"><i class="fa fa-comments"></i></span>
                                            <span class="input-hint">Please leave a comment to help us serve you better</span>
                                        </label>
                                    </div>
                                    <!--  smart-option-group -->
                                </div>
                                <!-- end .option-group section -->

                            </div>
                        </div>
                        <!-- end frm-row section -->
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

                </div>
                <!-- end .form-body section -->
                <div class="smartforms-px smart-forms">
                </div>
                <asp:Panel ID="PnlLoginBtnContainer" runat="server">
                    <div class="form-footer">
                        <a href="#" data-smart-modal="#smart-modal1" class="button btn-primary smartforms-modal-trigger">Report</a>

                    </div>
                    <!-- end .form-footer section -->
                </asp:Panel>
                <asp:Panel ID="PnlNoLoginBtnContainer" Visible="false" runat="server">
                    <div class="form-footer">

                        <asp:Button ID="LoginBtnSubmit" OnClientClick="fillHiddenFields()" OnClick="LoginBtnSubmit_Click" CssClass="button btn-primary" runat="server" Text="Gotodb" />

                    </div>
                    <!-- end .form-footer section -->
                </asp:Panel>
            </form>

        </div>
        <!-- end .smart-forms section -->
    </div>
    <!-- end .smart-wrap section -->

    <div></div>
    <!-- end section -->

</body>
</html>
