using OpenQA.Selenium;
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
                //inserir parametros para a procedure
                var parametersselectUserData = new List<SqlParameter>
                    {
                        new SqlParameter("@userId", cod_usuario)
                    };
                // Executa a query e armazena os resultados em um DataTable
                DataTable dt = conexao.sqlProcedureDataTable("GetuserInformation", parametersselectUserData);

                if (dt.Rows.Count > 0)
                {
                    // Armazena as informações do usuário em variáveis locais
                    var nomeUsuario = dt.Rows[0]["nome_usuario"].ToString();
                    var login_usuario = dt.Rows[0]["login_usuario"].ToString();
                    var desc_perfil_usuario = dt.Rows[0]["desc_perfil_usuario"].ToString();

                    //quanto seguidores esse alguém tem
                    var parametersUsuarioSeguidores = new List<SqlParameter>
                    {
                        new SqlParameter("@userId", cod_usuario)
                    };
                    DataTable dt2 = conexao.sqlProcedureDataTable("GetQuantityFollowers", parametersUsuarioSeguidores);

                    // quantas pessoas esse alguém segue
                    var parametersUsuarioSegue = new List<SqlParameter>
                    {
                        new SqlParameter("@userId", cod_usuario)
                    };
                    DataTable dt3 = conexao.sqlProcedureDataTable("GetQuantityFollowing", parametersUsuarioSegue);

                    // Extrair o numero de "seguindo" e "seguidores" do DataTable
                    int usuario_seguidores = 0;
                    int usuario_segue = 0;

                    if (dt2.Rows.Count > 0)
                    {
                        usuario_seguidores = Convert.ToInt32(dt2.Rows[0]["FollowersCount"]);
                    }

                    if (dt3.Rows.Count > 0)
                    {
                        usuario_segue = Convert.ToInt32(dt3.Rows[0]["FollowingCount"]);
                    }

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
                    lblSeguidores.Text = usuario_seguidores.ToString();
                    lblSeguindo.Text = usuario_segue.ToString();
                }
            }
            return true;
        }

        //public static bool UserRelations(int cod_usuario_logado, int cod_usuario_alvo, Page page)
        //{
        //    using (Conexao C = new Conexao())
        //    {
        //        C.conectar();
        //        var parametrosUserRelations = new List<SqlParameter>
        //            {
        //                new SqlParameter("@usuario_alvo", cod_usuario_alvo),
        //                new SqlParameter("@usuario_seguidor", cod_usuario_logado)
        //            };

        //        int boolSegueOuNao = C.ExecuteDeleteProcedure("VerifyIfUserIsAlreadyBeingFollowed", parametrosUserRelations);

        //        ContentPlaceHolder contentPlaceHolder = (ContentPlaceHolder)page.Master.FindControl("A");
        //        Button btnSeguir = (Button)contentPlaceHolder.FindControl("btnSeguir");

        //        if (boolSegueOuNao > 0)
        //        {
        //            return true;
        //        }
        //        else
        //        {
        //            return false;
        //        }
        //    }
        //}

        public static bool CheckFollowUser(int cod_usuario_logado, int cod_usuario_alvo)
        {
            using (Conexao c = new Conexao())
            {
                c.conectar();
                var parametrosVerify = new List<SqlParameter>
                    {
                        new SqlParameter("@usuario_seguidor", cod_usuario_logado),
                        new SqlParameter("@usuario_alvo", cod_usuario_alvo)
                    };
                DataSet query = c.sqlProcedure("VerifyIfUserIsAlreadyBeingFollowed", parametrosVerify);
                int resultado = Convert.ToInt32(query.Tables[0].Rows[0][0]);
                //verifica se o usuário logado ja segue o desejado
                if (resultado > 0)
                {// o usuário nao segue este, continua com o escopo para seguir o usuário
                    return true;
                }
                // o usuário ja segue este, segue o escopo para parar de seguir o usuário
                else
                {
                    return false;
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
