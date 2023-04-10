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
using VerifyUpdateSession;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void myDataList_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            // Find the "verified" badge div control
            var divVerifiedBadge = e.Item.FindControl("divVerifiedBadge") as HtmlGenericControl;

            // Get the "verified" data from the data source
            DataRowView row = e.Item.DataItem as DataRowView;
            HiddenField hfPostId = (HiddenField)e.Item.FindControl("hfPostId");
            string postId = hfPostId.Value;
            int userId = Convert.ToInt32(Session["codigoUsuario"]);
            var valorVerificado = Convert.ToBoolean(DataBinder.Eval(e.Item.DataItem, "verificado"));
            ImageButton btnLike = e.Item.FindControl("btnLike") as ImageButton;


            // Check if the "verified" data is true and show the badge if it is
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
                using (Conexao conexao = new Conexao())
                {
                    conexao.conectar();

                    // Check if user already liked this post
                    string queryCheckLiked =
                        "SELECT COUNT(*) FROM tblPostagemCurtidas WHERE tblPostagemCurtidas_cod_post = @postId AND tblPostagemCurtidas_cod_usuario = @userId";
                    SqlCommand cmdCheckLiked = new SqlCommand(queryCheckLiked, conexao.conexao);
                    cmdCheckLiked.Parameters.AddWithValue("@postId", postId);
                    cmdCheckLiked.Parameters.AddWithValue("@userId", userId);
                    int likedCount = (int)cmdCheckLiked.ExecuteScalar();

                    if (likedCount > 0)
                    {
                        btnLike.ImageUrl = "images/heart-fill.svg";
                    }

                    conexao.fechaConexao();
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
                // Check if the user has already liked the post in the tblPost table
                if (alreadyLiked > 0)
                {
                    // Retire a curtida da tabela de curtidas do usuário
                    string queryRemoveLike = "DELETE FROM tblPostagemCurtidas WHERE tblPostagemCurtidas_cod_post = @postId AND tblPostagemCurtidas_cod_usuario = @userId";
                    conexao.command.CommandText = queryRemoveLike;
                    conexao.command.Parameters.Clear();
                    conexao.command.Parameters.AddWithValue("@postId", postId);
                    conexao.command.Parameters.AddWithValue("@userId", userId);
                    int rowsRemoved = conexao.command.ExecuteNonQuery();

                    if (rowsRemoved > 0)
                    { 
                        // Update the "curtidas" value for the post in the "tblPostagem" table
                        string queryUpdateLikes = "UPDATE tblPost SET curtidas_post = curtidas_post - 1 WHERE cod_post = @id_postagem";
                        conexao.command.CommandText = queryUpdateLikes;
                        conexao.command.Parameters.Clear();
                        conexao.command.Parameters.AddWithValue("@id_postagem", postId);
                        int updatedRows = conexao.command.ExecuteNonQuery();

                        if (updatedRows > 0)
                        { 
                            // Update the DataList to display the current number of likes
                            btnLike.ImageUrl = "Images/heart.svg";
                            myDataList.DataBind();
                        }
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
                        // atualizar numero total de curtidas na tabela do post
                        string queryUpdateLikes = "UPDATE tblPost SET curtidas_post = curtidas_post + 1 WHERE cod_post = @id_postagem";
                        conexao.command.CommandText = queryUpdateLikes;
                        conexao.command.Parameters.Clear();
                        conexao.command.Parameters.AddWithValue("@id_postagem", postId);
                        int updatedRows = conexao.command.ExecuteNonQuery();

                        //se realmente teve uma mudança na tabela individual da postagem
                        if (updatedRows > 0)
                        {
                            // atualizar o DataList para exibir o número total de likes atualmente
                            myDataList.DataBind();
                            btnLike.ImageUrl = "Images/heart_filled.svg";
                        }
                    }
                }
            }
        }
    }
}