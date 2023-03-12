using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class fazer_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnLogar_Click(object sender, EventArgs e)
    {
        // Instânciando um objeto do tipo conexão
        Conexao c = new Conexao();

        //acionando a função de conectar ao banco de dados pré-definido
        c.conectar();

        // Instânciando um objeto que irá adaptar para os comandos sql
        SqlDataAdapter dAdapter = new SqlDataAdapter();

        // vai setar todos os dados obtidos e colocar dentro da variável "dt"
        DataSet dt = new DataSet();


        // usando a minha conexão e enviando um comando de texto para puxar os dados do banco de dados
        c.command.CommandText = "select * from Usuario where " + " email=@email and senha=@senha";

        // colocando todos esses parâmetros passados em uma variável
        c.command.Parameters.Add("@email", SqlDbType.VarChar).Value = txtEmail.Text.Trim();
        c.command.Parameters.Add("@senha", SqlDbType.VarChar).Value = txtSenha.Text.Trim();

        // o meu adaptador vai pegar
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        if ((int)dt.Tables[0].DefaultView.Count == 1)
        {
            // É AQUI RAPAZEADA, se vc quiser que so site apareça qualquer coisa só depois de logado, é necessário usar um if para verificar se a sessão logado vai dar 1

            Session["logado"] = 1;
            Session["codigoUsuario"] = Convert.ToInt32(dt.Tables[0].DefaultView[0].Row["codigo"].ToString());
            Session["usuario"] = dt.Tables[0].DefaultView[0].Row["email"].ToString();
            Response.Redirect("Index.aspx");
        }
        else
        {
            //lblErro.Text = "Credenciais incorretas, verifique-as e tente novamente!";
        }
    }
}