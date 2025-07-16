<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminStats.aspx.cs" Inherits="WebApplication1.adminStats" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Statistics</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body { background: #000; color: #fff; font-family: 'Poppins', sans-serif; padding: 20px; }
        h1 { color: #ff004f; text-align: center; }
        .chart-container { display: flex; flex-wrap: wrap; justify-content: space-around; gap: 30px; margin-top: 30px; }
        canvas { background: #111; padding: 20px; border-radius: 10px; }
    </style>
</head>
<body>
    <form runat="server">
        <h1>Admin Analytics Dashboard</h1>

        <asp:Literal ID="litPieDataClient" runat="server" Visible="false" />
        <asp:Literal ID="litLessonLabelsClient" runat="server" Visible="false" />
        <asp:Literal ID="litLessonViewsClient" runat="server" Visible="false" />
        <asp:Literal ID="litCorrectIncorrectClient" runat="server" Visible="false" />

        <div class="chart-container">
            <canvas id="pieChart" width="350" height="350"></canvas>
            <canvas id="lessonBarChart" width="350" height="350"></canvas>
            <canvas id="correctChart" width="350" height="350"></canvas>
        </div>

        <script>
            const pieData = [<%= litPieDataClient.Text %>];
            const barLabels = [<%= litLessonLabelsClient.Text %>];
            const barData = [<%= litLessonViewsClient.Text %>];
            const correctData = [<%= litCorrectIncorrectClient.Text %>];

            new Chart(document.getElementById('pieChart'), {
                type: 'pie',
                data: { labels: ['Active Users', 'Inactive Users'], datasets: [{ data: pieData, backgroundColor: ['#4CAF50', '#F44336'] }] }
            });

            new Chart(document.getElementById('lessonBarChart'), {
                type: 'bar',
                data: { labels: barLabels, datasets: [{ label: 'Lesson Views', data: barData, backgroundColor: '#2196F3' }] },
                options: { scales: { y: { beginAtZero: true } } }
            });

            new Chart(document.getElementById('correctChart'), {
                type: 'doughnut',
                data: { labels: ['Correct', 'Incorrect'], datasets: [{ data: correctData, backgroundColor: ['#00e676', '#ff1744'] }] }
            });
        </script>
    </form>
</body>
</html>
