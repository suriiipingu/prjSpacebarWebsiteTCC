using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Conexao
/// </summary>
public class Conexao
{
    public SqlConnection conexao;
    public SqlCommand command;
    //string strConexao = "Server=localhost;DataBase=exe_servicos;user id=sa;password=etesp";
    string strConexao = "Server=localhost;DataBase=SpaceBar;trusted_connection=true";

	public Conexao()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public void conectar()
    {

        conexao = new SqlConnection(strConexao);
        conexao.Open();
        command = new SqlCommand();
        command.Connection = conexao;

    }

    public void fechaConexao()
    {
        conexao.Close();
        conexao = null;
        command = null;

    }
}
