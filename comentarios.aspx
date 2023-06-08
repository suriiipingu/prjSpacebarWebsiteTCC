<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="comentarios.aspx.cs" Inherits="comentarios" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="A" Runat="Server">
      <div class="conteudo wf-section">
    <div class="container-10 cnt-comentario w-container">
      <div class="postagem">
        <div class="titulo-post">
          <h1 class="heading-3">
              <asp:Label ID="lblTitulo" runat="server"></asp:Label></h1>
        </div>
        <div class="data-post w-clearfix">
          <div class="text-block-12">
              <asp:Label ID="lblData" runat="server"></asp:Label></div>
        </div>
        <div class="img-post"><img src="https://d3e54v103j8qbb.cloudfront.net/plugins/Basic/assets/placeholder.60f9b1840c.svg" loading="lazy" width="126" alt="" class="image-21"></div>
        <div class="tags-post">
            <!-- ==== div de tags ==== -->
          <div class="div-block-31">
          </div>
        </div>
        <div class="div-nome-curtidas div-coment">
          <div class="div-nome">
            <a href="#" class="w-inline-block">
              <div class="div-nome w-clearfix">
                  <asp:Image ID="imgPost" runat="server" />
                <div class="div-block-32">
                  <div class="text-block-16">
                      <asp:Label ID="lblNomeUsu" runat="server" Text="lblNomeUsu"></asp:Label></div>
                  <div class="text-block-17">
                      <asp:Label ID="lblLoginUsu" runat="server" Text="lblLoginUsu"></asp:Label></div>
                </div>
              </div>
            </a>
          </div>
          <div class="div-curtidas">
            <div class="div-curt">
            </div>
            <div class="div-coment">
            </div>
          </div>
        </div>
        <div class="div-fazer-coment">
          <div class="div-foto-coment">
            <a href="Perfil.aspx" class="w-inline-block w-clearfix"><img src="https://d3e54v103j8qbb.cloudfront.net/plugins/Basic/assets/placeholder.60f9b1840c.svg" loading="lazy" width="50" alt="" class="image-22"></a>
          </div>
          <div class="div-txt-coment">
            <div class="form-block-2 w-form">
              <form id="email-form" name="email-form" data-name="Email Form" method="get" class="form-7">
                  <asp:TextBox runat="server" placeholder="Faça um comentário" maxlength="5000" ID="txtComentario" name="txt-Coment" data-name="txt-Coment" required="" CssClass="textarea-4 w-input"></asp:TextBox>
                  <asp:Button OnClick="btnComentar_Click" ID="btnComentar" runat="server" type="submit" text="Comentar" CssClass="submit-button-4 w-button"/>
              </form>
              <div class="w-form-done">
                <div>Thank you! Your submission has been received!</div>
              </div>
              <div class="w-form-fail">
                <div>Oops! Something went wrong while submitting the form.</div>
              </div>
            </div>
          </div>
        </div>
        
          <asp:DataList OnItemDataBound="DataList1_ItemDataBound" ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
              <ItemTemplate>

         <div class="div-coment divcoment">
          <div class="div-block-46">
            <div class="div-foto-coment div-comentario-aaaa">
              <a href="perfil-usuarioaleatorio.aspx" class="w-inline-block w-clearfix"><img src="https://d3e54v103j8qbb.cloudfront.net/plugins/Basic/assets/placeholder.60f9b1840c.svg" loading="lazy" width="50" alt="" class="image-22"></a>
            </div>
            <div class="div-parte2">
              <div class="div-nome-usuario">
                <div class="text-block-16">
                    <asp:Label ID="lblNomeComentarista" runat="server"></asp:Label></div>
                <div class="text-block-17 txtblock-coment"><asp:Label ID="lblLoginComentarioAutor" runat="server"></asp:Label></div>
                <div class="text-block-17 txtblock-coment"><asp:Label ID="lblDataComentario" runat="server"></asp:Label></div>
                <div class="icon-denuncia">
                  <div data-hover="false" data-delay="0" class="w-dropdown">
                    <div class="dropdown-toggle-5 w-dropdown-toggle"><img src="images/dot-menu-more-2-svgrepo-com.svg" loading="lazy" width="14" alt=""></div>
                    <nav class="dropdown-list-3 w-dropdown-list">
                      <div class="div-block-17 diva div3">
                        <div class="div-block-22">
                          <a href="Perfil.aspx" class="link-block-3 w-inline-block w-clearfix"><img src="images/flag-svgrepo-com.svg" loading="lazy" width="21" alt="" class="image-13">
                            <div class="text-block-7">Denunciar Comentário</div>
                          </a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                      </div>
                    </nav>
                  </div>
                </div>
              </div>
              <div class="div-comentario">
                <div class="text-block-31">
                    <asp:Label ID="lblConteudoComentario" runat="server"></asp:Label></div>
              </div>
            </div>
          </div>
        </div>
              </ItemTemplate>
              
          </asp:DataList>
        
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SpaceBarConnectionString %>" SelectCommand="SELECT * FROM [tblComentarios] WHERE ([cod_post] = @cod_post)">
              <SelectParameters>
                  <asp:SessionParameter DefaultValue="" Name="cod_post" SessionField="codPostagemComentario" Type="Int32" />
              </SelectParameters>
          </asp:SqlDataSource>
        
      </div>
    </div>
  </div>
</asp:Content>

