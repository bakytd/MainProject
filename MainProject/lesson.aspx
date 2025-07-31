<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lesson.aspx.cs" Inherits="WebApplication1.lesson" %>

<!DOCTYPE html>
<html>
<head>
    <title>Lesson</title>
    <style>
        body {
            background: #0d0d0d;
            color: #f0f0f0;
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 60px 10vw;
            box-sizing: border-box;
        }

        h2 {
            text-align: center;
            color: #ffd700;
            font-size: 32px;
            margin-bottom: 30px;
        }

        video {
            display: block;
            width: 100%;
            max-width: 900px;
            margin: 0 auto 40px auto;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(255, 215, 0, 0.3);
        }

        .question-block {
            margin-top: 50px;
            background: rgba(255, 255, 255, 0.05);
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(255, 215, 0, 0.1);
        }

        .question-block label {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 10px;
            display: block;
            color: #ffd700;
        }

        .aspNetRadioButtonList input[type="radio"] {
            display: none;
        }

        .aspNetRadioButtonList label {
            display: block;
            background-color: #1c1c1c;
            border: 2px solid #ffd700;
            color: #ffd700;
            padding: 10px 15px;
            margin-bottom: 10px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        .aspNetRadioButtonList input[type="radio"]:checked + label {
            background-color: #ffd700;
            color: #000;
        }

        .nav-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 60px;
            flex-wrap: wrap;
        }

        .btn {
            padding: 12px 25px;
            background-color: #ffd700;
            color: #000;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: 0.3s ease;
        }

        .btn:hover {
            background-color: #ffea00;
        }

        .feedback {
            margin-top: 30px;
            text-align: center;
            font-size: 18px;
            color: #ff4f4f;
            font-weight: bold;
        }
    </style>
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
