<%@ Page Title="SpaceBar - O lugar para explorar o universo!" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" MaintainScrollPositionOnPostBack="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="A" Runat="Server">
    
    <!-- Crie, ative ou desative uma div para criar um aviso (experimental)-->
    <div class="container-10 w-container">
    <div class="avisos wf-section">
        <div class="postagem">
                <div class="titulo-post">
                    <h1 class="heading-3-text-aligned">SpaceBar Alpha Phase!!!</h1>
                </div>
            </div>
        </div>
    </div>
    <!-- Crie, ative ou desative uma div para criar um aviso (experimental)-->

  <div class="conteudo wf-section">
    <div class="container-10 w-container">
        <asp:DataList ID="myDataList" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="myDataList_ItemDataBound" OnItemCommand="DataList_ItemCommand">
            <ItemTemplate>

        <!-- começo do corpo da postagem -->        
        <div class="postagem">

            <!--Badge Verificado-->
            <div runat="server" id="divVerifiedBadge" class="div-icon-verificado"><img src="images/checked-svgrepo-com.svg" loading="lazy" width="19" alt=""></div>

            <!--Título-->
            <div class="titulo-post">
                <h1 class="heading-3"><asp:Label ID="titulo_postLabel" runat="server" /></h1>

            <!--ver mais detalhes da publicação-->
            <div class="div-block-36">
            <a href="#" class="div-btnvermais w-button">Ver mais +</a>
          </div>
            
        <!--Data Criação da publicação-->
        </div>
        <div class="data-post w-clearfix">
          <div class="text-block-12"><asp:Label ID="data_postLabel" runat="server" /></div></div>

        <!--Imagem capa da postagem-->
        <div class="img-post"><asp:Label ID="img_post1Label" runat="server" Text='<%# Eval("img_post1") %>'/></div>
        
        <!--Tags da postagem-->
        <div runat="server" id="tags_post" class="tags-post">

          <div runat="server" id="divDiscoveryBadge" class="div-block-31">
            <div class="text-block-13">Descoberta</div>
          </div>

          <div runat="server" id="divCienceBadge" class="div-block-31 div-2">
            <div class="text-block-14">Ciência</div>
          </div>

        </div>
        
        <div class="div-nome-curtidas">

            <!--Área da foto, nome e login do usuário que criou a postagem-->
            <div class="div-nome w-clearfix"><img src="https://d3e54v103j8qbb.cloudfront.net/plugins/Basic/assets/placeholder.60f9b1840c.svg" loading="lazy" width="46" alt="" class="image-22">
              <div class="div-block-32">
                <div class="text-block-16">
                    <asp:LinkButton CommandName="YourCommandName" CssClass="HyperLinkNomeUsuario" ID="HyperLinkNomeUsuario" runat="server"  Text='<%#LinkNomeUsuario%>'></asp:LinkButton>
                </div>
                <div class="text-block-17">
                    <asp:LinkButton CommandName="YourCommandName" CssClass="HyperLinkLoginUsuario" ID="HyperLinkLoginUsuario" runat="server" Text='<%#LinkLoginUsuario%>'></asp:LinkButton>
                </div>
              </div>
            </div>

            <!--Botão para curtir a postagem-->
          <div class="div-curtidas">
            <div class="div-curt">
              <div class="icon-like">
                  <asp:ImageButton CssClass="btn-icon-like" OnClick="btnLike_OnClick" ID="btnLike" ImageUrl="images/heart.svg" width="24" alt="" runat="server" /></div>
              <div class="div-lbl-likes"><asp:Label CssClass="lbl-likes" ID="curtidas_postLabel" runat="server" Text='<%#quantidadeCurtidas%>' /></div>
            </div>
              <!--Botão para ir para os comentários de uma determinada postagem-->
            <div class="div-coment">
              <a href="comentarios.aspx" class="link-block-4 w-inline-block">
                <div class="icon"><img src="images/comment-svgrepo-com-.svg" loading="lazy" width="24" alt=""></div>
                <div class="text-block-30">11</div>
              </a>
            </div>
          </div>
        </div>
      </div>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SpaceBarConnectionString %>" 
            SelectCommand= "EXECUTE GetPostAndAuthor">
        </asp:SqlDataSource>

        <!-- fim do corpo das postagens -->
    </div>
  </div>

</asp:Content>