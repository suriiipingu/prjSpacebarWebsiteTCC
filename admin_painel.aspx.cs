using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.DataVisualization.Charting;

public partial class admin_painel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if ((bool)Session["ADM"] == false)
            {
                Response.Redirect("fazer-login.aspx");
            }

            using (Conexao c = new Conexao())
            {
                var CountCreatedPosts = c.sqlProcedure("CountCreatedPosts");
                var CountCreatedusers = c.sqlProcedure("CountRegisteredUsers");
                var CountCreatedComments = c.sqlProcedure("CountCreatedComments");
                var CountCreatedLikes = c.sqlProcedure("CountCreatedLikes");

                lblQuantidadePostagens.Text = CountCreatedPosts.Tables[0].Rows[0]["quantidade_postagens"].ToString();
                lblQuantidadeUsuario.Text = CountCreatedusers.Tables[0].Rows[0]["quantidade_usuarios"].ToString();
                lblQuantidadeComentarios.Text = CountCreatedComments.Tables[0].Rows[0]["quantidade_comentarios"].ToString();
                lblPostsLikes.Text = CountCreatedLikes.Tables[0].Rows[0]["quantidade_curtidas"].ToString();
            }
            GetUsuariosCriadosPorDia();
        }
    }

    public void GetUsuariosCriadosPorDia()
    {
        using (Conexao c =new Conexao())
        {
            // Executar a procedure para obter os dados
            List<SqlParameter> parameters = new List<SqlParameter>();
            DataSet dataSet = c.sqlProcedure("ObterQuantidadeUsuariosCriadosPorData", parameters);
            
            // Verificar se o DataSet contém uma tabela com os resultados
            if (dataSet != null && dataSet.Tables.Count > 0)
            {
                DataTable dataTable = dataSet.Tables[0];

                // Criar listas para armazenar as datas e quantidades
                List<string> datas = new List<string>();
                List<int> quantidades = new List<int>();

                // Iterar pelas linhas do DataTable e extrair os valores
                foreach (DataRow row in dataTable.Rows)
                {
                    string data = Convert.ToDateTime(row["data_criacao"]).ToString("dd/MM/yyyy"); 
                    int quantidade = Convert.ToInt32(row["QuantidadeUsuarios"]);

                    datas.Add(data);
                    quantidades.Add(quantidade);
                }

                // Aplicar os valores no gráfico
                ChartUsuariosCriados.Series["UsuariosCriados"].Points.DataBindXY(datas, quantidades);
            }
        }
    }
}