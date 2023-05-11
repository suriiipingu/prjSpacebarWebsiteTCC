using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data.Common;

/// <summary>
/// Summary description for Conexao
/// </summary>
public class Conexao : IDisposable
{
    public SqlConnection conexao = new SqlConnection();
    public SqlCommand command = new SqlCommand();
    string strConexao = "Server=TEO_PC;DataBase=SpaceBar;trusted_connection=true";

    public Conexao()
	{
        command.Connection = conexao;
        conexao.ConnectionString = strConexao;
    }

    public void conectar()
    {
        conexao.Open();
    }

    public void fechaConexao()
    {
        conexao.Close();
    }

    public void Dispose()
    {
        command.Dispose();
        conexao.Dispose();
    }

    public DataTable sqlProcedure(string procedurename, string var = "")
    {
        var dataTable = new DataTable();

        using (var command = new SqlCommand(procedurename + var))
        {
            command.CommandType = CommandType.StoredProcedure;
            command.Connection = conexao;

            using (var adapter = new SqlDataAdapter(command))
            {
                adapter.Fill(dataTable);
            }
        }
        return dataTable;
    }
}
