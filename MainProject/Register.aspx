<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
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

        .form-container input, .form-container select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            background: #111;
            border: 1px solid #ff004f;
            color: white;
            border-radius: 8px;
        }

        .form-container input[type=submit], .form-container input[type=button], .form-container .aspNet-Button {
            background: #ff004f;
            color: white;
            border: none;
            cursor: pointer;
            transition: 0.3s;
        }

        .form-container input[type=submit]:hover {
            background: #ff3366;
        }

        .error {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="form-container">
        <h2>Register</h2>

        <asp:Label ID="errMsg" runat="server" CssClass="error" Visible="false" />

        <label>Gender:</label>
        <asp:DropDownList ID="gender" runat="server">
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
        </asp:DropDownList>

        <label>Country:</label>
        <asp:TextBox ID="country" runat="server" />

        <label>Email:</label>
        <asp:TextBox ID="email" runat="server" TextMode="Email" />

        <label>Username:</label>
        <asp:TextBox ID="username" runat="server" />

        <label>Password:</label>
        <asp:TextBox ID="pwd" runat="server" TextMode="Password" />

        <label>Confirm Password:</label>
        <asp:TextBox ID="pwd0" runat="server" TextMode="Password" />
        <asp:CompareValidator ID="cv1" runat="server" ControlToCompare="pwd" ControlToValidate="pwd0"
            ErrorMessage="Passwords do not match!" ForeColor="Red" Display="Dynamic" />

        <label>Admin Key (optional):</label>
        <asp:TextBox ID="adminKey" runat="server" TextMode="Password" />

        <br /><br />
        <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
    </form>
</body>
</html>
