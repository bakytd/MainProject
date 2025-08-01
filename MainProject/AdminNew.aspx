<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminNew.aspx.cs" Inherits="MainProject.AdminNew" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Content/styles.css" />
    <link rel="stylesheet" href="Content/adminnew.css" />
</head>
<body>
    <form runat="server">
        <header>
            <h1>Admin Dashboard</h1>
            <asp:Label ID="lblTotalUsers" runat="server" CssClass="card" />
        </header>

        <!-- User Progress Table -->
        <div class="card">
            <h2>User Progress</h2>
            <asp:GridView ID="GridViewProgress" runat="server" AutoGenerateColumns="true"
                GridLines="None" BorderColor="#333"
                HeaderStyle-BackColor="#222"
                HeaderStyle-ForeColor="#FFD700"
                RowStyle-BackColor="#111"
                RowStyle-ForeColor="white" />
        </div>

        <!-- Lesson Completion Stats Table -->
        <div class="card">
            <h2>Lesson Completion Stats</h2>
            <asp:GridView ID="GridViewLessonStats" runat="server" AutoGenerateColumns="true"
                GridLines="None" BorderColor="#333"
                HeaderStyle-BackColor="#222"
                HeaderStyle-ForeColor="#FFD700"
                RowStyle-BackColor="#111"
                RowStyle-ForeColor="white" />
        </div>

        <!-- Hidden literals for JS charts -->
        <asp:Literal ID="litPieDataClient" runat="server" Visible="false" />
        <asp:Literal ID="litLessonLabelsClient" runat="server" Visible="false" />
        <asp:Literal ID="litLessonViewsClient" runat="server" Visible="false" />
        <asp:Literal ID="litCorrectIncorrectClient" runat="server" Visible="false" />

        <!-- Analytics Charts -->
        <h2>Analytics Charts</h2>
        <div class="chart-container">
            <div class="chart-card" onclick="toggleFullscreen(this)">
                <canvas id="pieChart"></canvas>
            </div>
            <div class="chart-card large-bar-chart" onclick="toggleFullscreen(this)">
                <canvas id="lessonBarChart"></canvas>
            </div>
            <div class="chart-card" onclick="toggleFullscreen(this)">
                <canvas id="correctChart"></canvas>
            </div>
        </div>

        <script>
            function toggleFullscreen(el) {
                el.classList.toggle("fullscreen");
            }

            window.onload = function () {
                const pieData = [<%= litPieDataClient.Text %>];
                const barLabels = [<%= litLessonLabelsClient.Text %>];
                const barData = [<%= litLessonViewsClient.Text %>];
                const correctData = [<%= litCorrectIncorrectClient.Text %>];

                new Chart(document.getElementById('pieChart'), {
                    type: 'pie',
                    data: {
                        labels: ['Active Users', 'Inactive Users'],
                        datasets: [{
                            data: pieData,
                            backgroundColor: ['#FFD700', '#555']
                        }]
                    },
                    options: {
                        plugins: {
                            legend: {
                                labels: { color: '#fff' }
                            }
                        }
                    }
                });

                new Chart(document.getElementById('correctChart'), {
                    type: 'doughnut',
                    data: {
                        labels: ['Correct', 'Incorrect'],
                        datasets: [{
                            data: correctData,
                            backgroundColor: ['#FFD700', '#8b0000']
                        }]
                    },
                    options: {
                        plugins: {
                            legend: {
                                labels: { color: '#fff' }
                            }
                        }
                    }
                });

                new Chart(document.getElementById('lessonBarChart'), {
                    type: 'bar',
                    data: {
                        labels: barLabels,
                        datasets: [{
                            label: 'Lesson Views',
                            data: barData,
                            backgroundColor: '#FFD700'
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        scales: {
                            y: {
                                beginAtZero: true,
                                ticks: { color: '#fff' },
                                grid: { color: '#444' }
                            },
                            x: {
                                ticks: { color: '#fff' },
                                grid: { color: '#444' }
                            }
                        },
                        plugins: {
                            legend: {
                                labels: { color: '#fff' }
                            }
                        }
                    }
                });
            };
        </script>
    </form>
</body>
</html>
