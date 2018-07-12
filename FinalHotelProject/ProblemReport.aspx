<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProblemReport.aspx.cs" Inherits="FinalHotelProject.ProblemReport1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Report Problem - MyGuestXp</title>
    <link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="plugins/dropify/css/dropify.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="css/smart-forms.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link href="css/smart-addons.css" rel="stylesheet" />
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-118035317-1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'UA-118035317-1');
    </script>
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.formShowHide.min.js"></script>
    <script src="js/smartforms-modal.min.js"></script>
    <script src="js/jquery-ui-custom.min.js"></script>
    <script src="js/additional-methods.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="plugins/dropify/js/dropify.min.js"></script>
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

            value = $("input:radio[name='food']:checked").val();
            $('#HdnFood').val(value);

            value = $("input:radio[name='fitness']:checked").val();
            $('#HdnFitness').val(value);

            value = $("input:radio[name='parking']:checked").val();
            $('#HdnParking').val(value);

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
            value = $('#parking_comment').val();
            $('#Hdnparking_comment').val(value);
            value = $('#fitness_comment').val();
            $('#Hdnfitness_comment').val(value);
            value = $('#food_comment').val();
            $('#Hdnfood_comment').val(value);


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

                <h4 style="text-align: center">Report A Problem -
                    <asp:Label runat="server" ID="LblHotelName"></asp:Label></h4>

            </div>
            <!-- end .form-header section -->
            <ul class="breadcrumb">

                <li>
                    <asp:HyperLink runat="server" ID="HypHome">Home</asp:HyperLink></li>
                <li>Report a Problem</li>
            </ul>
            <form id="form1" enctype="multipart/form-data" runat="server">
                <div id="smart-modal1" class="smartforms-modal" role="alert">
                    <asp:HiddenField ID="HdnProblemType" runat="server"></asp:HiddenField>

                    <asp:HiddenField ID="HdnRoom" runat="server"></asp:HiddenField>

                    <asp:HiddenField ID="HdnFrontdesk" runat="server"></asp:HiddenField>

                    <asp:HiddenField ID="HdnHousekeeping" runat="server"></asp:HiddenField>

                    <asp:HiddenField ID="HdnWifi" runat="server"></asp:HiddenField>

                    <asp:HiddenField ID="HdnMaintenance" runat="server"></asp:HiddenField>

                    <asp:HiddenField ID="HdnCommon" runat="server"></asp:HiddenField>
                    <asp:HiddenField ID="HdnFood" runat="server"></asp:HiddenField>
                    <asp:HiddenField ID="HdnFitness" runat="server"></asp:HiddenField>
                    <asp:HiddenField ID="HdnParking" runat="server"></asp:HiddenField>

                    <asp:HiddenField ID="Hdnhousekeeping_comment" runat="server"></asp:HiddenField>
                    <asp:HiddenField ID="Hdninternet_comment" runat="server"></asp:HiddenField>
                    <asp:HiddenField ID="Hdnmaintain_comment" runat="server"></asp:HiddenField>
                    <asp:HiddenField ID="Hdncommon_comment" runat="server"></asp:HiddenField>
                    <asp:HiddenField ID="Hdnroom_comment" runat="server"></asp:HiddenField>
                    <asp:HiddenField ID="Hdnfrontdesk_comment" runat="server"></asp:HiddenField>
                    <asp:HiddenField ID="Hdnfood_comment" runat="server"></asp:HiddenField>
                    <asp:HiddenField ID="Hdnfitness_comment" runat="server"></asp:HiddenField>
                    <asp:HiddenField ID="Hdnparking_comment" runat="server"></asp:HiddenField>

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
                                        <div class="section">
                                            <label class="field prepend-icon">

                                                <asp:TextBox ID="TxtPhone" runat="server" CssClass="gui-input" placeholder="Phone Number"></asp:TextBox>
                                                <span class="field-icon"><i class="fa fa-phone"></i></span>
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
                            <asp:Label ID="LblStatus" runat="server"></asp:Label>
                        </p>


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
                                <option value="7" class="smartfm-ctrl" data-show-id="ctr_food">Food Area</option>
                                <option value="8" class="smartfm-ctrl" data-show-id="ctr_fitness">Spa/Fitness</option>
                                <option value="9" class="smartfm-ctrl" data-show-id="ctr_parking">Parking Area</option>
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
                                                    <i class="iconc"></i>Everything is Great/ Very Satisfied
                                                </span>
                                            </span>
                                        </label>

                                        <label for="housekeeping_2" class="option">
                                            <input type="radio" name="housekeeping" id="housekeeping_2" value="2">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Not Satisfied
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
                                        <div class="form-group">
                                            <label for="exampleInputFile" class="field-label">Upload Image</label>
                                            <input type="file" name="housekeeping_file" class="dropify" data-allowed-file-extensions="jpg JPG jpeg png" data-height="100" data-max-file-size="10M">
                                            <p class="help-block">Upload .jpg or .png files</p>
                                        </div>
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
                                                    <i class="iconc"></i>Everything is Great/ Very Satisfied
                                                </span>
                                            </span>
                                        </label>

                                        <label for="internet_2" class="option">
                                            <input type="radio" name="internet" id="internet_2" value="2">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Not Satisfied
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
                                        <div class="form-group">
                                            <label for="exampleInputFile" class="field-label">Upload Image</label>
                                            <input type="file" name="internet_file" class="dropify" data-allowed-file-extensions="jpg JPG jpeg png" data-height="100" data-max-file-size="10M">
                                            <p class="help-block">Upload .jpg or .png files</p>
                                        </div>
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
                                                    <i class="iconc"></i>Everything is Great/ Very Satisfied
                                                </span>
                                            </span>
                                        </label>

                                        <label for="maintain_2" class="option">
                                            <input type="radio" name="maintain" id="maintain_2" value="2">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Not Satisfied
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
                                        <div class="form-group">
                                            <label for="exampleInputFile" class="field-label">Upload Image</label>
                                            <input type="file" name="maintain_file" class="dropify" data-allowed-file-extensions="jpg JPG jpeg png" data-height="100" data-max-file-size="10M">
                                            <p class="help-block">Upload .jpg or .png files</p>
                                        </div>
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
                                                    <i class="iconc"></i>Everything is Great/ Very Satisfied
                                                </span>
                                            </span>
                                        </label>

                                        <label for="common_2" class="option">
                                            <input type="radio" name="common" id="common_2" value="2">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Not Satisfied
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
                                        <div class="form-group">
                                            <label for="exampleInputFile" class="field-label">Upload Image</label>
                                            <input type="file" name="common_file" class="dropify" data-allowed-file-extensions="jpg JPG jpeg png" data-height="100" data-max-file-size="10M">
                                            <p class="help-block">Upload .jpg or .png files</p>
                                        </div>
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
                                                    <i class="iconc"></i>Everything is Great/ Very Satisfied
                                                </span>
                                            </span>
                                        </label>

                                        <label for="room_2" class="option">
                                            <input type="radio" name="room" id="room_2" value="2">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Not Satisfied
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
                                        <div class="form-group">
                                            <label for="exampleInputFile" class="field-label">Upload Image</label>
                                            <input type="file" name="room_file" class="dropify" data-allowed-file-extensions="jpg JPG jpeg png" data-height="100" data-max-file-size="10M">
                                            <p class="help-block">Upload .jpg or .png files</p>
                                        </div>
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
                                                    <i class="iconc"></i>Everything is Great/ Very Satisfied
                                                </span>
                                            </span>
                                        </label>

                                        <label for="frontdesk_2" class="option">
                                            <input type="radio" name="helpdesk" id="frontdesk_2" value="2">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Not Satisfied
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
                                        <div class="form-group">
                                            <label for="exampleInputFile" class="field-label">Upload Image</label>
                                            <input type="file" name="frontdesk_file" class="dropify" data-allowed-file-extensions="jpg JPG jpeg png" data-height="100" data-max-file-size="10M">
                                            <p class="help-block">Upload .jpg or .png files</p>
                                        </div>
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
                    <div id="ctr_food" class="hiddenbox">

                        <div class="frm-row">
                            <div class="section colm colm12">

                                <div class="option-group field">
                                    <div class="smart-option-group smart-option-list group-vertical">
                                        <label for="food_0" class="option">
                                            <input type="radio" checked name="food" id="food_0" value="0">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>No Comments
                                                </span>
                                            </span>
                                        </label>
                                        <label for="food_1" class="option">
                                            <input type="radio" name="food" id="food_1" value="1">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Everything is Great/ Very Satisfied
                                                </span>
                                            </span>
                                        </label>

                                        <label for="food_2" class="option">
                                            <input type="radio" name="food" id="food_2" value="2">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Not Satisfied
                                                </span>
                                            </span>
                                        </label>

                                        <label for="food_3" class="option">
                                            <input type="radio" name="food" id="food_3" value="3">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Something is broken
                                                </span>
                                            </span>
                                        </label>
                                        <label for="food_4" class="option">
                                            <input type="radio" name="food" id="food_4" value="4">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Needs Immediate Attention
                                                </span>
                                            </span>
                                        </label>
                                        <div class="form-group">
                                            <label for="exampleInputFile" class="field-label">Upload Image</label>
                                            <input type="file" name="food_file" class="dropify" data-allowed-file-extensions="jpg JPG jpeg png" data-height="100" data-max-file-size="10M">
                                            <p class="help-block">Upload .jpg or .png files</p>
                                        </div>
                                        <label for="frontdesk_comment" class="field-label">Additional Comments</label>
                                        <label class="field prepend-icon">
                                            <textarea class="gui-textarea" id="food_comment"></textarea>
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
                    <div id="ctr_fitness" class="hiddenbox">

                        <div class="frm-row">
                            <div class="section colm colm12">

                                <div class="option-group field">
                                    <div class="smart-option-group smart-option-list group-vertical">
                                        <label for="fitness_0" class="option">
                                            <input type="radio" checked name="fitness" id="fitness_0" value="0">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>No Comments
                                                </span>
                                            </span>
                                        </label>
                                        <label for="fitness_1" class="option">
                                            <input type="radio" name="fitness" id="fitness_1" value="1">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Everything is Great/ Very Satisfied
                                                </span>
                                            </span>
                                        </label>

                                        <label for="fitness_2" class="option">
                                            <input type="radio" name="fitness" id="fitness_2" value="2">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Not Satisfied
                                                </span>
                                            </span>
                                        </label>

                                        <label for="fitness_3" class="option">
                                            <input type="radio" name="fitness" id="fitness_3" value="3">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Something is broken
                                                </span>
                                            </span>
                                        </label>
                                        <label for="fitness_4" class="option">
                                            <input type="radio" name="fitness" id="fitness_4" value="4">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Needs Immediate Attention
                                                </span>
                                            </span>
                                        </label>
                                        <div class="form-group">
                                            <label for="exampleInputFile" class="field-label">Upload Image</label>
                                            <input type="file" name="fitness_file" class="dropify" data-allowed-file-extensions="jpg JPG jpeg png" data-height="100" data-max-file-size="10M">
                                            <p class="help-block">Upload .jpg or .png files</p>
                                        </div>
                                        <label for="frontdesk_comment" class="field-label">Additional Comments</label>
                                        <label class="field prepend-icon">
                                            <textarea class="gui-textarea" id="fitness_comment"></textarea>
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
                    <div id="ctr_parking" class="hiddenbox">

                        <div class="frm-row">
                            <div class="section colm colm12">

                                <div class="option-group field">
                                    <div class="smart-option-group smart-option-list group-vertical">
                                        <label for="parking_0" class="option">
                                            <input type="radio" checked name="parking" id="parking_0" value="0">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>No Comments
                                                </span>
                                            </span>
                                        </label>
                                        <label for="parking_1" class="option">
                                            <input type="radio" name="parking" id="parking_1" value="1">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Everything is Great/ Very Satisfied
                                                </span>
                                            </span>
                                        </label>

                                        <label for="parking_2" class="option">
                                            <input type="radio" name="parking" id="parking_2" value="2">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Not Satisfied
                                                </span>
                                            </span>
                                        </label>

                                        <label for="parking_3" class="option">
                                            <input type="radio" name="parking" id="parking_3" value="3">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Something is broken
                                                </span>
                                            </span>
                                        </label>
                                        <label for="parking_4" class="option">
                                            <input type="radio" name="parking" id="parking_4" value="4">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i>Needs Immediate Attention
                                                </span>
                                            </span>
                                        </label>
                                        <div class="form-group">
                                            <label for="exampleInputFile" class="field-label">Upload Image</label>
                                            <input type="file" name="parking_file" class="dropify" data-allowed-file-extensions="jpg JPG jpeg png" data-height="100" data-max-file-size="10M">
                                            <p class="help-block">Upload .jpg or .png files</p>
                                        </div>
                                        <label for="frontdesk_comment" class="field-label">Additional Comments</label>
                                        <label class="field prepend-icon">
                                            <textarea class="gui-textarea" id="parking_comment"></textarea>
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
                    <asp:Panel ID="PnlLoginBtnContainer" runat="server">

                        <a href="#" data-smart-modal="#smart-modal1" style="width: 30%" class="button btn-primary smartforms-modal-trigger">Report</a>


                        <!-- end .form-footer section -->
                    </asp:Panel>
                    <asp:Panel ID="PnlNoLoginBtnContainer" Visible="false" runat="server">


                        <asp:Button ID="LoginBtnSubmit" Width="30%" OnClientClick="fillHiddenFields()" OnClick="LoginBtnSubmit_Click" CssClass="button btn-primary" runat="server" Text="Report" />


                        <!-- end .form-footer section -->
                    </asp:Panel>
                </div>
                <!-- end .form-body section -->
                <div class="smartforms-px smart-forms">
                </div>
                <div class="form-footer">
                    <center><a href="http://www.myguestxp.com/"><img src="images/logohotel.png" /></a></center>
                </div>

            </form>

        </div>
        <!-- end .smart-forms section -->
    </div>
    <!-- end .smart-wrap section -->

    <div></div>
    <!-- end section -->
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
