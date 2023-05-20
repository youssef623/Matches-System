<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FanRegister.aspx.cs" Inherits="DatabaseMilestone3.FanRegister" %>

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
            left: 759px;
            z-index: 1;
            width: 191px;
            height: 39px;
        }
        .auto-style5 {
            position: absolute;
            top: 54px;
            left: 980px;
            z-index: 1;
            width: 191px;
            height: 39px;
        }
        .auto-style6 {
            position: absolute;
            top: 54px;
            left: 1201px;
            z-index: 1;
            width: 191px;
            height: 39px;
        }
        .auto-style7 {
            position: absolute;
            top: 54px;
            left: 1421px;
            z-index: 1;
            width: 191px;
            height: 39px;
        }
        .auto-style8 {
            position: absolute;
            top: 130px;
            left: 710px;
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
            <asp:TextBox ID="nationalidnumber" runat="server" placeholder="national id number" CssClass="auto-style4"></asp:TextBox>
            <asp:TextBox ID="phonenumber" runat="server" placeholder="phone" CssClass="auto-style5"></asp:TextBox>
            <asp:TextBox ID="birthdate" runat="server" placeholder="Birth date" CssClass="auto-style6" Style="z-index: 1"></asp:TextBox>
            <asp:TextBox ID="address" runat="server" placeholder="Address" CssClass="auto-style7" Style="z-index: 1"></asp:TextBox>
            <asp:Button ID="Register" class="button-36" runat="server" CssClass="auto-style8" Text="Register" OnClick="Register_Click" />
        </div>
    </form>
</body>
</html>
