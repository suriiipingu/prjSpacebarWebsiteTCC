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
                // 1 = usuário comum
                // 2 = criador de conteúdo
                // 3 = verificado
                // 4 = verificado e criador de conteúdo
                // 5 = adm

                var parameters = new List<SqlParameter>();
                parameters.Add(new SqlParameter("@nome", nome));
                parameters.Add(new SqlParameter("@login", login));
                parameters.Add(new SqlParameter("@email", email));
                parameters.Add(new SqlParameter("@cel", telefone));
                parameters.Add(new SqlParameter("@pais", pais));
                parameters.Add(new SqlParameter("@senha", hashSenha));
                parameters.Add(new SqlParameter("@data", data));
                parameters.Add(new SqlParameter("@tipo_usu", 1));


                try
                {
                    var result = c.sqlProcedure("InsertInscrever", parameters);
                }
                catch (SqlException ex)
                {
                    lblAviso.Text = "Falha ao criar usuário" + ex.Message;
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
