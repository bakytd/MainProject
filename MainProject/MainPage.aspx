<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="MainProject.WebForm1" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">

    <meta charset="utf-8" />
    <title>NetSmart - Digital Literacy Platform</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    

    <link rel="stylesheet" href="Content/styles.css" />
    <link rel="stylesheet" href="Content/mainpage.css" />
</head>

<body>
    <form id="form1" runat="server">

        <header id="header">
            <div class="container">
                <nav>
                    <img src="img/logo.png" class="logo" alt="NetSmart Logo" />
                    
                    <!-- Mobile menu toggle -->
                    <span class="menu-icon" onclick="toggleMenu()">☰</span>
                    
                    <ul id="navLinks" runat="server">
                        <li><a href="MainPage.aspx">Home</a></li>
                        <li><a href="AboutUs.aspx">About</a></li>
                        

                        <asp:PlaceHolder ID="phNotLoggedIn" runat="server">
                            <li><a href="Login.aspx">Login</a></li>
                        </asp:PlaceHolder>
                        
                        <asp:PlaceHolder ID="phLoggedIn" runat="server" Visible="false">
                            <li class="user-icon">
                                <div class="user-initials" id="userInitials" runat="server"></div>
                                <asp:LinkButton ID="btnLogout" runat="server" 
                                    OnClick="btnLogout_Click" 
                                    ForeColor="White" 
                                    Style="text-decoration: none;">
                                    Logout
                                </asp:LinkButton>
                            </li>
                        </asp:PlaceHolder>
                    </ul>
                </nav>
                

                <div class="header-text">
                    <h1>Master the Digital World.<br />
                        <span>Smart. Safe. Strong.</span>
                    </h1>
                </div>
            </div>
        </header>


        <asp:Panel ID="lessonSection" runat="server" Visible="false">
            <section class="lesson-background">
                <div class="container1">
                    <h2>Your Lessons</h2>
                    

                    <div class="lesson-grid">
                        <asp:Repeater ID="lessonRepeater" runat="server">
                            <ItemTemplate>
                                <a class="lesson-card" href='<%# "lesson.aspx?id=" + Eval("LessonId") %>'>
                                    <%# Eval("Title") %>
                                </a>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </section>
        </asp:Panel>
    </form>


    <script>
        // Toggle mobile menu visibility
        function toggleMenu() {
            const nav = document.getElementById("navLinks");
            nav.classList.toggle("show");
        }
    </script>
</body>
</html>