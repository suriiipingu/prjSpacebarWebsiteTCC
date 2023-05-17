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

            if (Session["codigoUsuario"] != null)
            {
                c.command.Parameters.Add("@codUsuarioConectado", SqlDbType.VarChar).Value = Session["codigoUsuario"].ToString();
            }
            else
            {
                Response.Redirect("fazer-login.aspx");
            }

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
                        c.command.CommandText = "Update tblUsuario set email_usuario=@email where cod_usuario = @codUsuarioConectado";
                        c.command.Parameters.Add("@email", SqlDbType.VarChar).Value = txtEmail.Text.Trim();

                        try
                        {
                            c.command.ExecuteNonQuery();
                        }
                        catch (SqlException ex)
                        {
                            lblAviso.Text = "Falha ao atualizar.";
                            return;
                        }
                        finally
                        {
                            c.fechaConexao();
                        }
                    }
                }


                

                

            }
        }
    }
}