using System;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear session on load
            Session.Clear();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                string query = "SELECT usertype FROM userTable WHERE username = @username AND password = @password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@username", username.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password.Text.Trim());

                object result = cmd.ExecuteScalar();

                if (result != null)
                {
                    string userType = result.ToString().ToLower();
                    Session["username"] = username.Text;
                    Session["usertype"] = userType;

                    if (userType == "admin")
                    {
                        Response.Redirect("admin.aspx");
                    }
                    else
                    {
                        Response.Redirect("MainPage.aspx");
                    }
                }
                else
                {
                    lblError.Visible = true;
                    lblError.Text = "Invalid username or password.";
                }
            }
        }
    }
}
