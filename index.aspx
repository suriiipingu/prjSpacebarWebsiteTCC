<%@ Page Title="SpaceBar - O lugar para explorar o universo!" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <!-- alerta de erro -->
    <script type="text/javascript">
        function hideDangerAlert() {
            document.getElementById('dangerAlert').style.display = 'none';
        }
    </script>

    <script type="text/javascript">
        setTimeout(hideDangerAlert, 4000);
    </script>
    <!-- alerta de erro -->

    <!-- alerta de sucesso -->
    <script type="text/javascript">
        function hideSuccessAlert() {
            document.getElementById('successAlert').style.display = 'none';
        }
    </script>

    <script type="text/javascript">
        setTimeout(hideSuccessAlert, 4000);
    </script>
    <!-- alerta de sucesso -->

    <!-- esconder div imagem se não tiver imagem -->
    <script type="text/javascript">
        function esconderDivImagem() {
            document.getElementById('divImgPotsagem').style.display = 'none';
        }
    </script>

    <!-- alerta de erro quando invalidado -->
    <script type="text/javascript">
        function hideDangerAlertInvalidar() {
            document.getElementById('dangerAlertInvalidar').style.display = 'none';
        }
    </script>

    <script type="text/javascript">
        setTimeout(hideDangerAlertInvalidar, 4000);
    </script>
    <!-- alerta de erroquando invalidado -->

    <!-- alerta de sucesso quando invalidado -->
    <script type="text/javascript">
        function hideSuccessAlertInvalidar() {
            document.getElementById('successAlertInvalidar').style.display = 'none';
        }
    </script>

    <script type="text/javascript">
        setTimeout(hideSuccessAlertInvalidar, 4000);
    </script>
    <!-- alerta de sucesso quando invalidado -->

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="A" runat="Server">

    <!-- Crie, ative ou desative uma div para criar um aviso (experimental)-->

    <%--<div class="container-10 w-container">
    <div class="avisos wf-section">
        <div class="postagem">
                <div class="titulo-post">
                    <h1 class="heading-3-text-aligned">SpaceBar Alpha Phase!!!</h1>
                </div>
            </div>
        </div>
    </div>--%>
    <!-- Crie, ative ou desative uma div para criar um aviso (experimental)-->

    <div class="conteudo wf-section">
        <div class="container-10 w-container">
            <asp:DataList Style="margin-left: auto; margin-right: auto;" ID="myDataList" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="myDataList_ItemDataBound" OnItemCommand="DataList_ItemCommand">
                <ItemTemplate>

                    <!-- div de confirmação para validar a postagem -->
                    <div class="position-absolute bottom-0 start-50 translate-middle-x">
                        <div id="successAlert" class="alert alert-success" role="alert" style="display: none;">
                            Postagem validada com sucesso!
                        </div>
                    </div>

                    <div class="position-absolute bottom-0 start-50 translate-middle-x">
                        <div id="dangerAlert" class="alert alert-danger" role="alert" style="display: none;">
                            Ocorreu um erro ao validar a postagem, se o erro persistir, contate o suporte.
                        </div>
                    </div>

                    <!-- div de confirmação para invalidar a postagem -->
                    <div class="position-absolute bottom-0 start-50 translate-middle-x">
                        <div id="successAlertInvalidar" class="alert alert-success" role="alert" style="display: none;">
                            Postagem invalidada com sucesso!
                        </div>
                    </div>

                    <div class="position-absolute bottom-0 start-50 translate-middle-x">
                        <div id="dangerAlertInvalidar" class="alert alert-danger" role="alert" style="display: none;">
                            Ocorreu um erro ao invalidar a postagem, se o erro persistir, contate o suporte.
                        </div>
                    </div>


                    <!-- começo do corpo da postagem -->
                    <div class="postagem">

                        <!--Badge Verificado-->
                        <div runat="server" id="divVerifiedBadge" class="div-icon-verificado">
                            <img src="images/patch-check-fill.svg" loading="lazy" width="19" alt="">
                        </div>

                        <!--Título-->
                        <div class="titulo-post">
                            <h1 class="heading-3">
                                <asp:Label ID="titulo_postLabel" runat="server" /></h1>

                            <!--ver mais detalhes da publicação-->
                            <div class="div-block-36">
                                <asp:LinkButton OnClick="btnVerMais_Click" CssClass="div-btnvermais w-button" ID="btnVerMais" runat="server">Ver Mais +</asp:LinkButton>
                            </div>

                            <!--Data Criação da publicação-->
                        </div>
                        <div class="data-post w-clearfix">
                            <div class="text-block-12">
                                <asp:Label ID="data_postLabel" runat="server" />
                            </div>
                        </div>

                        <!--Imagem capa da postagem-->
                        <asp:Panel id="divImgPost" runat="server" class="img-post">
                            <asp:Image ID="ImgPost" Height="100%" runat="server" />
                        </asp:Panel>

                        <!--Tags da postagem-->
                        <div runat="server" id="tags_post" class="tags-post">
                            <asp:Label CssClass="lblDescricao" ID="lblDescricao" runat="server" Visible="False"></asp:Label>
                        </div>



                        <div class="div-nome-curtidas">

                            <!--Área da foto, nome e login do usuário que criou a postagem-->
                            <div class="div-nome w-clearfix">
                                <asp:Image loading="lazy" Width="46" Height="46" CssClass="image-22" ID="ImgPerfilUser" runat="server" />
                                <div class="div-block-32">
                                    <div class="text-block-16">
                                        <asp:LinkButton CommandName="YourCommandName" CssClass="HyperLinkNomeUsuario" ID="HyperLinkNomeUsuario" runat="server" Text='<%#LinkNomeUsuario%>'></asp:LinkButton>
                                    </div>
                                    <div class="text-block-17">
                                        <asp:LinkButton CommandName="YourCommandName" CssClass="HyperLinkLoginUsuario" ID="HyperLinkLoginUsuario" runat="server" Text='<%#LinkLoginUsuario%>'></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            <div id="DivValidar" class="d-flex justify-content-end me-3" style="display: none">
                                <asp:Button Visible="false" class="btn btn-outline-success" ID="btnVerificarPostagem" runat="server" Text="Verificar" OnClick="btnVerificarPostagem_Click" CommandName="VerificarPostagem" />
                                <asp:Button Visible="false" class="btn btn-outline-danger" ID="btnRetirarVerificadoPostagem" runat="server" Text="Invalidar" OnClick="btnRetirarVerificadoPostagem_Click" CommandName="InvalidarPostagem" />
                            </div>

                            <!--Botão para curtir a postagem-->
                            <div class="div-curtidas">
                                <div class="div-curt">
                                    <div class="icon-like">
                                        <asp:ImageButton CssClass="btn-icon-like" OnClick="btnLike_OnClick" ID="btnLike" ImageUrl="images/heart.svg" Width="20" alt="" runat="server" />
                                    </div>
                                    <div class="div-lbl-likes">
                                        <asp:Label CssClass="lbl-likes" ID="curtidas_postLabel" runat="server" Text='<%#quantidadeCurtidas%>' />
                                    </div>
                                </div>
                                <!--Botão para ir para os comentários de uma determinada postagem-->
                                <div class="div-coment">
                                    <div class="icon">
                                        <asp:ImageButton OnClick="btnComentarios_Click" ID="btnComentarios" CssClass="link-block-4 w-inline-block" runat="server" loading="lazy" Width="24" alt="" ImageUrl="~/images/comment-svgrepo-com-.svg" />
                                    </div>
                                    <div class="text-block-30">
                                        <asp:Label ID="lblQuantidadeComentarios" runat="server" Text=""></asp:Label>
                                    </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:SpaceBarConnectionString %>"
                SelectCommand="EXECUTE GetPostAndAuthor"></asp:SqlDataSource>

            <!-- fim do corpo das postagens -->
        </div>
    </div>

</asp:Content>
