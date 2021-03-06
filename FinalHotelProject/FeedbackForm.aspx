﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeedbackForm.aspx.cs" Inherits="FinalHotelProject.FeedbackForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MyGuestXp - Feedback</title>
    <link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="css/smart-forms.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link href="plugins/dropify/css/dropify.min.css" rel="stylesheet" />
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

    <script src="plugins/dropify/js/dropify.min.js"></script>
    <script type="text/javascript">
        function fillHiddenFields() {
            value = $('#problemtypes').val();
            $('#HdnProblemType').val(value);
            value = $("#problemtypes option:selected").text();
            $('#HdnProblemTypeText').val(value);
            value = $("#aboutus option:selected").text();
            $('#HdnAbout').val(value);
            value = $("input:radio[name='product-rate']:checked").val();
            $('#HdnRating').val(value);
            value = $('additional_comment').val();
            $('#HdnAddComments').val(value);

        }
    </script>
    <style>
        /* Always set the map height explicitly to define the size of the div
        * element that contains the map. */
        #map {
            height: 0%;
        }
        /* Optional: Makes the sample page fill the window. */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        #floating-panel {
            position: absolute;
            top: 10px;
            left: 25%;
            z-index: 5;
            background-color: #fff;
            padding: 5px;
            border: 1px solid #999;
            text-align: center;
            font-family: 'Roboto','sans-serif';
            line-height: 30px;
            padding-left: 10px;
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
<body class="woodbg">

    <div class="smart-wrap">
        <div class="smart-forms smart-container wrap-3">

            <div class="form-header header-primary">

                <h4 style="text-align: center">Your feedback</h4>
            </div>
            <!-- end .form-header section -->
            <div id="map"></div>
            <form id="feedback" enctype="multipart/form-data" runat="server">

                <asp:HiddenField ID="HdnPlacetoSearch" runat="server"></asp:HiddenField>
                <asp:HiddenField ID="HdnProblemType" runat="server"></asp:HiddenField>
                <asp:HiddenField ID="HdnProblemTypeText" runat="server"></asp:HiddenField>
                <asp:HiddenField ID="HdnRating" runat="server"></asp:HiddenField>
                <asp:HiddenField ID="HdnAddComments" runat="server"></asp:HiddenField>
                <asp:HiddenField ID="HdnAbout" runat="server"></asp:HiddenField>
                <asp:Panel runat="server" Visible="false" ID="PnlSuccessFailure">

                    <p>
                        <asp:Label ID="LblStatus" runat="server"></asp:Label>
                    </p>


                </asp:Panel>
                <asp:Panel ID="PnlFieldContainer" runat="server">
                    <div class="form-body">




                        <div class="section">

                            <span class="rating block">

                                <span class="lbl-text" style="font-size: x-large">Rate Your Stay</span>

                                <input class="rating-input" id="five-stars" type="radio" value="5" name="product-rate">

                                <label class="rating-star" for="five-stars"><i class="fa fa-star"></i></label>

                                <input class="rating-input" value="4" id="four-stars" type="radio" name="product-rate">
                                <label class="rating-star" for="four-stars"><i class="fa fa-star"></i></label>

                                <input class="rating-input" id="three-stars" value="3" type="radio" name="product-rate">
                                <label class="rating-star" for="three-stars"><i class="fa fa-star"></i></label>

                                <input class="rating-input" id="two-stars" value="2" type="radio" name="product-rate">
                                <label class="rating-star" for="two-stars"><i class="fa fa-star"></i></label>

                                <input class="rating-input" id="one-star" value="1" type="radio" name="product-rate">
                                <label class="rating-star" for="one-star"><i class="fa fa-star"></i></label>

                            </span>
                            <div class="spacer spacer-b20"></div>
                            <label for="problemtypes" class="field-label">Did you face any problems?</label>
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
                            <div class="spacer-b20"></div>
                            <label for="TxtComments" class="field-label">Additional Comments</label>
                            <label id="myModal" class="field prepend-icon">

                                <asp:TextBox CssClass="gui-textarea" TextMode="MultiLine" runat="server" ID="TxtComments"></asp:TextBox>
                                <span class="field-icon"><i class="fa fa-comments"></i></span>
                                <span class="input-hint">Please leave a comment to help us serve you better</span>
                            </label>

                            <div class="spacer-b20"></div>

                            <div class="form-group">
                                <label for="exampleInputFile" class="field-label">Upload Image</label>
                                <input type="file" name="review_file" class="dropify" data-allowed-file-extensions="jpg JPG jpeg png" data-height="80" data-max-file-size="10M">
                                <p class="help-block">Upload .jpg or .png files</p>
                            </div>
                            <div class="spacer-b20"></div>
                            <label for="aboutus" class="field-label">How did you know about us?</label>
                            <label class="field select">
                                <select name="aboutus" id="aboutus">
                                    <option value="none" selected>--Select--</option>
                                    <option value="Google" class="smartfm-ctrl" data-show-id="ctr_housekeeping">Google</option>
                                    <option value="TripAdvisor" class="smartfm-ctrl" data-show-id="ctr_internet">TripAdvisor</option>
                                    <option value="Expedia" class="smartfm-ctrl" data-show-id="ctr_maintain">Expedia</option>
                                    <option value="Other" class="smartfm-ctrl" data-show-id="ctr_common">Other</option>
                                    
                                </select>
                                <i class="arrow double"></i>
                            </label>


                        </div>
                        <!-- end  section -->

                        <div class="spacer spacer-b25"></div>


                        <asp:Button CssClass="button btn-primary" OnClick="Submit_Click" Text="Submit Feedback" runat="server" ID="Submit" OnClientClick="fillHiddenFields()" />

                    </div>
                    <!-- end .form-body section -->

                    <!-- end .form-footer section -->
                </asp:Panel>
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
        function getParameterByName(name, url) {
            if (!url) url = window.location.href;
            name = name.replace(/[\[\]]/g, "\\$&");
            var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, " "));
        }
        $(document).ready(() => {
            var star = getParameterByName('star');
            star = parseInt(star);
            if (!isNaN(star)) {
                if (star > 0 && star < 6) {
                    $('input:radio[name=product-rate]')[5 - star].checked = true;
                    $('#HdnRating').val(star);
                }
            }

            //alert(star);
        });

    </script>
    <script>
        var placeId;
        function initMap() {
            var map = new google.maps.Map(document.getElementById('map'), {

            });
            var geocoder = new google.maps.Geocoder();

            //document.getElementById('submit').addEventListener('click', function () {
            // geocodeAddress(geocoder, map);
            //});
            geocodeAddress(geocoder, map);
        }
        function generateReviewLink() {
            placeId = document.getElementById('HdnPlacetoSearch').value;
            var link = 'https://search.google.com/local/writereview?placeid=' + placeId;
            window.location = link;
        }
        function geocodeAddress(geocoder, resultsMap) {
            var address = document.getElementById('HdnPlacetoSearch').value;

            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status === 'OK') {
                    //resultsMap.setCenter(results[0].geometry.location);
                    //var marker = new google.maps.Marker({
                    //  map: resultsMap,
                    //position: results[0].geometry.location
                    //});
                    placeId = results[0].place_id;
                } else {
                    alert('Geocode was not successful for the following reason: ' + status);
                }
            });
        }
    </script>
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
