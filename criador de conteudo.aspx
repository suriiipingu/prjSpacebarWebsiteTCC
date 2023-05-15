<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="criador de conteudo.aspx.cs" Inherits="criador_de_conteudo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <link href="../css/normalize.css" rel="stylesheet" type="text/css">
  <link href="../css/webflow.css" rel="stylesheet" type="text/css">

  <link href="../css/site-spacebar.webflow.css" rel="stylesheet" type="text/css">

    <style>
        .body-2{
            background-color:white;

        }

        .fundo-fofo {
            position:absolute;
            width: 100%;
            height: 200px;
            background: linear-gradient(180deg, #3100F5 0%, #D57CFF 48.44%, rgba(98, 227, 255, 0.06) 100%);
        }


        .btnCriar{
            width:100%;
            height:40px;
            border:none;
            margin-bottom:10px;
            color: white;
            background: linear-gradient(90deg, #FD8EFF 14.36%, #50C1E5 86.32%);
border-radius: 10px;
cursor:pointer;
        }

        .ctn-bloco{
            position:relative;
            width:100%;
            padding:40px;
            background: #FFFFFF;
box-shadow: 0px 4px 19px rgba(0, 0, 0, 0.25);
border-radius: 30px;
        }

        .ctn-ajust{
            position:absolute;
padding:40px;
            width:100%;
            margin-top:40px;
        }

        .estrela{
            width:100%;
            height:80%;
            
        }

        .link-info{
            color: #AD33C1;
            text-decoration:none;
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
          <div class="fundo-fofo">
              <div class="estrela">
                  <img alt="" src="images/Vector.svg" />
<img alt="" src="images/Vector.svg"  class="estrela"/>
              </div>
          </div>
          <div class="ctn-ajust">
            <div class="ctn-bloco">
                <div class="div-block-7 divblockconta">
              <h4 class="heading-2">Criador de conteúdo</h4>
              <p class="paragraph">Caso esteja cansado de só visualizar as postagens, o que acha de criar as suas próprias?</p>
            </div>
            <div class="div-block-8">
              <p class="paragraph-3">Se tornando um criador de conteúdo, você pode:</p>
                <p>Publicar o que deseja;
                    <br />
                Interagir com a comunidade nas suas postagens;
                    <br>
                Editar postagens;</p>

              <p class="paragraph-3">Para conseguir acesso aos apetrechos do fórum, você concorda ter lido os nossos Termos de Uso.</p>
            </div>
            </div>
            <div class="w-form">
                <br />
                <asp:Button ID="btnEnviar" runat="server" Text="Comece a criar" CssClass="btnCriar" OnClick="btnEnviar_Click" />
                <p>Enviando seus dados, você confirma ter lido os nossos <a href="" class="link-info">Termos de Serviço</a> e <a href="" class="link-info">Política de Privacidade</a>. Caso não tenha lido, você pode encontrá-lo na nossa aba de <a href="" class="link-info">informações adicionais</a>.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=63b36b18e56c1d6047ac08b2" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="../js/webflow.js" type="text/javascript"></script>
</asp:Content>

