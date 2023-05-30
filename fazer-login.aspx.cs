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
        using (Conexao c = new Conexao())
        {
            DataSet dt = new DataSet();
            SqlDataAdapter dAdapter = new SqlDataAdapter();
            var email_inserido = txtEmail.Text.Trim();

            var parameters = new List<SqlParameter>();
            parameters.Add(new SqlParameter("@email_usuario", email_inserido));

            dt = c.sqlProcedure("LoginUsuario", parameters);

            if (dt.Tables[0].DefaultView.Count == 1)
            {
                string senhaCriptografadaBanco = dt.Tables[0].Rows[0]["senha_usuario"].ToString();

                string senha = txtSenha.Text;

                // Verifica se a senha fornecida corresponde à senha criptografada do banco de dados
                bool senhaCorreta = false;
                if (!string.IsNullOrEmpty(senhaCriptografadaBanco) && senhaCriptografadaBanco.Length >= 60)
                {
                    senhaCorreta = BCrypt.Net.BCrypt.Verify(senha, senhaCriptografadaBanco);
                }

                if (senhaCorreta)
                {
                    // Login bem sucedido, salva as informações do usuário na sessão
                    Session["logado"] = true;
                    Session["codigoUsuario"] = Convert.ToInt32(dt.Tables[0].DefaultView[0].Row["cod_usuario"].ToString());
                    Session["loginUsuario"] = dt.Tables[0].DefaultView[0].Row["login_usuario"].ToString();
                    Session["nomeUsuario"] = dt.Tables[0].DefaultView[0].Row["nome_usuario"].ToString();
                    Session["emailUsuario"] = dt.Tables[0].DefaultView[0].Row["email_usuario"].ToString();
                    Session["celUsuario"] = dt.Tables[0].DefaultView[0].Row["cel_usuario"].ToString();
                    Session["paisUsuario"] = dt.Tables[0].DefaultView[0].Row["pais_usuario"].ToString();
                    Session["bio_usuario"] = dt.Tables[0].DefaultView[0].Row["bio_usuario"].ToString();


                    // criar um novo DataSet para armazenar a nova query sql
                    DataSet dt2 = new DataSet();
                    DataSet dt3 = new DataSet();


                    // variável para guardar o código do usuário logado no momento
                    String cod_usuario = (dt.Tables[0].DefaultView[0].Row["cod_usuario"].ToString());

                    // nova query sql mandado só que com o cod_usuario do usuário logado atualmente
                    c.command.CommandText = "SELECT COUNT(*) FROM tblSeguidores WHERE id_usuario_alvo = " + cod_usuario + ";";

                    dAdapter.SelectCommand = c.command;
                    dAdapter.Fill(dt2);

                    c.command.CommandText =
                        "SELECT COUNT(*) FROM tblSeguidores WHERE id_usuario_seguidor = " + cod_usuario + ";";
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
            else
            {
                lblErro.Text = "A senha está incorreta, tente novamente! (nao retorna nada do banco)";
            }
        }
    }
}

