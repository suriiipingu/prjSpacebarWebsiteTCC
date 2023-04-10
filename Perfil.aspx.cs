using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using VerifyUpdateSession;

public partial class Perfil : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Verifica se o usuário está logado e atualiza as informações na página
        if (Session["logado"] != null && (bool)Session["logado"])
        { 
            SessionManager.IsUserLoggedInProfile(Session, this);
            //string varUserID = SessionManager.ReturnUserID(Session);
        }
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