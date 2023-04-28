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

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string quantidadeCurtidas = null;

    // construindo as postagens, este ItemDataBound está linkado com o DataList, e a cada item do DataList, todo este escopo será executado
    protected void myDataList_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            //Encontre a badge de "verificado" usando o FIndControl na div
            var divVerifiedBadge = e.Item.FindControl("divVerifiedBadge") as HtmlGenericControl;

            // Obtem is dados de  "verificado" da fonte de dados
            DataRowView row = e.Item.DataItem as DataRowView;
            var valorVerificado = Convert.ToBoolean(DataBinder.Eval(e.Item.DataItem, "verificado"));

            // obtendo alguns dados para realizar a verificação de likes, contagem de posts
            HiddenField hfPostId = (HiddenField)e.Item.FindControl("hfPostId");
            string postId = hfPostId.Value;
            int userId = Convert.ToInt32(Session["codigoUsuario"]);
            ImageButton btnLike = e.Item.FindControl("btnLike") as ImageButton;

            //obtendo os dados de likes de todas as postagens e exibindo a contagem de cada uma delas
            //fazer um using da Conexao, porque sempre que ele executa esse trecho de código denovo, ele tenta abrir novamente a conexao
            using (Conexao c = new Conexao())
            {
                //acionando a função de conectar ao banco de dados pré-definido
                c.conectar();

                // Instânciando um objeto que irá adaptar para os comandos sql
                SqlDataAdapter dAdapter = new SqlDataAdapter();

                // vai pegar todos os dados obtidos e colocar dentro do DataSet
                // é um lugar aonde vai as informações que você buscou do banco de dados
                DataSet DataSetQuantidadeLikes = new DataSet();

                // usando a minha conexão e enviando um comando de texto para puxar os dados do banco de dados
                c.command.CommandText = "SELECT COUNT(tblPostagemCurtidas_cod_usuario) FROM tblPostagemCurtidas WHERE tblPostagemCurtidas_cod_post = @postID";

                // colocando todos esses parâmetros passados em uma variável
                c.command.Parameters.Add("@postID", postId);

                // o adaptador vai salvar o que ele vai executar
                dAdapter.SelectCommand = c.command;
                dAdapter.Fill(DataSetQuantidadeLikes);

                Label lblQuantidadeCurtidas = (Label)e.Item.FindControl("curtidas_postLabel");
                lblQuantidadeCurtidas.Text = (DataSetQuantidadeLikes.Tables[0].DefaultView[0].Row["Column1"].ToString());
            }
            // Vefifique se os dados de "verificado" são verdadeiros, se sim, mostre a badge
            if (valorVerificado)
            {
                divVerifiedBadge.Visible = true;
            }
            else
            {
                divVerifiedBadge.Visible = false;
            }

            if (row != null && btnLike != null)
            {
                string cod_post = row["cod_post"].ToString();
                btnLike.CommandArgument = cod_post;
            }

            //Verificar se o usuário ja curtiu uma postagem e mudar a imagem do botão
            if (Session["codigoUsuario"] != null)
            {
                using (Conexao c = new Conexao())
                {
                    c.conectar();

                    // Check if user already liked this post
                    string queryCheckLiked = "SELECT COUNT(*) FROM tblPostagemCurtidas WHERE tblPostagemCurtidas_cod_post = @postId AND tblPostagemCurtidas_cod_usuario = @userId";
                    SqlCommand cmdCheckLiked = new SqlCommand(queryCheckLiked, c.conexao);
                    cmdCheckLiked.Parameters.AddWithValue("@postId", postId);
                    cmdCheckLiked.Parameters.AddWithValue("@userId", userId);
                    int likedCount = (int)cmdCheckLiked.ExecuteScalar();

                    if (likedCount > 0)
                    {
                        btnLike.ImageUrl = "images/heart-fill.svg";
                    }

                    c.fechaConexao();
                }
            }
        }
    }

    protected void btnLike_OnClick(object sender, ImageClickEventArgs e)
    {
        // Get the ID of the post that the user wants to like
        ImageButton btnLike = (ImageButton)sender;
        string postId = btnLike.CommandArgument;

        // get user ID from session
        int userId = Convert.ToInt32(Session["codigoUsuario"]);

        if (Session["codigoUsuario"] != null && int.TryParse(Session["codigoUsuario"].ToString(), out userId))
        {
            // Update the "curtidas" value for the post in the "tblPostagem" table
            using (Conexao conexao = new Conexao())
            {
                conexao.conectar();
                string queryCheckLiked = "SELECT COUNT(*) FROM tblPostagemCurtidas WHERE tblPostagemCurtidas_cod_post = @postId AND tblPostagemCurtidas_cod_usuario = @userId";
                conexao.command.CommandText = queryCheckLiked;
                conexao.command.Parameters.AddWithValue("@postId", postId);
                conexao.command.Parameters.AddWithValue("@userId", userId);
                int alreadyLiked = Convert.ToInt32(conexao.command.ExecuteScalar());
                // Verifique se o usuário curtiu a postagem específica
                if (alreadyLiked > 0)
                {
                    // Retire a curtida da tabela de curtidas do usuário
                    string queryRemoveLike = "DELETE FROM tblPostagemCurtidas WHERE tblPostagemCurtidas_cod_post = @postId AND tblPostagemCurtidas_cod_usuario = @userId";
                    conexao.command.CommandText = queryRemoveLike;
                    conexao.command.Parameters.Clear();
                    conexao.command.Parameters.AddWithValue("@postId", postId);
                    conexao.command.Parameters.AddWithValue("@userId", userId);
                    int rowsRemoved = conexao.command.ExecuteNonQuery();

                    // se as linhas realmente foram removidas, então mude a imagem para um coração vazio
                    if (rowsRemoved > 0)
                    {
                        btnLike.ImageUrl = "images/heart.svg";
                        myDataList.DataBind();
                    }
                }
                else
                {
                    // adicionando um novo like na tblPostagemCurtidas (tabela específica para verificar se um usuário ja deu like em uma postagem.)
                    string queryAddLike = "INSERT INTO tblPostagemCurtidas (tblPostagemCurtidas_cod_post, tblPostagemCurtidas_cod_usuario) VALUES (@id_postagem, @id_usuario)";
                    conexao.command.CommandText = queryAddLike;
                    conexao.command.Parameters.Clear();
                    conexao.command.Parameters.AddWithValue("@id_postagem", postId);
                    conexao.command.Parameters.AddWithValue("@id_usuario", userId);
                    int rowsAffected = conexao.command.ExecuteNonQuery();

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
    protected void MyDataList_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "SelecionarUsuario")
        {
            // Obtenha o código do usuário do CommandArgument
            int cod_usuario = Convert.ToInt32(e.CommandArgument);

            // Chame o método C# passando o código do usuário como parâmetro
            ProfileManager.UserProfileBuilder(cod_usuario,this);
        }
    }
}