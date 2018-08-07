<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/production/Smaller.Master" AutoEventWireup="true" CodeBehind="EditProblems.aspx.cs" Inherits="FinalHotelProject.Admin.production.EditProblems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPDatatable" runat="server">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>Form Design <small>different form elements</small></h2>
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
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="LblIncedentId">Incedent Id <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          
                            <asp:Label ID="LblIncedentId" runat="server"></asp:Label>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="DdlIncedentType">Incedent Type <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <asp:DropDownList ID="DdlIncedentType" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Feedback Value</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <asp:DropDownList ID="DdlFeedbackValue" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="TxtDesc">Incedent Description<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <asp:TextBox ID="TxtDesc" TextMode="MultiLine" runat="server" CssClass="form-control col-md-7 col-xs-12"></asp:TextBox>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="LblRoomNo">Room No.<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <asp:Label ID="LblRoomNo" runat="server"></asp:Label>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="LblTime">Incedent Time<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <asp:Label ID="LblTime" runat="server"></asp:Label>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="TxtDesc">Username<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <asp:TextBox ID="TxtUname" runat="server" CssClass="form-control col-md-7 col-xs-12"></asp:TextBox>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="TxtEmail">UserEmail<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <asp:TextBox ID="TxtEmail" runat="server" CssClass="form-control col-md-7 col-xs-12"></asp:TextBox>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="TxtEmail">Phone<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <asp:TextBox ID="TxtPhone" runat="server" CssClass="form-control col-md-7 col-xs-12"></asp:TextBox>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Is Resolved</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <asp:DropDownList ID="DdlIsResolved" runat="server" CssClass="form-control">
                              <asp:ListItem Value="0">No</asp:ListItem>
                              <asp:ListItem Value="1">Yes</asp:ListItem>
                          </asp:DropDownList>
                        </div>
                      </div>
                      
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          
                          <asp:Button runat="server" ID="BtnSave" CssClass="btn btn-primary" Text="Save" />
                          
                        </div>
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
