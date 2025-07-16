<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: black;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background: rgba(0, 0, 0, 0.8);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 15px #ff004f;
            width: 400px;
        }

        .form-container h2 {
            color: #ff004f;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-container label {
            display: block;
            margin-top: 10px;
        }

        .form-container input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            background: #111;
            border: 1px solid #ff004f;
            color: white;
            border-radius: 8px;
        }

        .form-container .btn {
            background: #ff004f;
            color: white;
            border: none;
            cursor: pointer;
            transition: 0.3s;
            margin-top: 15px;
        }

        .form-container .btn:hover {
            background: #ff3366;
        }

        .error {
            color: red;
            margin-top: 10px;
        }

        .register-link {
            margin-top: 15px;
            color: #999;
            text-align: center;
            display: block;
        }

        .register-link a {
            color: #ff004f;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="form-container">
        <h2>Login</h2>

        <asp:Label ID="lblError" runat="server" CssClass="error" Visible="false" />

        <label>Username:</label>
        <asp:TextBox ID="username" runat="server" />

        <label>Password:</label>
        <asp:TextBox ID="password" runat="server" TextMode="Password" />

        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />

        <div class="register-link">
            Don't have an account? <a href="register.aspx">Register here</a>
        </div>
    </form>
</body>
</html>
