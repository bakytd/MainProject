using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace MainProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                phNotLoggedIn.Visible = false;
                phLoggedIn.Visible = true;

                string username = Session["username"].ToString();
                string initials = GetInitials(username);
                userInitials.InnerText = initials.ToUpper();

                if (!IsPostBack)
                {
                    LoadLessons();
                    lessonSection.Visible = true;
                }
            }
            else
            {
                phNotLoggedIn.Visible = true;
                phLoggedIn.Visible = false;
                lessonSection.Visible = false;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("MainPage.aspx");
        }

        private string GetInitials(string name)
        {
            if (string.IsNullOrWhiteSpace(name))
                return "?";

            string[] parts = name.Split(new[] { ' ', '_' }, StringSplitOptions.RemoveEmptyEntries);
            if (parts.Length == 1) return parts[0].Substring(0, 1);
            return parts[0][0].ToString() + parts[1][0].ToString();
        }

        private void LoadLessons()
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT LessonId, Title FROM lessonTable ORDER BY LessonId", con);
                SqlDataReader reader = cmd.ExecuteReader();
                lessonRepeater.DataSource = reader;
                lessonRepeater.DataBind();
            }
        }
    }
}

