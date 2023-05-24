<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="atualizar-nomeusuario.aspx.cs" Inherits="atualizar_nomeusuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/normalize.css" rel="stylesheet" type="text/css">
  <link href="../css/webflow.css" rel="stylesheet" type="text/css">

  <link href="../css/site-spacebar.webflow.css" rel="stylesheet" type="text/css">

    <style>
        .body-2{
            background-color:white;
        }

        .btn-atualizar{
            width:100%;
            margin-top:20px;
            background-color: #c108ff;
            padding:10px;
            border-radius:10px;
        }

        .btn-atualizar:hover{
            background-color: #d863ff;
        }

        .espaco{
            margin-bottom:10px;
        }

        .lblErro{
            color:red;
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
              <h4 class="heading-2">Nome de Usuário</h4>
              <p class="paragraph">Atualize seu nome de usuário.</p>
            </div>
            <div class="div-block-8">
              <div class="div-input-texto">
                <div class="div-texto">
                  <div class="text-block txtatualizar">Atual</div>
                  <div class="text-block txtatualizar">Novo</div>
                </div>
                <div class="div-input">
                  <div class="w-form">
                      <div class="espaco">
                          <asp:Label ID="lblNomeUsuario" runat="server" Text="Label" CssClass="field-label-5"></asp:Label>
                      </div>
                      
                      <asp:TextBox ID="txtNomeUsuario" runat="server" CssClass="text-field txt-atualizar w-input"></asp:TextBox>
                      <asp:Label ID="lblErro" runat="server" Text="" CssClass="lblErro"></asp:Label>
                       <asp:Button ID="btnAtualizar" runat="server" Text="Atualizar" CssClass="btn-atualizar w-button"  OnClick="btnAtualizar_Click"/>
                    
                  </div>
                </div>
              </div>
            </div>
               
          </div>
        </div>
      </div>
    </div>
    </div>
</asp:Content>

