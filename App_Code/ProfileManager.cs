using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
/// <summary>
/// Descrição resumida de ProfileManager
/// </summary>
namespace UserProfile
{
    public class ProfileManager
    {
        // pega o cod do usuário criador daquela postagem, ou daquele escopo em que foi clicado,
        // redireciona o usuário para a página de perfil de um usuário, e a preenche usando os
        // dados obtidos do mesmo.
        public static bool UserProfileBuilder(int cod_usuario, Page page)
        {
            using (Conexao conexao = new Conexao())
            {
                conexao.conectar();
                string selectUserData = "SELECT * FROM tblUsuario WHERE cod_usuario = @cod_usuario";
                conexao.command.CommandText = selectUserData;
                conexao.command.Parameters.AddWithValue("@cod_usuario", cod_usuario);

                // Executa a query e armazena os resultados em um DataTable
                SqlDataAdapter adapter = new SqlDataAdapter(conexao.command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    // Armazena as informações do usuário em variáveis locais
                    var nomeUsuario = dt.Rows[0]["nome_usuario"].ToString();
                    var login_usuario = dt.Rows[0]["login_usuario"].ToString();
                    var desc_perfil_usuario = dt.Rows[0]["desc_perfil_usuario"].ToString();
                    
                    string seguindo_usuario = "SELECT COUNT(*) FROM tblSeguidores WHERE id_usuario_alvo = " + cod_usuario + ";";
                    DataSet dt2 = new DataSet();
                    conexao.command.CommandText = seguindo_usuario;
                    adapter.Fill(dt2);

                    string seguidores_usuario = "SELECT COUNT(*) FROM tblSeguidores WHERE id_usuario_seguidor = " + cod_usuario + ";";
                    conexao.command.CommandText = seguidores_usuario;
                    DataSet dt3 = new DataSet();
                    adapter.Fill(dt3);

                    var usuario_seguidores= (dt2.Tables[0].DefaultView[0].Row["Column1"].ToString());
                    var usuario_segue= (dt3.Tables[0].DefaultView[0].Row["Column1"].ToString());

                    // Encontra os controles na Página em que a função foi chamada
                    ContentPlaceHolder contentPlaceHolder = (ContentPlaceHolder)page.Master.FindControl("A");
                    Label lblNomeUsuarioPerfil = (Label)contentPlaceHolder.FindControl("lblNomeUsuario");
                    Label lblLoginUsuarioPerfil = (Label)contentPlaceHolder.FindControl("lblLoginUsuario");
                    Label lblDescPerfilUsuario = (Label)contentPlaceHolder.FindControl("lblPerfilDesc");
                    Label lblSeguidores = (Label)contentPlaceHolder.FindControl("lblSeguidores");
                    Label lblSeguindo = (Label)contentPlaceHolder.FindControl("lblSeguindo");

                    // Atualiza as informações dos controles
                    lblNomeUsuarioPerfil.Text = nomeUsuario;
                    lblLoginUsuarioPerfil.Text = "@" + login_usuario;
                    lblDescPerfilUsuario.Text = desc_perfil_usuario;
                    lblSeguidores.Text = usuario_seguidores;
                    lblSeguindo.Text = usuario_segue;
                }
            }
            return true;
        }

        public static bool UserRelations(int cod_usuario_logado, int cod_usuario_alvo, Page page)
        {
            using (Conexao C = new Conexao())
            {
                C.conectar();
                string ChecarRelacaoUsuario = "SELECT COUNT(id_usuario_seguidor) FROM tblSeguidores WHERE id_usuario_alvo = @usuarioSeguido AND id_usuario_seguidor = @usuarioSeguidor";
                SqlCommand cmdChecarRelacaoUsuario = new SqlCommand(ChecarRelacaoUsuario, C.conexao);
                cmdChecarRelacaoUsuario.Parameters.AddWithValue("@usuarioSeguido", cod_usuario_alvo);
                cmdChecarRelacaoUsuario.Parameters.AddWithValue("@usuarioSeguidor", cod_usuario_logado);
                int resultado = (int)cmdChecarRelacaoUsuario.ExecuteScalar();

                if (resultado > 0)
                {
                    ContentPlaceHolder contentPlaceHolder = (ContentPlaceHolder)page.Master.FindControl("A");
                    Button btnSeguir = (Button)contentPlaceHolder.FindControl("btnSeguir");
                    btnSeguir.Text = "Seguindo";
                    btnSeguir.CssClass = "seguindo-usuario";
                    return false;
                }
                else
                {
                    ContentPlaceHolder contentPlaceHolder = (ContentPlaceHolder)page.Master.FindControl("A");
                    Button btnSeguir = (Button)contentPlaceHolder.FindControl("btnSeguir");
                    btnSeguir.Text = "Seguir";
                    return true;
                }
            }
        }
        public static bool FollowUser(int cod_usuario_logado, int cod_usuario_alvo)
        {
            using (Conexao C = new Conexao())
            {
                C.conectar();
                string criarRelacao = "INSERT INTO tblSeguidores (id_usuario_seguidor,id_usuario_alvo) VALUES (@usuario_seguidor, @usuario_alvo)";
                SqlCommand cmdCriarRelacao = new SqlCommand(criarRelacao, C.conexao);
                cmdCriarRelacao.Parameters.AddWithValue("@usuario_alvo", cod_usuario_alvo);
                cmdCriarRelacao.Parameters.AddWithValue("@usuario_seguidor", cod_usuario_logado);
                int resultado = (int)cmdCriarRelacao.ExecuteScalar();

                if (resultado > 0)
                {
                    
                    return false;
                }
                else
                {
                    
                    return true;
                }
            }
        }
        public string returnUserLogin(object value)
        {
             var userLogin = value.ToString();

            if (!string.IsNullOrEmpty(userLogin))
            {
                System.Web.HttpContext.Current.Session["userLogin"] = userLogin;
                return (string)System.Web.HttpContext.Current.Session["userLogin"];
            }

            return ""; // default in case you can't process the value
        }
    }
}
