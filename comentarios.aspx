<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="comentarios.aspx.cs" Inherits="comentarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="A" Runat="Server">
      <div class="conteudo wf-section">
    <div class="container-10 cnt-comentario w-container">
      <div class="postagem">
        <div class="titulo-post">
          <h1 class="heading-3">Inspirado na obra de Van Gogh “A noite estrelada” criam jogo de astros sobre</h1>
        </div>
        <div class="data-post w-clearfix">
          <div class="text-block-12">16 de jan de 2023 · 22:30 PM</div>
        </div>
        <div class="img-post"><img src="https://d3e54v103j8qbb.cloudfront.net/plugins/Basic/assets/placeholder.60f9b1840c.svg" loading="lazy" width="126" alt="" class="image-21"></div>
        <div class="tags-post">
          <div class="div-block-31">
            <div class="text-block-13">Descoberta</div>
          </div>
          <div class="div-block-31 div-2">
            <div class="text-block-13">Ciência</div>
          </div>
        </div>
        <div class="div-nome-curtidas div-coment">
          <div class="div-nome">
            <a href="#" class="w-inline-block">
              <div class="div-nome w-clearfix"><img src="https://d3e54v103j8qbb.cloudfront.net/plugins/Basic/assets/placeholder.60f9b1840c.svg" loading="lazy" width="46" alt="" class="image-22">
                <div class="div-block-32">
                  <div class="text-block-16">Eliza Santos</div>
                  <div class="text-block-17">@Eliza.Santos</div>
                </div>
              </div>
            </a>
          </div>
          <div class="div-curtidas">
            <div class="div-curt">
              <div class="icon"><img src="images/love-mobile-ui-svgrepo-com.svg" loading="lazy" width="24" alt=""></div>
              <div>11</div>
            </div>
            <div class="div-coment">
              <a href="#" class="link-block-4 w-inline-block">
                <div class="icon"><img src="images/comment-svgrepo-com-.svg" loading="lazy" width="24" alt=""></div>
                <div class="text-block-30">11</div>
              </a>
            </div>
          </div>
        </div>
        <div class="div-fazer-coment">
          <div class="div-foto-coment">
            <a href="Perfil.aspx" class="w-inline-block w-clearfix"><img src="https://d3e54v103j8qbb.cloudfront.net/plugins/Basic/assets/placeholder.60f9b1840c.svg" loading="lazy" width="50" alt="" class="image-22"></a>
          </div>
          <div class="div-txt-coment">
            <div class="form-block-2 w-form">
              <form id="email-form" name="email-form" data-name="Email Form" method="get" class="form-7"><textarea placeholder="Faça um comentário" maxlength="5000" id="txt-Coment" name="txt-Coment" data-name="txt-Coment" required="" class="textarea-4 w-input"></textarea><input type="submit" value="Responder" data-wait="Please wait..." class="submit-button-4 w-button"></form>
              <div class="w-form-done">
                <div>Thank you! Your submission has been received!</div>
              </div>
              <div class="w-form-fail">
                <div>Oops! Something went wrong while submitting the form.</div>
              </div>
            </div>
          </div>
        </div>
        
          <asp:DataList ID="DataList1" runat="server">
              <ItemTemplate>

         <div class="div-coment divcoment">
          <div class="div-block-46">
            <div class="div-foto-coment div-comentario-aaaa">
              <a href="perfil-usuarioaleatorio.aspx" class="w-inline-block w-clearfix"><img src="https://d3e54v103j8qbb.cloudfront.net/plugins/Basic/assets/placeholder.60f9b1840c.svg" loading="lazy" width="50" alt="" class="image-22"></a>
            </div>
            <div class="div-parte2">
              <div class="div-nome-usuario">
                <div class="text-block-16">Maria da Foncesa</div>
                <div class="text-block-17 txtblock-coment">@Maria.Foncesa</div>
                <div class="text-block-17 txtblock-coment">· 16 de jan de 2023  </div>
                <div class="icon-denuncia">
                  <div data-hover="false" data-delay="0" class="w-dropdown">
                    <div class="dropdown-toggle-5 w-dropdown-toggle"><img src="images/dot-menu-more-2-svgrepo-com.svg" loading="lazy" width="14" alt=""></div>
                    <nav class="dropdown-list-3 w-dropdown-list">
                      <div class="div-block-17 diva div3">
                        <div class="div-block-22">
                          <a href="Perfil.aspx" class="link-block-3 w-inline-block w-clearfix"><img src="images/flag-svgrepo-com.svg" loading="lazy" width="21" alt="" class="image-13">
                            <div class="text-block-7">Denunciar Comentário</div>
                          </a>
                        </div>
                      </div>
                    </nav>
                  </div>
                </div>
              </div>
              <div class="div-comentario">
                <div class="text-block-31">This is some text inside of a div block.This is some text inside of a div block.This is some text inside of a div block.This is some text inside of a div block.</div>
              </div>
            </div>
          </div>
        </div>
              </ItemTemplate>

          </asp:DataList>
        
      </div>
    </div>
  </div>
</asp:Content>

