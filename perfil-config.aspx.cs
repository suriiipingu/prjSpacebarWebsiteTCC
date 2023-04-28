using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class perfil_config : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnCamImg.Attributes.Add("onclick", "document.getElementById('" + FUimg.ClientID + "').click();");
        btnAtualizar.Attributes.Add("onclick", "document.getElementById('" + FUimgmini.ClientID + "').click();");
        /*btnAtualizar2.Attributes.Add("onclick", "document.getElementById('" + FUimg.ClientID + "').click();");*/
    }

    protected void btnSalvar_Click(object sender, EventArgs e)

    {
        Conexao c = new Conexao();
        c.conectar();

        string usuario = "usuario1";

        string pastaImagens = Server.MapPath("~/imagens-usuarios/icon/");

        if (FUimg.HasFile) //salvar imagem na pasta do usuario
        {

            string pastaUsuario = Path.Combine(pastaImagens, usuario);

            if (!Directory.Exists(pastaUsuario))
            {
                Directory.CreateDirectory(pastaUsuario);
            }

            string caminhoCompletoArquivo = Path.Combine(pastaUsuario,"arquivo1.jpg");

            FUimg.SaveAs(caminhoCompletoArquivo);


        }



    }
}