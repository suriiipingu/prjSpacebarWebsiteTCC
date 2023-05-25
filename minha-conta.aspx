<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="minha-conta.aspx.cs" Inherits="minha_conta" %>

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
                <div class="text-block-4">Minha conta</div>
              </div>
              <nav class="dropdown-list w-dropdown-list">
                <a href="perfil-config.aspx" class="w-dropdown-link">Meu perfil</a>
                <a href="minha-conta.aspx" aria-current="page" class="dropdown-link-4 w-dropdown-link w--current">Minha conta</a>
                <a href="criador de conteudo.aspx"" class="w-dropdown-link">Criador de conteúdo</a>
                <a href="verificado.aspx" class="w-dropdown-link">Verificado</a>
              </nav>
            </div>
          </div>
          <ol role="list" class="sidebar-config">
            <li class="margin-bottom-24px fund1">
              <a href="perfil-config.aspx" class="nav-link-2">Meu perfil</a>
            </li>
            <li class="margin-bottom-24px">
              <a href="minha-conta.aspx" aria-current="page" class="nav-link-2 w--current">Minha conta</a>
            </li>
            <li class="margin-bottom-24px">
              <a href="criador de conteudo.aspx" class="nav-link-2">Criador de conteúdo</a>
            </li>
            <li class="margin-bottom-24px">
              <a href="verificado.aspx" class="nav-link-2">Verificado</a>
            </li>
          </ol>
        </div>
        <div class="ctn-perfil w-col w-col-9">
          <div class="cnt-perfil ctn-conta w-container">
            <div class="div-block-7 divblockconta">
              <h4 class="heading-2">Minha conta</h4>
              <p class="paragraph">Atualize as informações da sua conta.</p>
            </div>
            <div class="div-block-8">
              <div class="linha linha-conta w-row">
                <div class="column-10 w-col w-col-4">
                  <div class="text-block">Nome de Usuário</div>
                </div>
                <div class="column-13 w-col w-col-8">
                  <div class="w-form">

                        <asp:Label ID="lblNomeUsuario" runat="server" CssClass="field-label" Text="@suriipingu"></asp:Label>
                      <a href="atualizar-nomeusuario.aspx" class="button-3 w-button">Atualizar</a>
                  </div>
                </div>
              </div>
              <div class="linha linha-conta w-row">
                <div class="column-9 w-col w-col-4">
                  <div class="text-block">Celular</div>
                </div>
                <div class="column-12 w-col w-col-8">
                  <div class="w-form">
                      <asp:Label ID="lblCelular" runat="server" CssClass="field-label" Text="(55+) 11 99014-1476"></asp:Label>
                        
                      <a href="atualizar-celular.aspx" class="button-3 w-button">Atualizar</a>
                    
                    
                  </div>
                </div>
              </div>
              <div class="linha linha-conta w-row">
                <div class="column-7 w-col w-col-4">
                  <div class="text-block">E-mail</div>
                </div>
                <div class="column-5 w-col w-col-8">
                  <div class="w-form">
                      <asp:Label ID="lblEmail" runat="server" CssClass="field-label" Text="clara.venturoli@gmail.com"></asp:Label>
                      <a href="atualizar-email.aspx" class="button-3 w-button">Atualizar</a>

                  </div>
                </div>
              </div>
              <div class="linha linha-conta w-row">
                <div class="column-7 w-col w-col-4">
                  <div class="text-block">País</div>
                </div>
                <div class="column-5 w-col w-col-8">
                  <div class="w-form">
                      <asp:Label ID="lblPais" runat="server" CssClass="field-label" Text="Brasil"></asp:Label>
                      <a href="atualizar-pais.aspx" class="button-3 w-button">Atualizar</a>
                    
                    
                </div>
              </div>
              
            </div>
                <div class="ctn-senha">
                <div class="text-block">
                  <a href="atualizar-senha.aspx" class="link-5">Atualizar Senha</a>
                </div>
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

