using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usertype"] == null || Session["usertype"].ToString().ToLower() != "admin")
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadTotalUsers();
                LoadUserProgress();
                LoadLessonStats();
                LoadUserAnswers();
            }
        }

        private void LoadTotalUsers()
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM userTable WHERE usertype = 'user'", con);
                int total = (int)cmd.ExecuteScalar();
                lblTotalUsers.Text = total.ToString();
            }
        }

        private void LoadUserProgress()
        {
            string query = @"
                SELECT 
                    u.username, 
                    l.Title AS Lesson, 
                    p.Score
                FROM userProgress p
                JOIN userTable u ON u.Id = p.UserId
                JOIN lessonTable l ON l.LessonId = p.LessonId
                ORDER BY u.username, l.LessonId";

            BindGrid(GridViewProgress, query);
        }

        private void LoadLessonStats()
        {
            string query = @"
                SELECT 
                    l.Title AS Lesson,
                    COUNT(p.Id) AS UsersCompleted,
                    SUM(p.Score) AS TotalScore
                FROM lessonTable l
                LEFT JOIN userProgress p ON l.LessonId = p.LessonId
                GROUP BY l.Title";

            BindGrid(GridViewLessonStats, query);
        }

        private void LoadUserAnswers()
        {
            string query = @"
                SELECT 
                    u.username,
                    l.Title AS Lesson,
                    a.QuestionText,
                    a.SelectedAnswer,
                    a.CorrectAnswer,
                    a.IsCorrect
                FROM userAnswers a
                JOIN userTable u ON u.Id = a.UserId
                JOIN lessonTable l ON l.LessonId = a.LessonId
                ORDER BY u.username, l.LessonId";

            BindGrid(GridViewUserAnswers, query);
        }

        private void BindGrid(System.Web.UI.WebControls.GridView grid, string query)
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                grid.DataSource = dt;
                grid.DataBind();
            }
        }

        // 🔹 This method handles the View Charts button click
        protected void btnGoToStats_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminStats.aspx");
        }
    }
}
