<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="criador de conteudo.aspx.cs" Inherits="criador_de_conteudo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <link href="../css/normalize.css" rel="stylesheet" type="text/css">
  <link href="../css/webflow.css" rel="stylesheet" type="text/css">

  <link href="../css/site-spacebar.webflow.css" rel="stylesheet" type="text/css">

    <style>
        .body-2{
            background-color:white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="A" Runat="Server">
    <div class="section-2 wf-section">
    <div class="div-block-3">
      <h4 class="heading">Configurações</h4>
    </div>
  </div>
  <div class="conteudo wf-section">
    <div>
      <div class="w-row">
        <div class="column-2 w-col w-col-3">
          <div class="container-5 w-container">
            <div data-hover="false" data-delay="0" class="dropdown w-dropdown">
              <div class="dropdown-toggle-4 w-dropdown-toggle">
                <div class="icon-2 w-icon-dropdown-toggle"></div>
                <div class="text-block-4">Criador de conteúdo</div>
              </div>
              <nav class="dropdown-list w-dropdown-list">
                <a href="perfil-config.aspx" class="w-dropdown-link">Perfil</a>
                <a href="minha-conta.aspx" class="w-dropdown-link">Minha conta</a>
                <a href="criador de conteudo.aspx" aria-current="page" class="dropdown-link w-dropdown-link w--current">Criador de conteúdo</a>
                <a href="verificado.aspx" class="w-dropdown-link">Verificado</a>
              </nav>
            </div>
          </div>
          <ol role="list" class="sidebar-config">
            <li class="margin-bottom-24px fund1">
              <a href="perfil-config.aspx" class="nav-link-2">Meu perfil</a>
            </li>
            <li class="margin-bottom-24px">
              <a href="minha-conta.aspx" class="nav-link-2">Minha conta</a>
            </li>
            <li class="margin-bottom-24px">
              <a href="criador de conteudo.aspx" aria-current="page" class="nav-link-2 w--current">Criador de conteúdo</a>
            </li>
            <li class="margin-bottom-24px">
              <a href="verificado.aspx" class="nav-link-2">Verificado</a>
            </li>
          </ol>
        </div>
        <div class="ctn-perfil w-col w-col-9">
          <div class="cnt-perfil cnt-spacer w-container">
            <div class="div-block-7 divblockconta">
              <h4 class="heading-2">Criador de conteúdo</h4>
              <p class="paragraph">Se deseja publicar suas próprias postagens está no lugar certo.</p>
            </div>
            <div class="div-block-8">
              <p class="paragraph-3">Aceitando se tornar um criador, terá acesso a inúmeras ferramentas para criar a sua própria comunidade espacial.<br>Dentre elas estão:</p>
              <ul role="list">
                <li class="list-item">Publicar o que deseja</li>
                <li class="list-item">Interagir com a comunidade nas suas postagens</li>
                <li class="list-item">Editar postagens</li>
              </ul>
              <p class="paragraph-3">Para conseguir acesso aos apetrechos do fórum, você concorda ter lido os nossos Termos de Uso.</p>
            </div>
            <div class="w-form">
                  <label class="w-checkbox">
                      <asp:CheckBox ID="CheckBox1" CssClass="custom-checkbox"  runat="server" />
                      <span class="checkbox-label w-form-label" for="Checkbox">Eu li e concordo com os Termos de Uso.</span>
                </label>
                <asp:Button ID="Button1" runat="server" Text="Se tornar um Backspace" CssClass="submit-button-2 w-button" />
              <div class="w-form-done">
                <div>Thank you! Your submission has been received!</div>
              </div>
              <div class="w-form-fail">
                <div>Oops! Something went wrong while submitting the form.</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=63b36b18e56c1d6047ac08b2" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="../js/webflow.js" type="text/javascript"></script>
</asp:Content>

