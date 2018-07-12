<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/production/Admin.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FinalHotelProject.Admin.production.LinegraphComplaints" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlcLinegraphComplaints" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Transaction Summary <small>
                        <asp:TextBox ID="TxtTest" runat="server"></asp:TextBox></small></h2>
                    <div class="filter">
                        <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                            <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                            <span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="col-md-9 col-sm-12 col-xs-12">
                        <div class="demo-container" style="height: 430px">
                            <%--<div id="chart_plot_02" class="demo-placeholder"></div>--%>
                            <canvas id="myChart" class="demo-placeholder"></canvas>

                        </div>
                        <div class="tiles">
                            <div class="col-md-4 tile">
                                <span>Total Sessions</span>
                                <h2>231,809</h2>
                                <span class="sparkline11 graph" style="height: 160px;">
                                    <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                                </span>
                            </div>
                            <div class="col-md-4 tile">
                                <span>Total Revenue</span>
                                <h2>$231,809</h2>
                                <span class="sparkline22 graph" style="height: 160px;">
                                    <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                                </span>
                            </div>
                            <div class="col-md-4 tile">
                                <span>Total Sessions</span>
                                <h2>231,809</h2>
                                <span class="sparkline11 graph" style="height: 160px;">
                                    <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                                </span>
                            </div>
                        </div>

                    </div>

                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div>
                            <div class="x_title">
                                <h2>Recent Requests</h2>
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
                            <ul class="list-unstyled top_profiles scroll-view">
                                <asp:UpdatePanel ID="UPIncedents" runat="server">
                                    <ContentTemplate>
                                        <asp:Repeater ID="RptIncedents" runat="server">

                                            <ItemTemplate>
                                                <li class="media event">
                                                    <a class="pull-left border-aero profile_thumb">
                                                        <i class="fa fa-user aero"></i>
                                                    </a>
                                                    <div class="media-body">
                                                        <a class="title" href="#"><%# Eval("Type") %></a>
                                                        <p><strong style="color: <%# Eval("Color")%>"><%# Eval("Problem") %></strong> </p>
                                                        <p>Room No: <strong><%# Eval("RoomNo") %></strong> </p>

                                                        <p>
                                                            <%# Eval("IncedentDescription") %>
                                                        </p>
                                                    </div>
                                                </li>
                                            </ItemTemplate>

                                        </asp:Repeater>


                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                                    </Triggers>

                                </asp:UpdatePanel>
                                <asp:Timer ID="Timer1" runat="server" Interval="5000" OnTick="Timer1_Tick"></asp:Timer>
                            </ul>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <script src="js/chart/Chart.min.js"></script>
    <script>
        let myChart = document.getElementById('myChart').getContext('2d');
        console.log('working');
        // Global Options
        Chart.defaults.global.defaultFontFamily = 'Lato';
        Chart.defaults.global.defaultFontSize = 18;
        Chart.defaults.global.defaultFontColor = '#777';

        let massPopChart = new Chart(myChart, {
            type: 'bar', // bar, horizontalBar, pie, line, doughnut, radar, polarArea
            data: {
                labels: ['Boston', 'Worcester', 'Springfield', 'Lowell', 'Cambridge', 'New Bedford'],
                datasets: [{
                    label: 'Population',
                    data: [
                        617594,
                        181045,
                        153060,
                        106519,
                        105162,
                        95072
                    ],
                    //backgroundColor:'green',
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.6)',
                        'rgba(54, 162, 235, 0.6)',
                        'rgba(255, 206, 86, 0.6)',
                        'rgba(75, 192, 192, 0.6)',
                        'rgba(153, 102, 255, 0.6)',
                        'rgba(255, 159, 64, 0.6)',
                        'rgba(255, 99, 132, 0.6)'
                    ],
                    borderWidth: 1,
                    borderColor: '#777',
                    hoverBorderWidth: 3,
                    hoverBorderColor: '#000'
                }]
            },
            options: {
                title: {
                    display: true,
                    text: 'Largest Cities In Massachusetts',
                    fontSize: 25
                },
                legend: {
                    display: true,
                    position: 'right',
                    labels: {
                        fontColor: '#000'
                    }
                },
                layout: {
                    padding: {
                        left: 50,
                        right: 0,
                        bottom: 0,
                        top: 0
                    }
                },
                tooltips: {
                    enabled: true
                }
            }
        });
    </script>
    <script>
        $(document).ready(function () {
            console.log("i am still running");
        })
    </script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="CPIncedents">
    <div class="row">
        <div class="col-md-4">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Top Profiles <small>Sessions</small></h2>
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
                    <article class="media event">
                        <a class="pull-left date">
                            <p class="month">April</p>
                            <p class="day">23</p>
                        </a>
                        <div class="media-body">
                            <a class="title" href="#">Item One Title</a>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </article>
                    <article class="media event">
                        <a class="pull-left date">
                            <p class="month">April</p>
                            <p class="day">23</p>
                        </a>
                        <div class="media-body">
                            <a class="title" href="#">Item Two Title</a>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </article>
                    <article class="media event">
                        <a class="pull-left date">
                            <p class="month">April</p>
                            <p class="day">23</p>
                        </a>
                        <div class="media-body">
                            <a class="title" href="#">Item Two Title</a>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </article>
                    <article class="media event">
                        <a class="pull-left date">
                            <p class="month">April</p>
                            <p class="day">23</p>
                        </a>
                        <div class="media-body">
                            <a class="title" href="#">Item Two Title</a>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </article>
                    <article class="media event">
                        <a class="pull-left date">
                            <p class="month">April</p>
                            <p class="day">23</p>
                        </a>
                        <div class="media-body">
                            <a class="title" href="#">Item Three Title</a>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </article>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Top Profiles <small>Sessions</small></h2>
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
                    <article class="media event">
                        <a class="pull-left date">
                            <p class="month">April</p>
                            <p class="day">23</p>
                        </a>
                        <div class="media-body">
                            <a class="title" href="#">Item One Title</a>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </article>
                    <article class="media event">
                        <a class="pull-left date">
                            <p class="month">April</p>
                            <p class="day">23</p>
                        </a>
                        <div class="media-body">
                            <a class="title" href="#">Item Two Title</a>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </article>
                    <article class="media event">
                        <a class="pull-left date">
                            <p class="month">April</p>
                            <p class="day">23</p>
                        </a>
                        <div class="media-body">
                            <a class="title" href="#">Item Two Title</a>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </article>
                    <article class="media event">
                        <a class="pull-left date">
                            <p class="month">April</p>
                            <p class="day">23</p>
                        </a>
                        <div class="media-body">
                            <a class="title" href="#">Item Two Title</a>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </article>
                    <article class="media event">
                        <a class="pull-left date">
                            <p class="month">April</p>
                            <p class="day">23</p>
                        </a>
                        <div class="media-body">
                            <a class="title" href="#">Item Three Title</a>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </article>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Top Profiles <small>Sessions</small></h2>
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
                    <article class="media event">
                        <a class="pull-left date">
                            <p class="month">April</p>
                            <p class="day">23</p>
                        </a>
                        <div class="media-body">
                            <a class="title" href="#">Item One Title</a>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </article>
                    <article class="media event">
                        <a class="pull-left date">
                            <p class="month">April</p>
                            <p class="day">23</p>
                        </a>
                        <div class="media-body">
                            <a class="title" href="#">Item Two Title</a>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </article>
                    <article class="media event">
                        <a class="pull-left date">
                            <p class="month">April</p>
                            <p class="day">23</p>
                        </a>
                        <div class="media-body">
                            <a class="title" href="#">Item Two Title</a>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </article>
                    <article class="media event">
                        <a class="pull-left date">
                            <p class="month">April</p>
                            <p class="day">23</p>
                        </a>
                        <div class="media-body">
                            <a class="title" href="#">Item Two Title</a>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </article>
                    <article class="media event">
                        <a class="pull-left date">
                            <p class="month">April</p>
                            <p class="day">23</p>
                        </a>
                        <div class="media-body">
                            <a class="title" href="#">Item Three Title</a>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </article>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
