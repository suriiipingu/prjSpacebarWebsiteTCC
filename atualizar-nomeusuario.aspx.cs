using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class atualizar_nomeusuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["logado"] != null && (bool)Session["logado"])
        {

            var login_usuario = Session["loginUsuario"].ToString();

            lblNomeUsuario.Text = "@" + login_usuario;

        }
    }

    protected void btnAtualizar_Click(object sender, EventArgs e)
    {
        using(Conexao c = new Conexao())
        {
            c.conectar();

            if (Session["codigoUsuario"] != null)
            {
                c.command.Parameters.Add("@codUsuarioConectado", SqlDbType.VarChar).Value = Session["codigoUsuario"].ToString();

                String login = txtNomeUsuario.Text;
                String email = Session["emailUsuario"].ToString();

                if (txtNomeUsuario.Text.Length > 3)
                {
                    if (UserProfile.ProfileManager.VerificarLoginEmail(login, email) == false)
                    {
                        lblErro.Text = "Esse nome de usuário já existe, tente outro.";
                        return;
                    }
                    else
                    {
                        List<SqlParameter> parameters = new List<SqlParameter>();
                        parameters.Add(new SqlParameter("@nomeUsuario", txtNomeUsuario.Text));
                        parameters.Add(new SqlParameter("@codUsuarioConectado", Session["codigoUsuario"]));

                        int rowsAffected = c.ExecuteDeleteProcedure("AtualizarNomeUsuario", parameters);

                        if (rowsAffected > 0)
                        {
                            // Atualização bem-sucedida
                        }
                        else
                        {
                            lblErro.Text = "Falha ao atualizar.";
                        }
                    }

                }
            }
            else
            {
                Response.Redirect("fazer-login.aspx");
            }
        }
    }
}