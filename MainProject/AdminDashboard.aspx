<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/AdminMaster.Master"
    AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="MainProject.AdminDashboard" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <style>
        /* Base Styles */
        .admin-container {
            padding: 20px;
            font-family: 'Poppins', sans-serif;
            color: #fff;
        }

        /* Stats Cards */
        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            padding: 20px;
            display: flex;
            align-items: center;
            transition: transform 0.3s ease;
        }

            .stat-card:hover {
                transform: translateY(-5px);
                background: rgba(255, 255, 255, 0.15);
            }

        .stat-icon {
            font-size: 24px;
            color: #FFD700;
            margin-right: 15px;
        }

        .stat-content {
            display: flex;
            flex-direction: column;
        }

        .stat-value {
            font-size: 28px;
            font-weight: 700;
            color: #FFD700;
        }

        .stat-label {
            font-size: 14px;
            opacity: 0.8;
        }

        /* Charts Container */
        .charts-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
            gap: 20px;
        }

        .chart-card {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            padding: 20px;
        }

        .chart-title {
            margin-top: 0;
            margin-bottom: 15px;
            color: #FFD700;
        }

        canvas {
            width: 100% !important;
            height: 300px !important;
        }
    </style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="admin-container">
        <!-- Stats Cards Section -->
        <div class="stats-container">
            <div class="stats-container">
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <div class="stat-content">
                        <span class="stat-value">
                            <asp:Label ID="lblTotalUsers" runat="server" Text="0" /></span>
                        <span class="stat-label">Total Users</span>
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-check-circle"></i>
                    </div>
                    <div class="stat-content">
                        <span class="stat-value">
                            <asp:Label ID="lblActiveUsers" runat="server" Text="0" /></span>
                        <span class="stat-label">Active Users</span>
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-book"></i>
                    </div>
                    <div class="stat-content">
                        <span class="stat-value">
                            <asp:Label ID="lblLessonsCompleted" runat="server" Text="0" /></span>
                        <span class="stat-label">Lessons Completed</span>
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <div class="stat-content">
                        <span class="stat-value">
                            <asp:Label ID="lblAvgScore" runat="server" Text="0%" /></span>
                        <span class="stat-label">Avg. Score</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Charts Section -->
        <div class="charts-container">
            <div class="charts-container">
                <div class="chart-card">
                    <h3 class="chart-title">User Demographics</h3>
                    <canvas id="demographicsChart"></canvas>
                    <asp:Literal ID="litDemographicsData" runat="server" Visible="false" />
                </div>

                <div class="chart-card">
                    <h3 class="chart-title">Lesson Completion</h3>
                    <canvas id="completionChart"></canvas>
                    <asp:Literal ID="litCompletionData" runat="server" Visible="false" />
                </div>

                <div class="chart-card">
                    <h3 class="chart-title">Accuracy Trend</h3>
                    <canvas id="accuracyChart"></canvas>
                    <asp:Literal ID="litAccuracyData" runat="server" Visible="false" />
                </div>

                <div class="chart-card">
                    <h3 class="chart-title">Score Distribution</h3>
                    <canvas id="scoreChart"></canvas>
                    <asp:Literal ID="litScoreData" runat="server" Visible="false" />
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Initialize all charts
            initDemographicsChart();
            initCompletionChart();
            initAccuracyChart();
            initScoreChart();
        });

        function initDemographicsChart() {
            const data = JSON.parse('<%= litDemographicsData.Text %>');
            const labels = data.map(item => item.gender);
            const values = data.map(item => item.count);

            new Chart(document.getElementById('demographicsChart'), {
                type: 'doughnut',
                data: {
                    labels: labels,
                    datasets: [{
                        data: values,
                        backgroundColor: ['#36A2EB', '#FF6384', '#FFCE56', '#4BC0C0']
                    }]
                },
                options: getChartOptions('User Demographics')
            });
        }

        function initCompletionChart() {
            const data = JSON.parse('<%= litCompletionData.Text %>');
            const labels = data.map(item => item.Title);
            const values = data.map(item => item.count);

            new Chart(document.getElementById('completionChart'), {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Completions',
                        data: values,
                        backgroundColor: '#FFD700'
                    }]
                },
                options: getChartOptions('Lesson Completion', true)
            });
        }

        function initAccuracyChart() {
            const data = JSON.parse('<%= litAccuracyData.Text %>');
            const labels = data.map(item => item.Month);
            const values = data.map(item => item.Accuracy);

            new Chart(document.getElementById('accuracyChart'), {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Accuracy %',
                        data: values,
                        borderColor: '#4BC0C0',
                        fill: false
                    }]
                },
                options: getChartOptions('Accuracy Trend')
            });
        }

        function initScoreChart() {
            const data = JSON.parse('<%= litScoreData.Text %>');
            const labels = data.map(item => item.Range);
            const values = data.map(item => item.Count);

            new Chart(document.getElementById('scoreChart'), {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Users',
                        data: values,
                        backgroundColor: '#9966FF'
                    }]
                },
                options: getChartOptions('Score Distribution', true)
            });
        }

        function getChartOptions(title, isBar = false) {
            return {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: {
                            color: '#fff'
                        }
                    },
                    title: {
                        display: true,
                        text: title,
                        color: '#FFD700',
                        font: {
                            size: 16
                        }
                    }
                },
                scales: isBar ? {
                    y: {
                        beginAtZero: true,
                        ticks: { color: '#fff' },
                        grid: { color: 'rgba(255,255,255,0.1)' }
                    },
                    x: {
                        ticks: { color: '#fff' },
                        grid: { display: false }
                    }
                } : {}
            };
        }
</script>
</asp:Content>
