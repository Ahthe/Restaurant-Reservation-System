﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace starserv
{
    public partial class CancelReservation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConfirmCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("CancelConfirmation.aspx");
        }
    }
}