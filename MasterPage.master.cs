using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VerifyUpdateSession;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Verifica se o usuário está logado e atualiza as informações na Master Page
        if (Session["logado"] != null && (bool)Session["logado"])
        {
            SessionManager.IsUserLoggedInMaster(Session, this);
        }
    }
}
