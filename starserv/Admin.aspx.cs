using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace starserv
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) 
            { 
                string username = Request.Form["username"]; 
                string password = Request.Form["password"]; 
                if (username == "admin" && password == "password") 
                { 
                    Response.Redirect("RestaurantLayout.aspx");
                }
                else 
                { 
                    Response.Write("Invalid username or password."); 
                } 
            }
        }
        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {

        }

        }
}