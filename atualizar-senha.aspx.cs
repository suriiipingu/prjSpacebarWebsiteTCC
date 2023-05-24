using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class atualizar_senha : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    public string CriptografarSenha(string senha)
    {
        // Define um fator de custo para o bcrypt
        int fatorCusto = 12;

        // Gera um salt aleatório para a senha
        string salt = BCrypt.Net.BCrypt.GenerateSalt(fatorCusto);

        // Criptografa a senha usando o salt e o fator de custo
        string hashSenha = BCrypt.Net.BCrypt.HashPassword(senha, salt);

        // Retorna a senha criptografada (hash + salt)
        return hashSenha;
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

            lblErro.Text = "";

            if (txtNovaSenha.Text == txtConfirmSenha.Text)
            {
                String senha = txtNovaSenha.Text.Trim();
                String hashSenha = CriptografarSenha(senha);

                c.command.CommandText = "Update tblUsuario set senha_usuario=@senha where cod_usuario = @codUsuarioConectado";

                c.command.Parameters.Add("@senha", SqlDbType.VarChar).Value = hashSenha;

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
            else
            {
                lblErro.Text = "As senhas não coincidem.";
                return;
            }
        }
    }

}