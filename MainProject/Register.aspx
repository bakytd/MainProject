<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

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
            background: rgba(0, 0, 0, 0.85);
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 0 20px gold;
            width: 400px;
        }

        .form-container h2 {
            color: gold;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
        }

        .form-container input,
        .form-container select {
            width: 100%;
            padding: 10px;
            background: #111;
            border: 1px solid gold;
            color: white;
            border-radius: 8px;
            box-sizing: border-box;
        }

        .form-container input[type=submit],
        .form-container input[type=button],
        .form-container .aspNet-Button {
            background: gold;
            color: black;
            border: none;
            cursor: pointer;
            transition: 0.3s;
            font-weight: bold;
            border-radius: 8px;
        }

        .form-container input[type=submit]:hover,
        .form-container input[type=button]:hover,
        .form-container .aspNet-Button:hover {
            background: #ffd700;
        }

        .error, .aspNet-Validator {
            color: red;
            font-size: 0.9em;
            display: block;
            margin-top: 5px;
        }

        .form-container .submit-wrapper {
            margin-top: 25px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="form-container">
        <h2>Register</h2>

        <asp:Label ID="errMsg" runat="server" CssClass="error" Visible="false" />

        <div class="form-group">
            <label for="gender">Gender:</label>
            <asp:DropDownList ID="gender" runat="server">
                <asp:ListItem>Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label for="country">Country:</label>
            <asp:TextBox ID="country" runat="server" />
        </div>

        <div class="form-group">
            <label for="email">Email:</label>
            <asp:TextBox ID="email" runat="server" TextMode="Email" />
        </div>

        <div class="form-group">
            <label for="username">Username:</label>
            <asp:TextBox ID="username" runat="server" />
        </div>

        <div class="form-group">
            <label for="pwd">Password:</label>
            <asp:TextBox ID="pwd" runat="server" TextMode="Password" />
        </div>

        <div class="form-group">
            <label for="pwd0">Confirm Password:</label>
            <asp:TextBox ID="pwd0" runat="server" TextMode="Password" />
            <asp:CompareValidator ID="cv1" runat="server"
                ControlToCompare="pwd"
                ControlToValidate="pwd0"
                ErrorMessage="Passwords do not match!"
                CssClass="aspNet-Validator"
                Display="Dynamic"
                ForeColor="Red" />
        </div>

        <div class="form-group">
            <label for="adminKey">Admin Key (optional):</label>
            <asp:TextBox ID="adminKey" runat="server" TextMode="Password" />
        </div>

        <div class="submit-wrapper">
            <asp:Button ID="Button1" runat="server" Text="Register" CssClass="aspNet-Button" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
