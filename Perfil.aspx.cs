using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using VerifyUpdateSession;
using UserProfile;

public partial class Perfil : System.Web.UI.Page
{
    public string quantidadeCurtidas = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            // Verifica se o usuário está logado e atualiza as informações na página
            if (Session["logado"] != null && (bool)Session["logado"])
            {
                SessionManager.IsUserLoggedInProfile(Session, this);
                ProfileManager.mostrarImagemPerfil(ImgPerfil, Session);
                ProfileManager.exibirImagemFundo(ImgFundoPerfil, Session);

                int codUsuarioLogado = (int)Session["codigoUsuario"];
                SqlDataSource1.SelectParameters["postAuthorID"].DefaultValue = codUsuarioLogado.ToString();
            }
        }
    }
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
}