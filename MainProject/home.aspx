<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="WebApplication1.home" %>

<!DOCTYPE html>
<html>
<head>
    <title>Digital Literacy Lessons</title>
    <link rel="stylesheet" href="Content/styles.css" />
    <link rel="stylesheet" href="Content/home.css" />
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
