using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
                Response.Redirect("signin.aspx");

            if (!IsPostBack)
                LoadLessons();
        }

        private void LoadLessons()
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM lessonTable", con);
                con.Open();
                LessonRepeater.DataSource = cmd.ExecuteReader();
                LessonRepeater.DataBind();
            }
        }
    }
}
