using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace MainProject
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStatistics();
                LoadChartData();
            }
        }

        private void LoadStatistics()
        {
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = conn;
                conn.Open();

                // Total Users
                cmd.CommandText = "SELECT COUNT(*) FROM userTable";
                lblTotalUsers.Text = cmd.ExecuteScalar()?.ToString() ?? "0";

                // Active Users (last 30 days)
                cmd.CommandText = "SELECT COUNT(DISTINCT UserId) FROM UserActivity WHERE ActivityDate > DATEADD(day, -30, GETDATE())";
                lblActiveUsers.Text = cmd.ExecuteScalar()?.ToString() ?? "0";

                // Lessons Completed
                cmd.CommandText = "SELECT COUNT(*) FROM userProgress WHERE Completed = 1";
                lblLessonsCompleted.Text = cmd.ExecuteScalar()?.ToString() ?? "0";

                // Average Score
                cmd.CommandText = "SELECT CAST(AVG(Score) AS INT) FROM userProgress WHERE Score IS NOT NULL";
                var avgScore = cmd.ExecuteScalar();
                lblAvgScore.Text = (avgScore != DBNull.Value ? avgScore.ToString() : "0") + "%";
            }
        }

        private void LoadChartData()
        {
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = conn;
                conn.Open();

                // 1. Demographics Data
                cmd.CommandText = "SELECT gender, COUNT(*) as count FROM userTable GROUP BY gender";
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                litDemographicsData.Text = Newtonsoft.Json.JsonConvert.SerializeObject(dt);

                // 2. Lesson Completion Data
                cmd.CommandText = @"SELECT l.Title, COUNT(up.UserId) as count 
                                   FROM Lessons l
                                   LEFT JOIN userProgress up ON l.Id = up.LessonId AND up.Completed = 1
                                   GROUP BY l.Title";
                dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                litCompletionData.Text = Newtonsoft.Json.JsonConvert.SerializeObject(dt);

                // 3. Accuracy Trend Data
                cmd.CommandText = @"SELECT 
                                    FORMAT(ActivityDate, 'yyyy-MM') as Month,
                                    AVG(CASE WHEN IsCorrect = 1 THEN 100.0 ELSE 0 END) as Accuracy
                                   FROM userAnswers
                                   WHERE ActivityDate > DATEADD(month, -6, GETDATE())
                                   GROUP BY FORMAT(ActivityDate, 'yyyy-MM')
                                   ORDER BY Month";
                dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                litAccuracyData.Text = Newtonsoft.Json.JsonConvert.SerializeObject(dt);

                // 4. Score Distribution
                cmd.CommandText = @"SELECT 
                                    CASE 
                                        WHEN Score BETWEEN 0 AND 50 THEN '0-50'
                                        WHEN Score BETWEEN 51 AND 75 THEN '51-75'
                                        ELSE '76-100' 
                                    END as Range,
                                    COUNT(*) as Count
                                   FROM userProgress
                                   WHERE Score IS NOT NULL
                                   GROUP BY CASE 
                                        WHEN Score BETWEEN 0 AND 50 THEN '0-50'
                                        WHEN Score BETWEEN 51 AND 75 THEN '51-75'
                                        ELSE '76-100' 
                                    END";
                dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                litScoreData.Text = Newtonsoft.Json.JsonConvert.SerializeObject(dt);
            }
        }
    }
}