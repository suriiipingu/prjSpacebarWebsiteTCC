using System;
using System.Activities;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.SessionState;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UserProfile;
using VerifyUpdateSession;

public partial class user : System.Web.UI.Page
{
    public string quantidadeCurtidas = null;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        // preenchendo a página do usuário aleatório
        //e pra ajudar, esse trecho de código ja passa para uma variável o cod_usuario de quem está sendo exibido
        if (Session["postAuthorID"] != null)
        {
            // pra chamar a função de construir o perfil do usuário aleatório,
            // preciso pegar o cod_usuario do perfil que foi clicado
            int cod_usuario_alvo = (int)Session["postAuthorID"];

            // chama a função de construir o perfil do usuário, agora passando o cod do usuário que está sendo exibido
            bool userRelation = ProfileManager.UserProfileBuilder(cod_usuario_alvo, this);

            //construir as postagens que apenas aquele usuário criou
            SqlDataSource1.SelectParameters["postAuthorID"].DefaultValue = cod_usuario_alvo.ToString();

            // este está funcionando tranquilo
            int cod_usuario_logado = Convert.ToInt32(Session["codigoUsuario"]);

            //mostrar imagem fundo e imagem de perfil do user
            ProfileManager.mostrarImagemPerfilUser(ImgPerfil, cod_usuario_alvo);
            ProfileManager.exibirImagemFundoUser(ImgFundo, cod_usuario_alvo);

            // estou tentando pegar se o usuário segue o outro e mostrar os botões da forma correta usando este método:
            bool relacaoUsuario = ProfileManager.CheckFollowUser(cod_usuario_logado, cod_usuario_alvo);
            if (relacaoUsuario)
            {
                btnSeguir.Text = "Seguindo";
            }
            else
            {
                btnSeguir.Text = "Seguir";
            }
        }
    }

    protected void btnSeguir_Click(object sender, EventArgs e)
    {
        if (Session["postAuthorID"] != null)
        {
            using (Conexao c = new Conexao())
            {
                int cod_usuario_exibido = (int)Session["postAuthorID"];
                int cod_usuario_conectado = Convert.ToInt32(Session["codigoUsuario"].ToString());
                bool resultado = ProfileManager.CheckFollowUser(cod_usuario_conectado, cod_usuario_exibido);
                if (resultado == false)
                {
                    //retornado o resultado (não segue), o usuário segue o outro
                    var parametrosFollowUser = new List<SqlParameter>
                    {
                        new SqlParameter("@usuario_seguidor", cod_usuario_conectado),
                        new SqlParameter("@usuario_alvo", cod_usuario_exibido)
                    };
                    c.sqlProcedure("FollowUser", parametrosFollowUser);
                    //seguiu com sucesso!

                    btnSeguir.Text = "Seguindo";
                    Server.Transfer(Request.Path);
                }
                else
                {
                    // retornado o resultado (já segue), pare de seguir
                    var parametrosUnfollowUser = new List<SqlParameter>
                    {
                        new SqlParameter("@usuario_seguidor", cod_usuario_conectado),
                        new SqlParameter("@usuario_alvo", cod_usuario_exibido)
                    };
                    c.sqlProcedure("Unfollowuser", parametrosUnfollowUser);
                    //parou de seguir com sucesso!
                    btnSeguir.Text = "Seguir";
                    Server.Transfer(Request.Path);
                }
            }
        }
    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (Session["postAuthorID"] != null)
        {
            int cod_usuario_alvo = (int)Session["postAuthorID"];
        
            Image ImgPerfilUser = (Image)e.Item.FindControl("ImgPerfilUser");
            ProfileManager.mostrarImagemPerfilUser(ImgPerfilUser, cod_usuario_alvo);
        }
    }
}