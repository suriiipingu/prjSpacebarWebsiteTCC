<%@ Page Title="SpaceBar - Seu perfil" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Perfil.aspx.cs" Inherits="Perfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="A" Runat="Server">
    <div class="conteudo wf-section">
    <div class="cnt-perfil w-container">
      <div class="parte1">
        <div class="div-ft-fundo"> <asp:Image ID="ImgFundoPerfil" runat="server" loading="lazy" alt="" class="image-15"/></div>
        <div class="div-foto-perfil"> <asp:Image ID="ImgPerfil" runat="server" loading="lazy" alt="" class="image-8 imgperfil-fixo"/></div>
        <div class="div-block-7 div-bio">
            <!-- nome e login do próprio usuário logado: -->
          <h3 class="heading-4">
              <asp:Label runat="server" ID="lblNomeUsuarioPerfil" Text="Label"></asp:Label>
          </h3>
          <div class="text-block-23">
              <asp:Label runat="server" ID="lblLoginUsuarioPerfil" Text="Label"></asp:Label>
          </div>
            <!--Descrição (ou bio) do perfil do usuário logado:-->
          <div class="text-block-20">
              <asp:Label ID="lblDescPerfilUsuario" runat="server" Text="Label"></asp:Label></div>
          <div class="div-block-37">
            <div>
                <!--Label com a quantidade de seguidores e seguindo do usuário conectado:-->
            <div class="text-block-22">Seguindo</div>
            <asp:Label ID="lblSeguindo" runat="server" Text="0"></asp:Label></div>
            <div class="text-block-21"><asp:Label ID="lblSeguidores" runat="server" Text="0"></asp:Label></div>
            <div class="text-block-22">Seguidores</div>

            <div class="div-btnconfig">
              <a href="perfil-config.aspx" class="link-block w-inline-block w-clearfix"><img src="images/settings-01-svgrepo-com.svg" loading="lazy" width="24" alt="" class="image-13"></a>
            </div>
          </div>
        </div>
      </div>
      <div class="div-selos w-clearfix">
      </div>
      <div class="parte-2">
        <div class="bloco-navbar-perifl">
          <!-- <input type="search" class="search-input-2 w-input" maxlength="256" name="query" placeholder="Pesquisar" id="search" required=""><img src="images/search-svgrepo-com.svg" loading="lazy" width="14" alt="" class="image-25"><input type="submit" value="&gt;" class="search-button-2 w-button"> -->
        </div>
          
          <asp:DataList ID="DataList1" runat="server" DataKeyField="cod_post" DataSourceID="SqlDataSource1">
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
              <div class="img-post"><img src="https://d3e54v103j8qbb.cloudfront.net/plugins/Basic/assets/placeholder.60f9b1840c.svg" loading="lazy" width="126" alt="" class="image-21"></div>
              <div class="tags-post">
                <div class="div-block-31">
                  <div class="text-block-13">Descoberta</div>
                </div>
                <div class="div-block-31 div-2">
                  <div class="text-block-13">Jogo</div>
                </div>
                <div class="div-block-31 div-2 div-3">
                  <div class="text-block-13">Diversão</div>
                </div>
              </div>
              <div class="div-nome-curtidas">
                <div class="div-nome w-clearfix"><img src="https://d3e54v103j8qbb.cloudfront.net/plugins/Basic/assets/placeholder.60f9b1840c.svg" loading="lazy" width="46" alt="" class="image-22">
                  <div class="div-block-32">
                    <div class="text-block-16"><asp:Label ID="nome_usuarioLabel" runat="server" Text='<%# Eval("nome_usuario") %>' /></div>
                    <div class="text-block-17"><asp:Label ID="login_usuarioLabel" runat="server" Text='<%# Eval("login_usuario") %>' /></div>
                  </div>
                </div>
                <div class="div-curtidas">
                  <div class="div-curt">
                    <!-- <asp:ImageButton ID="ImageButton1" ImageUrl="images/love-mobile-ui-svgrepo-com.svg" loading="lazy" width="24" alt="" runat="server" /></div> -->
                    <div><asp:Label ID="curtidas_postLabel" runat="server" Text='<%#quantidadeCurtidas%>' /></div>
                  </div>
                  <div class="div-coment">
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
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SpaceBarConnectionString %>" SelectCommand="EXECUTE GetAllInfoAndPostsByAuthor @postAuthorID">
              <SelectParameters>
                  <asp:Parameter Name="postAuthorID"/>
              </SelectParameters>
          </asp:SqlDataSource>
      </div>
    </div>
  </div>
</asp:Content>