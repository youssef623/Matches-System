<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fans.aspx.cs" Inherits="DatabaseMilestone3.Fans" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 91px;
            left: 33px;
            z-index: 1;
        }
        .auto-style2 {
            position: absolute;
            top: 92px;
            left: 219px;
            z-index: 1;
        }
        .auto-style3 {
            position: absolute;
            top: 153px;
            left: 638px;
            z-index: 1;
        }
        .auto-style4 {
            position: absolute;
            top: 153px;
            left: 36px;
            z-index: 1;
        }
        .auto-style5 {
            position: absolute;
            top: 153px;
            left: 221px;
            z-index: 1;
        }
        .auto-style6 {
            position: absolute;
            top: 153px;
            left: 406px;
            z-index: 1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="date" runat="server" placeholder ="date" CssClass="auto-style1"></asp:TextBox>
            <asp:Button ID="viewAvailabletickets" runat="server" CssClass="auto-style2" Text="view Available tickets" OnClick="viewAvailabletickets_Click1" />
            <asp:Button ID="purchaseTicket" runat="server" CssClass="auto-style3" Text="purchase Ticket" OnClick="purchaseTicket_Click" />
            <asp:TextBox ID="hostName" runat="server" placeholder ="Host name" CssClass="auto-style4"></asp:TextBox>
            <asp:TextBox ID="competingClubName" placeholder="Guest Club" runat="server" CssClass="auto-style5"></asp:TextBox>
            <asp:TextBox ID="datetimePurchaseTicket" placeholder="datetime" runat="server" CssClass="auto-style6"></asp:TextBox>
        </div>
    </form>
</body>
</html>
