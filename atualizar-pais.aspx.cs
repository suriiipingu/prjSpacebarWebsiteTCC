using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class atualizar_pais : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["logado"] != null && (bool)Session["logado"])
        {

            var pais_usuario = Session["paisUsuari" +
                "o"].ToString();

            lblPais.Text = pais_usuario;

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


            c.command.CommandText = "Update tblUsuario set pais_usuario=@pais where cod_usuario = @codUsuarioConectado";

            c.command.Parameters.Add("@pais", SqlDbType.VarChar).Value = dropdPais.Text.Trim();

            try
            {
                c.command.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                lblErro.Text = "Falha ao atualizar.";
                return;
            }
            finally
            {
                c.fechaConexao();
            }
        }
    }
}