<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="verificado.aspx.cs" Inherits="verificado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/normalize.css" rel="stylesheet" type="text/css">
    <link href="../css/webflow.css" rel="stylesheet" type="text/css">

    <link href="../css/site-spacebar.webflow.css" rel="stylesheet" type="text/css">

    <style>
        .body-2 {
            background-color: white;
        }

        .file-upload-esconder {
            display: none;
        }
        .btnCriar {
            width: 100%;
            height: 40px;
            border: none;
            margin-bottom: 10px;
            color: white;
            background: linear-gradient(90deg, #FD8EFF 14.36%, #50C1E5 86.32%);
            border-radius: 10px;
            cursor: pointer;
        }

        .text-field.login-txt{
            margin:0;
        }

        .field-wrap{
            margin:0;
            margin-top:30px;
            margin-bottom:20px;
        }

        .ctn-bloco {
            position: relative;
            width: 100%;
            padding: 40px;
            background: #FFFFFF;
            box-shadow: 0px 4px 19px rgba(0, 0, 0, 0.25);
            border-radius: 30px;
        }

        .ctn-ajust {
            position: absolute;
            padding: 40px;
            width: 100%;
        }


        .link-info {
            color: #AD33C1;
            text-decoration: none;
        }

        p{
            width:100%;
        }

        .paragraph-3{
            font-weight:700;
        }

        .corTexto{
            color: #FF0CC9;
        }

        .textobotao{
            width:50%;
            flex-direction:column;
            flex: 0 auto;
            order: 0;
            justify-content: center;
            align-self: auto;
            align-items: center;
            display:flex;
        }

        .coluninha{
            flex-direction:row;
            justify-items:flex-start;
            align-items:stretch;
            margin-bottom:10px;
            display:flex;
        }

        .botaoEnviarImg{
            width:50px;
            height:50px;
            border: 1px solid #959595;
            border-radius:16px;
            margin-bottom:0;
            padding:10px;
        }

        .imgBotao{
            cursor:pointer;
            transition: transform 0.3s ease-out;
        }

        .imgBotao:hover{
             transform: scale(0.8);
        }

        .texto-coluna{
            align-self:center;
            margin-top:0;
            margin-left:10px;
        }

        .divOcultarBaixar{
            display:none;
        }

        .div-ocultar-adm{
            display:none;
        }

        .arquivos-baixar{
            display:none;
        }

        @media screen and (max-width:991px){
            .img{
            margin-top:0;
            display:block;
            }
            
            .img.imgpc{
                margin-top:40px;
                margin-bottom:100px;
                margin-right:0;
            }

            .imgpc{
                display:block;
            }
        }

        @media screen and (max-width: 767px){
            .arquivos-baixar{
                flex-direction:column;
                align-items:center;
                padding-left:0;
                padding-right:0;
            }

            .textobotao{
                width:70%;
            }

            .img.imgcel-menor{
                margin-top:20px;
                display:block;
            }

            .img.imgcelpc{
                display:none;
            }

            .img.imgpc{
                margin-top:20px;
                margin-bottom:10px;
            }

            .imgpc{
                align-items:center;
                margin-right:0;
                display:flex;
            }
        }

        @media screen and (max-width:479px){
            .p6{
                width:100%;
            }

            .textobotao{
                width:70%;
            }
        }

    </style>

    <script  type="text/javascript">

        /* ocultar div que mostra solicitação para virar criador de conteúdo */
        function EsconderSolicitacao() {
            var divOcultarExplicacao = document.getElementById("divOcultarExplicacao");
            var divOcultarBtnExplicacao = document.getElementById("divOcultarBtnExplicacao");
            divOcultarBtnExplicacao.style.display = "none";
            divOcultarExplicacao.style.display = "none";
        }
        /*div para mostrar - verificado pendente */
        function MostrarVerificadoPendente() {
            divVerificadoPendente.style.display = "block";
        }

        /*div para mostrar se usuário já é verificado */
        function MostrarDivOcultar() {
            var divOcultarBaixar = document.getElementById("divOcultar");
            divOcultar.style.display = "block";
        }

        function setupFileUpload() {
            // Obtém referência para o elemento File Upload
            var fileUpload = document.getElementById('<%= FileUploadVerificado.ClientID %>');

            var lblImageCount = document.getElementById('<%= lblNum.ClientID %>');

            // Adiciona um ouvinte de evento para o evento de alteração
            fileUpload.addEventListener('change', function () {
                // Obtém a quantidade de imagens selecionadas
                var selectedImageCount = fileUpload.files.length;

                // Atualiza o texto da label com a contagem de imagens selecionadas
                lblImageCount.textContent = selectedImageCount + '/1';
            });
        }

        // Chama a função de configuração quando a página é carregada
        window.addEventListener('DOMContentLoaded', setupFileUpload);

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="A" runat="Server">
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
                    <div class="ctn-ajust">
                        <div class="ctn-bloco">
                            <div id="divOcultarExplicacao" class="div-ocultar-explicacao">
                                <!-- Div explicando o que é verificado -->
                                <div class="div-block-7 divblockconta">
                                    <h4 class="heading-2">Verificado</h4>
                                </div>
                                <div class="div-block-8">
                                    <p class="paragraph-3">Por que <a class="corTexto">Verificado</a>?</p>
                                    <p>Desde o início pensamos em ter uma rede social, no qual as pessoas possam confiar nas notícias espaciais que são postadas por aqui. Porém para termos o controle correto do que passa pelo fórum precisamos de colaboradores.
</p>
                                    <p class="paragraph-3">Quem pode ser <a class="corTexto">Verificado</a>?</p>
                                    <p>Estudantes, professores, pesquisadores, astrônomos e até astrofísicos podem obter esse selo.</p>
                                    <p class="paragraph-3">Como conseguir?</p>
                                    <p>Nos envie até 2 arquivos que comprove que você tem uma base de estudo no campo astronômico.</p>
                                    <p class="paragraph-3">O que você precisa saber</p>
                                    <p>Após enviar os arquivos, iremos analisar seu perfil e em 4 dias retornaremos com um e-mail, dizendo se foi aprovado ou não.</p>


                                </div>


                            </div>

                            <div id="divOcultar" class="divOcultarBaixar">
                                <!-- Div para aparecer se usuário já é verificado -->
                                <div class="div-block-7 divblockconta">
                                    <h4 class="heading-2">Verificado</h4>
                                    <p class="paragraph">Você já é verificado, agora poderá confirmar a vericidade das postagens! </p>
                                </div>

                            </div>
                            <!-- Div para aparecer se usuário está pendente em verificado -->
                            <div id="divVerificadoPendente" class="divOcultarBaixar">
                                <h4 class="heading-2">Verificado</h4>
                                    <p class="paragraph">Estamos analisando a sua solicitação, volte daqui à 4 dias!!</p>
                            </div>

                        </div>

                        <!-- botão para enviar solicitação de verificado -->
                        <div id="divOcultarBtnExplicacao" class="div-ocultar-explicacao">
                            <div class="w-form">

                                <div class="field-wrap">
                                <asp:Label ID="lblProfissao" runat="server" Text="Profissão *" CssClass="field-label-4"></asp:Label>
                                <asp:TextBox ID="txtProfissao" CssClass="text-field login-txt w-input" placeholder="Nos diga a sua profissão" runat="server"></asp:TextBox>
                            </div>
                                <div class="coluninha">
                                    <div class="botaoEnviarImg">
                                        <asp:FileUpload ID="FileUploadVerificado" runat="server" CssClass="file-upload-esconder" accept=".png,.jpg,.jpeg" maxlength="524880"/>
                                    <asp:Image ID="imgEnviar" runat="server" ImageUrl="~/images/upload.svg"  CssClass="imgBotao"/>

                                </div>
                                    <div class="texto-coluna">
                                        <div class="txtblock-1">Envie aqui o(s) seu(s) arquivo(s)</div>
                                        <asp:Label ID="lblNum" runat="server" Text="0/1" CssClass="txtblock-1"></asp:Label>
                                    </div>
                                </div>
                                
                                <asp:Label ID="lblErro" runat="server" Text=""></asp:Label>
                                <asp:Button ID="btnEnviar" runat="server" Text="Enviar" CssClass="btnCriar" OnClick="btnEnviar_Click"/>
                                <p>Enviando seus dados, você confirma ter lido os nossos <a href="" class="link-info">Termos de Serviço</a> e <a href="" class="link-info">Política de Privacidade</a>. Caso não tenha lido, você pode encontrá-lo na nossa aba de <a href="" class="link-info">informações adicionais</a>.</p>
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

