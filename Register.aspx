<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="DatabaseMilestone3.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .button {
  
}
        .auto-style1 {
            position: absolute;
            top: 158px;
            left: 156px;
            z-index: 1;
            width: 81px;
            height: 39px;
        }
        .auto-style3 {
            position: absolute;
            top: 158px;
            left: 280px;
            z-index: 1;
            width: 191px;
            height: 39px;
        }
        .auto-style4 {
            position: absolute;
            top: 158px;
            left: 520px;
            z-index: 1;
            width: 191px;
            height: 39px;
        }
        .auto-style5 {
            position: absolute;
            top: 159px;
            left: 750px;
            z-index: 1;
            width: 138px;
            height: 39px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="FanRegister" runat="server" CssClass="auto-style1" Text="Fan" BorderWidth="3px" OnClick="FanRegister_Click" />
        </div>
        <asp:Button ID="SportsAssociationManagerRegister" runat="server" CssClass="auto-style3" Text="Sports Association Manager" BorderWidth="3px" OnClick="SportsAssociationManagerRegister_Click" />
        <asp:Button ID="ClubRepresentativeRegister" runat="server" CssClass="auto-style4" Text="Club Representative" BorderWidth="3px" OnClick="ClubRepresentativeRegister_Click" />
        <asp:Button ID="StadiumManagerRegister" runat="server" CssClass="auto-style5" Text="Stadium Manager" BorderWidth="3px" OnClick="StadiumManagerRegister_Click" />
    </form>
</body>
</html>
