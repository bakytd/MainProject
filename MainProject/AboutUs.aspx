<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="MainProject.AboutUs" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>About Us - NetSmart</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

        * {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            box-sizing: border-box;
        }

        body {
            background-color: #121212;
            color: #ababab;
        }

        html {
            scroll-behavior: smooth;
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
            padding: 15px 0;
        }

        .logo {
            width: 200px;
        }

        .menu-icon {
            display: none;
            font-size: 28px;
            cursor: pointer;
            color: #fff;
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
                background-color: rgba(0, 0, 0, 0.95);
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

        #about {
            padding: 80px 0;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .about-col-1 {
            flex-basis: 35%;
            margin-bottom: 30px;
        }

        .about-col-1 img {
            width: 100%;
            border-radius: 15px;
        }

        .about-col-2 {
            flex-basis: 60%;
        }

        .sub-title {
            font-size: 60px;
            font-weight: 600;
            color: #ffffff;
        }

        .tab-skills {
            display: flex;
            margin: 20px 0 40px;
        }

        .tab-links {
            margin-right: 50px;
            font-size: 18px;
            font-weight: 500;
            cursor: pointer;
            position: relative;
            color: #fff;
        }

        .tab-links::after {
            content: '';
            width: 0;
            height: 3px;
            background: #FFD700;
            position: absolute;
            left: 0;
            bottom: -8px;
            transition: 0.5s;
        }

        .tab-links.active-link::after {
            width: 50%;
        }

        .tab-contents ul {
            padding-left: 20px;
        }

        .tab-contents ul li {
            list-style: none;
            margin: 10px 0;
        }

        .tab-contents ul li span {
            color: #FFD700;
            font-size: 14px;
            font-weight: bold;
            display: inline-block;
        }

        .tab-contents {
            display: none;
        }

        .tab-contents.active-tab {
            display: block;
        }

        @media (max-width: 768px) {
            .row {
                flex-direction: column;
            }

            .about-col-1,
            .about-col-2 {
                flex-basis: 100%;
            }

            .sub-title {
                font-size: 40px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <nav>
                <img src="img/logo.png" class="logo" />
                <span class="menu-icon" onclick="toggleMenu()">☰</span>
                <ul id="navLinks" runat="server">
                    <li><a href="MainPage.aspx">Home</a></li>
                    <li><a href="AboutUs.aspx">About</a></li>
                    <asp:PlaceHolder ID="phNotLoggedIn" runat="server">
                      
                    </asp:PlaceHolder>
                    <asp:PlaceHolder ID="phLoggedIn" runat="server" Visible="false">
                        <li class="user-icon">
                            <div class="user-initials" id="userInitials" runat="server"></div>
                            <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click" ForeColor="White" Style="text-decoration:none;">Logout</asp:LinkButton>
                        </li>
                    </asp:PlaceHolder>
                </ul>
            </nav>
        </div>

        <div id="about">
            <div class="container">
                <div class="row">
                    <div class="about-col-1">
                        <img src="img/AboutUs.jpg" class="photo-about" alt="About us photo">
                    </div>
                    <div class="about-col-2">
                        <h1 class="sub-title">About Us</h1>
                        <p>
                            Welcome to <strong>NetSmart</strong>, founded in 2025 with a mission to empower innovation in the digital age. We are a dynamic technology solutions provider that helps businesses embrace digital transformation through smart software, powerful data solutions, and future-ready platforms.
                            <br><br>
                            Our passion lies in building scalable, efficient, and human-centered systems that power everything from startups to global enterprises. With a strong commitment to integrity, inclusivity, and excellence, we strive to be more than just a tech provider—we’re your strategic partner in progress.
                            <br><br>
                            At NetSmart, we combine cutting-edge development with real-world strategy. Whether you're looking to automate operations, scale with cloud, or innovate with AI, we're here to elevate your potential.
                        </p>

                        <div class="tab-skills">
                            <p class="tab-links active-link" onclick="openTab('skills')">Skills</p>
                            <p class="tab-links" onclick="openTab('experience')">Experience</p>
                            <p class="tab-links" onclick="openTab('education')">Education</p>
                        </div>

                        <div class="tab-contents active-tab" id="skills">
                            <ul>
                                <li><span>Software Engineering:</span> Proficient in full-stack development and scalable architecture</li>
                                <li><span>Cloud Solutions:</span> AWS, Azure, and hybrid cloud integration</li>
                                <li><span>AI & Automation:</span> Implementing smart tools and data-driven systems</li>
                            </ul>
                        </div>

                        <div class="tab-contents" id="experience">
                            <ul>
                                <li><span>Enterprise Projects:</span> Delivered 5 enterprise-level solutions across industries</li>
                                <li><span>Tech Partnerships:</span> Collaborated with Fortune 5 clients and leading startups</li>
                                <li><span>Innovation Labs:</span> Developed award-winning prototypes and emerging tech platforms</li>
                            </ul>
                        </div>

                        <div class="tab-contents" id="education">
                            <ul>
                                <li><span>Certifications:</span> AWS Certified Solutions Architect, Microsoft Azure Developer, PMP</li>
                                <li><span>Training Programs:</span> In-house mentoring, leadership coaching, and cross-functional skill development</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script>
        function toggleMenu() {
            const nav = document.getElementById("navLinks");
            nav.classList.toggle("show");
        }

        function openTab(tabName) {
            let tabLinks = document.getElementsByClassName("tab-links");
            let tabContents = document.getElementsByClassName("tab-contents");

            for (let link of tabLinks) {
                link.classList.remove("active-link");
            }

            for (let content of tabContents) {
                content.classList.remove("active-tab");
            }

            event.currentTarget.classList.add("active-link");
            document.getElementById(tabName).classList.add("active-tab");
        }
    </script>
</body>
</html>
