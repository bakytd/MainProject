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
            background: #000; /* Black background */
            color: #fff;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-container {
            background: rgba(0, 0, 0, 0.85);
            padding: 40px 35px;
            border-radius: 20px;
            box-shadow: 0 0 25px gold;
            width: 100%;
            max-width: 400px;
        }

        h2 {
            text-align: center;
            color: gold;
            margin-bottom: 30px;
            font-size: 28px;
        }

        label {
            display: block;
            margin: 15px 0 5px;
            font-weight: 500;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            background: #111;
            border: 1px solid gold;
            color: white;
            border-radius: 8px;
            box-sizing: border-box;
        }

        .btn {
            width: 100%;
            background: gold;
            color: black;
            border: none;
            border-radius: 8px;
            padding: 12px;
            margin-top: 20px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .btn:hover {
            background: #ffd700;
        }

        .error {
            color: red;
            margin-top: 10px;
            text-align: center;
        }

        .register-link {
            margin-top: 20px;
            text-align: center;
            font-size: 14px;
            color: #cccccc;
        }

        .register-link a {
            color: gold;
            text-decoration: none;
            font-weight: 500;
        }

        .register-link a:hover {
            color: white;
            text-decoration: underline;
        }
    </style>
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




