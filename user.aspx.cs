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

public partial class perfil_usuarioaleatorio : System.Web.UI.Page
{
    public string quantidadeCurtidas = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        // preenchendo a página do usuário aleatório
        //e pra ajudar, esse trecho de código ja passa para uma variável o cod_usuario de quem está sendo exibido
        if (Session["postAuthorID"] != null)
        {

            // pra chamar a função de construir o perfil do usuário aleatório,
            // preciso pegar o cod_usuario do perfil que foi clicado,
            int cod_usuario_exibido = (int)Session["postAuthorID"];
            
            // chama a função de construir o perfil do usuário, agora passando o cod do usuário que está sendo exibido
            ProfileManager.UserProfileBuilder(cod_usuario_exibido, this);
            SqlDataSource1.SelectParameters["parametroCodigoUsuarioVisualizado"].DefaultValue = cod_usuario_exibido.ToString();

            // este está funcionando tranquilo
            int cod_usuario_conectado = Convert.ToInt32(SessionManager.ReturnUserID(Session));

            // estou tentando pegar se o usuário segue o outro e mostrar os motões da forma correta usando este método:
            bool relacaoUsuario = ProfileManager.UserRelations(cod_usuario_conectado, cod_usuario_exibido, this);
        }
    }

    protected void btnSeguir_OnClick(object sender, EventArgs e)
    {
        if (Request.QueryString["user"] != null)
        {
            int cod_usuario_exibido = (int)Session["postAuthorID"];
            int cod_usuario_conectado = Convert.ToInt32(SessionManager.ReturnUserID(Session));
            //ProfileManager.FollowUser(cod_usuario_conectado, cod_usuario_exibido);
        }
    }
}