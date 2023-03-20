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
               // var parameters = SQLTableAvailability.UpdateParameters;
                //Update the id to match the current id 
             //   parameters["TableID"].DefaultValue = tableID.ToString();
                //Update taken to be taken instead of avaliable 
             //   parameters["Taken"].DefaultValue = "1";
                try
                {
                 //   SQLTableAvailability.Update();
                   
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
            // Get the new selected date
            DateTime dateTime = calDateSelect.SelectedDate;

            //Get the parameters 
            //var parameters = SQLTableAvailability.SelectParameters;

            //Set the parameter to the new selection
           // parameters["SelectedDate"].DefaultValue = dateTime.ToString();
            
            //Call method to update the data in the gridview (I think databind might work?)
            try
            {
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