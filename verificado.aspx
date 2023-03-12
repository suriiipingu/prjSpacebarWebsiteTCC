<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="verificado.aspx.cs" Inherits="verificado" %>

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
                <div class="text-block-4">Verificado</div>
              </div>
              <nav class="dropdown-list w-dropdown-list">
                <a href="../config/perfil-config.html" class="w-dropdown-link">Perfil</a>
                <a href="../config/minha-conta.html" class="w-dropdown-link">Minha conta</a>
                <a href="../config/criador-de-conteudo.html" class="w-dropdown-link">Criador de conteúdo</a>
                <a href="../config/verificado.html" aria-current="page" class="dropdown-link-5 w-dropdown-link w--current">Verificado</a>
              </nav>
            </div>
          </div>
          <ol role="list" class="sidebar-config">
            <li class="margin-bottom-24px fund1">
              <a href="../config/perfil-config.html" class="nav-link-2">Meu perfil</a>
            </li>
            <li class="margin-bottom-24px">
              <a href="../config/minha-conta.html" class="nav-link-2">Minha conta</a>
            </li>
            <li class="margin-bottom-24px">
              <a href="../config/criador-de-conteudo.html" class="nav-link-2">Criador de conteúdo</a>
            </li>
            <li class="margin-bottom-24px">
              <a href="../config/verificado.html" aria-current="page" class="nav-link-2 w--current">Verificado</a>
            </li>
          </ol>
        </div>
        <div class="ctn-perfil w-col w-col-9">
          <div class="cnt-perfil ctnverificado w-container">
            <div class="div-block-7 divblockconta">
              <h4 class="heading-2">Verificado</h4>
              <p class="paragraph">Nós precisamos de especialistas que possam confirmar notícias sobre o campo astronômico.</p>
            </div>
            <div class="div-block-8">
              <p class="paragraph-4">Desde o início pensamos em ter um fórum onde as pessoas possam confiar nas notícias espaciais que são postadas por aqui. Porém para termos o controle correto do que passa pelo fórum precisamos de colaboradores.</p>
              <p class="paragraph-4">Se você for estudante, professor, pesquisador, astrônomo, ou astrofísico e quiser obter o selo de Verificado, basta nos enviar até 5 arquivos que comprove que você está dentre esses listados. </p>
              <p class="paragraph-4">Após isso iremos analisar o seu perfil e os arquivos e em 4 dias enviaremos um e-mail dizendo se foi aprovada ou não.</p>
              <a href="#" class="button-4 w-button">Enviar</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=63b36b18e56c1d6047ac08b2" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="../js/webflow.js" type="text/javascript"></script>
</asp:Content>

