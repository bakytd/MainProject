using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI;

namespace WebApplication1
{
    public partial class adminStats : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["usertype"]?.ToString().ToLower() != "admin")
                    Response.Redirect("Login.aspx");

                LoadUserActivity();
                LoadLessonViews();
                LoadAnswerStats();
            }
        }

        private void LoadUserActivity()
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            int totalUsers = 0, activeUsers = 0;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                totalUsers = Convert.ToInt32(new SqlCommand("SELECT COUNT(*) FROM userTable", con).ExecuteScalar());
                activeUsers = Convert.ToInt32(new SqlCommand("SELECT COUNT(DISTINCT UserId) FROM userProgress", con).ExecuteScalar());
            }

            int inactive = totalUsers - activeUsers;
            litPieDataClient.Text = $"{activeUsers},{inactive}";
        }

        private void LoadLessonViews()
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            StringBuilder labels = new StringBuilder(), views = new StringBuilder();

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                var cmd = new SqlCommand(@"
                    SELECT l.Title, COUNT(p.Id) AS Views
                    FROM lessonTable l
                    LEFT JOIN userProgress p ON l.LessonId = p.LessonId
                    GROUP BY l.Title", con);
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    labels.Append($"'{reader["Title"]}',");
                    views.Append(reader["Views"] + ",");
                }
            }

            litLessonLabelsClient.Text = labels.ToString().TrimEnd(',');
            litLessonViewsClient.Text = views.ToString().TrimEnd(',');
        }

        private void LoadAnswerStats()
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            int correct = 0, incorrect = 0;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                correct = Convert.ToInt32(new SqlCommand("SELECT COUNT(*) FROM userAnswers WHERE IsCorrect=1", con).ExecuteScalar());
                incorrect = Convert.ToInt32(new SqlCommand("SELECT COUNT(*) FROM userAnswers WHERE IsCorrect=0", con).ExecuteScalar());
            }

            litCorrectIncorrectClient.Text = $"{correct},{incorrect}";
        }
    }
}
