using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class atualizar_celular : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["logado"] != null && (bool)Session["logado"])
        {

            var celular_usuario = Session["celUsuario"].ToString();

            lblCelular.Text = celular_usuario;

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

            if (txtCelular.Text.Length > 0)
            {
                if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "validarCelular"))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "validarCelular", "<script>validarCelular();</script>");
                }

                if (hfCelularValido.Value != "true")
                {
                    lblAviso.Text = "Insira um número de celular válido para atualizar.";
                    return;
                }

                c.command.CommandText = "Update tblUsuario set cel_usuario=@cel where cod_usuario = @codUsuarioConectado";
                c.command.Parameters.Add("@cel", SqlDbType.VarChar).Value = txtCelular.Text.Trim();

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