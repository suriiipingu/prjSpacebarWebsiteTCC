<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="perfil-config.aspx.cs" Inherits="perfil_config" %>

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
          <ol role="list" class="sidebar-config">
            <li class="margin-bottom-24px fund1">
              <a href="../config/perfil-config.html" aria-current="page" class="nav-link-2 w--current">Meu perfil</a>
            </li>
            <li class="margin-bottom-24px">
              <a href="../config/minha-conta.html" class="nav-link-2">Minha conta</a>
            </li>
            <li class="margin-bottom-24px">
              <a href="../config/criador-de-conteudo.html" class="nav-link-2">Criador de conteúdo</a>
            </li>
            <li class="margin-bottom-24px">
              <a href="../config/verificado.html" class="nav-link-2">Verificado</a>
            </li>
          </ol>
          <div class="container-5 w-container">
            <div data-hover="false" data-delay="0" class="dropdown w-dropdown">
              <div class="dropdown-toggle-4 w-dropdown-toggle">
                <div class="icon-2 w-icon-dropdown-toggle"></div>
                <div class="text-block-4">Perfil</div>
              </div>
              <nav class="dropdown-list w-dropdown-list">
                <a href="../config/perfil-config.html" aria-current="page" class="dropdown-link-3 w-dropdown-link w--current">Perfil</a>
                <a href="../config/minha-conta.html" class="w-dropdown-link">Minha conta</a>
                <a href="../config/criador-de-conteudo.html" class="w-dropdown-link">Criador de conteúdo</a>
                <a href="../config/verificado.html" class="w-dropdown-link">Verificado</a>
              </nav>
            </div>
          </div>
        </div>
        <div class="ctn-perfil w-col w-col-9">
          <div class="cnt-perfil w-container">
            <div class="ft-fundo"><img src="https://d3e54v103j8qbb.cloudfront.net/plugins/Basic/assets/placeholder.60f9b1840c.svg" loading="lazy" alt="" class="image-16"></div>
            <div class="div-block-4"><img src="https://d3e54v103j8qbb.cloudfront.net/plugins/Basic/assets/placeholder.60f9b1840c.svg" loading="lazy" alt="" class="image-8">
              <div class="div-block-5"><img src="../images/camera-01-svgrepo-com.svg" loading="lazy" width="59" alt="" class="image-10"></div>
            </div>
            <div class="div-block-7">
              <div class="columns-5 w-row">
                <div class="column-8 w-col w-col-6">
                  <h4 class="heading-2">Perfil</h4>
                  <p class="paragraph">Atualize os dados do seu perfil.</p>
                </div>
                <div class="column-3 w-clearfix w-col w-col-6">
                  <div class="div-block-12">
                    <a href="#" class="btnclassico btncancel w-button">Cancelar</a>
                  </div>
                  <div class="divblock">
                    <a href="#" class="btnclassico btnsalvar submit-button w-button">Salvar</a>
                  </div>
                </div>
              </div>
            </div>
            <div class="div-block-8">
              <div class="linha w-row">
                <div class="column-10 w-col w-col-4">
                  <div class="text-block">Nome de Usuário</div>
                </div>
                <div class="w-col w-col-8">
                  <div class="w-form">
                    <form id="wf-form-" name="wf-form-" data-name="" method="get" class="form form-3"><input type="text" class="text-field w-input" maxlength="256" name="name" data-name="Name" placeholder="" id="name"></form>
                    <div class="w-form-done">
                      <div>Thank you! Your submission has been received!</div>
                    </div>
                    <div class="w-form-fail">
                      <div>Oops! Something went wrong while submitting the form.</div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="linha mobile w-row">
                <div class="column-9 w-col w-col-4">
                  <div class="text-block">Sua foto</div>
                  <p class="paragraph-2">Essa foto aparecerá no seu perfil.</p>
                </div>
                <div class="column-12 w-col w-col-8">
                  <div class="div-block-13"><img src="https://d3e54v103j8qbb.cloudfront.net/plugins/Basic/assets/placeholder.60f9b1840c.svg" loading="lazy" width="59" alt="" class="imgperfil"></div>
                  <div class="div-block-14 w-clearfix">
                    <div class="div-block-12">
                      <a href="#" class="btndel w-button">Cancelar</a>
                    </div>
                    <div class="div-block-12">
                      <a href="#" class="btnupdate w-button">Atualizar</a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="linha mobile w-row">
                <div class="column-9 w-col w-col-4">
                  <div class="text-block">Sua foto de fundo</div>
                  <p class="paragraph-2">Essa foto aparecerá no fundo do seu perfil.</p>
                </div>
                <div class="column-12 w-col w-col-8">
                  <div class="div-block-13"><img src="https://d3e54v103j8qbb.cloudfront.net/plugins/Basic/assets/placeholder.60f9b1840c.svg" loading="lazy" width="59" alt="" class="imgfundo"></div>
                  <div class="div-block-14 w-clearfix">
                    <div class="div-block-12">
                      <a href="#" class="btndel w-button">Cancelar</a>
                    </div>
                    <div class="div-block-12">
                      <a href="#" class="btnupdate w-button">Atualizar</a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="linha w-row">
                <div class="column-9 w-col w-col-4">
                  <div class="text-block">Sua bio</div>
                  <p class="paragraph-2">Escreva um pouco sobre você.</p>
                </div>
                <div class="column-12 w-col w-col-8">
                  <div class="w-form">
                    <form id="wf-form-" name="wf-form-" data-name="" method="get" class="form-2"><textarea id="txtArea" name="field" maxlength="5000" data-name="Field" placeholder="Adicione um brilho ao seu perfil" class="textarea-2 w-input"></textarea></form>
                    <div class="w-form-done">
                      <div>Thank you! Your submission has been received!</div>
                    </div>
                    <div class="w-form-fail">
                      <div>Oops! Something went wrong while submitting the form.</div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="linha linha2 w-row">
                <div class="column-7 w-col w-col-4">
                  <div class="text-block">Seus selos</div>
                  <p class="paragraph-2">Selos de sua explorção.</p>
                </div>
                <div class="column-5 w-col w-col-8">
                  <div class="cnt-selos w-clearfix">
                    <div class="selo-bloco"><img src="../images/BackSpace.svg" loading="lazy" width="107" alt="" class="image-24"></div>
                    <div class="selo-bloco"><img src="../images/Verificado2.svg" loading="lazy" width="107" alt="" class="image-24"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="div-block-16">
    <div class="div-block-15">
      <a href="#" class="btnclassico btncancel w-button">Cancelar</a>
    </div>
    <div class="divblock16">
      <a href="#" class="btnclassico btnsalvar submit-button w-button">Salvar</a>
    </div>
  </div>
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=63b36b18e56c1d6047ac08b2" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="../js/webflow.js" type="text/javascript"></script>
</asp:Content>

