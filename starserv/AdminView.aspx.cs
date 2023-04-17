using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace starserv
{
    public partial class AdminView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
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
            catch (Exception ex)
            {
                //lblConfirmationError.Text = "A database error has occured." +
                //        "Message: " + ex.Message;
            }
        }
        protected void gvAvailability_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
        protected void onSelection (object sender, EventArgs e)
        {
            Response.Redirect("AdminComfirmed.aspx");
        }

        protected void sdsAvailabilityGV_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    e.Cancel = true;
            //}
            //else
            //{
            //    e.Command.Parameters["@SelectedDate"].Value = ddlDate.SelectedValue;
            //}
        }
    }
}