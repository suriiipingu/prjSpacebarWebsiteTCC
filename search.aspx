<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="A" runat="Server">

    <div class="w-container">

        <div class="m-4">
            <p class="fs-1">Resultados da pesquisa</p>
        </div>

        <div></div>

        <asp:DataList OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound" ID="DataList1" runat="server" DataKeyField="cod_usuario" DataSourceID="SqlDataSource1">
            <ItemTemplate>

                <div class="div-nome w-clearfix">
                    <asp:Image loading="lazy" Width="46" Height="46" CssClass="image-22" ID="ImgPerfilUser" runat="server" />
                    <div class="div-block-32">
                        <div class="text-block-16">
                            <asp:LinkButton CssClass="HyperLinkNomeUsuario" ID="nome_usuarioLabel" runat="server" Text='<%# Eval("nome_usuario") %>' />
                        </div>

                        <div class="text-block-17">
                            <asp:LinkButton CssClass="HyperLinkLoginUsuario" ID="login_usuarioLabel" runat="server" Text='<%# Eval("login_usuario") %>' />
                        </div>

                        
                        <div class="div-block-37">
                            <div><asp:Label ID="lblSeguindo" runat="server" Text="Seguindo"></asp:Label></div>
                            <div class="text-block-22">Seguindo</div>
                            <div class="text-block-21"><asp:Label ID="lblSeguidores" runat="server" Text="Seguidores"></asp:Label></div>
                            <div class="text-block-22">Seguidores</div>

                                <div class="ms-3"></div>
                                <asp:Button CommandName="SeguirEDeixar" OnClick="btnSeguir_Click" CssClass="btn btn-primary" ID="btnSeguir" runat="server" Text="Seguir" />
                
                        </div>

                    </div>
                </div>

            </ItemTemplate>

        </asp:DataList>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SpaceBarConnectionString %>" SelectCommand="PesquisarUsuario" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="login_usuario" SessionField="TermoPesquisa" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>

    <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=63b36b18e56c1d6047ac08b2" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="js/webflow.js" type="text/javascript"></script>
</asp:Content>
