<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="perfil-config.aspx.cs" Inherits="perfil_config" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/normalize.css" rel="stylesheet" type="text/css">
    <link href="../css/webflow.css" rel="stylesheet" type="text/css">

    <link href="../css/site-spacebar.webflow.css" rel="stylesheet" type="text/css">

    <style>
        .body-2 {
            background-color: white;
        }

        .file-upload-esconder{
            display: none;
        }

    </style>

    <script type="text/javascript">
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
        //show preview 2

        //show preview 3
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
                        <div class="ft-fundo">
                            <img src="https://d3e54v103j8qbb.cloudfront.net/plugins/Basic/assets/placeholder.60f9b1840c.svg" loading="lazy" alt="" class="image-16"></div>

                        <!--Colocar imagem no banco-->
                        <div class="div-block-4">
                            <img id="imgpreview" src="https://d3e54v103j8qbb.cloudfront.net/plugins/Basic/assets/placeholder.60f9b1840c.svg" alt="" class="image-8">
                            <div class="div-block-5">
                                <asp:FileUpload ID="FUimg" runat="server" onchange="showpreview(this);" CssClass="file-upload-esconder"/>
                                <asp:Image ID="btnCamImg" runat="server" ImageUrl="../images/camera-01-svgrepo-com.svg" CssClass="image-10" Width="59" />
                            </div>
                        </div>
                        <div class="div-block-7">
                            <div class="columns-5 w-row">
                                <div class="column-8 w-col w-col-6">
                                    <h4 class="heading-2">Perfil</h4>
                                    <p class="paragraph">Atualize os dados do seu perfil.</p>
                                </div>
                                <div class="column-3 w-clearfix w-col w-col-6">
                                    <div class="div-block-12">
                                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btnclassico btncancel w-button" />
                                    </div>
                                    <div class="divblock">
                                        <asp:Button ID="btnSalvar" runat="server" Text="Salvar" CssClass="btnclassico btnsalvar submit-button w-button" />
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
                                        <asp:TextBox ID="txtNomeUsu" CssClass="text-field w-input" placeholder="@usuário" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="linha mobile w-row">
                                <div class="column-9 w-col w-col-4">
                                    <div class="text-block">Sua foto</div>
                                    <p class="paragraph-2">Essa foto aparecerá no seu perfil.</p>
                                </div>
                                <!--img 2 no banco-->
                                <div class="column-12 w-col w-col-8">
                                    <div class="div-block-13">
                                         <asp:FileUpload ID="FUimgmini" runat="server" onchange="showpreviewmini(this);" CssClass="file-upload-esconder"/>
                                         <img id="mini-img-perfil-preview" src="https://d3e54v103j8qbb.cloudfront.net/plugins/Basic/assets/placeholder.60f9b1840c.svg" alt="" class="imgperfil" width="59">
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
                                <div class="column-12 w-col w-col-8">
                                    <div class="div-block-13">
                                        <img id="mini-img-fundo-preview" src="https://d3e54v103j8qbb.cloudfront.net/plugins/Basic/assets/placeholder.60f9b1840c.svg" loading="lazy" width="59" alt="" class="imgfundo">
                                    </div>
                                    <div class="div-block-14 w-clearfix">
                                        <div class="div-block-12">
                                            <asp:HyperLink ID="btnAtualizar2" runat="server" CssClass="btnupdate w-button">Atualizar</asp:HyperLink>
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
                                        <asp:TextBox ID="txtArea" maxlength="300" placeholder="Adicione um brilho ao seu perfil" CssClass="textarea-2 w-input" runat="server"></asp:TextBox>
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
                                        <div class="selo-bloco">
                                            <img src="../images/BackSpace.svg" loading="lazy" width="107" alt="" class="image-24"></div>
                                        <div class="selo-bloco">
                                            <img src="../images/Verificado2.svg" loading="lazy" width="107" alt="" class="image-24"></div>
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
            <asp:Button ID="btnSalvar2" runat="server" Text="Salvar" CssClass="btnclassico btnsalvar submit-button w-button" />
        </div>
    </div>
    <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=63b36b18e56c1d6047ac08b2" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="../js/webflow.js" type="text/javascript"></script>
</asp:Content>

