<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="FinalHotelProject.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSourceHotel" ConnectionString="Data Source=DESKTOP-8346GUH\SQLEXPRESS;Initial Catalog=ExperienceHotelApp;Integrated Security=True" SelectCommand="select [Property Name]+' ('+[Property State]+')' as text,[Property] as id from Hotel" runat="server"></asp:SqlDataSource>
            <asp:DropDownList DataTextField="text" DataValueField="id" ID="DdlHotels" DataSourceID="SqlDataSourceHotel" runat="server"></asp:DropDownList>
        </div>
    </form>
</body>
</html>
