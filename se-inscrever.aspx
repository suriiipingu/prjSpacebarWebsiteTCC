<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="se-inscrever.aspx.cs" Inherits="se_inscrever" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="A" runat="Server">
    <div class="login wf-section">
        <div class="ctn-alinharlogin w-container">
            <div class="div-block-42"></div>
            <div class="div-login">
                <div class="div-log">
                    <div class="div-icon-spacebar">
                        <img src="images/logo_Icon.png" loading="lazy" width="76" sizes="76px" srcset="images/logo_Icon-p-500.png 500w, images/logo_Icon-p-800.png 800w, images/logo_Icon-p-1080.png 1080w" alt="" class="image-27">
                    </div>
                    <div class="div-block-41">
                        <h4 class="heading-5">Seja bem vindo ao SpaceBar!</h4>
                        <div class="text-block-27">Inscreva-se para continuar</div>
                    </div>
                    <div class="div-from-login">
                        <div class="w-form">
                            <div class="field-wrap">
                                <label class="field-label-4">Nome *</label>
                                <asp:TextBox ID="txtNome" CssClass="text-field login-txt w-input" placeholder="Como iremos chamá-lo" runat="server"></asp:TextBox>
                            </div>
                            <div class="field-wrap">
                                <label for="Nome-2" class="field-label-4">Nome de usuário *</label>
                                <asp:TextBox ID="txtLogin" CssClass="text-field login-txt w-input" placeholder="@usuário" runat="server"></asp:TextBox>
                            </div>
                            <div class="field-wrap">
                                <label for="email" class="field-label-4">Email *</label>
                                <asp:TextBox ID="txtEmail" CssClass="text-field login-txt w-input" placeholder="usuario@email.com" runat="server"></asp:TextBox>
                            </div>
                            <div class="field-wrap">
                                <label for="tel" class="field-label-4">Telefone</label>
                                <asp:TextBox ID="txtTelefone" CssClass="text-field login-txt w-input" placeholder="xxx-xxx-xxxx" runat="server"></asp:TextBox>
                            </div>
                            <div class="field-wrap">
                                <label for="Nome-3" class="field-label-4">País *</label>
                                <asp:DropDownList ID="dropdPais" CssClass="text-field login-txt w-select"  runat="server">
                                    <asp:ListItem Text="Afeganistão" Value="AF"></asp:ListItem>
                                    <asp:ListItem Text="África do Sul" Value="AS"></asp:ListItem>
                                    <asp:ListItem Text="Albânia" Value="AL"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="field-wrap">
                                <label for="senha" class="field-label-4">Senha *</label>
                                <asp:TextBox ID="txtSenha" CssClass="text-field login-txt w-input" placeholder="" TextMode="Password"  runat="server"></asp:TextBox>
                            </div>
                            <div class="field-wrap">
                                <label for="confirm-senha" class="field-label-4">Confirme sua senha *</label>
                                <asp:TextBox ID="txtConfSenha" CssClass="text-field login-txt w-input" placeholder="" TextMode="Password"  runat="server"></asp:TextBox>
                            </div>
                            <div class="text-block-28">Leia a nossa <a href="sobre-spacebar/politica-de-privacidade.aspx" class="link-4">Política de privacidade</a> antes de se inscrever.</div>
                            <asp:Button ID="btnInscrever" runat="server" Text="Inscrever-se" CssClass="btn-login w-button insc " OnClick="btnInscrever_Click" />
                            <div class="separador">
                                <div class="text-block-25">————— Ou —————</div>
                            </div>

                            <div class="text-block-26">
                                Já tem uma conta? <a href="fazer-login.aspx" class="link-3">Entre</a>
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
</asp:Content>

