using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UserProfile;
using Newtonsoft.Json;


public partial class aceitar_verificado : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        lblNomeUsuario.Text = nomeUsuarioSelecionado;
        lblLoginUsuario.Text = loginUsuarioSelecionado;

        using (Conexao c =  new Conexao())
        {
            c.conectar();
            DataSet SelectStatusVerificado = c.sqlProcedure("SelectVerificadoAceitosPendenteNegadoQntd");

            // Verifique se o DataSet contém uma tabela
            if (SelectStatusVerificado.Tables.Count > 0)
            {
                // Acesse a primeira tabela do DataSet
                DataTable dataTable = SelectStatusVerificado.Tables[0];

                // Verifique se a tabela contém linhas
                if (dataTable.Rows.Count > 0)
                {
                    // Acesse a primeira linha da tabela
                    DataRow row = dataTable.Rows[0];

                    // Obtenha a quantidade para cada status_verificado
                    int qntdAceitos = Convert.ToInt32(row["total_usuarios"]);
                    int qntdRecusados = Convert.ToInt32(row["total_usuarios"]);
                    int qntdPendentes = Convert.ToInt32(row["total_usuarios"]);

                    // Atribua os valores às Labels
                    lblSolicitacoesAceitas.Text = qntdAceitos.ToString();
                    lblSolicitacoesNegadas.Text = qntdRecusados.ToString();
                    lblSolicitacoesPendentes.Text = qntdPendentes.ToString();
                }
            }
        }
    }

    protected void DataList1_ItemDataBound1(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            // Acesse os controles dentro do item do DataList
            Label lblNomeUsuario = (Label)e.Item.FindControl("lblNomeUsuarioLista");
            Label lblLoginUsuario = (Label)e.Item.FindControl("lblLoginUsuarioLista");

            // Acesse os dados associados ao item
            DataRowView row = (DataRowView)e.Item.DataItem;
            int codUsuario = Convert.ToInt32(row["cod_usuario"]);

            Image imgPerfilUsuarioLista = (Image)e.Item.FindControl("imgPerfilUsuarioLista");
            ProfileManager.mostrarImagemPerfilUser(imgPerfilUsuarioLista, codUsuario);
        }
    }

    protected void pnlMostrarInformacoes_Click(object sender, EventArgs e)
    {
        Panel pnlMostrarInformacoes = (Panel)sender;
        DataListItem item = (DataListItem)pnlMostrarInformacoes.NamingContainer;

        Label lblNomeUsuario = (Label)item.FindControl("lblNomeUsuarioLista");
        Label lblLoginUsuario = (Label)item.FindControl("lblLoginUsuarioLista");

        // Atribua os valores das Labels a outras Labels desejadas
        lblNomeUsuario.Text = lblNomeUsuario.Text;
        lblLoginUsuario.Text = lblLoginUsuario.Text;
    }

    protected string nomeUsuarioSelecionado;
    protected string loginUsuarioSelecionado;

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "MostrarInformacoes")
        {
            // Obtenha o índice do item clicado
            int index = e.Item.ItemIndex;

            // Obtenha os controles dentro do item clicado
            Label lblNomeUsuario = (Label)e.Item.FindControl("lblNomeUsuarioLista");
            Label lblLoginUsuario = (Label)e.Item.FindControl("lblLoginUsuarioLista");

            // Armazene os valores em variáveis temporárias
            nomeUsuarioSelecionado = lblNomeUsuario.Text;
            loginUsuarioSelecionado = lblLoginUsuario.Text;

            // Execute qualquer outra lógica desejada

            // Redirecione para outra página ou atualize as Labels desejadas
            Response.Redirect("outra-pagina.aspx");
        }
    }

    [System.Web.Services.WebMethod]
    public static string ObterDadosUsuario(int index)
    {
        // Obtain a reference to the Page instance
        Page page = HttpContext.Current.Handler as Page;

        // Obtain a reference to the DataList
        DataList dataListUsuarios = page.FindControl("dataListUsuarios") as DataList;

        // Verify if the DataList exists and if the index is within the valid range
        if (dataListUsuarios != null && index >= 0 && index < dataListUsuarios.Items.Count)
        {
            // Obtain the item corresponding to the provided index
            DataListItem item = dataListUsuarios.Items[index];

            // Access the controls within the item and retrieve the user data
            Label lblNomeUsuario = item.FindControl("lblNomeUsuarioLista") as Label;
            Label lblLoginUsuario = item.FindControl("lblLoginUsuarioLista") as Label;

            // Create an object to store the user data
            var dadosUsuario = new
            {
                Nome = lblNomeUsuario.Text,
                Login = lblLoginUsuario.Text
            };

            // Serialize the object into a JSON string and return it
            string dadosUsuarioJson = Newtonsoft.Json.JsonConvert.SerializeObject(dadosUsuario);
            return dadosUsuarioJson;
        }

        // If the index is invalid or the item is not found, return an error response
        return "{\"error\": \"Invalid index or item not found\"}";
    }

    protected void btnExibirDados_Click(object sender, EventArgs e)
    {
        string nomeUsuario = DataList1.Attributes["nome_usuario"];
        string LoginUsuario = DataList1.Attributes["nome_usuario"];
        lblNomeUsuario.Text = nomeUsuario;
        lblLoginUsuario.Text = LoginUsuario;
    }

    protected void DataList1_ItemCommand1(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "YourCommandName")
        {
            // Recupera a variável do item do DataList
            string nomeUsuario = ((DataListItem)e.Item).Attributes["nome_usuario"];
            string LoginUsuario = ((DataListItem)e.Item).Attributes["login_usuario"];

            lblNomeUsuario.Text = nomeUsuario;
            lblLoginUsuario.Text = LoginUsuario;
        }
    }
}