using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class minha_conta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["logado"] !=null && (bool)Session["logado"]){

            var login_usuario = Session["loginUsuario"].ToString();
            var email_usuario = Session["emailUsuario"].ToString();
            var cel_usuario = Session["celUsuario"].ToString();
            var pais_usuario = Session["paisUsuario"].ToString();

            lblNomeUsuario.Text ="@"+ login_usuario;
            lblEmail.Text = email_usuario;
            lblCelular.Text = cel_usuario;
            lblPais.Text = pais_usuario;

        }
    }
}