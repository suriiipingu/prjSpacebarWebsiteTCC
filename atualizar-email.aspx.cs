using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class atualizar_email : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["logado"] != null && (bool)Session["logado"])
        {

            var email_usuario = Session["emailUsuario"].ToString();

            lblEmail.Text = email_usuario;

        }

    }

    protected void btnAtualizar_Click(object sender, EventArgs e)
    {
        using (Conexao c = new Conexao())
        {
            c.conectar();

            if (txtEmail.Text.Length > 0)
            {
                if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "validarEmail"))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "validarEmail", "<script>validarEmail();</script>");
                }

                if (hfEmailValido.Value != "true")
                {
                    lblAviso.Text = "Insira um email válido para atualizar.";
                    return;
                }
                else
                {
                    String email = txtEmail.Text;
                    String login = "";

                    if (UserProfile.ProfileManager.VerificarLoginEmail(login, email) == true)
                    {
                        lblAviso.Text = "Esse email já existe, tente outro.";
                        return;
                    }
                    else
                    {
                        List<SqlParameter> parameters = new List<SqlParameter>();
                        parameters.Add(new SqlParameter("@email", txtEmail.Text.Trim()));
                        parameters.Add(new SqlParameter("@codUsuarioConectado", Session["codigoUsuario"]));

                        int rowsAffected = c.ExecuteDeleteProcedure("AtualizarEmail", parameters);

                        if (rowsAffected > 0)
                        {
                            // Atualização bem-sucedida
                        }
                        else
                        {
                            lblAviso.Text = "Falha ao atualizar.";
                        }
                    }
                }


                

                

            }
        }
    }
}