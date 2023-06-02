using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_painel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
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
        }
    }
}