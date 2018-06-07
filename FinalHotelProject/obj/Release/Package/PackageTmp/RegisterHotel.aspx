<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterHotel.aspx.cs" Inherits="FinalHotelProject.RegisterHotel" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register Hotel - MyGuestXp </title>
    <link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="css/smart-forms.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">


    <!--[if lte IE 9]>
    	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>    
        <script type="text/javascript" src="js/jquery.placeholder.min.js"></script>
    <![endif]-->

    <!--[if lte IE 8]>
        <link type="text/css" rel="stylesheet" href="css/smart-forms-ie8.css">
    <![endif]-->
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
                    place: {
                        required: true
                    },
                    TxtPhone: {
                        required: true
                    },
                    TxtEmail: {
                        required: true,
                        email: true
                    },
                    TxtGm: {
                        required: true
                    }

                },
                messages: {

                    place: {
                        required: 'Please enter your hotel\'s name.'
                    },
                    TxtPhone: {
                        required: 'Please enter phone number.'
                    },
                    TxtEmail: {
                        required: 'Please enter your email id'

                    },
                    TxtGm: {
                        required: 'Please enter manager\'s name'
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
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAcW22Axg0u70M3Pobv9NtFCPXJacfcT8o&libraries=places&callback=initialize" async defer></script>
    <script type="text/javascript">
        var map,infowindow;
        function initialize() {
            var mapOptions = {
                zoom: 10,
                center: new google.maps.LatLng(29.760193, -95.369390),
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };

            map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
            //console.log(map.center);
            infowindow = new google.maps.InfoWindow();
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (position) {
                    var pos = {
                        lat: position.coords.latitude,
                        lng: position.coords.longitude
                    };
                    
                    map.setCenter(pos);
                }, function () {
                    handleLocationError(true, infoWindow, map.getCenter());
                });
            } else {
                // Browser doesn't support Geolocation
                handleLocationError(false, infoWindow, map.getCenter());
            }
            var marker = new google.maps.Marker({
                map: map,
                draggable: true,
                position: new google.maps.LatLng(29.760193, -95.369390)
            });
            var place = document.getElementById('place');
            var autocomplete = new google.maps.places.Autocomplete(place);
            autocomplete.bindTo('bounds', map);
            autocomplete.setTypes(['establishment']);
            infowindow = new google.maps.InfoWindow();
            var infowindowContent = document.getElementById('infowindow-content');
            infowindow.setContent(infowindowContent);
            var marker = new google.maps.Marker({
                map: map,
                anchorPoint: new google.maps.Point(0, -29)
            });
            autocomplete.addListener('place_changed', function () {
                infowindow.close();
                marker.setVisible(false);
                var place = autocomplete.getPlace();
                if (!place.geometry) {
                    // User entered the name of a Place that was not suggested and
                    // pressed the Enter key, or the Place Details request failed.
                    window.alert("No details available for input: '" + place.name + "'");
                    return;
                }
                // If the place has a geometry, then present it on a map.
                if (place.geometry.viewport) {
                    map.fitBounds(place.geometry.viewport);
                } else {
                    map.setCenter(place.geometry.location);
                    map.setZoom(17);  // Why 17? Because it looks good.
                }
                marker.setPosition(place.geometry.location);
                marker.setVisible(true);
                var address = '';
                if (place.address_components) {
                    address = [
                        (place.address_components[0] && place.address_components[0].short_name || ''),
                        (place.address_components[1] && place.address_components[1].short_name || ''),
                        (place.address_components[2] && place.address_components[2].short_name || '')
                    ].join(' ');
                }
                console.log(place);
                $('#HdnPlaceName').val(place.name);
                $('#HdnLatLong').val(place.geometry.location.lat() + ',' + place.geometry.location.lng());
                $('#HdnAddress').val(place.formatted_address);
                $('#HdnPlaceId').val(place.place_id);
                $('#HdnId').val(place.id);
                infowindowContent.children['place-icon'].src = place.icon;
                infowindowContent.children['place-name'].textContent = place.name;
                infowindowContent.children['place-address'].textContent = address;
                infowindow.open(map, marker);
            });
        }
        function handleLocationError(browserHasGeolocation, infoWindow, pos) {
            infoWindow.setPosition(pos);
            infoWindow.setContent(browserHasGeolocation ?
                'Error: The Geolocation service failed.' :
                'Error: Your browser doesn\'t support geolocation.');
            infoWindow.open(map);
        }
        //google.maps.event.addDomListener(window, 'resize', initialize);
        //google.maps.event.addDomListener(window, 'load', initialize);

    </script>

