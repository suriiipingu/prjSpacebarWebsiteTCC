using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class criador_de_conteudo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
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

            int codTipoAtual = 0;

            // Obtém o valor atual do cod_tipo no banco de dados
            c.command.CommandText = "SELECT cod_tipo FROM tblUsuario WHERE cod_usuario = @codUsuarioConectado";
            using (SqlDataReader reader = c.command.ExecuteReader())
            {
                if (reader.Read())
                {
                    codTipoAtual = Convert.ToInt32(reader["cod_tipo"]);
                }
                else
                {
                    // Caso o usuário não seja encontrado, você pode tomar alguma ação apropriada
                    return;
                }
            }

            // Verifica o valor atual do cod_tipo
            if (codTipoAtual == 2 || codTipoAtual == 4 || codTipoAtual == 5)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "MostrarDivOcultarBaixar", "MostrarDivOcultarBaixar();", true);
                ScriptManager.RegisterStartupScript(this, GetType(), "EsconderSolicitacaoCC", "EsconderSolicitacaoCC();", true);
            }
            else
            {
                // Caso o valor de cod_tipo não corresponda a nenhum dos casos acima, você pode tomar alguma ação apropriada
                return;
            }


        }
    }

    protected void btnEnviar_Click(object sender, EventArgs e)
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

            int novoCodTipo = 0;
            int codTipoAtual = 0;

            // Obtém o valor atual do cod_tipo no banco de dados
            c.command.CommandText = "SELECT cod_tipo FROM tblUsuario WHERE cod_usuario = @codUsuarioConectado";
            using (SqlDataReader reader = c.command.ExecuteReader())
            {
                if (reader.Read())
                {
                    codTipoAtual = Convert.ToInt32(reader["cod_tipo"]);
                }
                else
                {
                    // Caso o usuário não seja encontrado, você pode tomar alguma ação apropriada
                    return;
                }
            }

            // Verifica o valor atual do cod_tipo
            if (codTipoAtual == 3)
            {
                novoCodTipo = 4;
            }
            else if (codTipoAtual == 1)
            {
                novoCodTipo = 2;
            }
            else
            {
                // Caso o valor de cod_tipo não corresponda a nenhum dos casos acima, você pode tomar alguma ação apropriada
                return;
            }

            // Atualiza o cod_tipo no banco de dados
            c.command.CommandText = "UPDATE tblUsuario SET cod_tipo = @novoCodTipo WHERE cod_usuario = @codUsuarioConectado";
            c.command.Parameters.Clear();
            c.command.Parameters.Add("@novoCodTipo", SqlDbType.Int).Value = novoCodTipo;
            c.command.Parameters.Add("@codUsuarioConectado", SqlDbType.VarChar).Value = Session["codigoUsuario"].ToString();

            try
            {
                c.command.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                return;
            }
            finally
            {
                c.fechaConexao();
            }

        }
    }
}