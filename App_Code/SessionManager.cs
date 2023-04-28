using System.Data.SqlClient;
using System.Data;
using System.Web.SessionState;
using System.Web.UI;
using Label = System.Web.UI.WebControls.Label;
using System.Web.UI.WebControls;
using System.Security.Cryptography.X509Certificates;
using System;

/// <summary>
/// Descrição resumida de SessionManager
/// 
/// Cuida da sessão do usuário conectado, tratando e verificando suas conexões
/// 
/// A classe contém funções que ao serem chamadas verificam se o usuário está logado a partir das informações proferidas após o login na página fazer-login.aspx,
/// se a session do usuário inserido for verdadeira, irá se aplicar as mudanças a interface do usuário.
/// 
/// - Igoritto
/// 
/// </summary>

namespace VerifyUpdateSession
{ 
    public class SessionManager
    {
        public static bool IsUserLoggedInMaster(HttpSessionState session, MasterPage masterPage)
        {
            // se a minha sessão logado for diferente de null (valor de 1), E tiver um booleano true: usuário logado.
            if (session["logado"] != null && (bool)session["logado"])
            {
                // O usuário está logado, atualiza as informações na Master Page
                string nomeUsuario = session["nomeUsuario"].ToString();
                string login_usuario = session["loginUsuario"].ToString();

                // Encontra os controles na Master Page
                Label lblUserNameNavbar = (Label)masterPage.FindControl("lblUserNameNavbar");
                Label lblUserLoginNavbar = (Label)masterPage.FindControl("lblUserLoginNavbar");

                // Atualiza as informações dos controles
                lblUserNameNavbar.Text = nomeUsuario;
                lblUserLoginNavbar.Text = "@" + login_usuario;

                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool IsUserLoggedInProfile(HttpSessionState session, Page page)
        {
            if (session["logado"] != null && (bool)session["logado"])
            {
                // O usuário está logado, atualiza as informações na Master Page
                var nomeUsuario = session["nomeUsuario"].ToString();
                var login_usuario = session["loginUsuario"].ToString();
                var desc_perfil_usuario = session["desc_perfil_usuario"].ToString();
                var seguidores_usuario = session["seguidoresUsuario"].ToString();
                var usuario_segue = session["UsuarioSegue"].ToString();

                // Encontra os controles na Página em que a função foi chamada
                ContentPlaceHolder contentPlaceHolder = (ContentPlaceHolder)page.Master.FindControl("A");
                Label lblNomeUsuarioPerfil = (Label)contentPlaceHolder.FindControl("lblNomeUsuarioPerfil");
                Label lblLoginUsuarioPerfil = (Label)contentPlaceHolder.FindControl("lblLoginUsuarioPerfil");
                Label lblDescPerfilUsuario = (Label)contentPlaceHolder.FindControl("lblDescPerfilUsuario");
                Label lblSeguidores = (Label)contentPlaceHolder.FindControl("lblSeguidores");
                Label lblSeguindo = (Label)contentPlaceHolder.FindControl("lblSeguindo");

                // Atualiza as informações dos controles
                lblNomeUsuarioPerfil.Text = nomeUsuario;
                lblLoginUsuarioPerfil.Text = "@" + login_usuario;
                lblDescPerfilUsuario.Text = desc_perfil_usuario;
                lblSeguidores.Text = seguidores_usuario;
                lblSeguindo.Text = usuario_segue;

                return true;
            }
            else
            {
                return false;
            }
        }
        //Usando, você chama a função SessionManager.ReturnUserID e como parâmetro passa sua Session,
        //se o usuário estiver logado, irá ser retornado uma String do código do usuário logado.
        public static string ReturnUserID(HttpSessionState session)
        {
            if (session["logado"] != null && (bool)session["logado"])
            {
                return session["codigoUsuario"].ToString();
            }
            else { return "error"; }
        }
        private bool CheckIfFollowing(int followerId, int followingId)
        {
            using (Conexao conexao = new Conexao())
            {
                conexao.conectar();

                SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM tblSeguidores WHERE id_usuario_seguidor = @followerId AND id_usuario_alvo = @followingId");
                command.Parameters.AddWithValue("@followerId", followerId);
                command.Parameters.AddWithValue("@followingId", followingId);
                command.Connection = conexao.conexao;
                int count = Convert.ToInt32(command.ExecuteScalar());

                return (count > 0);
            }
        }
    }
}