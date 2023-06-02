using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class comentarios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            using (Conexao c = new Conexao())
            {
                //recebendo da index o codPost que foi clicado para ver os comentarios
                int postId = Convert.ToInt32(Session["codPostagemComentario"]);
                c.conectar();

                //obtendo os dados do post em específico
                var parametrosGetPostById = new List<SqlParameter>
                    {
                        new SqlParameter("@postId", postId)
                    };
                var conteudoPostagemComentario = c.sqlProcedure("GetPostAndAuthorById", parametrosGetPostById);

                // obtendo os dados de todos os comentarios para aquela postagem
                var parametrosComentarios = new List<SqlParameter>
                    {
                        new SqlParameter("@postId", postId)
                    };
                var dadosComentario = c.sqlProcedure("GetComments", parametrosComentarios);

                //salvando em uma variável o cod do autor do comentário atual
                int codAutorComentarioAtual = Convert.ToInt32(dadosComentario.Tables[0].Rows[0]["cod_usuario"]);

                //requisitando as informações do usuário que criou o comentário para em seguida,
                //exibir no corpo do comentário (seu nome, login e foto de perfil)
                var parametrosGetUserInformation = new List<SqlParameter>
                    {
                        new SqlParameter("@userId", codAutorComentarioAtual)
                    };
                var GetUserInformation = c.sqlProcedure("GetUserInformation", parametrosGetUserInformation);

                //prenchendo o DataList dos comentarios
                //encontrando os elementos e os preenchendo

                //login do autor do comentário
                Label lblLoginComentarioAutor = (Label)e.Item.FindControl("lblLoginComentarioAutor");
                lblLoginComentarioAutor.Text = GetUserInformation.Tables[0].Rows[0]["login_usuario"].ToString();

                //data de criação do comentário
                Label lblDataComentario = (Label)e.Item.FindControl("lblDataComentario");
                lblDataComentario.Text = dadosComentario.Tables[0].Rows[0]["data_comentario"].ToString();

                //conteudo do comentario
                Label lblConteudoComentario = (Label)e.Item.FindControl("lblConteudoComentario");
                lblConteudoComentario.Text = dadosComentario.Tables[0].Rows[0]["conteudo_comentario"].ToString();

                Label lblTitulo = (Label)e.Item.FindControl("lblTitulo");
                lblTitulo.Text = conteudoPostagemComentario.Tables[0].Rows[0]["titulo_post"].ToString();

                Label lblData = (Label)e.Item.FindControl("lblData");
                lblData.Text = conteudoPostagemComentario.Tables[0].Rows[0]["data_post"].ToString();

                Label lblNomeUsu = (Label)e.Item.FindControl("lblNomeUsu");
                lblNomeUsu.Text = conteudoPostagemComentario.Tables[0].Rows[0]["nome_usuario"].ToString();

                Label lblLoginUsu = (Label)e.Item.FindControl("lblLoginUsu");
                lblLoginUsu.Text = conteudoPostagemComentario.Tables[0].Rows[0]["login_usuario"].ToString();

               
            }
        }
    }

    protected void btnComentar_Click(object sender, EventArgs e)
    {
        //se o conteúdo do comentário que está sendo digitado for maior do que 0...
        if (txtComentario.Text.Length > 0) {
            using (Conexao c = new Conexao())
            {
                int postId = Convert.ToInt32(Session["codPostagemComentario"]);
                var parametrosComentar = new List<SqlParameter>
                    {
                        new SqlParameter("@cod_post", postId),
                        new SqlParameter("@cod_usuario", Session["codigoUsuario"]),
                        new SqlParameter("@comentario", txtComentario.Text)
                    };
                var Comentar = c.sqlProcedure("Comentar", parametrosComentar);
            }
        }
    }
}