<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link rel="stylesheet" href="Content/styles.css" />
    <link rel="stylesheet" href="Content/login.css" />
</head>
<body>
    <form id="form1" runat="server" class="form-container">
        <h2>Login</h2>

        <asp:Label ID="lblError" runat="server" CssClass="error" Visible="false" />

        <label for="username">Username</label>
        <asp:TextBox ID="username" runat="server" CssClass="input" />

        <label for="password">Password</label>
        <asp:TextBox ID="password" runat="server" CssClass="input" TextMode="Password" />

        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />

        <div class="register-link">
            Don't have an account? <a href="register.aspx">Register here</a>
        </div>
    </form>
</body>
</html>




