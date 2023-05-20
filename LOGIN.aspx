<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LOGIN.aspx.cs" Inherits="DatabaseMilestone3.LOGIN" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 74px;
            left: 128px;
            z-index: 1;
            margin-top: 0px;
        }
        .auto-style3 {
            position: absolute;
            top: 126px;
            left: 320px;
            z-index: 1;
            height: 25px;
        }
        .auto-style4 {
            position: absolute;
            top: 130px;
            left: 129px;
            z-index: 1;
        }
        .auto-style5 {
            position: absolute;
            top: 183px;
            left: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            LOGIN PAGE<br />
        </div>
        <asp:TextBox ID="USERNAME" runat="server" CssClass="auto-style1"></asp:TextBox>
        <asp:Button ID="SIGNIN" runat="server" CssClass="auto-style3" Text="SIGN IN" OnClick="SIGNIN_Click1" />
        <br />
        <br />
        <br />
        USERNAME<br />
        <br />
        <asp:Button ID="Register" runat="server" CssClass="auto-style5" style="z-index: 1" Text="Register" OnClick="Register_Click" />
        <br />
        PASSWORD<asp:TextBox ID="PASSWORD" runat="server" CssClass="auto-style4"></asp:TextBox>
    </form>
</body>
</html>
