using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;
using VerifyUpdateSession;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void myDataList_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            // Find the "verified" badge div control
            var divVerifiedBadge = e.Item.FindControl("divVerifiedBadge") as HtmlGenericControl;

            // Get the "verified" data from the data source
            DataRowView row = e.Item.DataItem as DataRowView;
            var valorVerificado = Convert.ToBoolean(DataBinder.Eval(e.Item.DataItem, "verificado"));

            // Check if the "verified" data is true and show the badge if it is
            if (valorVerificado)
            {

                divVerifiedBadge.Visible = true;
            }
            else
            {
                divVerifiedBadge.Visible = false;
            }
        }
    }

}