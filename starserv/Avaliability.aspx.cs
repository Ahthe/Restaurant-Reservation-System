using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                String tableID = row.Cells[0].Text;
                //Get the parameters needed for the update
                var parameters = sdsAvailabilityGV.UpdateParameters;
                //Update the id to match the current id 
                parameters["TableID"].DefaultValue = tableID.ToString();
                //Update taken to be taken instead of avaliable 
                parameters["Taken"].DefaultValue = "1";
                sdsAvailabilityGV.Update();
                   
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
    }
}