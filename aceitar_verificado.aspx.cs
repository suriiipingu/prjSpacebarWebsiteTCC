using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aceitar_verificado : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (!IsPostBack)
        {
            using(Conexao c =  new Conexao())
            {
                // DataSet com todos os dados de usuários de quem está com status 'pendente'
                DataSet DadosVerificados = c.sqlProcedure("SelectVerificadoPendentes");

                int contador = e.Item.ItemIndex;
                int userIdAtual = Convert.ToInt32(DadosVerificados.Tables[0].Rows[contador]["cod_usuario"]);

                // obtendo a quantidade de publicações criadas de cada usuário a ser aceito

                var parameters = new List<SqlParameter>();
                parameters.Add(new SqlParameter("@userId", userIdAtual));

                DataSet result = c.sqlProcedure("GetPostsQntdByUser", parameters);

                // achando os controles na página asp.net
                Label lblNomeUsuario = (Label)e.Item.FindControl("lblNomeusuario");
                Label lblLoginUsuario = (Label)e.Item.FindControl("lblLoginUsuario");
                Label lblQntdPostagensUsuario = (Label)e.Item.FindControl("lblQntdPostagensUsuario");

                // inserindo os dados nos controles
                lblNomeUsuario.Text = DadosVerificados.Tables[0].Rows[contador]["nome_usuario"].ToString();
                lblLoginUsuario.Text = DadosVerificados.Tables[0].Rows[contador]["login_usuario"].ToString();
                lblQntdPostagensUsuario.Text = result.Tables[0].Rows[0]["qntd_posts"].ToString();
            }
        }
    }
}