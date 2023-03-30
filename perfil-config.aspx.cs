using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class perfil_config : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnCamImg.Attributes.Add("onclick", "document.getElementById('" + FUimg.ClientID + "').click();");
        btnAtualizar.Attributes.Add("onclick", "document.getElementById('" + FUimgmini.ClientID + "').click();");
        /*btnAtualizar2.Attributes.Add("onclick", "document.getElementById('" + FUimg.ClientID + "').click();");*/
    }
}