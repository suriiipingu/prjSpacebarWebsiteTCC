<%@ Page Title="SpaceBar: @usuarioMostrado" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="A" Runat="Server">
     <div class="conteudo wf-section">
    <div class="cnt-perfil w-container">
      <div class="parte1">
        <div class="div-ft-fundo"> <asp:Image ID="ImgFundo" runat="server" loading="lazy" width="1640" alt="" class="image-15"/></div>
        <div class="div-foto-perfil"> <asp:Image ID="ImgPerfil" runat="server" loading="lazy" alt="" class="image-8 imgperfil-fixo"/> </div>
        <div class="div-block-7 div-bio"> 
          <h3 class="heading-4">
              <asp:Label ID="lblNomeUsuario" runat="server" Text="userName"></asp:Label>
          </h3>
          <div class="text-block-23">
              <asp:Label ID="lblLoginUsuario" runat="server" Text="UserLogin"></asp:Label></div>
          <div class="text-block-20">
              <asp:Label ID="lblBioUser" runat="server" Text="Label"></asp:Label></asp:Label></div>
          <div class="div-block-37">
            <div><asp:Label ID="lblSeguindo" runat="server" Text="Seguindo"></asp:Label></div>
            <div class="text-block-22">Seguindo</div>
            <div class="text-block-21"><asp:Label ID="lblSeguidores" runat="server" Text="Seguidores"></asp:Label></div>
            <div class="text-block-22">Seguidores</div>
            <div class="div-btnseguir">

                <asp:Button OnClick="btnSeguir_Click" CssClass="button-10 w-button" ID="btnSeguir" runat="server" Text="Seguir" />
                
            </div>
          </div>
        </div>
      </div>
      <div class="div-selos w-clearfix">
      </div>
      <div class="parte-2">
        <div class="bloco-navbar-perifl">
          
        </div>
      
          <div class="postagens">
              <asp:DataList ID="DataList1" runat="server" DataKeyField="cod_post" DataSourceID="SqlDataSource1" OnItemDataBound="DataList1_ItemDataBound">
              <ItemTemplate>

                  <div class="postagem postagem-perfil">
              <div class="titulo-post">
                <h1 class="heading-3"><asp:Label ID="titulo_postLabel" runat="server" Text='<%# Eval("titulo_post") %>' /></h1>
                <div class="div-block-36">
                  <a href="#" class="div-btnvermais w-button">Ver mais +</a>
                </div>
              </div>
              <div class="data-post w-clearfix">
                <div class="text-block-12"><asp:Label ID="data_postLabel" runat="server" Text='<%# Eval("data_post") %>' /></div>
              </div>
              <div class="img-post">
                  <asp:Image ID="imgPost" runat="server" loading="lazy" width="126" alt="" class="image-21"/>
              </div>
              <div class="tags-post>
                  <!-- div de tags -->
                <div class="div-block-31">
                </div>
              </div>
              <div class="div-nome-curtidas">
                <div class="div-nome w-clearfix"><asp:Image loading="lazy" width="46" CssClass="image-22" ID="ImgPerfilUser" runat="server" />
                  <div class="div-block-32">
                    <div class="text-block-16"><asp:Label ID="nome_usuarioLabel" runat="server" Text='<%# Eval("nome_usuario") %>' /></div>
                    <div class="text-block-17"><asp:Label ID="login_usuarioLabel" runat="server" Text='<%# Eval("login_usuario") %>' /></div>
                  </div>
                </div>
                <div class="div-curtidas">
                  <div class="div-curt">
                    <asp:ImageButton ID="ImageButton1" ImageUrl="images/love-mobile-ui-svgrepo-com.svg" loading="lazy" width="24" alt="" runat="server" /></div>
                    <div><asp:Label ID="curtidas_postLabel" runat="server" Text='<%#quantidadeCurtidas%>' /></div>
                  </div>
                  <div class="div-coment">s
                    <a href="comentarios.html" class="link-block-4 w-inline-block">
                      <div class="icon"><img src="images/comment-svgrepo-com-.svg" loading="lazy" width="24" alt=""></div>
                      <div class="text-block-30"><asp:Label ID="comentarios_postLabel" runat="server" Text='<%# Eval("comentarios_post") %>' /></div>
                    </a>
                  </div>
                </div>
              </div>
            </div>
              </ItemTemplate>
          </asp:DataList>

          <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                             ConnectionString="<%$ ConnectionStrings:SpaceBarConnectionString %>" 
                             SelectCommand="EXECUTE GetAllInfoAndPostsByAuthor @postAuthorID">
              <SelectParameters>
                  <asp:Parameter Name="postAuthorID"/>
              </SelectParameters>
          </asp:SqlDataSource>
          </div>
          
      </div>
    </div>
  </div>
</asp:Content>