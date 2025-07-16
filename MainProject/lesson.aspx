<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lesson.aspx.cs" Inherits="WebApplication1.lesson" %>

<!DOCTYPE html>
<html>
<head>
    <title>Lesson</title>
    <style>
        body {
            background: #000;
            color: #fff;
            font-family: 'Poppins', sans-serif;
            padding: 20px;
        }

        video {
            width: 80%;
            max-height: 400px;
        }

        .question-block {
            margin-top: 20px;
        }

        input, button {
            margin-top: 10px;
            padding: 10px;
        }

        .feedback {
            margin-top: 10px;
            color: #ff004f;
        }

        .nav-buttons {
            margin-top: 20px;
        }

        .nav-buttons asp\:button {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <form runat="server">
        <h2><asp:Label ID="lblTitle" runat="server" /></h2>
        <video controls runat="server" id="lessonVideo" />

        <!-- Question 1 -->
        <div class="question-block">
            <asp:Label ID="lblQ1" runat="server" /><br />
            <asp:RadioButtonList ID="rblQ1" runat="server" RepeatDirection="Vertical" />
        </div>

        <!-- Question 2 -->
        <div class="question-block">
            <asp:Label ID="lblQ2" runat="server" /><br />
            <asp:RadioButtonList ID="rblQ2" runat="server" RepeatDirection="Vertical" />
        </div>

        <!-- Question 3 -->
        <div class="question-block">
            <asp:Label ID="lblQ3" runat="server" /><br />
            <asp:RadioButtonList ID="rblQ3" runat="server" RepeatDirection="Vertical" />
        </div>

        <!-- Submit and Feedback -->
        <asp:Button ID="btnSubmit" runat="server" Text="Submit Answers" OnClick="btnSubmit_Click" /><br />
        <asp:Label ID="lblFeedback" runat="server" CssClass="feedback" />

        <!-- Navigation -->
        <div class="nav-buttons">
            <asp:Button ID="btnPrev" runat="server" Text="◀ Previous Lesson" OnClick="btnPrev_Click" />
            <asp:Button ID="btnNext" runat="server" Text="Next Lesson ▶" OnClick="btnNext_Click" />
            <asp:Button ID="btnHome" runat="server" Text="🏠 Main Menu" OnClick="btnHome_Click" />
        </div>
    </form>
</body>
</html>
