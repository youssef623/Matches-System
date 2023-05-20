<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SportsAssociationManager.aspx.cs" Inherits="DatabaseMilestone3.SportsAssociationManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 44px;
            left: 187px;
            z-index: 1;
        }
        .auto-style2 {
            position: absolute;
            top: 43px;
            left: 388px;
            z-index: 1;
        }
        .auto-style3 {
            position: absolute;
            top: 43px;
            left: 595px;
            z-index: 1;
        }
        .auto-style4 {
            position: absolute;
            top: 43px;
            left: 800px;
            z-index: 1;
        }
        .auto-style5 {
            position: absolute;
            top: 42px;
            left: 991px;
            z-index: 1;
        }
        .auto-style6 {
            position: absolute;
            top: 99px;
            left: 187px;
            z-index: 1;
        }
        .auto-style7 {
            position: absolute;
            top: 96px;
            left: 387px;
            z-index: 1;
        }
        .auto-style8 {
            position: absolute;
            top: 98px;
            left: 598px;
            z-index: 1;
        }
        .auto-style9 {
            position: absolute;
            top: 97px;
            left: 801px;
            z-index: 1;
        }
        .auto-style10 {
            position: absolute;
            top: 94px;
            left: 995px;
            z-index: 1;
        }
        .auto-style11 {
            position: absolute;
            top: 149px;
            left: 11px;
            z-index: 1;
        }
        .auto-style12 {
            position: absolute;
            top: 150px;
            left: 288px;
            z-index: 1;
        }
        .auto-style13 {
            position: absolute;
            top: 151px;
            left: 589px;
            z-index: 1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Sports Association Manager<br />
            <asp:TextBox ID="guestClubNameAddNewMatch" placeholder="Guest Name" runat="server" CssClass="auto-style2"></asp:TextBox>
            <asp:TextBox ID="startTimeAddNewMatch" placeholder="Start Time" runat="server" CssClass="auto-style3"></asp:TextBox>
            <asp:TextBox ID="endTimeAddNewMatch" placeholder="End Time" runat="server" CssClass="auto-style4"></asp:TextBox>
            <asp:Button ID="addNewMatch" runat="server" CssClass="auto-style5" Text="add New Match" OnClick="addNewMatch_Click" />
            <br />
        </div>
        ADD NEW MATCH
        <asp:TextBox ID="hostClubNameAddNewMatch" placeholder="Host Name" runat="server" CssClass="auto-style1"></asp:TextBox>
        <br />
        <asp:TextBox ID="hostClubNameDeleteMatch" placeholder="Host Name" runat="server" CssClass="auto-style6"></asp:TextBox>
        <asp:TextBox ID="guestClubNameDeleteMatch" placeholder="Guest Name" runat="server" CssClass="auto-style7"></asp:TextBox>
        <asp:TextBox ID="startTimeDeleteMatch" runat="server" placeholder="Start Time" CssClass="auto-style8"></asp:TextBox>
        <asp:TextBox ID="endTimeDeleteMatch" runat="server" placeholder="End Time" CssClass="auto-style9"></asp:TextBox>
        <asp:Button ID="deleteMatch" runat="server" CssClass="auto-style10" Text="Delete Match" OnClick="deleteMatch_Click" />
        <br />
        <asp:Button ID="viewAllUpcomingMatches" runat="server" CssClass="auto-style11" Text="View All upcoming matches" OnClick="viewAllUpcomingMatches_Click" />
        <br />
        DELETE MATCH<asp:Button ID="viewAlreadyPlayedMatches" runat="server" CssClass="auto-style12" Text="View already played matches" OnClick="viewAlreadyPlayedMatches_Click1" />
        <br />
        <asp:Button ID="viewClubsNeverPlayerTogether" runat="server" CssClass="auto-style13" Text="View pair of club names who never scheduled to play with each other" />
    </form>
</body>
</html>
