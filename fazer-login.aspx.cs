using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography.X509Certificates;

public partial class fazer_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public String cod_usuario = "a";

    protected void btnLogar_Click(object sender, EventArgs e)
    {
        // Instânciando um objeto do tipo conexão
        Conexao c = new Conexao();

        //acionando a função de conectar ao banco de dados pré-definido
        c.conectar();

        // Instânciando um objeto que irá adaptar para os comandos sql
        SqlDataAdapter dAdapter = new SqlDataAdapter();

        // vai pegar todos os dados obtidos e colocar dentro do DataSet
        // é um lugar aonde vai as informações que você buscou do banco de dados
        DataSet dt = new DataSet();

        // usando a minha conexão e enviando um comando de texto para puxar os dados do banco de dados
        c.command.CommandText = "SELECT * from tblUsuario WHERE " + " email_usuario=@email_inserido and senha_usuario=@senha_inserido";

        // colocando todos esses parâmetros passados em uma variável
        c.command.Parameters.Add("@email_inserido", SqlDbType.VarChar).Value = txtEmail.Text.Trim();
        c.command.Parameters.Add("@senha_inserido", SqlDbType.VarChar).Value = txtSenha.Text.Trim();

        // o adaptador vai salvar o que ele vai executar
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        if ((int)dt.Tables[0].DefaultView.Count == 1)
        {
            // Login bem sucedido, salva as informações do usuário na sessão
            Session["logado"] = true;
            Session["codigoUsuario"] = Convert.ToInt32(dt.Tables[0].DefaultView[0].Row["cod_usuario"].ToString());
            Session["loginUsuario"] = dt.Tables[0].DefaultView[0].Row["login_usuario"].ToString();
            Session["nomeUsuario"] = dt.Tables[0].DefaultView[0].Row["nome_usuario"].ToString();
            Session["desc_perfil_usuario"] = dt.Tables[0].DefaultView[0].Row["desc_perfil_usuario"].ToString();

            // criar um novo DataSet para armazenar a nova query sql
            DataSet dt2 = new DataSet();
            DataSet dt3 = new DataSet();

            // variável "cod_usuario" vai receber o valor guardado no DataSet que tem o cod_usuario logado no momento
            String cod_usuario = (dt.Tables[0].DefaultView[0].Row["cod_usuario"].ToString());

            // nova query sql mandado só que com o cod_usuario do usuário logado atualmente
            c.command.CommandText = "SELECT COUNT(id_usuario_alvo) FROM tblSeguidores WHERE id_usuario_alvo = " + cod_usuario + ";";

            dAdapter.SelectCommand = c.command;

            dAdapter.Fill(dt2);

            c.command.CommandText = "SELECT COUNT(id_usuario_seguidor) FROM tblSeguidores WHERE id_usuario_seguidor = " + cod_usuario + ";";
            dAdapter.SelectCommand = c.command;
            dAdapter.Fill(dt3);

            Session["seguidoresUsuario"] = (dt2.Tables[0].DefaultView[0].Row["Column1"].ToString());
            Session["UsuarioSegue"] = (dt3.Tables[0].DefaultView[0].Row["Column1"].ToString());
            Response.Redirect("index.aspx");
        }
        else
        {
            lblErro.Text = "Credenciais incorretas, verifique-as e tente novamente!";
        }
    } 
}