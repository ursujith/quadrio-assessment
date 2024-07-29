using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string role = ddlRole.SelectedValue;
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            if (role == "admin")
            {
                // Validate admin credentials
                if (username == "sujith" && password == "1234")
                {
                    Response.Redirect("AdminDashboard.aspx");
                }
                else
                {
                    // Display error message
                    lblError.Visible = true;
                    lblError.Text = "Invalid admin credentials";
                }
            }
            else if (role == "user")
            {
                // Validate user credentials
                if (username == "afrid" && password == "1234")
                {
                    Response.Redirect("UserDashboard.aspx");
                }
                else
                {
                    // Display error message
                    lblError.Visible = true;
                    lblError.Text = "Invalid user credentials";
                }
            }
            else
            {
                // Display error message for invalid role
                lblError.Visible = true;
                lblError.Text = "Please select the role";
            }
        }
    }
}