using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.ServiceModel.Activities;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class verificado : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Clicar no botão da imagem upload e chamar o evento do File Upload
        imgEnviar.Attributes.Add("onclick", "document.getElementById('" + FileUploadVerificado.ClientID + "').click();");

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

            int codTipoAtual = 0;
            string status_verificado = "";

            // Obtém o valor atual do cod_tipo no banco de dados
            c.command.CommandText = "SELECT cod_tipo, status_verificado FROM tblUsuario WHERE cod_usuario = @codUsuarioConectado";
            using (SqlDataReader reader = c.command.ExecuteReader())
            {
                if (reader.Read())
                {
                    codTipoAtual = Convert.ToInt32(reader["cod_tipo"]);
                    status_verificado = reader["status_verificado"].ToString(); // Adicionado para obter o valor do status_verificado
                }
                else
                {
                    // Caso o usuário não seja encontrado, você pode tomar alguma ação apropriada
                    return;
                }
            }
            // Verifica o valor  do cod_tipo
            if (codTipoAtual == 3 || codTipoAtual == 4 || codTipoAtual == 5)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "EsconderSolicitacao", "EsconderSolicitacao();", true);
                ScriptManager.RegisterStartupScript(this, GetType(), "MostrarDivOcultar", "MostrarDivOcultar();", true);

            }else if (status_verificado=="pendente")
            {
                
                ScriptManager.RegisterStartupScript(this, GetType(), "EsconderSolicitacao", "EsconderSolicitacao();", true);
                ScriptManager.RegisterStartupScript(this, GetType(), "MostrarVerificadoPendente", "MostrarVerificadoPendente();", true);
            }
            else
            {
                // Caso o valor de cod_tipo não corresponda a nenhum dos casos acima, você pode tomar alguma ação apropriada
                return;
            }


        }
    }

    protected void btnEnviar_Click(object sender, EventArgs e)
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


            if (FileUploadVerificado.HasFile)
            {
                try
                {
                    string extensao = Path.GetExtension(FileUploadVerificado.FileName);
                    if (extensao.ToLower() == ".png" || extensao.ToLower() == ".jpg" || extensao.ToLower() == ".jpeg")
                    {
                        //Verificar se o tamanho da imagem (limite de 5mb)
                        if (FileUploadVerificado.FileBytes.Length <= 5242880)
                        {
                            byte[] imgUsu;
                            using (BinaryReader br = new BinaryReader(FileUploadVerificado.FileContent))
                            {
                                imgUsu = br.ReadBytes((int)FileUploadVerificado.FileContent.Length);
                            }

                            if (txtProfissao.Text.Length > 0)
                            {
                                //inserir profissao no banco
                                String profissao = txtProfissao.Text.Trim();

                                c.command.CommandText = "Update tblUsuario SET profissao = @profissao, img_comprovante=@img, status_verificado = @status where cod_usuario = @codUsuarioConectado";
                                c.command.Parameters.AddWithValue("@status", SqlDbType.VarChar).Value = "pendente";
                                c.command.Parameters.AddWithValue("@profissao", SqlDbType.VarChar).Value = profissao;
                                c.command.Parameters.Add("@img", SqlDbType.VarBinary).Value = imgUsu;

                                c.command.ExecuteNonQuery();

                                // Exibir mensagem de sucesso
                                lblErro.Text = "Sua solicitação foi enviada!";
                            }
                            else
                            {
                                lblErro.Text = "O campo profissão precisa estar preenchido.";
                            }

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
                
                catch (Exception ex)
                {
                    // Exibir mensagem de erro
                    lblErro.Text = "Ocorreu um erro durante o upload" + ex.Message;
                }
            } 
            
        }
    }
}