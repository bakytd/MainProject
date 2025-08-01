<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeBehind="MainPage.aspx.cs" Inherits="MainProject.MainPage" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="Content/mainpage.css" />
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="hero">
        <div class="container">
            <div class="hero-text">
                <h1>Master the Digital World</h1>
                <p class="tagline">Smart. Safe. Strong.</p>
            </div>
        </div>
    </section>

    <asp:Panel ID="lessonSection" runat="server" Visible="false">
        <section class="lesson-background">
            <div class="container">
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
</asp:Content>