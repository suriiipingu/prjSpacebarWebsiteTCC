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
using System.Reflection.Emit;
using Label = System.Web.UI.WebControls.Label;
using System.Xml.Linq;
using System.Security.Cryptography;

public partial class aceitar_verificado : System.Web.UI.Page
{
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (lblNomeUsuario.Text == "")
        {
            btnVerArquivo.Enabled = false;
            btnAceitar.Enabled = false;
            btnRecusar.Enabled = false;
            txtMensagem.Enabled = false;
        }
        else
        {
            btnVerArquivo.Enabled = true;
            btnAceitar.Enabled = true;
            btnRecusar.Enabled = true;
            txtMensagem.Enabled = true;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        using (Conexao c = new Conexao())
        {
            c.conectar();

            var SelectVerificadoNegado = c.sqlProcedure("SelectVerificadoNegado");

            if (SelectVerificadoNegado.Tables.Count > 0 && SelectVerificadoNegado.Tables[0].Rows.Count > 0)
            {
                int qntdNegado = Convert.ToInt32(SelectVerificadoNegado.Tables[0].Rows[0][0]);
                lblSolicitacoesNegadas.Text = qntdNegado.ToString();
            }

            var SelectVerificadoPendente = c.sqlProcedure("SelectVerificadoPendente");

            if (SelectVerificadoPendente.Tables.Count > 0 && SelectVerificadoPendente.Tables[0].Rows.Count > 0)
            {
                int qntdPendente = Convert.ToInt32(SelectVerificadoPendente.Tables[0].Rows[0][0]);
                lblSolicitacoesPendentes.Text = qntdPendente.ToString();
                lblQuantidadeSolicitacoes.Text = qntdPendente.ToString();
            }

            var SelectVerificadoAceito = c.sqlProcedure("SelectVerificadoAceito");

            if (SelectVerificadoAceito.Tables.Count > 0 && SelectVerificadoAceito.Tables[0].Rows.Count > 0)
            {
                int qntdAceito = Convert.ToInt32(SelectVerificadoAceito.Tables[0].Rows[0][0]);
                lblSolicitacoesAceitas.Text = qntdAceito.ToString();
            }
        }
    }

    protected void DataListSolicitacoes_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "ExibirDados")
        {
            // Obtém o índice do item clicado
            int itemIndex = e.Item.ItemIndex;

            // Obtém o valor da chave de dados (cod_usuario) do item clicado
            int codUsuario = (int)DataListSolicitacoes.DataKeys[itemIndex];

            // Armazena o valor do cod_usuario na variável de sessão
            Session["LastClickedUserId"] = codUsuario;

            // Recupera os dados do usuário correspondente ao cod_usuario
            DataView dataView = (DataView)SqlDataSourceSolicitacoes.Select(DataSourceSelectArguments.Empty);

            // Acessa diretamente a primeira linha do DataView
            DataRowView selectedUserRow = dataView[0];

            // Recupera os dados desejados do registro do usuário
            string nomeUsuario = selectedUserRow["nome_usuario"].ToString();
            string loginUsuario = selectedUserRow["login_usuario"].ToString();

            // Define os dados nos rótulos externos
            ProfileManager.mostrarImagemPerfilUser(imgUsuarioSelecionado, codUsuario);
            lblNomeUsuario.Text = nomeUsuario;
            lblLoginUsuario.Text = loginUsuario;
        }
    }

    protected void DataListSolicitacoes_ItemDataBound(object sender, DataListItemEventArgs e)
    {

        // Obtém o índice do item clicado
        int itemIndex = e.Item.ItemIndex;

        // Obtém o valor da chave de dados (cod_usuario) do item clicado
        int codUsuario = (int)DataListSolicitacoes.DataKeys[itemIndex];

        Image ImgPerfilUsuarioLista = (Image)e.Item.FindControl("ImgPerfilUsuarioLista");
        ProfileManager.mostrarImagemPerfilUser(ImgPerfilUsuarioLista, codUsuario);
    }

    protected void btnVerArquivo_Click(object sender, EventArgs e)
    {
        // Obtém o valor do cod_usuario do último item clicado do DataList
        int lastClickedUserId = (int)Session["LastClickedUserId"];
        ProfileManager.exibirImagemSolicitacao(ImgImagemRecebida, lastClickedUserId);
    }

    protected void btnAceitar_Click(object sender, EventArgs e)
    {
        using (Conexao c = new Conexao())
        {
            c.conectar();
            int lastClickedUserId = (int)Session["LastClickedUserId"];
            var parametros = new List<SqlParameter>
                    {
                        new SqlParameter("@codUsuario", lastClickedUserId)
                    };

            int rowsAffected = c.ExecuteDeleteProcedure("InsertAceito", parametros);
            if (rowsAffected > 0)
            {
                string script = @" <script type='text/javascript'>
                                        document.getElementById('successAlert').style.display = 'block';
                                        setTimeout(function() {
                                        document.getElementById('successAlert').style.display = 'none';
                                        }, 4000);
                                    </script>";


                if (!ClientScript.IsStartupScriptRegistered("popupScript"))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "popupScript", script);
                }
                DataListSolicitacoes.DataBind();
            }
            else
            {
                string script = @" <script type='text/javascript'>
                                        document.getElementById('dangerAlert').style.display = 'block';
                                        setTimeout(function() {
                                        document.getElementById('dangerAlert').style.display = 'none';
                                        }, 4000);
                                    </script>";

                if (!ClientScript.IsStartupScriptRegistered("popupScript"))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "popupScript", script);
                }
                DataListSolicitacoes.DataBind();
            }
        }
    }

    protected void btnRecusar_Click(object sender, EventArgs e)
    {
        using (Conexao c = new Conexao())
        {
            c.conectar();
            int lastClickedUserId = (int)Session["LastClickedUserId"];
            var parametros = new List<SqlParameter>
                    {
                        new SqlParameter("@codUsuario", lastClickedUserId)
                    };

            int rowsAffected = c.ExecuteDeleteProcedure("InsertNegado", parametros);
            if (rowsAffected > 0)
            {
                string script = @" <script type='text/javascript'>
                                        document.getElementById('successAlertNegado').style.display = 'block';
                                        setTimeout(function() {
                                        document.getElementById('successAlertNegado').style.display = 'none';
                                        }, 4000);
                                    </script>";


                if (!ClientScript.IsStartupScriptRegistered("popupScript"))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "popupScript", script);
                }
                DataListSolicitacoes.DataBind();
            }
            else
            {
                string script = @" <script type='text/javascript'>
                                        document.getElementById('dangerAlertNegado').style.display = 'block';
                                        setTimeout(function() {
                                        document.getElementById('dangerAlertNegado').style.display = 'none';
                                        }, 4000);
                                    </script>";

                if (!ClientScript.IsStartupScriptRegistered("popupScript"))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "popupScript", script);
                }
                DataListSolicitacoes.DataBind();
            }
        }
    }
}