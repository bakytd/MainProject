<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="WebApplication1.home" %>

<!DOCTYPE html>
<html>
<head>
    <title>Digital Literacy Lessons</title>
    <style>
        body {
            background: #000;
            color: #fff;
            font-family: 'Poppins', sans-serif;
            text-align: center;
            padding: 20px;
        }

        .lesson-box {
            background: #111;
            margin: 10px;
            padding: 20px;
            border-radius: 10px;
            border: 1px solid #ff004f;
        }

        a.lesson-link {
            color: #ff004f;
            text-decoration: none;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <h1>Welcome, <%= Session["username"] %>!</h1>
    <h2>Digital Literacy Course</h2>

    <div id="lessons">
        <asp:Repeater ID="LessonRepeater" runat="server">
            <ItemTemplate>
                <div class="lesson-box">
                    <h3><%# Eval("Title") %></h3>
                    <a class="lesson-link" href='lesson.aspx?id=<%# Eval("LessonId") %>'>Start Lesson</a>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</body>
</html>
