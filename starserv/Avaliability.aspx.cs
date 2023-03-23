using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace starserv
{
    public partial class Avaliability : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
/*            string connectionString = ConfigurationManager.ConnectionStrings["starservConnectionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            SqlCommand sqlCommand = new SqlCommand("SELECT * FROM [RestaurantTables] WHERE TableDate >= @SelectedDate ORDER BY [TableDate], [TableHour]");
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataSet dataSet = new DataSet();
            sqlDataAdapter.Fill(dataSet, "MyData");
            gvAvailability.DataSource = dataSet.Tables["MyData"];
            gvAvailability.DataBind();
            sqlConnection.Close();*/
        }

        // Code to change a table to taken when customer hits button
        protected void btnConfirmReservation_Click(object sender, EventArgs e)
        {
/*                string connectionString = ConfigurationManager.ConnectionStrings["starservConnectionString"].ConnectionString;
                SqlConnection sqlConnection = new SqlConnection(connectionString);
                SqlCommand sqlCommand = new SqlCommand("SELECT * FROM [RestaurantTables] WHERE TableDate >= @SelectedDate ORDER BY [TableDate], [TableHour]");
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                DataSet dataSet = new DataSet();
                sqlDataAdapter.Fill(dataSet, "MyData");
                gvAvailability.DataSource = dataSet.Tables["MyData"];
                gvAvailability.DataBind();*/
 /*               sqlConnection.Close();*/
                
            try
            {
                // Get the row that is currently selected
                GridViewRow row = gvAvailability.SelectedRow;
                //Get the index of that row
                string reservationID = row.Cells[0].ToString();
                //Get the parameters needed for the update
                var parameters = sdsAvailabilityGV.UpdateParameters;
                //Update the id to match the current id 
                parameters["ReservationID"].DefaultValue = Convert.ToInt32(reservationID.ToString());
                /*string taken = "1";
                string connectionString = ConfigurationManager.ConnectionStrings["starservConnectionString"].ToString();
                string query = "UPDATE RestaurantTables SET taken = @Taken where tableID = @TableID";
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Taken", taken);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }*/
                //Update taken to be taken instead of avaliable 
                parameters["Taken"].DefaultValue = "1";
                sdsAvailabilityGV.Update();
                sdsAvailabilityGV.DataBind();


                /* string connectionString = ConfigurationManager.ConnectionStrings["starservConnectionString"].ConnectionString;
                 SqlConnection conn = new SqlConnection(connectionString);
                 conn.Open();
                 string SID = lblSID.Text;
                 MySqlCommand cmd = new MySqlCommand("update student Set Name = @Name, Address = @Address, Mobile = @Mobile, Email = @Email where SID = @SID", conn);  
                 cmd.Parameters.AddWithValue("@Name", txtName.Text);
                 cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                 cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);
                 cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                 cmd.Parameters.AddWithValue("SID", SID);
                 cmd.ExecuteNonQuery();
                 cmd.Dispose();
                 ShowMessage("Student Data update Successfully......!");
                 GridViewStudent.EditIndex = -1;
                 BindGridView(); btnUpdate.Visible = false;*/


            }
            catch (Exception ex)
            {
                lblConfirmationError.Text = "A database error has occured." +
                    "Message: " + ex.Message;
            }
        }
        
        //Change the gridview when the calendar data is changed. 
        protected void CalDateSelect_SelectionChanged(object sender, EventArgs e)
        {
            
            
            //Call method to update the data in the gridview (I think databind might work?)
            try
            {
                // Get the new selected date
                DateTime dateTime = calDateSelect.SelectedDate;

                //Get the parameters 
                var parameters = sdsAvailabilityGV.SelectParameters;

                //Set the parameter to the new selection
                parameters["SelectedDate"].DefaultValue = dateTime.ToString();
                // I think this might work 
                gvAvailability.DataBind();
            }
            catch(Exception ex)
            {
                lblConfirmationError.Text = "A database error has occured." +
                        "Message: " + ex.Message;
            }
        }

        protected void gvAvailability_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}