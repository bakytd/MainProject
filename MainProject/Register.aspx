<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link rel="stylesheet" href="Content/styles.css" />
    <link rel="stylesheet" href="Content/register.css" />
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
