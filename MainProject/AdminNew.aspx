<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminNew.aspx.cs" Inherits="MainProject.AdminNew" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #0d0d0d;
            color: #ffffff;
            padding: 30px 5vw;
        }

        header {
            margin-bottom: 40px;
        }

        h1 {
            font-size: 2.5rem;
            color: #FFD700;
            margin-bottom: 10px;
        }

        h2 {
            font-size: 1.5rem;
            margin-top: 40px;
            margin-bottom: 15px;
            color: #e6c200;
        }

        .card {
            background-color: #111;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(255, 215, 0, 0.1);
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #333;
        }

        th {
            background-color: #222;
            color: #FFD700;
        }

        td {
            color: #eee;
        }

        .chart-container {
            display: flex;
            flex-wrap: wrap;
            gap: 2rem;
            margin-top: 30px;
        }

        .chart-card {
            background: #1a1a1a;
            padding: 20px;
            border-radius: 10px;
            flex: 1 1 300px;
            box-shadow: 0 4px 12px rgba(255, 215, 0, 0.15);
            transition: transform 0.2s ease;
            cursor: pointer;
        }

        .chart-card:hover {
            transform: scale(1.02);
        }

        canvas {
            width: 100% !important;
            height: auto !important;
        }

        .large-bar-chart canvas {
            height: 400px !important;
        }

        .nav-button {
            display: inline-block;
            margin-top: 25px;
            background: #FFD700;
            padding: 10px 25px;
            border: none;
            border-radius: 8px;
            color: #000;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .nav-button:hover {
            background-color: #e6c200;
        }

        .fullscreen {
            position: fixed !important;
            top: 0;
            left: 0;
            width: 100vw !important;
            height: 100vh !important;
            background: #000;
            z-index: 9999;
            padding: 40px;
            box-sizing: border-box;
            overflow: auto;
        }
    </style>
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
