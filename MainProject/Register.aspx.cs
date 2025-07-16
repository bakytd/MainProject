using System;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                // Check if username already exists
                string checkUser = "SELECT COUNT(*) FROM userTable WHERE username = @username";
                SqlCommand checkCmd = new SqlCommand(checkUser, con);
                checkCmd.Parameters.AddWithValue("@username", username.Text.Trim());
                int exists = Convert.ToInt32(checkCmd.ExecuteScalar());

                if (exists > 0)
                {
                    errMsg.Visible = true;
                    errMsg.Text = "Username already exists!";
                    return;
                }

                // Password length validation
                if (pwd.Text.Length < 8 || pwd.Text.Length > 16)
                {
                    errMsg.Visible = true;
                    errMsg.Text = "Password must be between 8 and 16 characters.";
                    return;
                }

                // Determine user type
                string userType = "user";
                if (adminKey.Text == "adminSecret123")
                    userType = "admin";

                // Insert new user
                string insert = @"INSERT INTO userTable 
                    (gender, country, email, username, password, usertype) 
                    VALUES (@gender, @country, @email, @username, @password, @usertype)";
                SqlCommand insertCmd = new SqlCommand(insert, con);
                insertCmd.Parameters.AddWithValue("@gender", gender.SelectedItem.Text);
                insertCmd.Parameters.AddWithValue("@country", country.Text.Trim());
                insertCmd.Parameters.AddWithValue("@email", email.Text.Trim());
                insertCmd.Parameters.AddWithValue("@username", username.Text.Trim());
                insertCmd.Parameters.AddWithValue("@password", pwd.Text.Trim());
                insertCmd.Parameters.AddWithValue("@usertype", userType);

                insertCmd.ExecuteNonQuery();

                // Set session and redirect
                Session["username"] = username.Text;
                Session["usertype"] = userType;

                con.Close();

                if (userType == "admin")
                    Response.Redirect("admin.aspx");
                else
                    Response.Redirect("MainPage.aspx");
            }
            catch (Exception ex)
            {
                errMsg.Visible = true;
                errMsg.Text = "Error: " + ex.Message;
            }
        }
    }
}
