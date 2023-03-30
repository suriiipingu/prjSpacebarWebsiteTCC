<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="se-inscrever.aspx.cs" Inherits="se_inscrever" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


    <script type="text/javascript">

        function validarEmail() {
            var email = document.getElementById('<%= txtEmail.ClientID %>').value;
            var pattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            var txtEmail = document.getElementById('<%= txtEmail.ClientID %>');
            var spnEmail = document.getElementById('spnEmail');
            var divErro = document.getElementById('divErro');
            if (!pattern.test(email)) {
                txtEmail.style.borderColor = "red";
                txtEmail.style.marginBottom = "0";
                spnEmail.style.color = "red";
                spnEmail.style.marginLeft = "10px";
                divErro.style.marginBottom = "0";
                document.getElementById('spnEmail').innerHTML = "Insira um e-mail válido.";
                return false;
            }
            txtEmail.style.borderColor = "";
            spnEmail.innerHTML = "";

            return true;
        }

        function validarCelular() {
            var celular = document.getElementById('<%= txtCelular.ClientID %>').value;
            var regex = /^(\+55|55)?(\d{2})?(\d{5})(\d{4})$/;
            var txtCelular = document.getElementById('<%= txtCelular.ClientID %>');
            var spnCelular = document.getElementById('spnCelular');
            var divErro2 = document.getElementById('divErro2');
            if (!regex.test(celular)) {
                txtCelular.style.borderColor = "red";
                txtCelular.style.marginBottom = "0";
                spnCelular.style.color = "red";
                spnCelular.style.marginLeft = "10px";
                divErro2.style.marginBottom = "0";
                document.getElementById('spnCelular').innerHTML = "Insira um número de celular válido.";
                return;
            }
            txtCelular.style.borderColor = "";
            spnCelular.innerHTML = "";

        }

        function confirmaSenha() {
            var senha = document.getElementById('<%= txtSenha.ClientID %>').value;
            var confirmasenha = document.getElementById('<%= txtConfSenha.ClientID %>').value;
            var txtConfSenha = document.getElementById('<%= txtConfSenha.ClientID %>');
            var AvisoSenha = document.getElementById('AvisoSenha');
            var divErro3 = document.getElementById('divErro3');

            if (senha != confirmasenha) {
                txtConfSenha.style.borderColor = "red";
                txtConfSenha.style.marginBottom = "0";
                AvisoSenha.style.color = "red";
                AvisoSenha.style.marginLeft = "10px";
                divErro3.style.marginBottom = "0";
                document.getElementById('AvisoSenha').innerHTML = "As senhas não coincidem. Tente novamente.";
                return;
            }

            txtConfSenha.style.borderColor = "";
            AvisoSenha.innerHTML = "";
            return;

        }

<%--       function validarCampos() {
            var campoNome = document.getElementById('<%= txtNome.ClientID %>');
            var campoLogin = document.getElementById('<%= txtLogin.ClientID %>');
            var campoEmail = document.getElementById('<%= txtEmail.ClientID %>');
            var campoCelular = document.getElementById('<%= txtCelular.ClientID %>');
            var campoSenha = document.getElementById('<%= txtSenha.ClientID %>').value;
            var campoConfSenha = document.getElementById('<%= txtConfSenha.ClientID %>');
            

            if (campoNome === "" || campoLogin === "" || campoEmail === "" || campoCelular === "" || campoSenha === "" || campoConfSenha === "") {
                document.getElementById('<%= btnInscrever.ClientID %>').disabled = true;
                return false;
            }
            else {
                document.getElementById('<%= btnInscrever.ClientID %>').disabled = false;
                return true;
            }
        }--%>

    </script>

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
                                <asp:Label ID="lblNome" runat="server" Text="Nome *" CssClass="field-label-4"></asp:Label>
                                <asp:TextBox ID="txtNome" CssClass="text-field login-txt w-input" placeholder="Como iremos chamá-lo" runat="server"></asp:TextBox>
                            </div>
                            <div class="field-wrap">
                                <label for="Nome-2" class="field-label-4">Nome de usuário *</label>
                                <asp:TextBox ID="txtLogin" CssClass="text-field login-txt w-input" placeholder="@usuário" runat="server"></asp:TextBox>
                            </div>
                            <div id="divErro" class="field-wrap">
                                <label for="email" class="field-label-4">Email *</label>
                                <asp:TextBox ID="txtEmail" CssClass="text-field login-txt w-input" placeholder="usuario@email.com" runat="server" onblur="validarEmail()"></asp:TextBox>
                            </div>
                            <span id="spnEmail"></span>

                            <div id="divErro2" class="field-wrap">
                                <label for="tel" class="field-label-4">Celular</label>
                                <asp:TextBox ID="txtCelular" CssClass="text-field login-txt w-input" placeholder="(xx)x-xxxx-xxxx" runat="server" onblur="validarCelular()"></asp:TextBox>
                            </div>
                            <span id="spnCelular"></span>

                            <div class="field-wrap">
                                <label for="Nome-3" class="field-label-4">País *</label>
                                <asp:DropDownList ID="dropdPais" CssClass="text-field login-txt w-select" runat="server">
                                    <asp:ListItem Text="Afeganistão" Value="AF"></asp:ListItem>
                                    <asp:ListItem Text="África do Sul" Value="AS"></asp:ListItem>
                                    <asp:ListItem Text="Albânia" Value="AL"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="field-wrap">
                                <label for="senha" class="field-label-4">Senha *</label>
                                <asp:TextBox ID="txtSenha" CssClass="text-field login-txt w-input" placeholder="" TextMode="Password" runat="server"></asp:TextBox>
                            </div>
                            <div id="divErro3" class="field-wrap">
                                <label for="confirm-senha" class="field-label-4">Confirme sua senha *</label>
                                <asp:TextBox ID="txtConfSenha" CssClass="text-field login-txt w-input" placeholder="" TextMode="Password" runat="server" onblur="confirmaSenha()"></asp:TextBox>
                            </div>
                            <span id="AvisoSenha"></span>

                            <div class="text-block-28">Leia a nossa <a href="sobre-spacebar/politica-de-privacidade.aspx" class="link-4">Política de privacidade</a> antes de se inscrever.</div>
                            <asp:Button ID="btnInscrever" runat="server" Text="Inscrever-se" CssClass="btn-login w-button insc " OnClick="btnInscrever_Click" />
                            <!--onmouseover="return validarCampos()"-->

                            <asp:Label ID="lblAviso" runat="server" Text=""></asp:Label>
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

