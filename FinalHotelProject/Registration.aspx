<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="FinalHotelProject.Registration" %>

<!DOCTYPE html>
<html lang="en">
  <head>
  	<title> Smart Forms - Checkout Form </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" type="text/css"  href="css/smart-forms.css">
    <link rel="stylesheet" type="text/css"  href="css/font-awesome.min.css">
      <script src="js/jquery-1.9.1.min.js"></script>
      <script src="js/jquery.placeholder.min.js"></script>
      <script type="text/javascript">
          function loadHiddenFields() {
              var value = $('#location').val();
              $('#HdnCountry').val(value);
              value = $('#states').val();
              $('#HdnState').val(value);
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

<body class="darkbg">

	<div class="smart-wrap">
    	<div class="smart-forms smart-container smart-flat wrap-3">
        
        	<div class="form-header header-lite">
                <img src="images/logohotel.png" />
            	<h4>Registration</h4>
            </div><!-- end .form-header section -->
            
            <form id="form1" runat="server">
                <asp:Panel runat="server" ID="PnlMain">
                <asp:HiddenField ID="HdnCountry" runat="server" />
                <asp:HiddenField ID="HdnState" runat="server" />
            	<div class="form-body">
                
                    <div class="spacer-b30">
                    	<div class="tagline"><span>Property Information </span></div><!-- .tagline -->
                    </div> 
                    
                    <div class="section">
                        <label class="field prepend-icon">
                            
                            <asp:TextBox runat="server" ID="TxtPropBrand" CssClass="gui-input" placeholder="Brand"></asp:TextBox>
                            <span class="field-icon"><i class="fa fa-user"></i></span>  
                        </label>
                    </div><!-- end section -->
                    
                    <div class="section">
                        <label class="field prepend-icon">
                            <asp:TextBox runat="server" ID="TxtPropName" CssClass="gui-input" placeholder="Property Name"></asp:TextBox>
                            <b class="tooltip tip-left-top"><em>Enter the name exactly how it appears on Google Business</em></b>
                            <span class="field-icon"><i class="fa fa-user"></i></span>  
                        </label>
                    </div><!-- end section -->                                   
                
                	<div class="section">
                    	<label class="field prepend-icon">
                        	
                            <asp:TextBox ID="TxtPropEmail" runat="server" CssClass="gui-input" placeholder="Email address" autocomplete="email"></asp:TextBox>
                            <span class="field-icon"><i class="fa fa-envelope"></i></span>  
                        </label>
                    </div><!-- end section -->
                    
                	<div class="section">
                    	<label for="mobile" class="field prepend-icon">
                        	
                            <asp:TextBox ID="TxtPhone" autocomplete='tel' runat="server" CssClass="gui-input" placeholder="Telephone / moble number"></asp:TextBox>
                            <span class="field-icon"><i class="fa fa-phone-square"></i></span>  
                        </label>
                    </div><!-- end section -->
                    
                   
                    
                    <div class="spacer-t20 spacer-b30">
                    	<div class="tagline"><span> Property Address </span></div><!-- .tagline -->
                    </div> 
                    
                    <div class="section">
                    
                        <label class="field prepend-icon">
                            
                            <asp:TextBox ID="TxtAddress1" runat="server" CssClass="gui-input" placeholder="Street address" autocomplete='address-line1'></asp:TextBox>
                            <span class="field-icon"><i class="fa fa-building-o"></i></span>  
                        </label>
                    </div><!-- end section -->
                    
                    <div class="section">
                        <label class="field prepend-icon">
                            
                            <asp:TextBox runat="server" ID="TxtAddress2" autocomplete='address-line2' CssClass="gui-input" placeholder="Street address 2"></asp:TextBox>
                            <span class="field-icon"><i class="fa fa-map-marker"></i></span>  
                        </label>
                    </div><!-- end section -->
                    
                    <div class="section">
                        <label class="field select">
                            <select autocomplete='country-name' id="location" name="location">
                                <option value="">Select country...</option>
                                <option value="AL">Albania</option>
                                <option value="DZ">Algeria</option>
                                <option value="AD">Andorra</option>
                                <option value="AO">Angola</option>
                                <option value="AI">Anguilla</option>
                                <option value="AG">Antigua and Barbuda</option>
                                <option value="AR">Argentina</option>
                                <option value="AM">Armenia</option>
                                <option value="AW">Aruba</option>
                                <option value="AU">Australia</option>
                                <option value="AT">Austria</option>
                                <option value="AZ">Azerbaijan Republic</option>
                                <option value="BS">Bahamas</option>
                                <option value="BH">Bahrain</option>
                                <option value="BB">Barbados</option>
                                <option value="BE">Belgium</option>
                                <option value="BZ">Belize</option>
                                <option value="BJ">Benin</option>
                                <option value="BM">Bermuda</option>
                                <option value="BT">Bhutan</option>
                                <option value="BO">Bolivia</option>
                                <option value="BA">Bosnia and Herzegovina</option>
                                <option value="BW">Botswana</option>
                                <option value="BR">Brazil</option>
                                <option value="BN">Brunei</option>
                                <option value="BG">Bulgaria</option>
                                <option value="BF">Burkina Faso</option>
                                <option value="BI">Burundi</option>
                                <option value="KH">Cambodia</option>
                                <option value="CA">Canada</option>
                                <option value="CV">Cape Verde</option>
                                <option value="KY">Cayman Islands</option>
                                <option value="TD">Chad</option>
                                <option value="CL">Chile</option>
                                <option value="C2">China Worldwide</option>
                                <option value="CO">Colombia</option>
                                <option value="KM">Comoros</option>
                                <option value="CK">Cook Islands</option>
                                <option value="CR">Costa Rica</option>
                                <option value="HR">Croatia</option>
                                <option value="CY">Cyprus</option>
                                <option value="CZ">Czech Republic</option>
                                <option value="CD">Democratic Republic of the Congo</option>
                                <option value="DK">Denmark</option>
                                <option value="DJ">Djibouti</option>
                                <option value="DM">Dominica</option>
                                <option value="DO">Dominican Republic</option>
                                <option value="EC">Ecuador</option>
                                <option value="EG">Egypt</option>
                                <option value="SV">El Salvador</option>
                                <option value="ER">Eritrea</option>
                                <option value="EE">Estonia</option>
                                <option value="ET">Ethiopia</option>
                                <option value="FK">Falkland Islands</option>
                                <option value="FO">Faroe Islands</option>
                                <option value="FJ">Fiji</option>
                                <option value="FI">Finland</option>
                                <option value="FR">France</option>
                                <option value="GF">French Guiana</option>
                                <option value="PF">French Polynesia</option>
                                <option value="GA">Gabon Republic</option>
                                <option value="GM">Gambia</option>
                                <option value="GE">Georgia</option>
                                <option value="DE">Germany</option>
                                <option value="GI">Gibraltar</option>
                                <option value="GR">Greece</option>
                                <option value="GL">Greenland</option>
                                <option value="GD">Grenada</option>
                                <option value="GP">Guadeloupe</option>
                                <option value="GT">Guatemala</option>
                                <option value="GN">Guinea</option>
                                <option value="GW">Guinea Bissau</option>
                                <option value="GY">Guyana</option>
                                <option value="HN">Honduras</option>
                                <option value="HK">Hong Kong</option>
                                <option value="HU">Hungary</option>
                                <option value="IS">Iceland</option>
                                <option value="IN">India</option>
                                <option value="ID">Indonesia</option>
                                <option value="IE">Ireland</option>
                                <option value="IL">Israel</option>
                                <option value="IT">Italy</option>
                                <option value="JM">Jamaica</option>
                                <option value="JP">Japan</option>
                                <option value="JO">Jordan</option>
                                <option value="KZ">Kazakhstan</option>
                                <option value="KE">Kenya</option>
                                <option value="KI">Kiribati</option>
                                <option value="KW">Kuwait</option>
                                <option value="KG">Kyrgyzstan</option>
                                <option value="LA">Laos</option>
                                <option value="LV">Latvia</option>
                                <option value="LS">Lesotho</option>
                                <option value="LI">Liechtenstein</option>
                                <option value="LT">Lithuania</option>
                                <option value="LU">Luxembourg</option>
                                <option value="MG">Madagascar</option>
                                <option value="MW">Malawi</option>
                                <option value="MY">Malaysia</option>
                                <option value="MV">Maldives</option>
                                <option value="ML">Mali</option>
                                <option value="MT">Malta</option>
                                <option value="MH">Marshall Islands</option>
                                <option value="MQ">Martinique</option>
                                <option value="MR">Mauritania</option>
                                <option value="MU">Mauritius</option>
                                <option value="YT">Mayotte</option>
                                <option value="MX">Mexico</option>
                                <option value="FM">Micronesia</option>
                                <option value="MN">Mongolia</option>
                                <option value="MS">Montserrat</option>
                                <option value="MA">Morocco</option>
                                <option value="MZ">Mozambique</option>
                                <option value="NA">Namibia</option>
                                <option value="NR">Nauru</option>
                                <option value="NP">Nepal</option>
                                <option value="NL">Netherlands</option>
                                <option value="AN">Netherlands Antilles</option>
                                <option value="NC">New Caledonia</option>
                                <option value="NZ">New Zealand</option>
                                <option value="NI">Nicaragua</option>
                                <option value="NE">Niger</option>
                                <option value="NU">Niue</option>
                                <option value="NF">Norfolk Island</option>
                                <option value="NO">Norway</option>
                                <option value="OM">Oman</option>
                                <option value="PW">Palau</option>
                                <option value="PA">Panama</option>
                                <option value="PG">Papua New Guinea</option>
                                <option value="PE">Peru</option>
                                <option value="PH">Philippines</option>
                                <option value="PN">Pitcairn Islands</option>
                                <option value="PL">Poland</option>
                                <option value="PT">Portugal</option>
                                <option value="QA">Qatar</option>
                                <option value="CG">Republic of the Congo</option>
                                <option value="RE">Reunion</option>
                                <option value="RO">Romania</option>
                                <option value="RU">Russia</option>
                                <option value="RW">Rwanda</option>
                                <option value="KN">Saint Kitts and Nevis Anguilla</option>
                                <option value="PM">Saint Pierre and Miquelon</option>
                                <option value="VC">Saint Vincent and Grenadines</option>
                                <option value="WS">Samoa</option>
                                <option value="SM">San Marino</option>
                                <option value="ST">São Tomé and Príncipe</option>
                                <option value="SA">Saudi Arabia</option>
                                <option value="SN">Senegal</option>
                                <option value="RS">Serbia</option>
                                <option value="SC">Seychelles</option>
                                <option value="SL">Sierra Leone</option>
                                <option value="SG">Singapore</option>
                                <option value="SK">Slovakia</option>
                                <option value="SI">Slovenia</option>
                                <option value="SB">Solomon Islands</option>
                                <option value="SO">Somalia</option>
                                <option value="ZA">South Africa</option>
                                <option value="KR">South Korea</option>
                                <option value="ES">Spain</option>
                                <option value="LK">Sri Lanka</option>
                                <option value="SH">St. Helena</option>
                                <option value="LC">St. Lucia</option>
                                <option value="SR">Suriname</option>
                                <option value="SJ">Svalbard and Jan Mayen Islands</option>
                                <option value="SZ">Swaziland</option>
                                <option value="SE">Sweden</option>
                                <option value="CH">Switzerland</option>
                                <option value="TW">Taiwan</option>
                                <option value="TJ">Tajikistan</option>
                                <option value="TZ">Tanzania</option>
                                <option value="TH">Thailand</option>
                                <option value="TG">Togo</option>
                                <option value="TO">Tonga</option>
                                <option value="TT">Trinidad and Tobago</option>
                                <option value="TN">Tunisia</option>
                                <option value="TR">Turkey</option>
                                <option value="TM">Turkmenistan</option>
                                <option value="TC">Turks and Caicos Islands</option>
                                <option value="TV">Tuvalu</option>
                                <option value="UG">Uganda</option>
                                <option value="UA">Ukraine</option>
                                <option value="AE">United Arab Emirates</option>
                                <option value="GB">United Kingdom</option>
                                <option selected value="US">United States</option>
                                <option value="UY">Uruguay</option>
                                <option value="VU">Vanuatu</option>
                                <option value="VA">Vatican City State</option>
                                <option value="VE">Venezuela</option>
                                <option value="VN">Vietnam</option>
                                <option value="VG">Virgin Islands (British)</option>
                                <option value="WF">Wallis and Futuna Islands</option>
                                <option value="YE">Yemen</option>
                                <option value="ZM">Zambia</option>
                            </select>
                            <i class="arrow double"></i>                    
                        </label>  
                    </div><!-- end section -->                     
                    
                	<div class="frm-row">
                    
                        <div class="section colm colm3">
                            <label class="field prepend-icon">
                                
                                <asp:TextBox ID="TxtPropZip" autocomplete='postal-code' CssClass="gui-input" placeholder="Zip" runat="server"></asp:TextBox>
                                <span class="field-icon"><i class="fa fa-certificate"></i></span> 
                            </label>
                        </div><!-- end section -->
                        
                        <div class="section colm colm4">
                            <label class="field prepend-icon">
                                
                                <asp:TextBox ID="TxtPropCity" autocomplete='address-level2' runat="server" CssClass="gui-input" placeholder="City"></asp:TextBox>
                                <span class="field-icon"><i class="fa fa-building-o"></i></span> 
                            </label>
                        </div><!-- end section -->
                        
                        <div class="section colm colm5">
                            <label class="field select">
                                <select autocomplete='address-level1' id="states" name="states">
                                    <option value="">Choose state</option>
                                    <option value="AL">Alabama</option>
                                    <option value="AK">Alaska</option>
                                    <option value="AZ">Arizona</option>
                                    <option value="AR">Arkansas</option>
                                    <option value="CA">California</option>
                                    <option value="CO">Colorado</option>
                                    <option value="CT">Connecticut</option>
                                    <option value="DE">Delaware</option>
                                    <option value="DC">District Of Columbia</option>
                                    <option value="FL">Florida</option>
                                    <option value="GA">Georgia</option>
                                    <option value="HI">Hawaii</option>
                                    <option value="ID">Idaho</option>
                                    <option value="IL">Illinois</option>
                                    <option value="IN">Indiana</option>
                                    <option value="IA">Iowa</option>
                                    <option value="KS">Kansas</option>
                                    <option value="KY">Kentucky</option>
                                    <option value="LA">Louisiana</option>
                                    <option value="ME">Maine</option>
                                    <option value="MD">Maryland</option>
                                    <option value="MA">Massachusetts</option>
                                    <option value="MI">Michigan</option>
                                    <option value="MN">Minnesota</option>
                                    <option value="MS">Mississippi</option>
                                    <option value="MO">Missouri</option>
                                    <option value="MT">Montana</option>
                                    <option value="NE">Nebraska</option>
                                    <option value="NV">Nevada</option>
                                    <option value="NH">New Hampshire</option>
                                    <option value="NJ">New Jersey</option>
                                    <option value="NM">New Mexico</option>
                                    <option value="NY">New York</option>
                                    <option value="NC">North Carolina</option>
                                    <option value="ND">North Dakota</option>
                                    <option value="OH">Ohio</option>
                                    <option value="OK">Oklahoma</option>
                                    <option value="OR">Oregon</option>
                                    <option value="PA">Pennsylvania</option>
                                    <option value="RI">Rhode Island</option>
                                    <option value="SC">South Carolina</option>
                                    <option value="SD">South Dakota</option>
                                    <option value="TN">Tennessee</option>
                                    <option value="TX">Texas</option>
                                    <option value="UT">Utah</option>
                                    <option value="VT">Vermont</option>
                                    <option value="VA">Virginia</option>
                                    <option value="WA">Washington</option>
                                    <option value="WV">West Virginia</option>
                                    <option value="WI">Wisconsin</option>
                                    <option value="WY">Wyoming</option>
                                </select>
                                <i class="arrow double"></i>
                            </label>                   
                        </div><!-- end .col8 section -->	                        
                                                                   
                    </div><!-- end frm-row section -->                    
                     <div class="spacer-b30">
                    	<div class="tagline"><span>Property Contact Information </span></div><!-- .tagline -->
                    </div> 
                    
                    <div class="section">
                        <label class="field prepend-icon">
                            
                            <asp:TextBox runat="server" ID="TxtPropGm"  CssClass="gui-input" placeholder="General Manager"></asp:TextBox>
                            <span class="field-icon"><i class="fa fa-user"></i></span>  
                        </label>
                    </div><!-- end section -->
                    
                                               
                
                	
                    
                	                   
                    
                </div><!-- end .form-body section -->
                <div class="form-footer">
                	
                    <asp:Button runat="server" CssClass="button btn-primary" Text="Submit" OnClientClick="loadHiddenFields()" OnClick="BtnSubmit_Click" ID="BtnSubmit" />
                </div><!-- end .form-footer section -->
                    </asp:Panel>
            </form>
            
        </div><!-- end .smart-forms section -->
    </div><!-- end .smart-wrap section -->
    
    <div></div><!-- end section -->

</body>
</html>

