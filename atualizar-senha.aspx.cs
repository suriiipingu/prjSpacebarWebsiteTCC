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

                List<SqlParameter> parameters = new List<SqlParameter>();
                parameters.Add(new SqlParameter("@novaSenha", hashSenha));
                parameters.Add(new SqlParameter("@codUsuarioConectado", Session["codigoUsuario"]));

                int rowsAffected = c.ExecuteDeleteProcedure("AtualizarSenha", parameters);

                if (rowsAffected > 0)
                {
                    // Atualização bem-sucedida
                }
                else
                {
                    lblErro.Text = "Falha ao atualizar.";
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