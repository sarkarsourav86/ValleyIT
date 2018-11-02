<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/production/Smaller.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="FinalHotelProject.Admin.production.Reports" %>
<%@ MasterType VirtualPath="~/Admin/production/Smaller.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPDatatable" runat="server">
    <asp:HiddenField ID="HdnHotelId" runat="server" />
    <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Default Example <small>Users</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      
                      
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <p class="text-muted font-13 m-b-30">
                     have something better here!
                    </p>
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Report Type</label>
                        <div class="col-md-4 col-sm-5 col-xs-12">
                          <asp:DropDownList ID="DdlReport" runat="server" CssClass="form-control" >
                              <asp:ListItem Selected="True" Text="Users and Problems" Value="1"></asp:ListItem>
                              <asp:ListItem Text="Users" Value="2"></asp:ListItem>
                              <asp:ListItem Text="Problems" Value="3"></asp:ListItem>
                          </asp:DropDownList>
                        </div>
                      </div>
                    <br /><br /> <br />
                    <div class="form-group">
                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                          <asp:Button ID="BtnDownload" runat="server" OnClick="BtnDownload_Click" Text="Download" CssClass="btn btn-success" />
                          
                        </div>
                      </div>
                      
                  </div>
                </div>
              </div>
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
</asp:Content>
