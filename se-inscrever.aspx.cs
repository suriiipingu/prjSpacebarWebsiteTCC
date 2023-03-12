using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class se_inscrever : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnInscrever_Click(object sender, EventArgs e)
    {
        try
        {

            Conexao c = new Conexao();
            c.conectar();

            DateTime data_criacao = DateTime.Now; // declarando a variavel data

            String sql = "insert into usuario " + "(nome_usuario, login_usuario, senha_usuario, email_usuario, pais_usuario, cel_usuario, data_criacao) values(@nome,@login,@senha,@email,@pais,@cel,@data)";
            String nome = txtNome.Text.Trim();
            String login = txtLogin.Text.Trim();
            String email = txtEmail.Text.Trim();
            String telefone = txtTelefone.Text.Trim();
            String pais = dropdPais.Text.Trim();
            String senha = txtSenha.Text.Trim();
            String data = data_criacao.ToString(); //data de criação da conta

            c.command.Parameters.Add("@nome", SqlDbType.VarChar).Value = nome;
            c.command.Parameters.Add("@login", SqlDbType.VarChar).Value = login;
            c.command.Parameters.Add("@email", SqlDbType.VarChar).Value = email;
            c.command.Parameters.Add("@pais", SqlDbType.VarChar).Value = pais;
            c.command.Parameters.Add("@cel", SqlDbType.VarChar).Value = telefone;
            c.command.Parameters.Add("@senha", SqlDbType.VarChar).Value = senha;
            c.command.Parameters.Add("@data", SqlDbType.VarChar).Value = data;
            c.command.CommandText = sql;
            c.command.ExecuteNonQuery();
            c.fechaConexao();
            //MessageBox.Show("Dados gravados com sucesso", "Inserção de Usuário", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
        catch (SqlException ex)
        {
            if (ex.Message.Contains("UNIQUE"))
            {
                //MessageBox.Show("Usuario já Existe", "Incriçaõ de Usuario", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }


        }
    }
}
