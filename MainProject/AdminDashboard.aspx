<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="WebApplication1.AdminDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
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

        .admin-box {
            background: rgba(0, 0, 0, 0.85);
            padding: 40px;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 0 15px #ff004f;
        }

        .admin-box h1 {
            color: #ff004f;
            margin-bottom: 20px;
        }

        .admin-box p {
            font-size: 18px;
        }

        .admin-box a {
            display: inline-block;
            margin-top: 20px;
            color: white;
            text-decoration: none;
            background: #ff004f;
            padding: 10px 20px;
            border-radius: 10px;
            transition: 0.3s;
        }

        .admin-box a:hover {
            background: #ff3366;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="admin-box">
            <h1>Welcome, Admin!</h1>
            <p>You are logged in as an administrator.</p>
            <a href="MainPage.aspx">Go to Main Page</a>
        </div>
    </form>
</body>
</html>
