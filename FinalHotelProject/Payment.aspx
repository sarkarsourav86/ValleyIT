<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="FinalHotelProject.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment -MyGuestXp</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/smart-forms.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-118035317-1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'UA-118035317-1');
    </script>
</head>
<body class="woodbg">

    <div class="smart-wrap">
        <div class="smart-forms smart-container wrap-3">

            <div class="form-header header-primary">
                <h4><i class="fa fa-shopping-cart"></i>Checkout</h4>
            </div>
            <!-- end .form-header section -->


            <form id="form1" runat="server">
                <div class="form-body">

                    <div class="spacer-b30">
                        <div class="tagline"><span>Personal Information </span></div>
                        <!-- .tagline -->
                    </div>

                    <div class="section">
                        <label class="field prepend-icon">
                            <asp:TextBox ID="TxtFirstName" required runat="server" class="gui-input" placeholder="First name..."></asp:TextBox>
                            
                            <span class="field-icon"><i class="fa fa-user"></i></span>
                        </label>
                    </div>
                    <!-- end section -->

                    <div class="section">
                        <label class="field prepend-icon">
                            <asp:TextBox ID="TxtLastName" required runat="server" class="gui-input" placeholder="Last name..."></asp:TextBox>
                            
                            <span class="field-icon"><i class="fa fa-user"></i></span>
                        </label>
                    </div>
                    <!-- end section -->

                    <div class="section">
                        <label class="field prepend-icon">
                            
                            <asp:TextBox ID="TxtEmail" required CssClass="gui-input" runat="server" placeholder="Email address"></asp:TextBox>
                            <span class="field-icon"><i class="fa fa-envelope"></i></span>
                        </label>
                    </div>
                    <!-- end section -->

                    <div class="section">
                        <label for="mobile" class="field prepend-icon">
                            <asp:TextBox  runat="server" required ID="TxtPhone" CssClass="gui-input" placeholder="Telephone / moble number"></asp:TextBox>
                            <span class="field-icon"><i class="fa fa-phone-square"></i></span>
                        </label>
                    </div>
                    <!-- end section -->

                    <div class="spacer-t40 spacer-b30">
                        <div class="tagline"><span>Payment Details </span></div>
                        <!-- .tagline -->
                    </div>

                    
                    <!-- end section -->

                    
                    <!-- end section -->

                    <div class="fmx">

                        <div class="section">
                            <label class="field prepend-icon">
                                <asp:TextBox ID="TxtCardName" required runat="server" CssClass="gui-input" placeholder="Name on card..."></asp:TextBox>
                                <span class="field-icon"><i class="fa fa-user"></i></span>
                            </label>
                        </div>
                        <!-- end section -->

                        <div class="section">
                            <label class="field prepend-icon">
                                <asp:TextBox runat="server" ID="TxtCardNo" required CssClass="gui-input" placeholder="Card number..."></asp:TextBox>
                                <span class="field-icon"><i class="fa fa-credit-card"></i></span>
                            </label>
                        </div>
                        <!-- end section -->

                    </div>
                    <!-- end frm-row section -->

                    <div class="frm-row">

                        <div class="section colm colm6">
                            <label for="cardmonth" class="field select">
                                <asp:DropDownList runat="server" ID="DdlCardMonth">
                                    <asp:ListItem Value="">Expiry month...</asp:ListItem>
                                    <asp:ListItem Value="01">01 - Jan</asp:ListItem>
                                    <asp:ListItem Value="02">02 - Feb</asp:ListItem>
                                    <asp:ListItem Value="03">03 - Mar</asp:ListItem>
                                    <asp:ListItem Value="04">04 - Apr</asp:ListItem>
                                    <asp:ListItem Value="05">05 - May</asp:ListItem>
                                    <asp:ListItem Value="06">06 - Jun</asp:ListItem>
                                    <asp:ListItem Value="07">07 - Jul</asp:ListItem>
                                    <asp:ListItem Value="08">08 - Aug</asp:ListItem>
                                    <asp:ListItem Value="09">09 - Sep</asp:ListItem>
                                    <asp:ListItem Value="10">10 - Oct</asp:ListItem>
                                    <asp:ListItem Value="11">11 - Nov</asp:ListItem>
                                    <asp:ListItem Value="12">12 - Dec</asp:ListItem>
                                </asp:DropDownList>
                                <i class="arrow double"></i>
                            </label>
                        </div>
                        <!-- end section -->
                        
                        <div class="section colm colm6">
                            <label class="field select">
                                
                                <asp:DropDownList runat="server" ID="DdlExpiry">
                            
                                </asp:DropDownList>
                                <i class="arrow double"></i>
                            </label>
                        </div>
                        <!-- end section -->

                    </div>
                    <!-- end frm-row section -->

                    <div class="frm-row">

                        <div class="section colm colm6">
                            <label class="field prepend-icon">
                                <asp:TextBox runat="server"  ID="TxtSecNo" CssClass="gui-input" placeholder="Security number..."></asp:TextBox>
                                <b class="tooltip tip-left-top"><em>This is a four diigit number at the back of your card </em></b>
                                <span class="field-icon"><i class="fa fa-barcode"></i></span>
                            </label>
                        </div>
                        <!-- end section -->

                        <div class="section colm colm6">
                            <p><a href="#" class="smart-link">What is this? </a></p>
                        </div>
                        <!-- end section -->

                    </div>
                    <!-- end frm-row section -->

                    <div class="spacer-t20 spacer-b30">
                        <div class="tagline"><span>Billing Address </span></div>
                        <!-- .tagline -->
                    </div>

                    <div class="section">

                        <label class="field prepend-icon">
                            <asp:TextBox runat="server"  ID="TxtFrstAdd" class="gui-input" placeholder="Street address"></asp:TextBox>
                            <span class="field-icon"><i class="fa fa-building-o"></i></span>
                        </label>
                    </div>
                    <!-- end section -->

                    <div class="section">
                        <label class="field prepend-icon">
                            
                            <asp:TextBox ID="TxtLastAdd" runat="server" class="gui-input" placeholder="Street address 2"></asp:TextBox>
                            <span class="field-icon"><i class="fa fa-map-marker"></i></span>
                        </label>
                    </div>
                    <!-- end section -->

                    <div class="section">
                        <label class="field select">
                            <asp:DropDownList runat="server" ID="DdlCountry">
                                <asp:ListItem Value="">Select country...</asp:ListItem>
                                <asp:ListItem Value="AL">Albania</asp:ListItem>
                                <asp:ListItem Value="DZ">Algeria</asp:ListItem>
                                <asp:ListItem Value="AD">Andorra</asp:ListItem>
                                <asp:ListItem Value="AO">Angola</asp:ListItem>
                                <asp:ListItem Value="AI">Anguilla</asp:ListItem>
                                <asp:ListItem Value="AG">Antigua and Barbuda</asp:ListItem>
                                <asp:ListItem Value="AR">Argentina</asp:ListItem>
                                <asp:ListItem Value="AM">Armenia</asp:ListItem>
                                <asp:ListItem Value="AW">Aruba</asp:ListItem>
                                <asp:ListItem Value="AU">Australia</asp:ListItem>
                                <asp:ListItem Value="AT">Austria</asp:ListItem>
                                <asp:ListItem Value="AZ">Azerbaijan Republic</asp:ListItem>
                                <asp:ListItem Value="BS">Bahamas</asp:ListItem>
                                <asp:ListItem Value="BH">Bahrain</asp:ListItem>
                                <asp:ListItem Value="BB">Barbados</asp:ListItem>
                                <asp:ListItem Value="BE">Belgium</asp:ListItem>
                                <asp:ListItem Value="BZ">Belize</asp:ListItem>
                                <asp:ListItem Value="BJ">Benin</asp:ListItem>
                                <asp:ListItem Value="BM">Bermuda</asp:ListItem>
                                <asp:ListItem Value="BT">Bhutan</asp:ListItem>
                                <asp:ListItem Value="BO">Bolivia</asp:ListItem>
                                <asp:ListItem Value="BA">Bosnia and Herzegovina</asp:ListItem>
                                <asp:ListItem Value="BW">Botswana</asp:ListItem>
                                <asp:ListItem Value="BR">Brazil</asp:ListItem>
                                <asp:ListItem Value="BN">Brunei</asp:ListItem>
                                <asp:ListItem Value="BG">Bulgaria</asp:ListItem>
                                <asp:ListItem Value="BF">Burkina Faso</asp:ListItem>
                                <asp:ListItem Value="BI">Burundi</asp:ListItem>
                                <asp:ListItem Value="KH">Cambodia</asp:ListItem>
                                <asp:ListItem Value="CA">Canada</asp:ListItem>
                                <asp:ListItem Value="CV">Cape Verde</asp:ListItem>
                                <asp:ListItem Value="KY">Cayman Islands</asp:ListItem>
                                <asp:ListItem Value="TD">Chad</asp:ListItem>
                                <asp:ListItem Value="CL">Chile</asp:ListItem>
                                <asp:ListItem Value="C2">China Worldwide</asp:ListItem>
                                <asp:ListItem Value="CO">Colombia</asp:ListItem>
                                <asp:ListItem Value="KM">Comoros</asp:ListItem>
                                <asp:ListItem Value="CK">Cook Islands</asp:ListItem>
                                <asp:ListItem Value="CR">Costa Rica</asp:ListItem>
                                <asp:ListItem Value="HR">Croatia</asp:ListItem>
                                <asp:ListItem Value="CY">Cyprus</asp:ListItem>
                                <asp:ListItem Value="CZ">Czech Republic</asp:ListItem>
                                <asp:ListItem Value="CD">Democratic Republic of the Congo</asp:ListItem>
                                <asp:ListItem Value="DK">Denmark</asp:ListItem>
                                <asp:ListItem Value="DJ">Djibouti</asp:ListItem>
                                <asp:ListItem Value="DM">Dominica</asp:ListItem>
                                <asp:ListItem Value="DO">Dominican Republic</asp:ListItem>
                                <asp:ListItem Value="EC">Ecuador</asp:ListItem>
                                <asp:ListItem Value="EG">Egypt</asp:ListItem>
                                <asp:ListItem Value="SV">El Salvador</asp:ListItem>
                                <asp:ListItem Value="ER">Eritrea</asp:ListItem>
                                <asp:ListItem Value="EE">Estonia</asp:ListItem>
                                <asp:ListItem Value="ET">Ethiopia</asp:ListItem>
                                <asp:ListItem Value="FK">Falkland Islands</asp:ListItem>
                                <asp:ListItem Value="FO">Faroe Islands</asp:ListItem>
                                <asp:ListItem Value="FJ">Fiji</asp:ListItem>
                                <asp:ListItem Value="FI">Finland</asp:ListItem>
                                <asp:ListItem Value="FR">France</asp:ListItem>
                                <asp:ListItem Value="GF">French Guiana</asp:ListItem>
                                <asp:ListItem Value="PF">French Polynesia</asp:ListItem>
                                <asp:ListItem Value="GA">Gabon Republic</asp:ListItem>
                                <asp:ListItem Value="GM">Gambia</asp:ListItem>
                                <asp:ListItem Value="GE">Georgia</asp:ListItem>
                                <asp:ListItem Value="DE">Germany</asp:ListItem>
                                <asp:ListItem Value="GI">Gibraltar</asp:ListItem>
                                <asp:ListItem Value="GR">Greece</asp:ListItem>
                                <asp:ListItem Value="GL">Greenland</asp:ListItem>
                                <asp:ListItem Value="GD">Grenada</asp:ListItem>
                                <asp:ListItem Value="GP">Guadeloupe</asp:ListItem>
                                <asp:ListItem Value="GT">Guatemala</asp:ListItem>
                                <asp:ListItem Value="GN">Guinea</asp:ListItem>
                                <asp:ListItem Value="GW">Guinea Bissau</asp:ListItem>
                                <asp:ListItem Value="GY">Guyana</asp:ListItem>
                                <asp:ListItem Value="HN">Honduras</asp:ListItem>
                                <asp:ListItem Value="HK">Hong Kong</asp:ListItem>
                                <asp:ListItem Value="HU">Hungary</asp:ListItem>
                                <asp:ListItem Value="IS">Iceland</asp:ListItem>
                                <asp:ListItem Value="IN">India</asp:ListItem>
                                <asp:ListItem Value="ID">Indonesia</asp:ListItem>
                                <asp:ListItem Value="IE">Ireland</asp:ListItem>
                                <asp:ListItem Value="IL">Israel</asp:ListItem>
                                <asp:ListItem Value="IT">Italy</asp:ListItem>
                                <asp:ListItem Value="JM">Jamaica</asp:ListItem>
                                <asp:ListItem Value="JP">Japan</asp:ListItem>
                                <asp:ListItem Value="JO">Jordan</asp:ListItem>
                                <asp:ListItem Value="KZ">Kazakhstan</asp:ListItem>
                                <asp:ListItem Value="KE">Kenya</asp:ListItem>
                                <asp:ListItem Value="KI">Kiribati</asp:ListItem>
                                <asp:ListItem Value="KW">Kuwait</asp:ListItem>
                                <asp:ListItem Value="KG">Kyrgyzstan</asp:ListItem>
                                <asp:ListItem Value="LA">Laos</asp:ListItem>
                                <asp:ListItem Value="LV">Latvia</asp:ListItem>
                                <asp:ListItem Value="LS">Lesotho</asp:ListItem>
                                <asp:ListItem Value="LI">Liechtenstein</asp:ListItem>
                                <asp:ListItem Value="LT">Lithuania</asp:ListItem>
                                <asp:ListItem Value="LU">Luxembourg</asp:ListItem>
                                <asp:ListItem Value="MG">Madagascar</asp:ListItem>
                                <asp:ListItem Value="MW">Malawi</asp:ListItem>
                                <asp:ListItem Value="MY">Malaysia</asp:ListItem>
                                <asp:ListItem Value="MV">Maldives</asp:ListItem>
                                <asp:ListItem Value="ML">Mali</asp:ListItem>
                                <asp:ListItem Value="MT">Malta</asp:ListItem>
                                <asp:ListItem Value="MH">Marshall Islands</asp:ListItem>
                                <asp:ListItem Value="MQ">Martinique</asp:ListItem>
                                <asp:ListItem Value="MR">Mauritania</asp:ListItem>
                                <asp:ListItem Value="MU">Mauritius</asp:ListItem>
                                <asp:ListItem Value="YT">Mayotte</asp:ListItem>
                                <asp:ListItem Value="MX">Mexico</asp:ListItem>
                                <asp:ListItem Value="FM">Micronesia</asp:ListItem>
                                <asp:ListItem Value="MN">Mongolia</asp:ListItem>
                                <asp:ListItem Value="MS">Montserrat</asp:ListItem>
                                <asp:ListItem Value="MA">Morocco</asp:ListItem>
                                <asp:ListItem Value="MZ">Mozambique</asp:ListItem>
                                <asp:ListItem Value="NA">Namibia</asp:ListItem>
                                <asp:ListItem Value="NR">Nauru</asp:ListItem>
                                <asp:ListItem Value="NP">Nepal</asp:ListItem>
                                <asp:ListItem Value="NL">Netherlands</asp:ListItem>
                                <asp:ListItem Value="AN">Netherlands Antilles</asp:ListItem>
                                <asp:ListItem Value="NC">New Caledonia</asp:ListItem>
                                <asp:ListItem Value="NZ">New Zealand</asp:ListItem>
                                <asp:ListItem Value="NI">Nicaragua</asp:ListItem>
                                <asp:ListItem Value="NE">Niger</asp:ListItem>
                                <asp:ListItem Value="NU">Niue</asp:ListItem>
                                <asp:ListItem Value="NF">Norfolk Island</asp:ListItem>
                                <asp:ListItem Value="NO">Norway</asp:ListItem>
                                <asp:ListItem Value="OM">Oman</asp:ListItem>
                                <asp:ListItem Value="PW">Palau</asp:ListItem>
                                <asp:ListItem Value="PA">Panama</asp:ListItem>
                                <asp:ListItem Value="PG">Papua New Guinea</asp:ListItem>
                                <asp:ListItem Value="PE">Peru</asp:ListItem>
                                <asp:ListItem Value="PH">Philippines</asp:ListItem>
                                <asp:ListItem Value="PN">Pitcairn Islands</asp:ListItem>
                                <asp:ListItem Value="PL">Poland</asp:ListItem>
                                <asp:ListItem Value="PT">Portugal</asp:ListItem>
                                <asp:ListItem Value="QA">Qatar</asp:ListItem>
                                <asp:ListItem Value="CG">Republic of the Congo</asp:ListItem>
                                <asp:ListItem Value="RE">Reunion</asp:ListItem>
                                <asp:ListItem Value="RO">Romania</asp:ListItem>
                                <asp:ListItem Value="RU">Russia</asp:ListItem>
                                <asp:ListItem Value="RW">Rwanda</asp:ListItem>
                                <asp:ListItem Value="KN">Saint Kitts and Nevis Anguilla</asp:ListItem>
                                <asp:ListItem Value="PM">Saint Pierre and Miquelon</asp:ListItem>
                                <asp:ListItem Value="VC">Saint Vincent and Grenadines</asp:ListItem>
                                <asp:ListItem Value="WS">Samoa</asp:ListItem>
                                <asp:ListItem Value="SM">San Marino</asp:ListItem>
                                <asp:ListItem Value="ST">São Tomé and Príncipe</asp:ListItem>
                                <asp:ListItem Value="SA">Saudi Arabia</asp:ListItem>
                                <asp:ListItem Value="SN">Senegal</asp:ListItem>
                                <asp:ListItem Value="RS">Serbia</asp:ListItem>
                                <asp:ListItem Value="SC">Seychelles</asp:ListItem>
                                <asp:ListItem Value="SL">Sierra Leone</asp:ListItem>
                                <asp:ListItem Value="SG">Singapore</asp:ListItem>
                                <asp:ListItem Value="SK">Slovakia</asp:ListItem>
                                <asp:ListItem Value="SI">Slovenia</asp:ListItem>
                                <asp:ListItem Value="SB">Solomon Islands</asp:ListItem>
                                <asp:ListItem Value="SO">Somalia</asp:ListItem>
                                <asp:ListItem Value="ZA">South Africa</asp:ListItem>
                                <asp:ListItem Value="KR">South Korea</asp:ListItem>
                                <asp:ListItem Value="ES">Spain</asp:ListItem>
                                <asp:ListItem Value="LK">Sri Lanka</asp:ListItem>
                                <asp:ListItem Value="SH">St. Helena</asp:ListItem>
                                <asp:ListItem Value="LC">St. Lucia</asp:ListItem>
                                <asp:ListItem Value="SR">Suriname</asp:ListItem>
                                <asp:ListItem Value="SJ">Svalbard and Jan Mayen Islands</asp:ListItem>
                                <asp:ListItem Value="SZ">Swaziland</asp:ListItem>
                                <asp:ListItem Value="SE">Sweden</asp:ListItem>
                                <asp:ListItem Value="CH">Switzerland</asp:ListItem>
                                <asp:ListItem Value="TW">Taiwan</asp:ListItem>
                                <asp:ListItem Value="TJ">Tajikistan</asp:ListItem>
                                <asp:ListItem Value="TZ">Tanzania</asp:ListItem>
                                <asp:ListItem Value="TH">Thailand</asp:ListItem>
                                <asp:ListItem Value="TG">Togo</asp:ListItem>
                                <asp:ListItem Value="TO">Tonga</asp:ListItem>
                                <asp:ListItem Value="TT">Trinidad and Tobago</asp:ListItem>
                                <asp:ListItem Value="TN">Tunisia</asp:ListItem>
                                <asp:ListItem Value="TR">Turkey</asp:ListItem>
                                <asp:ListItem Value="TM">Turkmenistan</asp:ListItem>
                                <asp:ListItem Value="TC">Turks and Caicos Islands</asp:ListItem>
                                <asp:ListItem Value="TV">Tuvalu</asp:ListItem>
                                <asp:ListItem Value="UG">Uganda</asp:ListItem>
                                <asp:ListItem Value="UA">Ukraine</asp:ListItem>
                                <asp:ListItem Value="AE">United Arab Emirates</asp:ListItem>
                                <asp:ListItem Value="GB">United Kingdom</asp:ListItem>
                                <asp:ListItem Value="US">United States</asp:ListItem>
                                <asp:ListItem Value="UY">Uruguay</asp:ListItem>
                                <asp:ListItem Value="VU">Vanuatu</asp:ListItem>
                                <asp:ListItem Value="VA">Vatican City State</asp:ListItem>
                                <asp:ListItem Value="VE">Venezuela</asp:ListItem>
                                <asp:ListItem Value="VN">Vietnam</asp:ListItem>
                                <asp:ListItem Value="VG">Virgin Islands (British)</asp:ListItem>
                                <asp:ListItem Value="WF">Wallis and Futuna Islands</asp:ListItem>
                                <asp:ListItem Value="YE">Yemen</asp:ListItem>
                                <asp:ListItem Value="ZM">Zambia</asp:ListItem>
                            </asp:DropDownList>
                            <i class="arrow double"></i>
                        </label>
                    </div>
                    <!-- end section -->

                    <div class="frm-row">

                        <div class="section colm colm3">
                            <label class="field prepend-icon">
                                <asp:TextBox ID="TxtZip" runat="server" CssClass="gui-input" placeholder="Zip"></asp:TextBox>
                                <span class="field-icon"><i class="fa fa-certificate"></i></span>
                            </label>
                        </div>
                        <!-- end section -->

                        <div class="section colm colm4">
                            <label class="field prepend-icon">
                                
                                <asp:TextBox ID="TxtCity" runat="server" CssClass="gui-input" placeholder="City"></asp:TextBox>
                                <span class="field-icon"><i class="fa fa-building-o"></i></span>
                            </label>
                        </div>
                        <!-- end section -->

                        <div class="section colm colm5">
                            <label class="field select">
                                <asp:DropDownList ID="DdlStates" runat="server">
                                    <asp:ListItem Value="">Choose state</asp:ListItem>
                                    <asp:ListItem Value="AL">Alabama</asp:ListItem>
                                    <asp:ListItem Value="AK">Alaska</asp:ListItem>
                                    <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                                    <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                                    <asp:ListItem Value="CA">California</asp:ListItem>
                                    <asp:ListItem Value="CO">Colorado</asp:ListItem>
                                    <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                                    <asp:ListItem Value="DE">Delaware</asp:ListItem>
                                    <asp:ListItem Value="DC">District Of Columbia</asp:ListItem>
                                    <asp:ListItem Value="FL">Florida</asp:ListItem>
                                    <asp:ListItem Value="GA">Georgia</asp:ListItem>
                                    <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                                    <asp:ListItem Value="ID">Idaho</asp:ListItem>
                                    <asp:ListItem Value="IL">Illinois</asp:ListItem>
                                    <asp:ListItem Value="IN">Indiana</asp:ListItem>
                                    <asp:ListItem Value="IA">Iowa</asp:ListItem>
                                    <asp:ListItem Value="KS">Kansas</asp:ListItem>
                                    <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                                    <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                                    <asp:ListItem Value="ME">Maine</asp:ListItem>
                                    <asp:ListItem Value="MD">Maryland</asp:ListItem>
                                    <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                                    <asp:ListItem Value="MI">Michigan</asp:ListItem>
                                    <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                                    <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                                    <asp:ListItem Value="MO">Missouri</asp:ListItem>
                                    <asp:ListItem Value="MT">Montana</asp:ListItem>
                                    <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                                    <asp:ListItem Value="NV">Nevada</asp:ListItem>
                                    <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                                    <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                                    <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                                    <asp:ListItem Value="NY">New York</asp:ListItem>
                                    <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                                    <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                                    <asp:ListItem Value="OH">Ohio</asp:ListItem>
                                    <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                                    <asp:ListItem Value="OR">Oregon</asp:ListItem>
                                    <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                                    <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                                    <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                                    <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                                    <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                                    <asp:ListItem Value="TX">Texas</asp:ListItem>
                                    <asp:ListItem Value="UT">Utah</asp:ListItem>
                                    <asp:ListItem Value="VT">Vermont</asp:ListItem>
                                    <asp:ListItem Value="VA">Virginia</asp:ListItem>
                                    <asp:ListItem Value="WA">Washington</asp:ListItem>
                                    <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                                    <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                                    <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                                </asp:DropDownList>
                                <i class="arrow double"></i>
                            </label>
                        </div>
                        <!-- end .col8 section -->

                    </div>
                    <!-- end frm-row section -->

                    
                    <!-- end section -->

                </div>
                <!-- end .form-body section -->
                <div class="form-footer">
                    <%--<button type="submit" class="button btn-primary">Proceed to confirm </button>--%>
                    <asp:Button ID="BtnSubmit" CssClass="button btn-primary" runat="server" OnClick="BtnSubmit_Click" Text="Proceed to confirm" />
                </div>
                <!-- end .form-footer section -->
            </form>

        </div>
        <!-- end .smart-forms section -->
    </div>
    <!-- end .smart-wrap section -->

    <div></div>
    <!-- end section -->

</body>
<%--<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TxtEmail" runat="server"></asp:TextBox>
            <asp:Button ID="BtnSubmit" runat="server" OnClick="BtnSubmit_Click" Text="Submit" />
        </div>
    </form>
</body>--%>
</html>
