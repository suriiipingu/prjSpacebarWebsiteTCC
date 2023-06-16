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

                List<SqlParameter> parameters = new List<SqlParameter>();
                parameters.Add(new SqlParameter("@cel", txtCelular.Text));
                parameters.Add(new SqlParameter("@codUsuarioConectado", Session["codigoUsuario"]));

                int rowsAffected = c.ExecuteDeleteProcedure("AtualizarCelular", parameters);

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