</head>

<body class="woodbg">

    <div class="smart-wrap">
        <div class="smart-forms smart-container wrap-0">

            <div class="form-header header-primary">
                <h4><i class="fa fa-comments"></i>Get in touch</h4>
                
            </div>
            <!-- end .form-header section -->
            <asp:Panel runat="server" ID="PnlError" Visible="false" CssClass="notification alert-error spacer-t10">
                    <p><asp:Label runat="server" ID="LblError" /> </p>
                    <a href="#" class="close-btn">&times;</a>
                </asp:Panel>
            <form id="form1" runat="server">
                <asp:HiddenField runat="server" ID="HdnEmail" />
                <asp:HiddenField runat="server" ID="HdnAddress" />
                <asp:HiddenField runat="server" ID="HdnId" />
                <asp:HiddenField runat="server" ID="HdnPlaceId" />
                <asp:HiddenField runat="server" ID="HdnLatLong" />
                <asp:HiddenField runat="server" ID="HdnPlaceName" />
                <asp:Panel ID="PnlMain" runat="server">
                    <div class="form-body">

                        <div class="frm-row">

                            <div class="colm colm6">
                                <div class="section">
                                    <label class="field prepend-icon">

                                       Select Franchise
                                    </label>
                                    <label class="field prepend-icon">

                                        <asp:DropDownList CssClass="gui-input" AutoPostBack="true" DataTextField="Name" DataValueField="Id" runat="server" ID="DdlFranchise" OnSelectedIndexChanged="DdlFranchise_SelectedIndexChanged"></asp:DropDownList>
                                        <span class="field-icon"><i class="fa fa-envelope"></i></span>
                                    </label>
                                </div>
                                <asp:Panel ID="PnlBrand" runat="server" Visible="false">
                                    <div class="section">
                                    <label class="field prepend-icon">

                                       Select Franchise Brand
                                    </label>
                                    <label class="field prepend-icon">

                                        <asp:DropDownList CssClass="gui-input" AutoPostBack="true" DataTextField="BrandName" DataValueField="Id" runat="server" ID="DdlFranchiseBrands" ></asp:DropDownList>
                                        <span class="field-icon"><i class="fa fa-envelope"></i></span>
                                    </label>
                                </div>
                                </asp:Panel>
                                
                                <div class="section">
                                    <label class="field prepend-icon">

                                        <asp:TextBox ID="place" placeholder="Enter Place Name..." CssClass="gui-input" runat="server"></asp:TextBox>
                                        <span class="field-icon"><i class="fa fa-user"></i></span>
                                    </label>
                                </div>
                                <!-- end section -->

                                <div class="section">
                                    <label class="field prepend-icon">

                                        <asp:TextBox ID="TxtEmail" runat="server" CssClass="gui-input" placeholder="example@domain.com..."></asp:TextBox>
                                        <span class="field-icon"><i class="fa fa-envelope"></i></span>
                                    </label>
                                </div>
                                <!-- end section -->

                                <div class="section">
                                    <label class="field prepend-icon">

                                        <asp:TextBox runat="server" ID="TxtPhone" CssClass="gui-input" placeholder="Enter telephone or mobile..."></asp:TextBox>
                                        <span class="field-icon"><i class="fa fa-phone-square"></i></span>
                                    </label>
                                </div>
                                <!-- end section -->

                                <div class="section">
                                    <label class="field prepend-icon">

                                        <asp:TextBox runat="server" ID="TxtGm" CssClass="gui-input" placeholder="Enter Manager's Name'..."></asp:TextBox>
                                        <span class="field-icon"><i class="fa fa-user"></i></span>
                                    </label>
                                </div>
                                <!-- end section -->

                            </div>
                            <!-- end .colm6 section -->
                            <div class="colm colm6">
                                <div class="map-container">
                                    <div id="map_canvas"></div>
                                    <div id="infowindow-content">
                                        <img src="" width="16" height="16" id="place-icon">
                                        <span id="place-name" class="title"></span>
                                        <br>
                                        <span id="place-address"></span>
                                    </div>
                                </div>
                            </div>
                            <!-- end .colm6 section -->


                        </div>
                        <!-- end .frm-row section -->

                    </div>
                    <!-- end .form-body section -->
                    <div class="form-footer">

                        <asp:Button runat="server" ID="BtnSubmit" CssClass="button btn-primary" Text="Register" OnClick="BtnSubmit_Click" />
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

