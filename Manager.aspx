<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="DatabaseMilestone3.Manager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 127px;
            left: 53px;
            z-index: 1;
        }
        .auto-style2 {
            position: absolute;
            top: 195px;
            left: 58px;
            z-index: 1;
        }
        .auto-style3 {
            position: absolute;
            top: 195px;
            left: 255px;
            z-index: 1;
        }
        .auto-style4 {
            position: absolute;
            top: 195px;
            left: 463px;
            z-index: 1;
        }
        .auto-style5 {
            position: absolute;
            top: 195px;
            left: 683px;
            z-index: 1;
        }
        .auto-style6 {
            position: absolute;
            top: 271px;
            left: 58px;
            z-index: 1;
        }
        .auto-style7 {
            position: absolute;
            top: 271px;
            left: 255px;
            z-index: 1;
        }
        .auto-style8 {
            position: absolute;
            top: 271px;
            left: 463px;
            z-index: 1;
        }
        .auto-style9 {
            position: absolute;
            top: 271px;
            left: 683px;
            z-index: 1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="viewAllRequests" runat="server" CssClass="auto-style1" Text="view All Requests" OnClick="viewAllRequests_Click" />
            <asp:TextBox ID="HostNameAccept" runat="server" CssClass="auto-style2" placeholder="Host Name"></asp:TextBox>
            <asp:TextBox ID="GuestNameAccept" runat="server" CssClass="auto-style3" placeholder="Guest Name"></asp:TextBox>
            <asp:TextBox ID="DateTimeAccept" runat="server" CssClass="auto-style4" placeholder="Date Time"></asp:TextBox>
            <asp:Button ID="AcceptRequestButton" runat="server" CssClass="auto-style5" Text="Accept Request" OnClick="AcceptRequestButton_Click" />
            
            <asp:TextBox ID="HostNameReject" runat="server" CssClass="auto-style6" placeholder="Host Name"></asp:TextBox>
            <asp:TextBox ID="GuestNameReject" runat="server" CssClass="auto-style7" placeholder="Guest Name"></asp:TextBox>
            <asp:TextBox ID="DateTimeReject" runat="server" CssClass="auto-style8" placeholder="Date Time"></asp:TextBox>
            <asp:Button ID="RejectRequestButton" runat="server" CssClass="auto-style9" Text="Reject Request" OnClick="RejectRequestButton_Click" />
        </div>
    </form>
</body>
</html>
