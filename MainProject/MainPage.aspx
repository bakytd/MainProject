<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="MainProject.WebForm1" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Main Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            background: #000000;
            color: #ffffff;
        }

        #header {
            width: 100%;
            height: 100vh;
            position: relative;
            background-size: cover;
            background-position: center;
        }

        .container {
            padding: 5px 10%;
            position: relative;
            z-index: 2;
        }

        nav {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .logo {
            width: 200px;
        }

        .menu-icon {
            display: none;
            font-size: 28px;
            cursor: pointer;
        }

        nav ul {
            list-style: none;
            display: flex;
        }

            nav ul li {
                margin: 10px 20px;
            }

                nav ul li a {
                    color: #ffffff;
                    text-decoration: none;
                    font-size: 18px;
                    position: relative;
                }

                    nav ul li a::after {
                        content: '';
                        width: 0;
                        height: 3px;
                        background: #FFD700;
                        position: absolute;
                        left: 0;
                        bottom: -6px;
                        transition: 0.5s;
                    }

                    nav ul li a:hover::after {
                        width: 100%;
                    }

        .header-text {
            margin-top: 20%;
            font-size: 20px;
        }

            .header-text h1 {
                font-size: 60px;
                margin-top: 20px;
            }

                .header-text h1 span {
                    color: #FFD700;
                }

        .user-icon {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .user-initials {
            background: #FFD700;
            border-radius: 50%;
            width: 30px;
            height: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
        }

        @media screen and (max-width: 768px) {
            .menu-icon {
                display: block;
            }

            nav ul {
                display: none;
                flex-direction: column;
                background-color: rgba(0, 0, 0, 0.9);
                position: absolute;
                top: 60px;
                right: 10%;
                padding: 20px;
                border-radius: 10px;
            }

                nav ul.show {
                    display: flex;
                }

                nav ul li {
                    margin: 10px 0;
                }
        }

        .lesson-background {
            width: 100%;
            min-height: 100vh;
            background-color: black;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container1 {
            padding: 80px 10%;
            position: relative;
            z-index: 2;
        }

            .container1 h2 {
                font-size: 36px;
                color: #FFD700;
                text-align: center;
                margin-bottom: 40px;
            }

        .lesson-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .lesson-card {
            background-color: #111;
            border: 1px solid #FFD700;
            border-radius: 12px;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s, background-color 0.3s;
            color: #FFD700;
            font-size: 18px;
            font-weight: 500;
            text-decoration: none;
        }

            .lesson-card:hover {
                transform: translateY(-5px);
                background-color: #FFD700;
                color: #000;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="header">
            <div class="container">
                <nav>
                    <img src="img/logo.png" class="logo" />
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
                                <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click" ForeColor="White" Style="text-decoration: none;">Logout</asp:LinkButton>
                            </li>
                        </asp:PlaceHolder>
                    </ul>
                </nav>

                <div class="header-text">
                    <h1>Master the Digital World.<br />
                        <span>Smart. Safe. Strong.</span></h1>
                </div>
            </div>
        </div>

        <asp:Panel ID="lessonSection" runat="server" Visible="false">
            <div class="lesson-background">
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
            </div>
        </asp:Panel>

    </form>

    <script>
        function toggleMenu() {
            const nav = document.getElementById("navLinks");
            nav.classList.toggle("show");
        }
    </script>
</body>
</html>
