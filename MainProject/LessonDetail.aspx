<%@ Page Title="Lesson" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeBehind="LessonDetail.aspx.cs" Inherits="MainProject.LessonDetail" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="Content/lesson.css" />
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="lesson-container">
        <h2><asp:Label ID="lblTitle" runat="server" /></h2>
        
        <video controls runat="server" id="lessonVideo" class="lesson-video"></video>
        
        <!-- Question 1 -->
        <div class="question-block">
            <label><asp:Label ID="lblQ1" runat="server" /></label>
            <div class="aspNetRadioButtonList">
                <asp:RadioButtonList ID="rblQ1" runat="server" RepeatDirection="Vertical"
                    CssClass="radioList" RepeatLayout="Flow" />
            </div>
        </div>
        
        <!-- Question 2 -->
        <div class="question-block">
            <label><asp:Label ID="lblQ2" runat="server" /></label>
            <div class="aspNetRadioButtonList">
                <asp:RadioButtonList ID="rblQ2" runat="server" RepeatDirection="Vertical"
                    CssClass="radioList" RepeatLayout="Flow" />
            </div>
        </div>
        
        <!-- Question 3 -->
        <div class="question-block">
            <label><asp:Label ID="lblQ3" runat="server" /></label>
            <div class="aspNetRadioButtonList">
                <asp:RadioButtonList ID="rblQ3" runat="server" RepeatDirection="Vertical"
                    CssClass="radioList" RepeatLayout="Flow" />
            </div>
        </div>
        
        <!-- Submit Button -->
        <div class="submit-section">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Answers" CssClass="btn" OnClick="btnSubmit_Click" />
        </div>
        
        <!-- Feedback Message -->
        <asp:Label ID="lblFeedback" runat="server" CssClass="feedback" />
        
        <!-- Navigation -->
        <div class="nav-buttons">
            <asp:Button ID="btnPrev" runat="server" Text="◀ Previous Lesson" CssClass="btn" OnClick="btnPrev_Click" />
            <asp:Button ID="btnHome" runat="server" Text="🏠 Main Menu" CssClass="btn" OnClick="btnHome_Click" />
            <asp:Button ID="btnNext" runat="server" Text="Next Lesson ▶" CssClass="btn" OnClick="btnNext_Click" />
        </div>
    </div>
</asp:Content>