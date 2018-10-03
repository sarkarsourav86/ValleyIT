<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="FinalHotelProject.Admin.production.ResetPassword" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Gentelella Alela! | </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
    <div class="container body">
        <div class="main_container">


            <!-- top navigation -->

            <!-- /top navigation -->

            <!-- page content -->
            <div class="right_col" role="main">
                <div class="">
                    <div class="page-title">
                        <div class="title_left">
                            <h3>Forgot Password?</h3>
                        </div>


                    </div>
                    <asp:Panel runat="server" ID="PnlAlert" Visible="false"  role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                        
                        <strong><asp:Label ID="LblStatus" runat="server"></asp:Label></strong>
                    </asp:Panel>
                    <div class="clearfix"></div>
                    <form id="form1" runat="server" class="form-horizontal form-label-left">
                        
                        <asp:Panel ID="PnlSubmitReq" Visible="true" runat="server">
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="x_panel">

                                        <div class="x_content">




                                            <span class="section">Reset Password</span>


                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">
                                                    Email <span class="required">*</span>
                                                </label>
                                                <div class="col-md-3 col-sm-6 col-xs-12">
                                                    <asp:TextBox runat="server" type="email" ID="TxtEmailId" placeholder="Email Id" required CssClass="form-control col-md-7 col-xs-12"></asp:TextBox>
                                                </div>
                                            </div>
                                            
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">
                                                    New Password <span class="required">*</span>
                                                </label>
                                                <div class="col-md-3 col-sm-6 col-xs-12">
                                                    <asp:TextBox runat="server" TextMode="Password" ID="TxtNewPassword" placeholder="New Password" required CssClass="form-control col-md-7 col-xs-12"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">
                                                    Confirm Password <span class="required">*</span>
                                                </label>
                                                <div class="col-md-3 col-sm-6 col-xs-12">
                                                    <asp:TextBox runat="server" TextMode="Password" ID="TxtConfirmNewPassword" placeholder="Email Id" required CssClass="form-control col-md-7 col-xs-12"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-6 col-md-offset-3">
                                                    <br />
                                                    <asp:Button runat="server" ID="BtnResetPassword" CssClass="btn btn-primary" OnClick="BtnResetPassword_Click"  Text="Reset"></asp:Button>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>

                    </form>
                </div>
            </div>
            <!-- /page content -->

            <!-- footer content -->
            <footer>
                <div class="pull-right">
                    Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
                </div>
                <div class="clearfix"></div>
            </footer>
            <!-- /footer content -->
        </div>
    </div>

    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- validator -->
    <%--<script src="../vendors/validator/validator.js"></script>--%>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>

</body>
</html>
