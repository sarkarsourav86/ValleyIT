<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeedbackForm.aspx.cs" Inherits="FinalHotelProject.FeedbackForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Smart Forms - Feedback Form </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="css/smart-forms.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
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
                <h4><i class="fa fa-rocket"></i>Your feedback</h4>
            </div>
            <!-- end .form-header section -->
            <div id="map"></div>
            <form id="feedback" runat="server">
                <asp:HiddenField ID="HdnPlacetoSearch" runat="server"></asp:HiddenField>
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
                <asp:HiddenField ID="HdnAddComments" runat="server"></asp:HiddenField>
                <asp:Panel runat="server" Visible="false" ID="PnlSuccessFailure">

                    <p>
                        <asp:Label ID="LblStatus" runat="server"></asp:Label></p>


                </asp:Panel>
                <asp:Panel ID="PnlFieldContainer" runat="server">
                    <div class="form-body">

                        
                        <div class="spacer spacer-b20"></div>

                        <div class="section">

                            <span class="rating block">

                                <span class="lbl-text" style="font-size: x-large">Rate Your Hotel</span>

                                <input class="rating-input" onclick="generateReviewLink()" id="five-stars" type="radio" value="5" name="product-rate">

                                <label class="rating-star" for="five-stars"><i class="fa fa-star"></i></label>

                                <input class="rating-input" value="4" onclick="generateReviewLink()" id="four-stars" type="radio" name="product-rate">
                                <label class="rating-star" for="four-stars"><i class="fa fa-star"></i></label>

                                <input class="rating-input" id="three-stars" data-target="#myModal" value="3" type="radio" name="product-rate">
                                <label class="rating-star" for="three-stars"><i class="fa fa-star"></i></label>

                                <input class="rating-input" id="two-stars" value="2" type="radio" name="product-rate">
                                <label class="rating-star" for="two-stars"><i class="fa fa-star"></i></label>

                                <input class="rating-input" id="one-star" value="1" type="radio" name="product-rate">
                                <label class="rating-star" for="one-star"><i class="fa fa-star"></i></label>

                            </span>

                            <label for="TxtComments" class="field-label">Additional Comments</label>
                            <label id="myModal" class="field prepend-icon">
                                
                                <asp:TextBox CssClass="gui-textarea" TextMode="MultiLine" runat="server" ID="TxtComments"></asp:TextBox>
                                <span class="field-icon"><i class="fa fa-comments"></i></span>
                                <span class="input-hint">Please leave a comment to help us serve you better</span>
                            </label>



                        </div>
                        <!-- end  section -->

                        <div class="spacer spacer-b25"></div>




                    </div>
                    <!-- end .form-body section -->
                    <div class="form-footer">

                        <asp:Button CssClass="button btn-primary" OnClick="Submit_Click" Text="Submit Feedback" runat="server" ID="Submit" OnClientClick="fillHiddenFields()" />
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
        var link = 'https://search.google.com/local/writereview?placeid=' + placeId;
        window.location=link;
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
                placeId=results[0].place_id;
            } else {
                alert('Geocode was not successful for the following reason: ' + status);
            }
        });
    }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAcW22Axg0u70M3Pobv9NtFCPXJacfcT8o&libraries=places&callback=initMap" async defer></script>
</body>
</html>
