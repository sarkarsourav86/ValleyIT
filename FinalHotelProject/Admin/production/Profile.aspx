<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/production/Admin.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="FinalHotelProject.Admin.production.Profile" %>
<%@ MasterType VirtualPath="~/Admin/production/Admin.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlcUserStatus" runat="server">
    <asp:HiddenField ID="HdnHotelId" runat="server" />
    <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Update Profile Picture</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <div id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Profile Picture <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <asp:FileUpload runat="server" ID="FileProfilePhoto" CssClass="form-control col-md-7 col-xs-12 dropify" data-allowed-file-extensions="jpg JPG jpeg png" data-height="100" data-max-file-size="10M" />
                        </div>
                      </div>
                      
                      
                      
                      
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          
                          <asp:Button runat="server" ID="BtnUpdateProfilePicture" OnClick="BtnUpdateProfilePicture_Click" Text="Update" class="btn btn-success" />
                        </div>
                      </div>

                    </div>
                  </div>
                </div>
              </div>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlcLinegraphComplaints" runat="server">
    <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Update Password</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <div id="demo-form3" data-parsley-validate class="form-horizontal form-label-left">

                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Old Password <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <asp:TextBox TextMode="Password" runat="server" ID="TxtOldPwd" CssClass="form-control col-md-7 col-xs-12"></asp:TextBox>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">New Password <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <asp:TextBox TextMode="Password" runat="server" ID="TxtNewPwd" CssClass="form-control col-md-7 col-xs-12"></asp:TextBox>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">New Password <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <asp:TextBox TextMode="Password" runat="server" ID="TxtConfirmPwd" CssClass="form-control col-md-7 col-xs-12"></asp:TextBox>
                        </div>
                      </div>
                      
                      
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          
                          <asp:Button runat="server" ID="BtnUpdatePassword" Text="Update" class="btn btn-success" />
                        </div>
                      </div>

                    </div>
                  </div>
                </div>
              </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CPCharts" runat="server">
    <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Add Users</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <div id="demo-form3" data-parsley-validate class="form-horizontal form-label-left">

                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Email Id <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <asp:TextBox runat="server" ID="TxtEmailId" CssClass="form-control col-md-7 col-xs-12"></asp:TextBox>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Select Role <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          
                            <asp:DropDownList runat="server" ID="DdlRole" CssClass="form-control col-md-7 col-xs-12">
                                <asp:ListItem Text="Admin" Value="0"></asp:ListItem>
                                <asp:ListItem Text="SuperAdmin" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Password <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <asp:TextBox TextMode="Password" runat="server" ID="TxtPassword" CssClass="form-control col-md-7 col-xs-12"></asp:TextBox>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Confirm Password <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <asp:TextBox TextMode="Password" runat="server" ID="TxtConfirmPassword" CssClass="form-control col-md-7 col-xs-12"></asp:TextBox>
                        </div>
                      </div>
                      
                      
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          
                          <asp:Button runat="server" ID="BtnAddUser" Text="Update" class="btn btn-success" />
                        </div>
                      </div>

                    </div>
                  </div>
                </div>
              </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="CPIncedents" runat="server">
</asp:Content>
