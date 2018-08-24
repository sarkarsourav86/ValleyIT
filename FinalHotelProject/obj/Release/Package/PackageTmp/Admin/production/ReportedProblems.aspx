<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/production/Smaller.Master" AutoEventWireup="true" CodeBehind="ReportedProblems.aspx.cs" Inherits="FinalHotelProject.Admin.production.ReportedProblems" %>
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
                    <p class="text-muted font-13 m-b-30">
                     have something better here!
                    </p>
                    <table id="problemTable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>RoomNo</th>
                          <th>Incedent Type</th>
                          <th>Incedent Description</th>
                          <th>Incedent Time</th>
                          <th>Problem</th>
                          <th>IsResolved</th>
                          <th>Edit</th>
                          
                        </tr>
                      </thead>


                      
                    </table>
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
    
    <!-- iCheck -->
    <!-- Datatables -->
    
    <script src="../vendors/iCheck/icheck.min.js"></script>
    <script src="../vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="../vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="../vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="../vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="../vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="../vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="../vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="../vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="../vendors/jszip/dist/jszip.min.js"></script>
    <script src="../vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="../vendors/pdfmake/build/vfs_fonts.js"></script>
    <script>
        var loadTable = () => {
            var id=$('#CPDatatable_HdnHotelId').val();
            FinalHotelProject.Admin.production.Services.Reports.GetProblems(id, (result) => {
                $('#problemTable').DataTable(
                    {
                        data: result,
                        
                        "pageLength": 10,
                        columns: [
                        { 'data': 'RoomNo' },
                        { 'data': 'IncedentTypeStr' },
                        { 'data': 'IncedentDescription' },
                        { 'data': 'IncedentTime' },
                        { 'data': 'FeedbackStr' },
                        {
                            'data': 'IsSolved',
                            'render': (val) =>
                            {
                                if (val === true) return 'Yes';
                                else if(val===false) return 'No'
                            }
                        },
                        {
                            'data': 'IncedentID',
                            'render': (val) =>
                            {
                                //return "<a href='mypage.aspx?id=`${val}`'>Edit</a>"
                                return `<a href='EditProblems.aspx?id=${val}'>Edit</a>`;
                            }
                        }
                        ]
                            
                            
                    });
            });
        }
        $(document).ready(function () {
            loadTable();
        });
    </script>
</asp:Content>
