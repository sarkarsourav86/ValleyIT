<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="FinalHotelProject.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment -MyGuestXp</title>
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-118035317-1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'UA-118035317-1');
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TxtEmail" runat="server"></asp:TextBox>
            <asp:Button ID="BtnSubmit" runat="server" OnClick="BtnSubmit_Click" Text="Submit" />
        </div>
    </form>
</body>
</html>
