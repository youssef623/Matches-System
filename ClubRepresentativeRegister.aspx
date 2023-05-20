<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClubRepresentativeRegister.aspx.cs" Inherits="DatabaseMilestone3.ClubRepresentativeRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 54px;
            left: 45px;
            z-index: 1;
            width: 191px;
            height: 39px;
        }
        .auto-style2 {
            position: absolute;
            top: 54px;
            left: 281px;
            z-index: 1;
            width: 191px;
            height: 39px;
        }
        .auto-style3 {
            position: absolute;
            top: 54px;
            left: 520px;
            z-index: 1;
            width: 191px;
            height: 39px;
        }
        .auto-style4 {
            position: absolute;
            top: 54px;
            left: 740px;
            z-index: 1;
            width: 191px;
            height: 39px;
        }
        .auto-style8 {
            position: absolute;
            top: 130px;
            left: 350px;
            z-index: 1;
            width: 191px;
            height: 39px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="Name" runat="server" placeholder="NAME" CssClass="auto-style1"></asp:TextBox>
            <asp:TextBox ID="Username" runat="server" placeholder="Username" CssClass="auto-style2"></asp:TextBox>
            <asp:TextBox ID="password" runat="server" placeholder="password" CssClass="auto-style3"></asp:TextBox>
            <asp:TextBox ID="CLUBNAME" runat="server" placeholder="CLUB NAME" CssClass="auto-style4"></asp:TextBox>
            <asp:Button ID="Register" runat="server" CssClass="auto-style8" Text="Register" OnClick="Register_Click"/>
        </div>
    </form>
</body>
</html>
