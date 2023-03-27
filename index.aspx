<%@ Page Title="SpaceBar - the place to explore the universe" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="A" Runat="Server">

  <div class="avisos wf-section">
    
  </div>
  <div class="conteudo wf-section">
    <div class="container-10 w-container">

        <!-- postagens -->

        <asp:DataList ID="myDataList" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="myDataList_ItemDataBound">
            <ItemTemplate>
                
        <div class="postagem">
        <div class="titulo-post">
          <h1 class="heading-3"><asp:Label ID="titulo_postLabel" runat="server" Text='<%# Eval("titulo_post") %>'/></h1>
            <div class="div-icon-verificado"><img src="images/checked-svgrepo-com.svg" loading="lazy" width="19" alt=""></div>
        </div>
        <div class="data-post w-clearfix">
          <div class="text-block-12"><asp:Label ID="data_postLabel" runat="server" Text='<%# Eval("data_post") %>' /></div>
        </div>
        <div class="img-post"><asp:Label ID="img_post1Label" runat="server" Text='<%# Eval("img_post1") %>'/></div>

        <!-- loading="lazy" width="126" alt="" class="image-21 -->
        
        <div runat="server" id="tags_post" class="tags-post">

          <div runat="server" id="divDiscoveryBadge" class="div-block-31">
            <div class="text-block-13">Descoberta</div>
          </div>

          <div runat="server" id="divCienceBadge" class="div-block-31 div-2">
            <div class="text-block-14">Ciência</div>
          </div>
            
          <div runat="server" id="divVerifiedBadge" class="div-block-31 div-3" style="background-color:darkorange">
            <div class="text-block-15">Postagem Verificada</div>
          </div>

        </div>
        
        <div class="div-nome-curtidas">
          <a href="perfil-usuarioaleatorio.aspx" class="w-inline-block">
            <div class="div-nome w-clearfix"><img src="https://d3e54v103j8qbb.cloudfront.net/plugins/Basic/assets/placeholder.60f9b1840c.svg" loading="lazy" width="46" alt="" class="image-22">
              <div class="div-block-32">
                <div class="text-block-16">
                    <asp:Label ID="LabelNomeUsuario" runat="server" Text='<%# Eval("nome_usuario") %>'></asp:Label>
                </div>
                <div class="text-block-17">
                    <asp:Label ID="LabelLoginUsuario" runat="server" Text='<%# Eval("login_usuario") %>'></asp:Label>
                </div>
              </div>
            </div>
          </a>
          <div class="div-curtidas">
            <div class="div-curt">
              <div class="icon">
                  <asp:ImageButton ID="ImageButton1" ImageUrl="images/love-mobile-ui-svgrepo-com.svg" loading="lazy" width="24" alt="" runat="server" /></div>
              <div><asp:Label ID="curtidas_postLabel" runat="server" Text='<%# Eval("curtidas_post") %>' /></div>
            </div>
            <div class="div-coment">
              <a href="comentarios.aspx" class="link-block-4 w-inline-block">
                <div class="icon"><img src="images/comment-svgrepo-com-.svg" loading="lazy" width="24" alt=""></div>
                <div class="text-block-30">11</div>
              </a>
            </div>
          </div>
        </div>
      </div>

      <!-- para testes, remover antes da entra final-->
      <asp:Label ID="verificadoLabel" runat="server" Text='<%# Eval("verificado") %>' />
      <asp:Label ID="cod_usuarioLabel" runat="server" Text='<%# Eval("cod_usuario") %>' />
      <!-- para testes, remover antes da entra final-->
                
      </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SpaceBarConnectionString %>" 
            SelectCommand=
            "SELECT * from tblPost INNER JOIN tblUsuario tU on tU.cod_usuario = tblPost.cod_usuario">
        </asp:SqlDataSource>

        <!-- postagens -->
    </div>
  </div>

</asp:Content>