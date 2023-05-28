<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="perfil-config.aspx.cs" Inherits="perfil_config" %>

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

        textarea {
            resize: none;
        }

        .fundo-opacity {
            object-fit: cover;
            background-color: rgba(0,0,0, .3);
            border-top-left-radius: 40px;
            border-top-right-radius: 40px;
            position: absolute;
            top: 0%;
            bottom: 0%;
            left: 0%;
            right: 0%;
        }

        .img-fundo {
            position: absolute;
            width: 30px;
            top: 50%;
            bottom: 50%;
            left: 50%;
            right: 50%;
            transition: transform 0.3s ease-out;
            cursor: pointer;
        }

            .img-fundo:hover {
                transform: scale(0.8);
            }

        .image-10 {
            transition: transform 0.3s ease-out;
            cursor: pointer;
        }

            .image-10:hover {
                transform: scale(0.8);
            }

        .image-16 {
            object-fit:cover;
            position: absolute;
        }

        .image-8 {
            width:190px;
            height:190px;
            object-fit: cover;
        }

        img[src=""] {
            display: none;
        }

        .lblErro {
            color: red;
        }
        .btnsalvar:hover{
            background-color:#a750ff;
        }



        @media screen and (max-width: 991px) {
            .btnclassico.btncancel {
                width: 100%;
            }
        }

        @media screen and (max-width: 767px) {
            .btnclassico.btnsalvar.submit-button {
                width: 100%;
            }

            .imgperfil {
                position: absolute;
                width: 60px;
                height: 60px;
                object-fit: cover;
            }

            .imgfundo {
                position: absolute;
            }

            .div-block-bola {
                float: left;
                background-color: rgba(0, 0, 0, 0.3);
                width: 60px;
                height: 60px;
                border-radius: 100%;
            }

            .div-block-13 {
                background-color: rgba(0, 0, 0, 0.3);
                border-top-left-radius: 20px;
                border-top-right-radius: 20px;
                width: 120px;
                height: 50px;
            }
        }
    </style>


    <script type="text/javascript">

        //show preview imagem perfil - Computador
        function showpreview(input) {

            if (input.files && input.files[0]) {

                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgpreview').css('visibility', 'visible');
                    $('#imgpreview').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }

        }
        //show preview imagem fundo - Computador
        function showpreviewFundo(input) {

            if (input.files && input.files[0]) {

                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgpreviewFundo').css('visibility', 'visible');
                    $('#imgpreviewFundo').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }

        }


        //show preview imagem perfil - Celular
        function showpreviewmini(input) {

            if (input.files && input.files[0]) {

                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#mini-img-perfil-preview').css('visibility', 'visible');
                    $('#mini-img-perfil-preview').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }

        }

        //show preview imagem fundo - Celular
        function showpreviewminiFundo(input) {

            if (input.files && input.files[0]) {

                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#mini-img-fundo-preview').css('visibility', 'visible');
                    $('#mini-img-fundo-preview').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }

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
                    <ol role="list" class="sidebar-config">
                        <li class="margin-bottom-24px fund1">
                            <a href="perfil-config.aspx" aria-current="page" class="nav-link-2 w--current">Meu perfil</a>
                        </li>
                        <li class="margin-bottom-24px">
                            <a href="minha-conta.aspx" class="nav-link-2">Minha conta</a>
                        </li>
                        <li class="margin-bottom-24px">
                            <a href="criador de conteudo.aspx" class="nav-link-2">Criador de conteúdo</a>
                        </li>
                        <li class="margin-bottom-24px">
                            <a href="verificado.aspx" class="nav-link-2">Verificado</a>
                        </li>
                    </ol>
                    <div class="container-5 w-container">
                        <div data-hover="false" data-delay="0" class="dropdown w-dropdown">
                            <div class="dropdown-toggle-4 w-dropdown-toggle">
                                <div class="icon-2 w-icon-dropdown-toggle"></div>
                                <div class="text-block-4">Perfil</div>
                            </div>
                            <nav class="dropdown-list w-dropdown-list">
                                <a href="perfil-config.aspx" aria-current="page" class="dropdown-link-3 w-dropdown-link w--current">Perfil</a>
                                <a href="minha-conta.aspx" class="w-dropdown-link">Minha conta</a>
                                <a href="criador de conteudo.aspx" class="w-dropdown-link">Criador de conteúdo</a>
                                <a href="verificado.aspx" class="w-dropdown-link">Verificado</a>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="ctn-perfil w-col w-col-9">
                    <div class="cnt-perfil w-container">

                        <%-- Imagem fundo - computador --%>
                        <div class="ft-fundo">
                            <div class="fundo-opacity">
                            </div>
                            <asp:Image ID="imgFundo" runat="server" CssClass="image-16" />
                            <img id="imgpreviewFundo" src="" alt="" class="image-16">

                            <asp:FileUpload ID="FileUploadFundo" runat="server" onchange="showpreviewFundo(this);" accept=".png,.jpg,.jpeg" maxlength="524880" CssClass="file-upload-esconder" />
                            <asp:Image ID="btnCamFundo" runat="server" ImageUrl="../images/camera-01-svgrepo-com.svg" CssClass="img-fundo" />

                        </div>

                        <!--Imagem perfil - Computador-->
                        <div class="div-block-4">
                            <asp:Image ID="imgPerfil" runat="server" CssClass="image-8" />
                            <img id="imgpreview" src="" alt="" class="image-8">

                            <div class="div-block-5">
                                <asp:FileUpload ID="FUimg" runat="server" onchange="showpreview(this);" accept=".png,.jpg,.jpeg" maxlength="524880" CssClass="file-upload-esconder" />
                                <asp:Image ID="btnCamImg" runat="server" ImageUrl="../images/camera-01-svgrepo-com.svg" CssClass="image-10" Width="59" />
                            </div>
                        </div>

                        <div class="div-block-7">
                            <div class="columns-5 w-row">
                                <div class="column-8 w-col w-col-6">
                                    <h4 class="heading-2">Perfil</h4>
                                    <p class="paragraph">Atualize os dados do seu perfil.</p>

                                    <asp:Label ID="lblErro" runat="server" Text="" CssClass="lblErro"></asp:Label>
                                </div>
                                <div class="column-3 w-clearfix w-col w-col-6">
                                    <div class="div-block-12">
                                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btnclassico btncancel w-button" />
                                    </div>
                                    <div class="divblock">
                                        <asp:Button ID="btnSalvar" runat="server" Text="Salvar" CssClass="btnclassico btnsalvar submit-button w-button" OnClick="btnSalvar_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="div-block-8">
                            <div class="linha w-row">
                                <div class="column-10 w-col w-col-4">
                                    <div class="text-block">Seu nome</div>
                                </div>
                                <div class="w-col w-col-8">
                                    <div class="w-form">
                                        <asp:TextBox ID="txtNomeUsu" CssClass="text-field w-input" placeholder="Insira seu nome" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="linha mobile w-row">
                                <div class="column-9 w-col w-col-4">
                                    <div class="text-block">Sua foto</div>
                                    <p class="paragraph-2">Essa foto aparecerá no seu perfil.</p>
                                </div>
                                <!--Imagem perfil - Celular -->
                                <div class="column-12 w-col w-col-8">
                                    <div class="div-block-bola">
                                        <asp:FileUpload ID="FUimgmini" runat="server" onchange="showpreviewmini(this);" CssClass="file-upload-esconder" />
                                        <asp:Image ID="imgPerfilCel" runat="server" CssClass="imgperfil" />
                                        <img id="mini-img-perfil-preview" src="" alt="" class="imgperfil">
                                    </div>
                                    <div class="div-block-14 w-clearfix">
                                        <div class="div-block-12">
                                            <asp:HyperLink ID="btnAtualizar" runat="server" CssClass="btnupdate w-button">Atualizar</asp:HyperLink>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="linha mobile w-row">
                                <div class="column-9 w-col w-col-4">
                                    <div class="text-block">Sua foto de fundo</div>
                                    <p class="paragraph-2">Essa foto aparecerá no fundo do seu perfil.</p>
                                </div>
                                <!--Imagem fundo - Celular -->
                                <div class="column-12 w-col w-col-8">
                                    <div class="div-block-13">
                                        <asp:FileUpload ID="FileUploadFundoCelular" runat="server" onchange="showpreviewminiFundo(this);" CssClass="file-upload-esconder" />
                                        <asp:Image ID="imgFundoCel" runat="server" CssClass="imgfundo" />
                                        <img id="mini-img-fundo-preview" src="" loading="lazy" width="59" alt="" class="imgfundo">
                                    </div>
                                    <div class="div-block-14 w-clearfix">
                                        <div class="div-block-12">
                                            <asp:HyperLink ID="btnAtualizar2" runat="server" CssClass="btnupdate w-button">Atualizar</asp:HyperLink>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--bio-->
                            <div class="linha w-row">
                                <div class="column-9 w-col w-col-4">
                                    <div class="text-block">Sua bio</div>
                                    <p class="paragraph-2">Escreva um pouco sobre você.</p>
                                </div>
                                <div class="column-12 w-col w-col-8">
                                    <div class="w-form">
                                        <asp:TextBox ID="txtBio" MaxLength="300" placeholder="Adicione um brilho ao seu perfil" CssClass="textarea-2 w-input" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!---selos--->
                            <div class="linha linha2 w-row">
                                <div class="column-7 w-col w-col-4">
                                    <div class="text-block">Seus selos</div>
                                    <p class="paragraph-2">Selos de sua explorção.</p>
                                </div>
                                <div class="column-5 w-col w-col-8">
                                    <div class="cnt-selos w-clearfix">
                                        <div class="selo-bloco">
                                            <asp:Image ID="selo1" runat="server" Width="107" CssClass="image-24" />
                                            <div class="selo-bloco">
                                                <asp:Image ID="selo2" runat="server" Width="107" CssClass="image-24" />
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
                    <asp:Button ID="btnCancelar2" runat="server" Text="Cancelar" CssClass="btnclassico btncancel w-button" />
                </div>
                <div class="divblock16">
                    <asp:Button ID="btnSalvar2" runat="server" Text="Salvar" CssClass="btnclassico btnsalvar submit-button w-button" OnClick="btnSalvar2_Click" />
                </div>
            </div>
            <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=63b36b18e56c1d6047ac08b2" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
            <script src="../js/webflow.js" type="text/javascript"></script>
</asp:Content>

