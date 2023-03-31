<%@ Page Title="Faça Login na SpaceBar" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="fazer-login.aspx.cs" Inherits="fazer_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="A" Runat="Server">

<div class="login wf-section">
        <div class="ctn-alinharlogin w-container">
            <div class="div-imagem"></div>
            <div class="div-login">
                <div class="div-log">
                    <div class="div-icon-spacebar">
                        <img src="images/logo_Icon.png" loading="lazy" width="76" sizes="76px" srcset="images/logo_Icon-p-500.png 500w, images/logo_Icon-p-800.png 800w, images/logo_Icon-p-1080.png 1080w" alt="" class="image-27">
                    </div>
                    <div class="div-block-41">
                        <h4 class="heading-5">Pronto para explorar?</h4>
                        <div class="text-block-27">Login para continuar</div>
                    </div>
                    <div class="div-from-login">
                        <div class="w-form">
                            <asp:TextBox ID="txtEmail" CssClass="text-field login-txt w-input" placeholder="Insira seu E-mail" runat="server"></asp:TextBox>
                            <asp:TextBox ID="txtSenha" CssClass="text-field login-txt w-input" placeholder="Insira sua senha" runat="server"></asp:TextBox>
                            <div class="div-block-40 w-clearfix">
                                <label class="field-label-3">Esqueceu sua senha?</label>
                                <!-- label para exibir se o as credencias inseridas estão incorretas-->
                                <asp:Label ID="lblErro" runat="server"></asp:Label>
                            </div>

                            <asp:Button ID="btnLogar" runat="server" CssClass="btn-login w-button insc" Text="Entrar" OnClick="btnLogar_Click"/>

                            <div class="separador">
                                <div class="text-block-25">————— Ou —————</div>
                            </div>

                            <div class="text-block-26">
                                Novo no Spacebar? <a href="se-inscrever.aspx" class="link-2">Crie sua conta</a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <section class="footer-subscribe wf-section">
        <div class="container-11">
            <div class="footer-wrapper-three">
                <div class="footer-block-three">
                    <a href="sobre-spacebar/sobre-nos.aspx" class="footer-link-three">Sobre nós</a>
                </div>
                <div class="footer-social-block-three">
                    <a href="#" class="footer-social-link-three w-inline-block">
                        <img src="https://uploads-ssl.webflow.com/62434fa732124a0fb112aab4/62434fa732124ab37a12aaf0_twitter%20big.svg" loading="lazy" alt=""></a>
                    <a href="#" class="footer-social-link-three w-inline-block">
                        <img src="https://uploads-ssl.webflow.com/62434fa732124a0fb112aab4/62434fa732124a61f512aaed_instagram%20big.svg" loading="lazy" alt=""></a>
                </div>
            </div>
            <div class="footer-divider-two"></div>
            <div class="footer-bottom">
                <div class="footer-copyright">© 2022 Spacebar. Todos os direitos reservados.</div>
                <div class="footer-legal-block">
                    <a href="sobre-spacebar/termos-de-uso.aspx" class="footer-legal-link">Termos de Uso</a>
                    <a href="sobre-spacebar/politica-de-privacidade.aspx" class="footer-legal-link">Política de Privacidade</a>
                </div>
            </div>
        </div>
    </section>
Recolher
message.txt
4 KB

</asp:Content>

