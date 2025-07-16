using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class lesson : System.Web.UI.Page
    {
        int lessonId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
                Response.Redirect("Login.aspx");

            if (!int.TryParse(Request.QueryString["id"], out lessonId))
                lessonId = 1;

            if (!IsPostBack)
                LoadLesson();
        }

        private void LoadLesson()
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                SqlCommand cmd1 = new SqlCommand("SELECT Title, VideoUrl FROM lessonTable WHERE LessonId=@id", con);
                cmd1.Parameters.AddWithValue("@id", lessonId);
                SqlDataReader reader1 = cmd1.ExecuteReader();
                if (reader1.Read())
                {
                    lblTitle.Text = reader1["Title"].ToString();
                    lessonVideo.Src = reader1["VideoUrl"].ToString();
                }
                reader1.Close();

                SqlCommand cmd2 = new SqlCommand("SELECT TOP 3 * FROM lessonQuestions WHERE LessonId=@id", con);
                cmd2.Parameters.AddWithValue("@id", lessonId);
                SqlDataReader reader2 = cmd2.ExecuteReader();

                int index = 1;
                while (reader2.Read())
                {
                    string question = reader2["QuestionText"].ToString();
                    string a = reader2["OptionA"].ToString();
                    string b = reader2["OptionB"].ToString();
                    string c = reader2["OptionC"].ToString();

                    switch (index)
                    {
                        case 1:
                            lblQ1.Text = question;
                            rblQ1.Items.Clear();
                            rblQ1.Items.Add(new ListItem(a));
                            rblQ1.Items.Add(new ListItem(b));
                            rblQ1.Items.Add(new ListItem(c));
                            break;
                        case 2:
                            lblQ2.Text = question;
                            rblQ2.Items.Clear();
                            rblQ2.Items.Add(new ListItem(a));
                            rblQ2.Items.Add(new ListItem(b));
                            rblQ2.Items.Add(new ListItem(c));
                            break;
                        case 3:
                            lblQ3.Text = question;
                            rblQ3.Items.Clear();
                            rblQ3.Items.Add(new ListItem(a));
                            rblQ3.Items.Add(new ListItem(b));
                            rblQ3.Items.Add(new ListItem(c));
                            break;
                    }
                    index++;
                }
                reader2.Close();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int score = 0;
            List<string> userAnswers = new List<string> {
                rblQ1.SelectedValue.Trim(),
                rblQ2.SelectedValue.Trim(),
                rblQ3.SelectedValue.Trim()
            };

            List<string> correctAnswers = new List<string>();
            List<string> questions = new List<string>();
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT TOP 3 QuestionText, CorrectAnswer FROM lessonQuestions WHERE LessonId=@id", con);
                cmd.Parameters.AddWithValue("@id", lessonId);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    questions.Add(reader["QuestionText"].ToString());
                    correctAnswers.Add(reader["CorrectAnswer"].ToString().Trim());
                }
                reader.Close();
            }

            for (int i = 0; i < correctAnswers.Count; i++)
            {
                string selected = userAnswers[i];
                string correct = correctAnswers[i];
                string question = questions[i];

                if (selected.ToLower() == correct.ToLower())
                    score++;

                SaveAnswer(lessonId, question, selected, correct);
            }

            lblFeedback.Text = $"You got {score}/3 correct.";

            SaveProgress(score); // сохранить даже если не 3

            if (score == 3)
            {
                Response.AddHeader("REFRESH", "2;URL=lesson.aspx?id=" + (lessonId + 1));
            }
            else
            {
                lblFeedback.Text += " Try again!";
            }
        }

        private void SaveProgress(int score)
        {
            int userId = GetUserId();
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                SqlCommand checkCmd = new SqlCommand("SELECT COUNT(*) FROM userProgress WHERE UserId=@uid AND LessonId=@lid", con);
                checkCmd.Parameters.AddWithValue("@uid", userId);
                checkCmd.Parameters.AddWithValue("@lid", lessonId);

                int exists = (int)checkCmd.ExecuteScalar();

                if (exists == 0)
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO userProgress (UserId, LessonId, Score, Completed) VALUES (@uid, @lid, @score, 1)", con);
                    cmd.Parameters.AddWithValue("@uid", userId);
                    cmd.Parameters.AddWithValue("@lid", lessonId);
                    cmd.Parameters.AddWithValue("@score", score);
                    cmd.ExecuteNonQuery();
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("UPDATE userProgress SET Score=@score, Completed=1 WHERE UserId=@uid AND LessonId=@lid", con);
                    cmd.Parameters.AddWithValue("@uid", userId);
                    cmd.Parameters.AddWithValue("@lid", lessonId);
                    cmd.Parameters.AddWithValue("@score", score);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private void SaveAnswer(int lessonId, string question, string selected, string correct)
        {
            bool isCorrect = (selected.Trim().ToLower() == correct.Trim().ToLower());
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO userAnswers (UserId, LessonId, QuestionText, SelectedAnswer, CorrectAnswer, IsCorrect) " +
                    "VALUES (@uid, @lid, @q, @sel, @corr, @iscorrect)", con);
                cmd.Parameters.AddWithValue("@uid", GetUserId());
                cmd.Parameters.AddWithValue("@lid", lessonId);
                cmd.Parameters.AddWithValue("@q", question);
                cmd.Parameters.AddWithValue("@sel", selected);
                cmd.Parameters.AddWithValue("@corr", correct);
                cmd.Parameters.AddWithValue("@iscorrect", isCorrect);
                cmd.ExecuteNonQuery();
            }
        }

        private int GetUserId()
        {
            string username = Session["username"].ToString().Trim(); // trim to be safe
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT Id FROM userTable WHERE username=@user", con);
                cmd.Parameters.AddWithValue("@user", username);
                con.Open();

                object result = cmd.ExecuteScalar();
                if (result == null)
                {
                    lblFeedback.Text += $" [User '{username}' not found in userTable]";
                    return -1; // not found
                }

                return (int)result;
            }
        }


        protected void btnPrev_Click(object sender, EventArgs e)
        {
            int prev = lessonId - 1;
            if (prev >= 1)
                Response.Redirect("lesson.aspx?id=" + prev);
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            int next = lessonId + 1;
            if (next <= 10)
                Response.Redirect("lesson.aspx?id=" + next);
            else
                lblFeedback.Text = "You've completed all lessons! 🎉";
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainPage.aspx");
        }
    }
}
