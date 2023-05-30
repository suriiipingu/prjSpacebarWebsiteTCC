using System;
using System.Activities.Statements;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Profile;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using VerifyUpdateSession;
using UserProfile;

public partial class perfil_config : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Clicar no botão da imagem de perfil e chamar o evento do File Upload - Computador
        btnCamImg.Attributes.Add("onclick", "document.getElementById('" + FUimg.ClientID + "').click();");

        //Clicar no botão da imagem de fundo e chamar o evento do File Upload - Computador
        btnCamFundo.Attributes.Add("onclick", "document.getElementById('" + FileUploadFundo.ClientID + "').click();");

        //Clicar no botão da imagem de perfil e chamar o evento do File Upload - Celular
        btnAtualizar.Attributes.Add("onclick", "document.getElementById('" + FUimgmini.ClientID + "').click();");

        //Clicar no botão da imagem de fundo e chamar o evento do File Upload - Celular
        btnAtualizar2.Attributes.Add("onclick", "document.getElementById('" + FileUploadFundoCelular.ClientID + "').click();");

        UserProfile.ProfileManager.mostrarImagemPerfil(imgPerfil, Session);
        UserProfile.ProfileManager.mostrarImagemPerfil(imgPerfilCel, Session);
        UserProfile.ProfileManager.exibirImagemFundo(imgFundo, Session);
        UserProfile.ProfileManager.exibirImagemFundo(imgFundoCel, Session);
        UserProfile.ProfileManager.mostrarSelos(selo1, selo2, Session);
    }

    protected void btnSalvar_Click(object sender, EventArgs e)

    {
        using(Conexao c = new Conexao())
        {
            c.conectar();

            if (Session["codigoUsuario"] != null)
            {
                c.command.Parameters.Add("@codUsuarioConectado", SqlDbType.VarChar).Value = Session["codigoUsuario"].ToString();
            }
            else
            {
                Response.Redirect("fazer-login.aspx");
            }

            //salvar imagem de perfil no banco em varbinary - Computador
            if (FUimg.HasFile) //salvar imagem no banco de dados em VARBINARY
            {
                //verficia qual a extensão do arquivo enviado
                string extensao = Path.GetExtension(FUimg.FileName);
                if (extensao.ToLower() == ".png" || extensao.ToLower() == ".jpg" || extensao.ToLower() == ".jpeg")
                {
                    //Verificar se o tamanho da imagem (limite de 5mb)
                    if (FUimg.FileBytes.Length <= 5242880)
                    {
                        byte[] imgUsu;
                        using (BinaryReader br = new BinaryReader(FUimg.FileContent))
                        {
                            imgUsu = br.ReadBytes((int)FUimg.FileContent.Length);
                        }

                        c.command.CommandText = "UPDATE tblUsuario SET icon_usuario = @icon WHERE cod_usuario = @codUsuarioConectado";
                        c.command.Parameters.Add("@icon", SqlDbType.VarBinary).Value = imgUsu;


                        c.command.ExecuteNonQuery();
                    }
                    else
                    {
                        lblErro.Text = "A imagem escolhida é maior do que 5mb";
                    }
                }
                else
                {
                    lblErro.Text = "A imagem de perfil deve ser png, jpg ou jpeg";

                }


            }
            //salvar imagem de fundo no banco em varbinary - Computador
            if (FileUploadFundo.HasFile) //salvar imagem no banco de dados em VARBINARY
            {
                //verficia qual a extensão do arquivo enviado
                string extensao = Path.GetExtension(FileUploadFundo.FileName);
                if (extensao.ToLower() == ".png" || extensao.ToLower() == ".jpg" || extensao.ToLower() == ".jpeg")
                {
                    //Verificar se o tamanho da imagem (limite de 5mb)
                    if (FileUploadFundo.FileBytes.Length <= 5242880)
                    {
                        byte[] imgUsu;
                        using (BinaryReader br = new BinaryReader(FileUploadFundo.FileContent))
                        {
                            imgUsu = br.ReadBytes((int)FileUploadFundo.FileContent.Length);
                        }

                        c.command.CommandText = "UPDATE tblUsuario SET imgfundo_usuario = @imgfundo WHERE cod_usuario = @codUsuarioConectado";
                        c.command.Parameters.Add("@imgfundo", SqlDbType.VarBinary).Value = imgUsu;


                        c.command.ExecuteNonQuery();
                    }
                    else
                    {
                        lblErro.Text = "A imagem escolhida para wallpaper é maior do que 5mb.";
                    }
                }
                else
                {
                    lblErro.Text = "A imagem do wallpaper deve ser png, jpg ou jpeg.";

                }


            }



            //atualizar nome

            if (txtNomeUsu.Text.Length > 0)
            {

                String NomeAtualizado = txtNomeUsu.Text.Trim();
             

                c.command.CommandText = "Update tblUsuario set nome_usuario=@nome where cod_usuario = @codUsuarioConectado";

                c.command.Parameters.Add("@nome", SqlDbType.VarChar).Value = NomeAtualizado;

                c.command.ExecuteNonQuery();


            }


            if (txtBio.Text.Length>0)
            {
                //criar bio
                String bio = txtBio.Text.Trim();

                c.command.CommandText = "Update tblUsuario set bio_usuario=@bio where cod_usuario = @codUsuarioConectado";

                c.command.Parameters.Add("@bio", SqlDbType.VarChar).Value = bio;


                c.command.ExecuteNonQuery();

            }



        }
        

    }

    protected void btnSalvar2_Click(object sender, EventArgs e)
    {
        using (Conexao c = new Conexao())
        {
            c.conectar();

            if (Session["codigoUsuario"] != null)
            {
                c.command.Parameters.Add("@codUsuarioConectado", SqlDbType.VarChar).Value = Session["codigoUsuario"].ToString();
            }
            else
            {
                Response.Redirect("fazer-login.aspx");
            }
            //salvar imagem de perfil no banco em varbinary - Celular
            if (FUimgmini.HasFile) //salvar imagem no banco de dados em VARBINARY
            {
                //verficia qual a extensão do arquivo enviado
                string extensao = Path.GetExtension(FUimgmini.FileName);
                if (extensao.ToLower() == ".png" || extensao.ToLower() == ".jpg" || extensao.ToLower() == ".jpeg")
                {
                    //Verificar se o tamanho da imagem (limite de 5mb)
                    if (FUimgmini.FileBytes.Length <= 5242880)
                    {
                        byte[] imgUsu;
                        using (BinaryReader br = new BinaryReader(FUimgmini.FileContent))
                        {
                            imgUsu = br.ReadBytes((int)FUimgmini.FileContent.Length);
                        }

                        c.command.CommandText = "UPDATE tblUsuario SET icon_usuario = @icon WHERE cod_usuario = @codUsuarioConectado";
                        c.command.Parameters.Add("@icon", SqlDbType.VarBinary).Value = imgUsu;


                        c.command.ExecuteNonQuery();
                    }
                    else
                    {
                        lblErro.Text = "A imagem escolhida é maior do que 5mb";
                    }
                }
                else
                {
                    lblErro.Text = "A imagem de perfil deve ser png, jpg ou jpeg.";

                }


            }
            //salvar imagem de fundo no banco em varbinary - Celular
            if (FileUploadFundoCelular.HasFile) //salvar imagem no banco de dados em VARBINARY
            {
                //verficia qual a extensão do arquivo enviado
                string extensao = Path.GetExtension(FileUploadFundoCelular.FileName);
                if (extensao.ToLower() == ".png" || extensao.ToLower() == ".jpg" || extensao.ToLower() == ".jpeg")
                {
                    //Verificar se o tamanho da imagem (limite de 5mb)
                    if (FileUploadFundoCelular.FileBytes.Length <= 5242880)
                    {
                        byte[] imgUsu;
                        using (BinaryReader br = new BinaryReader(FileUploadFundoCelular.FileContent))
                        {
                            imgUsu = br.ReadBytes((int)FileUploadFundoCelular.FileContent.Length);
                        }

                        c.command.CommandText = "UPDATE tblUsuario SET imgfundo_usuario = @imgfundo WHERE cod_usuario = @codUsuarioConectado";
                        c.command.Parameters.Add("@imgfundo", SqlDbType.VarBinary).Value = imgUsu;


                        c.command.ExecuteNonQuery();
                    }
                    else
                    {
                        lblErro.Text = "A imagem escolhida é maior do que 5mb";
                    }
                }
                else
                {
                    lblErro.Text = "A imagem do wallpaper deve ser png, jpg ou jpeg.";

                }


            }

            //atualizar nome

            if (txtNomeUsu.Text.Length > 0)
            {

                String NomeAtualizado = txtNomeUsu.Text.Trim();


                c.command.CommandText = "Update tblUsuario set nome_usuario=@nome where cod_usuario = @codUsuarioConectado";

                c.command.Parameters.Add("@nome", SqlDbType.VarChar).Value = NomeAtualizado;

                c.command.ExecuteNonQuery();


            }


            if (txtBio.Text.Length > 0)
            {
                //criar bio
                String bio = txtBio.Text.Trim();

                c.command.CommandText = "Update tblUsuario set bio_usuario=@bio where cod_usuario = @codUsuarioConectado";

                c.command.Parameters.Add("@bio", SqlDbType.VarChar).Value = bio;


                c.command.ExecuteNonQuery();

            }

        }


    }
}
