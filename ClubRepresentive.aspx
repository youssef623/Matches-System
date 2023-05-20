<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClubRepresentive.aspx.cs" Inherits="DatabaseMilestone3.ClubRepresentive" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            position: absolute;
            top: 223px;
            left: 26px;
            z-index: 1;
            width: 124px;
            height: 43px;
        }
        
        .auto-style3 {
            position: absolute;
            top: 153px;
            left: 231px;
            z-index: 1;
            width: 168px;
            height: 20px;
        }
        
        .auto-style4 {
            position: absolute;
            top: 153px;
            left: 22px;
            z-index: 1;
            width: 168px;
            height: 20px;
        }
        
        .auto-style5 {
            position: absolute;
            top: 82px;
            left: 25px;
            z-index: 1;
            width: 163px;
        }
        
        .auto-style6 {
            position: absolute;
            top: 83px;
            left: 262px;
            z-index: 1;
        }
        
        .auto-style7 {
            position: absolute;
            top: 81px;
            left: 486px;
            z-index: 1;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="upcomingMatches" runat="server" CssClass="auto-style2" Text="upcoming Matches" OnClick="upcomingMatches_Click" />
            <asp:Button ID="availablestadiums" runat="server" CssClass="auto-style3" Text=" view available stadiums" OnClick="availablestadiums_Click" />
            <asp:TextBox ID="dateViewAvailablestadiums" placeholder="date" runat="server" CssClass="auto-style4"></asp:TextBox>
            <asp:TextBox ID="stadiumname" runat="server" placeholder="Stadium Name" CssClass="auto-style5"></asp:TextBox>
            <asp:TextBox ID="date" runat="server" placeholder="date of the match" CssClass="auto-style6"></asp:TextBox>
            <asp:Button ID="sendRequest" runat="server" CssClass="auto-style7" Text="Send Request" OnClick="sendRequest_Click" />
        </div>
    </form>
</body>
</html>
