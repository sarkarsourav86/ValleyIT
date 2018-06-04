<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Places.aspx.cs" Inherits="FinalHotelProject.Places" %>

<!DOCTYPE html>
<html lang="en">
  <head>
  	<title> Nearby Restaurants - MyGuestXp </title>
      <link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" type="text/css"  href="css/smart-forms.css">
    <link rel="stylesheet" type="text/css"  href="css/font-awesome.min.css">
    

    <!--[if lte IE 9]>
    	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>    
        <script type="text/javascript" src="js/jquery.placeholder.min.js"></script>
    <![endif]-->    
    
    <!--[if lte IE 8]>
        <link type="text/css" rel="stylesheet" href="css/smart-forms-ie8.css">
    <![endif]-->

      <script src="js/jquery-1.9.1.min.js"></script>
      <script>
        

        function initMap() {
            var pyrmont;
            var map;
            var infowindow;
            console.log($('#HdnLong').val());
            pyrmont = { lat: parseFloat($('#HdnLat').val()), lng: parseFloat($('#HdnLong').val()) }
                map = new google.maps.Map(document.getElementById('map_canvas'), {
                    center: pyrmont,
                    zoom: 15
                });

                infowindow = new google.maps.InfoWindow();
                var service = new google.maps.places.PlacesService(map);
                service.nearbySearch({
                    location: pyrmont,
                    radius: 1500,
                    type: ['restaurant']
                }, callback);
                function callback(results, status) {
                    console.log(results)
                    if (status === google.maps.places.PlacesServiceStatus.OK) {
                        for (var i = 0; i < results.length; i++) {
                            createMarker(results[i]);
                            service.getDetails({
                                placeId: results[i].place_id
                            }, function (place, status) {
                                if (status === google.maps.places.PlacesServiceStatus.OK) {
                                    console.log(place)
                                    $('#description').append('<div class="section"><div class="card">' + '<h1>' + place.name + '</h1><p class="title"><a href="' + place.url + '">' + place.vicinity + '</a></p><p>' + place.formatted_phone_number + '</p><p><button>Contact</button></p></div></div>')
                                }
                            });
                            //$('#description').append("<a href='" + results[i].vicinity+"'>Address</a>")
                            //$('#map').append('<p>hey</p>');
                        }
                    }
                }
                function createMarker(place) {
                    var placeLoc = place.geometry.location;
                    var marker = new google.maps.Marker({
                        map: map,
                        position: place.geometry.location
                    });

                    google.maps.event.addListener(marker, 'click', function () {
                        //console.log(place)
                        infowindow.setContent('<b>' + place.name + "</b><br/><a href='#'>" + place.vicinity);
                        infowindow.open(map, this);
                    });
                }
            


        }




      </script>

<style>
    .card {
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        max-width: 300px;
        margin: auto;
        text-align: center;
        font-family: arial;
    }
</style>
	    
       
</head>

<body>

	<div class="smart-wrap">
    	<div class="smart-forms">
        
         <div class="form-header header-custom">
             <img src="images/logohotel.png" />
            	<h4><i class="fa fa-cutlery"></i>Restaurants Nearby</h4>
             <ul class="breadcrumb">
                 <li><asp:HyperLink runat="server" ID="HypHome">Home</asp:HyperLink></li>

                 <li>Nearby Restaurants</li>
             </ul>
          </div><!-- end .form-header section -->
            
            <form runat="server" id="contact">
                <asp:HiddenField ID="HdnLat" runat="server" />
                <asp:HiddenField ID="HdnLong" runat="server" />
            	<div class="form-body-custom">
                
                	<div class="frm-row">
                        <div class="colm colm6">
                            <div class="map-container">
                                <div id="map_canvas"></div>
                            </div>
                        </div>
                    	<div id="description" class="colm colm6">
                        
                            
                        
                        </div><!-- end .colm6 section -->
                        <!-- end .colm6 section -->
                    </div><!-- end .frm-row section -->                             
                    
                </div><!-- end .form-body section -->
                <div class="form-footer-custom">
                	<button type="submit" class="button btn-primary">Submit</button>
                </div><!-- end section -->
            </form>
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAcW22Axg0u70M3Pobv9NtFCPXJacfcT8o&libraries=places&callback=initMap" async defer></script>
        </div><!-- end .smart-forms section -->
    </div><!-- end .smart-wrap section -->
</body>
</html>

