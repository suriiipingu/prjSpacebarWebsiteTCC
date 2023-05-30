using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.HtmlControls;
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
                    var desc_perfil_usuario = dt.Rows[0]["bio_usuario"].ToString();

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
                    Label lblBioUser = (Label)contentPlaceHolder.FindControl("lblBioUser");
                    Label lblSeguidores = (Label)contentPlaceHolder.FindControl("lblSeguidores");
                    Label lblSeguindo = (Label)contentPlaceHolder.FindControl("lblSeguindo");

                    // Atualiza as informações dos controles
                    lblNomeUsuarioPerfil.Text = nomeUsuario;
                    lblLoginUsuarioPerfil.Text = "@" + login_usuario;
                    lblBioUser.Text = desc_perfil_usuario;
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

        public static void mostrarImagemPerfil(Image imgPerfil, HttpSessionState session)
        {
            using (Conexao c = new Conexao())
            {
                c.conectar();

                if (session["logado"] != null && (bool)session["logado"])
                {

                    //mostrar imagem de perfil
                    string query = "SELECT icon_usuario FROM tblUsuario WHERE cod_usuario = @id";
                    object id = session["codigoUsuario"]; // id da imagem a ser recuperada
                    byte[] imageBytes = null;

                    c.command.CommandText = query;

                    c.command.Parameters.AddWithValue("@id", id);

                    using (SqlDataReader reader = c.command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            if (!reader.IsDBNull(reader.GetOrdinal("icon_usuario")))
                            {
                                imageBytes = (byte[])reader["icon_usuario"];
                            }
                            else
                            {
                                // Tratar valor nulo da coluna "icon_usuario"
                            }
                        }
                    }

                    // obtém o tipo de imagem
                    string imageType = "";
                    if (imageBytes != null && imageBytes.Length > 0)
                    {
                        using (var ms = new MemoryStream(imageBytes))
                        {
                            try
                            {
                                var img = System.Drawing.Image.FromStream(ms);
                                if (img.RawFormat.Equals(ImageFormat.Jpeg))
                                    imageType = "image/jpeg";
                                else if (img.RawFormat.Equals(ImageFormat.Png))
                                    imageType = "image/png";
                            }
                            catch (ArgumentException ex)
                            {
                                // a exceção será lançada se o formato da imagem for inválido
                                // fazer tratamento adequado aqui
                            }
                        }

                    }
                    if (!string.IsNullOrEmpty(imageType))
                    {
                        string base64String = Convert.ToBase64String(imageBytes);
                        string imageUrl = string.Format("data:{0};base64,{1}", imageType, base64String);
                        imgPerfil.ImageUrl = imageUrl;
                    }

                }


            }

        }

        public static void exibirImagemFundo(Image imgFundo, HttpSessionState session)
        {
            using (Conexao c = new Conexao())
            {
                c.conectar();

                if (session["logado"] != null && (bool)session["logado"])
                {
                    //mostrar imagem de fundo
                    string query = "SELECT imgfundo_usuario FROM tblUsuario WHERE cod_usuario = @id";
                    object id = session["codigoUsuario"];
                    byte[] imageBytes = null;

                    c.command.CommandText = query;

                    c.command.Parameters.AddWithValue("@id", id);

                    using (SqlDataReader reader = c.command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            if (!reader.IsDBNull(reader.GetOrdinal("imgfundo_usuario")))
                            {
                                imageBytes = (byte[])reader["imgfundo_usuario"];
                            }
                            else
                            {
                                // Tratar valor nulo da coluna "imgfundo_usuario"
                            }
                        }
                    }
                    // obtém o tipo de imagem
                    string imageType = "";
                    if (imageBytes != null && imageBytes.Length > 0)
                    {
                        using (var ms = new MemoryStream(imageBytes))
                        {
                            try
                            {
                                var img = System.Drawing.Image.FromStream(ms);
                                if (img.RawFormat.Equals(ImageFormat.Jpeg))
                                    imageType = "image/jpeg";
                                else if (img.RawFormat.Equals(ImageFormat.Png))
                                    imageType = "image/png";
                            }
                            catch (ArgumentException ex)
                            {
                                // a exceção será lançada se o formato da imagem for inválido
                                // fazer tratamento adequado aqui
                            }
                        }

                    }
                    if (!string.IsNullOrEmpty(imageType))
                    {
                        string base64String = Convert.ToBase64String(imageBytes);
                        string imageUrl = string.Format("data:{0};base64,{1}", imageType, base64String);
                        imgFundo.ImageUrl = imageUrl;
                    }

                }




            }
        }

        public static void mostrarSelos(Image selo1, Image selo2, HttpSessionState session)
        {
            using (Conexao c = new Conexao())
            {
                c.conectar();

                if (session["codigoUsuario"] != null)
                {

                    c.command.CommandText = "SELECT cod_tipo from tblUsuario where cod_usuario = @codUsuarioConectado";
                    c.command.Parameters.Add("@codUsuarioConectado", SqlDbType.VarChar).Value = session["codigoUsuario"].ToString();
                }
                else
                {
                    //slayyy
                }

                //mostrar selos

                int cod_tipo = (int)c.command.ExecuteScalar();


                //definir selos
                if (cod_tipo == 2)
                {
                    //criador de conteúdo
                    selo2.ImageUrl = "../images/BackSpace.svg";
                }
                else if (cod_tipo == 3)
                {
                    //verificado
                    selo2.ImageUrl = "../images/Verificado2.svg";
                }
                else if (cod_tipo == 4)
                {
                    //criador de conteúdo e verificado
                    selo2.ImageUrl = "../images/BackSpace.svg";
                    selo1.ImageUrl = "../images/Verificado2.svg";

                }
                else if (cod_tipo == 5)
                {
                    //ADM
                }
            }
        }

        public static bool VerificarLoginEmail(string login, string email)
        {
            using (Conexao c = new Conexao())
            {

                c.conectar();

                List<SqlParameter> parameters = new List<SqlParameter>();
                parameters.Add(new SqlParameter("@login", login));
                parameters.Add(new SqlParameter("@email", email));

                DataSet dt = c.sqlProcedure("SelectVerificarLoginEmail", parameters);

                if (dt.Tables[0].Rows.Count > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            // se o sql nao retornar nada (que quer dizer que nao tem um email ou login igual ao que o usuarui colocou), retornamos false, para dizer que nao tem nada
            // caso o sql retorne algo, (significa que o login ou email que o usuario colocou ja existe), logo, retorna true

        }

        public static void mostrarImagemPerfilUser(Image imgPerfil, int codUsuario)
        {
            using (Conexao c = new Conexao())
            {
                c.conectar();
                if (codUsuario > 0)
                {
                    //mostrar imagem de perfil
                    string query = "SELECT icon_usuario FROM tblUsuario WHERE cod_usuario = @id";
                    object id = codUsuario; // id da imagem a ser recuperada
                    byte[] imageBytes = null;

                    c.command.CommandText = query;

                    c.command.Parameters.AddWithValue("@id", id);

                    using (SqlDataReader reader = c.command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            if (!reader.IsDBNull(reader.GetOrdinal("icon_usuario")))
                            {
                                imageBytes = (byte[])reader["icon_usuario"];
                            }
                            else
                            {
                                // Tratar valor nulo da coluna "icon_usuario"
                            }
                        }
                    }

                    // obtém o tipo de imagem
                    string imageType = "";
                    if (imageBytes != null && imageBytes.Length > 0)
                    {
                        using (var ms = new MemoryStream(imageBytes))
                        {
                            try
                            {
                                var img = System.Drawing.Image.FromStream(ms);
                                if (img.RawFormat.Equals(ImageFormat.Jpeg))
                                    imageType = "image/jpeg";
                                else if (img.RawFormat.Equals(ImageFormat.Png))
                                    imageType = "image/png";
                            }
                            catch (ArgumentException ex)
                            {
                                // a exceção será lançada se o formato da imagem for inválido
                                // fazer tratamento adequado aqui
                            }
                        }

                    }
                    if (!string.IsNullOrEmpty(imageType))
                    {
                        string base64String = Convert.ToBase64String(imageBytes);
                        string imageUrl = string.Format("data:{0};base64,{1}", imageType, base64String);
                        imgPerfil.ImageUrl = imageUrl;
                    }

                }


            }

        }

        public static void exibirImagemFundoUser(Image imgFundo, int codUsuarioAlvo)
        {
            using (Conexao c = new Conexao())
            {
                c.conectar();

                if (codUsuarioAlvo > 0)
                {
                    //mostrar imagem de fundo
                    string query = "SELECT imgfundo_usuario FROM tblUsuario WHERE cod_usuario = @id";
                    object id = codUsuarioAlvo;
                    byte[] imageBytes = null;

                    c.command.CommandText = query;

                    c.command.Parameters.AddWithValue("@id", id);

                    using (SqlDataReader reader = c.command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            if (!reader.IsDBNull(reader.GetOrdinal("imgfundo_usuario")))
                            {
                                imageBytes = (byte[])reader["imgfundo_usuario"];
                            }
                            else
                            {
                                // Tratar valor nulo da coluna "imgfundo_usuario"
                            }
                        }
                    }
                    // obtém o tipo de imagem
                    string imageType = "";
                    if (imageBytes != null && imageBytes.Length > 0)
                    {
                        using (var ms = new MemoryStream(imageBytes))
                        {
                            try
                            {
                                var img = System.Drawing.Image.FromStream(ms);
                                if (img.RawFormat.Equals(ImageFormat.Jpeg))
                                    imageType = "image/jpeg";
                                else if (img.RawFormat.Equals(ImageFormat.Png))
                                    imageType = "image/png";
                            }
                            catch (ArgumentException ex)
                            {
                                // a exceção será lançada se o formato da imagem for inválido
                                // fazer tratamento adequado aqui
                            }
                        }

                    }
                    if (!string.IsNullOrEmpty(imageType))
                    {
                        string base64String = Convert.ToBase64String(imageBytes);
                        string imageUrl = string.Format("data:{0};base64,{1}", imageType, base64String);
                        imgFundo.ImageUrl = imageUrl;
                    }

                }




            }
        }

        public static void exibirImagemPost(Image imgFundo, int codPost)
        {
            using (Conexao c = new Conexao())
            {
                c.conectar();

                if (codPost > 0)
                {
                    //mostrar imagem de fundo
                    string query = "SELECT img_post FROM tblPost WHERE cod_post = @idpost";
                    object idpost = codPost;
                    byte[] imageBytes = null;

                    c.command.CommandText = query;

                    c.command.Parameters.AddWithValue("@idpost", codPost);

                    using (SqlDataReader reader = c.command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            if (!reader.IsDBNull(reader.GetOrdinal("img_post")))
                            {
                                imageBytes = (byte[])reader["img_post"];
                            }
                            else
                            {
                                // Tratar valor nulo da coluna "imgfundo_usuario"
                            }
                        }
                    }
                    // obtém o tipo de imagem
                    string imageType = "";
                    if (imageBytes != null && imageBytes.Length > 0)
                    {
                        using (var ms = new MemoryStream(imageBytes))
                        {
                            try
                            {
                                var img = System.Drawing.Image.FromStream(ms);
                                if (img.RawFormat.Equals(ImageFormat.Jpeg))
                                    imageType = "image/jpeg";
                                else if (img.RawFormat.Equals(ImageFormat.Png))
                                    imageType = "image/png";
                            }
                            catch (ArgumentException ex)
                            {
                                // a exceção será lançada se o formato da imagem for inválido
                                // fazer tratamento adequado aqui

                            }
                        }

                    }
                    if (!string.IsNullOrEmpty(imageType))
                    {
                        string base64String = Convert.ToBase64String(imageBytes);
                        string imageUrl = string.Format("data:{0};base64,{1}", imageType, base64String);
                        imgFundo.ImageUrl = imageUrl;
                    }

                }




            }
        }

    }
}
