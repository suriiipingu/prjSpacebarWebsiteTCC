using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UserProfile;

public partial class search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            // Obtém os dados do SqlDataSource para o item atual do DataList
            DataRowView rowView = e.Item.DataItem as DataRowView;
            if (rowView != null)
            {
                string hexCodePerfil = rowView["icon_usuario"].ToString();

                int codUsuarioDataList = Convert.ToInt32(rowView["cod_usuario"]);

                Button btnSeguir = (Button)e.Item.FindControl("btnSeguir");
                btnSeguir.CommandArgument = codUsuarioDataList.ToString();

                Image ImgPerfilUser = (Image)e.Item.FindControl("ImgPerfilUser");
                ProfileManager.mostrarImagemPerfilUser(ImgPerfilUser, codUsuarioDataList);

                using (Conexao c = new Conexao())
                {
                    c.conectar();
                    var parametroSeguindo = new List<SqlParameter>();
                    parametroSeguindo.Add(new SqlParameter("@userId", codUsuarioDataList));
                    var qntdSeguindo = c.sqlProcedure("GetQuantityFollowing", parametroSeguindo);
                    Label lblSeguindo = (Label)e.Item.FindControl("lblSeguindo");
                    lblSeguindo.Text = qntdSeguindo.Tables[0].Rows[0][0].ToString();

                    var parametroSeguidor = new List<SqlParameter>();
                    parametroSeguidor.Add(new SqlParameter("@userId", codUsuarioDataList));
                    var qntdSeguidor = c.sqlProcedure("GetQuantityFollowers", parametroSeguidor);
                    Label lblSeguidores = (Label)e.Item.FindControl("lblSeguidores");
                    lblSeguidores.Text = qntdSeguindo.Tables[0].Rows[0][0].ToString();

                    var parametroVerificaSeguindo = new List<SqlParameter>();
                    parametroVerificaSeguindo.Add(new SqlParameter("@usuario_alvo", codUsuarioDataList));
                    parametroVerificaSeguindo.Add(new SqlParameter("@usuario_seguidor", Session["codigoUsuario"]));
                    var verificaSeguindo = c.sqlProcedure("VerifyIfUserIsAlreadyBeingFollowed", parametroVerificaSeguindo);

                    if (Convert.ToInt32(verificaSeguindo.Tables[0].Rows[0][0]) > 0)
                    {
                        btnSeguir.CssClass = "btn btn-outline-primary";
                        btnSeguir.Text = "Seguindo";
                    }
                }
            }
        }
    }
    protected void btnSeguir_Click(object sender, EventArgs e)
    {

    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        // todo e qualquer comando feito no DataList cai aqui, mas cabe a o if, verificar qual comando foi ativado e qual executar
        if (e.CommandName == "SeguirEDeixar")
        {
            using (Conexao c = new Conexao())
            {
                Button btnSeguir = (Button)e.Item.FindControl("btnSeguir");
                int codUsuarioDataList = Convert.ToInt32(btnSeguir.CommandArgument);
                int codUsuarioConectado = Convert.ToInt32(Session["codigoUsuario"]);

                bool resultado = ProfileManager.CheckFollowUser(codUsuarioConectado, codUsuarioDataList);
                if (resultado == false)
                {
                    //retornado o resultado (não segue), o usuário segue o outro
                    var parametrosFollowUser = new List<SqlParameter>
                    {
                        new SqlParameter("@usuario_seguidor", codUsuarioConectado),
                        new SqlParameter("@usuario_alvo", codUsuarioDataList)
                    };
                    c.sqlProcedure("FollowUser", parametrosFollowUser);
                    //seguiu com sucesso!

                    btnSeguir.CssClass = "btn btn-outline-primary";
                    btnSeguir.Text = "Seguindo";
                    Server.Transfer(Request.Path);
                }
                else
                {
                    // retornado o resultado (já segue), pare de seguir
                    var parametrosUnfollowUser = new List<SqlParameter>
                    {
                        new SqlParameter("@usuario_seguidor", codUsuarioConectado),
                        new SqlParameter("@usuario_alvo", codUsuarioDataList)
                    };
                    c.sqlProcedure("Unfollowuser", parametrosUnfollowUser);
                    //parou de seguir com sucesso!
                    btnSeguir.CssClass = "btn btn-primary";
                    btnSeguir.Text = "Seguir";
                    Server.Transfer(Request.Path);
                }
            }
        }
    }
}