using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data.Common;
using System.Collections.Generic;

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

    public DataSet sqlProcedure(string procedurename, List<SqlParameter> parameters = null)
    {
        var dataSet = new DataSet();

        using (var command = new SqlCommand() { Connection = conexao, CommandType = CommandType.StoredProcedure, CommandText = procedurename })
        {
            command.CommandType = CommandType.StoredProcedure;
            command.Connection = conexao;

            if (parameters != null && parameters.Count > 0)
            {
                // Limpa a lista de parâmetros antes de adicionar novos
                command.Parameters.Clear();
                foreach (var parameter in parameters)
                {
                    command.Parameters.Add(parameter);
                }
            }

            using (var adapter = new SqlDataAdapter(command))
            {
                adapter.Fill(dataSet);
            }
        }
        return dataSet;
    }
}
