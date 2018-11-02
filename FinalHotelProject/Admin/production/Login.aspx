<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FinalHotelProject.Admin.production.Login" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Portal - MyGuestXp</title>
    <link href="../../images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="../vendors/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <form id="form1" runat="server">
             <asp:Panel ID="PnlLogin" runat="server" Visible="true">
                 <h2 style="margin-bottom:50px;font-size:30px;">MyGuestXp Portal Login</h2>
                
              <div>
                <asp:TextBox runat="server" ID="TxtUsername"  CssClass="form-control" placeholder="Username" required />
              </div>
              <div>
                <asp:TextBox TextMode="Password" CssClass="form-control" ID="TxtPwd" runat="server" placeholder="Password" required />
              </div>
              <div>
                <asp:Button CssClass="btn btn-default submit" runat="server" ID="BtnLogin" OnClick="BtnLogin_Click" Text="Login"></asp:Button>
                <a class="reset_pass" href="#">Forgot your password?</a>
              </div>

             </asp:Panel>
              <asp:Panel ID="PnlAfterLogin" runat="server" Visible="false">
                  <h2 style="margin-bottom:50px;font-size:30px;">Please Select your Hotel</h2>
              </asp:Panel>
              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">Visit us at
                  <a target="_blank" href="http://www.MyGuestXP.com" class="to_register"> www.MyGuestXP.com</a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <img src="../../images/logohotel.png" />
                  <p>©2018 All Rights Reserved. MyGuestXp.</p>
                </div>
              </div>
            </form>
          </section>
        </div>

        <div id="register" class="animate form registration_form">
          <section class="login_content">
            <form>
              <h1>Create Account</h1>
              <div>
                <input type="text" class="form-control" placeholder="Username" required="" />
              </div>
              <div>
                <input type="email" class="form-control" placeholder="Email" required="" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Password" required="" />
              </div>
              <div>
                <a class="btn btn-default submit" href="index.html">Submit</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">Already a member ?
                  <a href="#signin" class="to_register"> Log in </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <img src="../../images/logohotel.png" />
                  <p>©2018 All Rights Reserved. MyGuestXp.</p>
                </div>
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
  </body>
</html>

