<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="criador de conteudo.aspx.cs" Inherits="criador_de_conteudo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/normalize.css" rel="stylesheet" type="text/css">
    <link href="../css/webflow.css" rel="stylesheet" type="text/css">

    <link href="../css/site-spacebar.webflow.css" rel="stylesheet" type="text/css">

    <style>
        .body-2 {
            background-color: white;
        }

        .fundo-fofo {
            position: absolute;
            width: 100%;
            height: 200px;
            background: linear-gradient(180deg, #3100F5 0%, #D57CFF 48.44%, rgba(98, 227, 255, 0.06) 100%);
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
            margin-top: 40px;
        }

        .estrela {
            width: 100%;
            height: 80%;
        }

        .link-info {
            color: #AD33C1;
            text-decoration: none;
        }

        .arquivos-baixar{
            margin-top:30px;
            justify-content: center;
            display:flex;
        }

        .imgPcs{
            flex-direction:column;
            align-self:auto;
            margin-right:20px;
            display:flex;
        }

        .btnBaixar{
            background-image: linear-gradient(to right, #fd8eff, #50c1e5);
            border-radius:10px;
            margin-top:20px;
            padding-left:40px;
            padding-right:40px;
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

        .img{
            width:100px;
        }

        .img.imgcel-menor{
            display:none;
        }

        .img.imgpc{
            align-items: stretch;
            margin-top: 40px;
            margin-bottom:60px;
            display:block;
        }

        .imgpc{
            flex-direction:column;
            align-self:auto;
            align-items:center;
            margin-right:10px;
            display:flex;
        }

        .p6{
            width:100%;
            color:gray;
            text-align:center;
            margin: 20px 0 0;
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

    <script>

        /* ocultar div que mostra solicitação para virar criador de conteúdo */
        function EsconderSolicitacaoCC() {
            var divOcultarExplicacao = document.getElementById("divOcultarExplicacao");
            var divOcultarBtnExplicacao = document.getElementById("divOcultarBtnExplicacao");
            divOcultarBtnExplicacao.style.display = "none";
            divOcultarExplicacao.style.display = "none";
        }

        /*div para mostrar se usuário já é criador de conteúdo */
        function MostrarDivOcultarBaixar() {
            var divOcultarBaixar = document.getElementById("divOcultarBaixar");
            var divArquivosBaixar = document.getElementById("divArquivosBaixar");
            divArquivosBaixar.style.display = "flex";
            divOcultarBaixar.style.display = "block";
        }

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
                    <div class="fundo-fofo">
                        <div class="estrela">
                            <img alt="" src="images/Vector.svg" />
                            <img alt="" src="images/Vector.svg" class="estrela" />
                        </div>
                    </div>
                    <div class="ctn-ajust">
                        <div class="ctn-bloco">
                            <div id="divOcultarExplicacao" class="div-ocultar-explicacao">
                                <!-- Div explicando o que é criador de conteúdo -->
                                <div class="div-block-7 divblockconta">
                                    <h4 class="heading-2">Criador de conteúdo</h4>
                                    <p class="paragraph">Caso esteja cansado de só visualizar as postagens, o que acha de criar as suas próprias?</p>
                                </div>
                                <div class="div-block-8">
                                    <p class="paragraph-3">Se tornando um criador de conteúdo, você pode:</p>
                                    <p>
                                        Publicar o que deseja;
                    <br />
                                        Interagir com a comunidade nas suas postagens;
                    <br>
                                        Editar postagens;
                                    </p>

                                    <p class="paragraph-3">Para conseguir acesso aos apetrechos do fórum, você concorda ter lido os nossos Termos de Uso.</p>
                                </div>


                            </div>

                            <div id="divOcultarBaixar" class="divOcultarBaixar">
                                <!-- Div para aparecer se usuário já é criador de conteúdo -->
                                <div class="div-block-7 divblockconta">
                                    <h4 class="heading-2">Criador de conteúdo</h4>
                                    <p class="paragraph">Você já é criador de conteúdo, que tal começar a sua jornada?</p>
                                </div>
                                    <p class="paragraph-3">Se você não sabe como criar suas postagens, temos dois mecanismos:</p>

                                
                            </div>

                        </div>

                        <!-- botão para se transformar em um criador de conteúdo -->
                        <div id="divOcultarBtnExplicacao" class="div-ocultar-explicacao">
                            <div class="w-form">
                                <br />
                                <asp:Button ID="btnEnviar" runat="server" Text="Comece a criar" CssClass="btnCriar" OnClick="btnEnviar_Click" />
                                <p>Enviando seus dados, você confirma ter lido os nossos <a href="" class="link-info">Termos de Serviço</a> e <a href="" class="link-info">Política de Privacidade</a>. Caso não tenha lido, você pode encontrá-lo na nossa aba de <a href="" class="link-info">informações adicionais</a>.</p>
                            </div>
                        </div>

                        <!-- arquivos para baixar caso você já seja criador de conteúdo -->
                           <div id="divArquivosBaixar" class="arquivos-baixar">
                                    <div class="imgpc">
                                        <img alt="" src="images/icondesktop.png" class="img imgpc" />
                                        <img alt="" src="images/iconmobile.png"  class="img imgcelpc"/>
                                    </div>
                                    <div class="textobotao">
                                        <p class="p6">Temos o nosso aplicativo desktop, no qual permite que você crie suas postagens pelo computador. Por lá você poderá enviar fotos, escolher o seu título e se quiser, dar um texto a sua postegem.
                                            Se gostou da ideia, clique aqui para baixar!
                                        </p>
                                        <asp:Button ID="btnBaixarDesk" runat="server" Text="Baixar agora"  CssClass="btnBaixar w-button"/>

                                        <div class="text-block-25">————— Ou —————</div>

                                        <div class="imgpc imgcel">
                                            <img alt="" src="images/iconmobile.png" class="img imgcel-menor" />
                                        </div>
                                        <p class="p6">Caso não queira baixar nenhum aplicativo no seu computador, fique calmo. Temos também nosso aplicativo mobile, no qual permite que você crie suas postagens pelo celular. Por lá você fará as mesmas coisas aqui do site. Se gostou da ideia, clique aqui para baixar!</p>
                                         <asp:Button ID="btnBaixarMob" runat="server" Text="Baixar agora"  CssClass="btnBaixar w-button"/>


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

