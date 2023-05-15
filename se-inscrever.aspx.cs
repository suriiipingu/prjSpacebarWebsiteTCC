using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Configuration;
using System.IdentityModel.Protocols.WSTrust;
using BCrypt.Net;

public partial class se_inscrever : System.Web.UI.Page
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

    protected void btnInscrever_Click(object sender, EventArgs e)
    {

        Conexao c = new Conexao();
        c.conectar();

        DateTime data_criacao = DateTime.Now; // declarando a variavel data

        //salvou tudo em variáveis locais
        String nome = txtNome.Text.Trim();
        String login = txtLogin.Text.Trim();
        String email = txtEmail.Text.Trim();
        String telefone = txtCelular.Text.Trim();
        String pais = dropdPais.Text.Trim();
        String senha = txtSenha.Text.Trim();
        String hashSenha = CriptografarSenha(senha);
        String data = data_criacao.ToString(); //data de criação da conta


        if (UserProfile.ProfileManager.VerificarLoginEmail(login, email) == true)
        {
            txtNome.Text = "";
            txtLogin.Text = "";
            txtEmail.Text = "";
            txtCelular.Text = "";
            txtSenha.Text = "";
            lblAviso.Text = "Usuário já existe";
            return;
        }
        else
        {
            if (txtSenha.Text == txtConfSenha.Text)
            {
                c.command.Parameters.Add("@tipo_usu", SqlDbType.Int).Value = 1;
                // 1 = usuário comum
                // 2 = criador de conteúdo
                // 3 = verificado
                // 4 = adm

                c.command.CommandType = CommandType.StoredProcedure;
                c.command.CommandText = "InsertInscrever";

                c.command.Parameters.Add("@nome", SqlDbType.VarChar).Value = nome;
                c.command.Parameters.Add("@login", SqlDbType.VarChar).Value = login;
                c.command.Parameters.Add("@email", SqlDbType.VarChar).Value = email;
                c.command.Parameters.Add("@cel", SqlDbType.VarChar).Value = telefone;
                c.command.Parameters.Add("@pais", SqlDbType.Char).Value = pais;
                c.command.Parameters.Add("@senha", SqlDbType.VarChar).Value = hashSenha;
                c.command.Parameters.Add("@data", SqlDbType.Date).Value = data;

                try
                {
                    c.command.ExecuteNonQuery();
                }
                catch (SqlException ex)
                {
                    lblAviso.Text = "Falha ao criar usuário";
                    return;
                }
                finally
                {
                    c.fechaConexao();
                }

                lblAviso.Text = "Conta criada com sucesso!";
                return;
            }
            else
            {
                lblAviso.Text = "As senhas não coincidem.";
            }
        }

       
        
    }
}
