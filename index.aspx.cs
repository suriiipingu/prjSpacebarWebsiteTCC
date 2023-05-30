using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;
using UserProfile;
using VerifyUpdateSession;
using System.Activities.Expressions;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            myDataList.DataBind();
        }
    }

    public string LinkNomeUsuario;
    public string LinkLoginUsuario;
    public string quantidadeCurtidas = null;
    public string userLogin;

    // construindo as postagens, este ItemDataBound está linkado com o DataList, e a cada item do DataList, todo este escopo será executado
    protected void myDataList_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            using (Conexao c = new Conexao())
            {
                //construindo cada postagem
                c.conectar();
                var dadosPosts = c.sqlProcedure("GetPostAndAuthor");

                //obtendo valoes do post atual
                int postagens = e.Item.ItemIndex;
                string PostId = dadosPosts.Tables[0].Rows[postagens]["cod_post"].ToString();

                var parametersGetCommentsQuantity = new List<SqlParameter>
                    {
                        new SqlParameter("@postId", PostId)
                    };
                var quantidadeComentarios = c.sqlProcedure("GetCommentsQuantity", parametersGetCommentsQuantity);

                c.fechaConexao();
                
                //encontrando elementos no aspx e os preenchendo

                Label lblTituloPost = (Label)e.Item.FindControl("titulo_postLabel");
                // para a linha que eu quero no sql eu coloco como parâmetro a linha que estou no DataList
                lblTituloPost.Text = (dadosPosts.Tables[0].Rows[postagens]["titulo_post"].ToString());

                Label lblDataPost = (Label)e.Item.FindControl("data_postLabel");
                lblDataPost.Text = (dadosPosts.Tables[0].Rows[postagens]["data_post"].ToString());

                LinkButton lblNomeUsuario = (LinkButton)e.Item.FindControl("HyperLinkNomeUsuario");
                lblNomeUsuario.Text = (dadosPosts.Tables[0].Rows[postagens]["nome_usuario"].ToString());

                LinkButton lblLoginUsuario = (LinkButton)e.Item.FindControl("HyperLinkLoginUsuario");
                lblLoginUsuario.Text = "@" + (dadosPosts.Tables[0].Rows[postagens]["login_usuario"].ToString());

                Image ImgPost = (Image)e.Item.FindControl("ImgPost");
                ProfileManager.exibirImagemPost(ImgPost, Convert.ToInt32(PostId));

                Label lblDescricao = (Label)e.Item.FindControl("lblDescricao");
                lblDescricao.Text = (dadosPosts.Tables[0].Rows[postagens]["texto_post"].ToString());

                Label lblQuantidadeComentarios = (Label)e.Item.FindControl("lblQuantidadeComentarios");
                lblQuantidadeComentarios.Text = (quantidadeComentarios.Tables[0].Rows[0]["quantidade_comentarios"].ToString());

                // obtendo alguns dados para realizar a verificação de likes, contagem de posts
                int userId = Convert.ToInt32(Session["codigoUsuario"]);
                ImageButton btnLike = e.Item.FindControl("btnLike") as ImageButton;

                //obtendo os dados de likes de todas as postagens e exibindo a contagem de cada uma delas
                //fazer um using da Conexao, porque sempre que ele executa esse trecho de código denovo, ele tenta abrir novamente a conexao

                SqlDataAdapter dAdapter = new SqlDataAdapter();
                DataSet DataSetQuantidadeLikes = new DataSet();
                c.command.CommandText = "EXECUTE GetPostQuantityLikes " + PostId;
                dAdapter.SelectCommand = c.command;
                dAdapter.Fill(DataSetQuantidadeLikes);

                Label lblQuantidadeCurtidas = (Label)e.Item.FindControl("curtidas_postLabel");
                lblQuantidadeCurtidas.Text = (DataSetQuantidadeLikes.Tables[0].DefaultView[0].Row["Column1"].ToString());

                //Verificação de autenticidade do post (postagem verificada po alguém ou não)
                var divVerifiedBadge = e.Item.FindControl("divVerifiedBadge") as HtmlGenericControl;
                DataRowView row = e.Item.DataItem as DataRowView;

                var parameters = new List<SqlParameter>();
                parameters.Add(new SqlParameter("@cod_post", PostId));

                var result = c.sqlProcedure("GetPostVerified", parameters);

                // Vefifique se os dados de "verificado" são verdadeiros, se sim, mostre a badge
                if (result.Tables.Count > 0 && result.Tables[0].Rows.Count > 0)
                {
                    bool isVerified = Convert.ToBoolean(result.Tables[0].Rows[0]["verificado"]);

                    if (isVerified)
                    {
                        divVerifiedBadge.Visible = true;
                    }
                    else
                    {
                        divVerifiedBadge.Visible = false;
                    }
                }
                if (row != null && btnLike != null)
                {
                    string cod_post = row["cod_post"].ToString();
                    btnLike.CommandArgument = cod_post;
                }

                //Verificar se o usuário ja curtiu uma postagem e mudar a imagem do botão
                if (Session["codigoUsuario"] != null)
                {
                    // Check if user already liked this post
                    var parametersHasUserLiked = new List<SqlParameter>
                    {
                        new SqlParameter("@postID", PostId),
                        new SqlParameter("@userId", Session["codigoUsuario"])
                    };

                    DataSet queryCheckLiked = c.sqlProcedure("CheckUserHasLiked", parametersHasUserLiked);
                    int CheckLiked = Convert.ToInt32(queryCheckLiked.Tables[0].Rows[0][0].ToString());
                    if (CheckLiked != 0)
                    {
                        btnLike.ImageUrl = "images/heart-fill.svg";
                    }
                }
                var parametersPostagemCriada = new List<SqlParameter>
                {
                    new SqlParameter("@postId", PostId)
                };
                DataSet dtGetAuthorPost = c.sqlProcedure("GetAuthorPost", parametersPostagemCriada);

                int codAutorPost = Convert.ToInt32(dtGetAuthorPost.Tables[0].Rows[0]["cod_usuario"].ToString());
                var parametersGetUserInformation = new List<SqlParameter>
                {
                    new SqlParameter("userId", codAutorPost)
                };
                DataSet dtGetUserInformation = c.sqlProcedure("GetUserInformation", parametersGetUserInformation);

                LinkNomeUsuario = dtGetUserInformation.Tables[0].Columns["nome_usuario"].ToString();
                LinkLoginUsuario = dtGetUserInformation.Tables[0].Columns["login_usuario"].ToString();
                //retornand o data item atual
                LinkButton item = (LinkButton)e.Item.FindControl("HyperLinkLoginUsuario");
                //colocando a variável para o Item do DataList atual
                e.Item.Attributes["CodAutorPost"] = codAutorPost.ToString();

                Image ImgPerfilUser = (Image)e.Item.FindControl("ImgPerfilUser");
                ProfileManager.mostrarImagemPerfilUser(ImgPerfilUser, codAutorPost);
            }
        }
    }

    protected void btnLike_OnClick(object sender, ImageClickEventArgs e)
    {
        //obter o ID do post que o usuário quer curtir
        ImageButton btnLike = (ImageButton)sender;
        string postId = btnLike.CommandArgument;

        // obter o cod_usuario da session
        int userId = Convert.ToInt32(Session["codigoUsuario"]);

        if (Session["codigoUsuario"] != null && int.TryParse(Session["codigoUsuario"].ToString(), out userId))
        {
            // Update the "curtidas" value for the post in the "tblPostagem" table
            using (Conexao conexao = new Conexao())
            {
                conexao.conectar();

                var parametrosCheckUserHasLiked = new List<SqlParameter>
                {
                    new SqlParameter("@postId", postId),
                    new SqlParameter("@userId", userId)
                };
                DataSet queryCheckLiked = conexao.sqlProcedure("CheckUserHasLiked", parametrosCheckUserHasLiked);
                int alreadyLiked = Convert.ToInt32(queryCheckLiked.Tables[0].Rows[0][0].ToString());
                // Verifique se o usuário curtiu a postagem específica
                if (alreadyLiked > 0)
                {
                    // Retire a curtida da tabela de curtidas do usuário
                    var parametrosDeleteLike = new List<SqlParameter>
                    {
                        new SqlParameter("@postId", postId),
                        new SqlParameter("@userId", userId)
                    };

                    int rowsRemoved = conexao.ExecuteDeleteProcedure("DeleteLike", parametrosDeleteLike);

                    // Verifique se foi realmente removido, se foi, preencha o coraçãozinho <3
                    if (rowsRemoved > 0)
                    {
                        btnLike.ImageUrl = "images/heart.svg";
                        myDataList.DataBind();
                    }

                }
                else
                {
                    // adicionando um novo like na tblPostagemCurtidas (tabela específica para verificar se um usuário ja deu like em uma postagem.)
                    var parametrosDeleteLike = new List<SqlParameter>
                    {
                        new SqlParameter("@postId", postId),
                        new SqlParameter("@userId", userId)
                    };

                    int rowsAffected = conexao.ExecuteDeleteProcedure("AddLike", parametrosDeleteLike);

                    //se realmente teve uma mudança na tabela de likes individual do usuario no banco de dados e as linhas foram alteradas, inserindo o like na tabela de likes do usuario:
                    //então, se o usuário não tiver dado like naquela postagem antes, e conseguirmos succesívelmente inserir o like na tabela de likes do usuário,
                    //podemos então adicionar um like na postagem e que aparecerá para todos
                    if (rowsAffected > 0)
                    {
                        btnLike.ImageUrl = "images/heart-fill.svg";
                        myDataList.DataBind();
                    }
                }
                
            }
        }
    }

    protected void DataList_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "YourCommandName")
        {
            // Recupera a variável do item do DataList
            int codAutorPost = int.Parse(((DataListItem)e.Item).Attributes["CodAutorPost"]);

            // Salva a variável em uma sessão
            Session["postAuthorID"] = codAutorPost;
            Response.Redirect("user.aspx");
        }
    }

    protected void btnVerMais_Click(object sender, EventArgs e)
    {
        LinkButton lnkToggle = (LinkButton)sender;
        Label lblDescricao = (Label)lnkToggle.Parent.FindControl("lblDescricao");

        if (lblDescricao != null)
        {
            lblDescricao.Visible = !lblDescricao.Visible;
        }
    }
}
