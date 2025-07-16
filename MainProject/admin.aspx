<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="WebApplication1.admin" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel</title>
    <style>
        body {
            background: #000;
            color: #fff;
            font-family: 'Poppins', sans-serif;
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #111;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #333;
        }

        th {
            background-color: #222;
            color: #ff004f;
        }

        h1, h2 {
            color: #ff004f;
        }

        .nav-button {
            background-color: #ff004f;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form runat="server">
        <h1>Admin Panel</h1>
        <h2>Total Users: <asp:Label ID="lblTotalUsers" runat="server" /></h2>

        <h2>User Progress:</h2>
        <asp:GridView ID="GridViewProgress" runat="server" AutoGenerateColumns="true"
                      GridLines="None" BorderColor="#333"
                      HeaderStyle-BackColor="#222"
                      HeaderStyle-ForeColor="#ff004f"
                      RowStyle-BackColor="#111"
                      RowStyle-ForeColor="white" />

        <h2>Lesson Completion Stats:</h2>
        <asp:GridView ID="GridViewLessonStats" runat="server" AutoGenerateColumns="true"
                      GridLines="None" BorderColor="#333"
                      HeaderStyle-BackColor="#222"
                      HeaderStyle-ForeColor="#ff004f"
                      RowStyle-BackColor="#111"
                      RowStyle-ForeColor="white" />

        <h2>User Answers:</h2>
        <asp:GridView ID="GridViewUserAnswers" runat="server" AutoGenerateColumns="true"
                      GridLines="None" BorderColor="#333"
                      HeaderStyle-BackColor="#222"
                      HeaderStyle-ForeColor="#ff004f"
                      RowStyle-BackColor="#111"
                      RowStyle-ForeColor="white" />

        <asp:Button ID="btnGoToStats" runat="server" Text="View Charts" CssClass="nav-button" OnClick="btnGoToStats_Click" />
    </form>
</body>
</html>
