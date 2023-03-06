using System;
using System.Collections.Generic;
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

        }

        // Code to change a table to taken when customer hits button
        protected void btnConfirmReservation_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Get the row that is currently selected
                GridViewRow row = gvAvailability.SelectedRow;
                //Get the index of that row
                int tableID = row.DataItemIndex;
                //Get the parameters needed for the update
                var parameters = SQLTableAvailability.UpdateParameters;
                //Update the id to match the current id 
                parameters["TableID"].DefaultValue = tableID.ToString();
                //Update taken to be taken instead of avaliable 
                parameters["Taken"].DefaultValue = "1";
                try
                {
                    SQLTableAvailability.Update();
                   
                }
                catch (Exception ex)
                {
                    lblConfirmationError.Text = "A database error has occured." +
                        "Message: " + ex.Message;
                }
            }
        }
        //Change the gridview when the calendar data is changed. 
        protected void CalDateSelect_SelectionChanged(object sender, EventArgs e)
        {
            // Create some type of method that would call a method here that would do a SQL
            // Query with the new date. 
        }
    }
}