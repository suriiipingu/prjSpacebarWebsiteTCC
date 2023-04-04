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

        if (FUimg.HasFile)
        {
            MemoryStream ms = new MemoryStream(FUimg.FileBytes);

            byte[] imgBytes = ms.ToArray();


            c.command.CommandText = "insert into tblUsuario(icon_usuario) values(@icon)";

            c.command.Parameters.Add("@icon", SqlDbType.VarBinary).Value = imgBytes;

            c.command.ExecuteNonQuery();

            c.fechaConexao();

            //byte[] imgBytes = new byte[FUimg.PostedFile.InputStream.Length + 1]; //passa os dados coletados no componente FileUpload para o array

            //FUimg.PostedFile.InputStream.Read(imgBytes, 0, imgBytes.Length); //o array imgBytes pode ser gravado como se fosse um parâmetro adicionado: c.command.Parameters.Add
        }

        

    }
}