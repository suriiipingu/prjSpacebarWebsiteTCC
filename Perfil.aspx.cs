using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using VerifyUpdateSession;
using UserProfile;

public partial class Perfil : System.Web.UI.Page
{
    public string quantidadeCurtidas = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            // Verifica se o usuário está logado e atualiza as informações na página
            if (Session["logado"] != null && (bool)Session["logado"])
            {
                SessionManager.IsUserLoggedInProfile(Session, this);
                ProfileManager.mostrarImagemPerfil(ImgPerfil, Session);
                ProfileManager.exibirImagemFundo(ImgFundoPerfil, Session);

                int codUsuarioLogado = (int)Session["codigoUsuario"];
                SqlDataSource1.SelectParameters["postAuthorID"].DefaultValue = codUsuarioLogado.ToString();
            }
        }
    }
    protected void myDataList_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            int itemIndex = e.Item.ItemIndex;
            int cod_post = (int)DataList1.DataKeys[itemIndex];
            // Recupera os dados do post correspondente ao cod_post
            DataView dataView = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            // Acessa diretamente a primeira linha do DataView
            DataRowView selectedUserRow = dataView[0];

            Image ImgPost = (Image)e.Item.FindControl("ImgPost");
            ProfileManager.exibirImagemPost(ImgPost, cod_post);

        }
    }
}