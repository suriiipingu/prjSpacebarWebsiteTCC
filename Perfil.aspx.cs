using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
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
        }
    }
}