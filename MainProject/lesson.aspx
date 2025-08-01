<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lesson.aspx.cs" Inherits="WebApplication1.lesson" %>

<!DOCTYPE html>
<html>
<head>
    <title>Lesson</title>
    <link rel="stylesheet" href="Content/styles.css" />
    <link rel="stylesheet" href="Content/lesson.css" />
</head>
<body>
    <form runat="server">
        <h2><asp:Label ID="lblTitle" runat="server" /></h2>
        <video controls runat="server" id="lessonVideo" />
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
        <div style="text-align:center; margin-top: 30px;">
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
    </form>
</body>
</html>
