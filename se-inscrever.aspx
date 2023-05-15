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
                          <asp:ListItem Text="Afeganistão" Value="Afeganistão"></asp:ListItem>
                          <asp:ListItem Text="África do Sul" Value="África do Sul"></asp:ListItem>
                          <asp:ListItem Text="Albânia" Value="Albânia"></asp:ListItem>
                          <asp:ListItem Text="Alemanha" Value="Alemanha"></asp:ListItem>
                          <asp:ListItem Text="Andorra" Value="Andorra"></asp:ListItem>
                          <asp:ListItem Text="Angola" Value="Angola"></asp:ListItem>
                          <asp:ListItem Text="Antígua e Barbuda" Value="Antígua e Barbuda"></asp:ListItem>
                          <asp:ListItem Text="Arábia Saudita" Value="Arábia Saudita"></asp:ListItem>
                          <asp:ListItem Text="Argélia" Value="Argélia"></asp:ListItem>
                          <asp:ListItem Text="Argentina" Value="Argentina"></asp:ListItem>
                          <asp:ListItem Text="Armênia" Value="Armênia"></asp:ListItem>
                          <asp:ListItem Text="Austrália" Value="Austrália"></asp:ListItem>
                          <asp:ListItem Text="Áustria" Value="Áustria"></asp:ListItem>
                          <asp:ListItem Text="Azerbaijão" Value="Azerbaijão"></asp:ListItem>
                          <asp:ListItem Text="Bahamas" Value="Bahamas"></asp:ListItem>
                          <asp:ListItem Text="Bahrein" Value="Bahrein"></asp:ListItem>
                          <asp:ListItem Text="Bangladesh" Value="Bangladesh"></asp:ListItem>
                          <asp:ListItem Text="Barbados" Value="Barbados"></asp:ListItem>
                          <asp:ListItem Text="Belarus" Value="Belarus"></asp:ListItem>
                          <asp:ListItem Text="Bélgica" Value="Bélgica"></asp:ListItem>
                          <asp:ListItem Text="Belize" Value="Belize"></asp:ListItem>
                          <asp:ListItem Text="Benin" Value="Benin"></asp:ListItem>
                          <asp:ListItem Text="Bhutan" Value="Bhutan"></asp:ListItem>
                          <asp:ListItem Text="Bolívia" Value="Bolívia"></asp:ListItem>
                          <asp:ListItem Text="Bósnia e Herzegovina" Value="Bósnia e Herzegovina"></asp:ListItem>
                          <asp:ListItem Text="Botswana" Value="Botswana"></asp:ListItem>
                          <asp:ListItem Text="Brasil" Value="Brasil"></asp:ListItem>
                          <asp:ListItem Text="Brunei" Value="Brunei"></asp:ListItem>
                          <asp:ListItem Text="Bulgária" Value="Bulgária"></asp:ListItem>
                          <asp:ListItem Text="Burkina Faso" Value="Burkina Faso"></asp:ListItem>
                          <asp:ListItem Text="Burundi" Value="Burundi"></asp:ListItem>
                          <asp:ListItem Text="Butão" Value="Butão"></asp:ListItem>
                          <asp:ListItem Text="Cabo Verde" Value="Cabo Verde"></asp:ListItem>
                          <asp:ListItem Text="Camarões" Value="Camarões"></asp:ListItem>
                          <asp:ListItem Text="Camboja" Value="Camboja"></asp:ListItem>
                          <asp:ListItem Text="Canadá" Value="Canadá"></asp:ListItem>
                          <asp:ListItem Text="Catar" Value="Catar"></asp:ListItem>
                          <asp:ListItem Text="Cazaquistão" Value="Cazaquistão"></asp:ListItem>
                          <asp:ListItem Text="Chade" Value="Chade"></asp:ListItem>
                          <asp:ListItem Text="Chile" Value="Chile"></asp:ListItem>
                          <asp:ListItem Text="China" Value="China"></asp:ListItem>
                          <asp:ListItem Text="Chipre" Value="Chipre"></asp:ListItem>
                          <asp:ListItem Text="Cingapura" Value="Cingapura"></asp:ListItem>
                          <asp:ListItem Text="Colômbia" Value="Colômbia"></asp:ListItem>
                          <asp:ListItem Text="Comores" Value="Comores"></asp:ListItem>
                          <asp:ListItem Text="Coreia do Norte" Value="Coreia do Norte"></asp:ListItem>
                          <asp:ListItem Text="Coreia do Sul" Value="Coreia do Sul"></asp:ListItem>
                          <asp:ListItem Text="Costa do Marfim" Value="Costa do Marfim"></asp:ListItem>
                          <asp:ListItem Text="Costa Rica" Value="Costa Rica"></asp:ListItem>
                          <asp:ListItem Text="Croácia" Value="Croácia"></asp:ListItem>
                          <asp:ListItem Text="Cuba" Value="Cuba"></asp:ListItem>
                          <asp:ListItem Text="Dinamarca" Value="Dinamarca"></asp:ListItem>
                          <asp:ListItem Text="Djibouti" Value="Djibouti"></asp:ListItem>
                          <asp:ListItem Text="Dominica" Value="Dominica"></asp:ListItem>
                          <asp:ListItem Text="Egito" Value="Egito"></asp:ListItem>
                          <asp:ListItem Text="El Salvador" Value="El Salvador"></asp:ListItem>
                          <asp:ListItem Text="Emirados Árabes Unidos" Value="Emirados Árabes Unidos"></asp:ListItem>
                          <asp:ListItem Text="Equador" Value="Equador"></asp:ListItem>
                          <asp:ListItem Text="Eritreia" Value="Eritreia"></asp:ListItem>
                          <asp:ListItem Text="Eslováquia" Value="Eslováquia"></asp:ListItem>
                          <asp:ListItem Text="Eslovênia" Value="Eslovênia"></asp:ListItem>
                          <asp:ListItem Text="Espanha" Value="Espanha"></asp:ListItem>
                          <asp:ListItem Text="Estados Unidos" Value="Estados Unidos"></asp:ListItem>
                          <asp:ListItem Text="Estônia" Value="Estônia"></asp:ListItem>
                          <asp:ListItem Text="Etiópia" Value="Etiópia"></asp:ListItem>
                          <asp:ListItem Text="Fiji" Value="Fiji"></asp:ListItem>
                          <asp:ListItem Text="Filipinas" Value="Filipinas"></asp:ListItem>
                          <asp:ListItem Text="Finlândia" Value="Finlândia"></asp:ListItem>
                          <asp:ListItem Text="França" Value="França"></asp:ListItem>
                          <asp:ListItem Text="Gabão" Value="Gabão"></asp:ListItem>
                          <asp:ListItem Text="Gâmbia" Value="Gâmbia"></asp:ListItem>
                          <asp:ListItem Text="Gana" Value="Gana"></asp:ListItem>
                          <asp:ListItem Text="Geórgia" Value="Geórgia"></asp:ListItem>
                          <asp:ListItem Text="Granada" Value="Granada"></asp:ListItem>
                          <asp:ListItem Text="Grécia" Value="Grécia"></asp:ListItem>
                          <asp:ListItem Text="Guatemala" Value="Guatemala"></asp:ListItem>
                          <asp:ListItem Text="Guiana" Value="Guiana"></asp:ListItem>
                          <asp:ListItem Text="Guiné" Value="Guiné"></asp:ListItem>
                          <asp:ListItem Text="Guiné Equatorial" Value="Guiné Equatorial"></asp:ListItem>
                          <asp:ListItem Text="Guiné-Bissau" Value="Guiné-Bissau"></asp:ListItem>
                          <asp:ListItem Text="Haiti" Value="Haiti"></asp:ListItem>
                          <asp:ListItem Text="Honduras" Value="Honduras"></asp:ListItem>
                          <asp:ListItem Text="Hungria" Value="Hungria"></asp:ListItem>
                          <asp:ListItem Text="Iêmen" Value="Iêmen"></asp:ListItem>
                          <asp:ListItem Text="Ilhas Marshall" Value="Ilhas Marshall"></asp:ListItem>
                          <asp:ListItem Text="Ilhas Maurício" Value="Ilhas Maurício"></asp:ListItem>
                          <asp:ListItem Text="Ilhas Salomão" Value="Ilhas Salomão"></asp:ListItem>
                          <asp:ListItem Text="Índia" Value="Índia"></asp:ListItem>
                          <asp:ListItem Text="Indonésia" Value="Indonésia"></asp:ListItem>
                          <asp:ListItem Text="Irã" Value="Irã"></asp:ListItem>
                          <asp:ListItem Text="Iraque" Value="Iraque"></asp:ListItem>
                          <asp:ListItem Text="Irlanda" Value="Irlanda"></asp:ListItem>
                          <asp:ListItem Text="Islândia" Value="Islândia"></asp:ListItem>
                          <asp:ListItem Text="Israel" Value="Israel"></asp:ListItem>
                          <asp:ListItem Text="Itália" Value="Itália"></asp:ListItem>
                          <asp:ListItem Text="Jamaica" Value="Jamaica"></asp:ListItem>
                          <asp:ListItem Text="Japão" Value="Japão"></asp:ListItem>
                          <asp:ListItem Text="Jordânia" Value="Jordânia"></asp:ListItem>
                          <asp:ListItem Text="Kiribati" Value="Kiribati"></asp:ListItem>
                          <asp:ListItem Text="Kuwait" Value="Kuwait"></asp:ListItem>
                          <asp:ListItem Text="Laos" Value="Laos"></asp:ListItem>
                          <asp:ListItem Text="Lesoto" Value="Lesoto"></asp:ListItem>
                          <asp:ListItem Text="Letônia" Value="Letônia"></asp:ListItem>
                          <asp:ListItem Text="Líbano" Value="Líbano"></asp:ListItem>
                          <asp:ListItem Text="Libéria" Value="Libéria"></asp:ListItem>
                          <asp:ListItem Text="Líbia" Value="Líbia"></asp:ListItem>
                          <asp:ListItem Text="Liechtenstein" Value="Liechtenstein"></asp:ListItem>
                          <asp:ListItem Text="Lituânia" Value="Lituânia"></asp:ListItem>
                          <asp:ListItem Text="Luxemburgo" Value="Luxemburgo"></asp:ListItem>
                          <asp:ListItem Text="Macedônia do Norte" Value="Macedônia do Norte"></asp:ListItem>
                          <asp:ListItem Text="Madagascar" Value="Madagascar"></asp:ListItem>
                          <asp:ListItem Text="Malásia" Value="Malásia"></asp:ListItem>
                          <asp:ListItem Text="Malawi" Value="Malawi"></asp:ListItem>
                          <asp:ListItem Text="Maldivas" Value="Maldivas"></asp:ListItem>
                          <asp:ListItem Text="Mali" Value="Mali"></asp:ListItem>
                          <asp:ListItem Text="Malta" Value="Malta"></asp:ListItem>
                          <asp:ListItem Text="Marrocos" Value="Marrocos"></asp:ListItem>
                          <asp:ListItem Text="Mauritânia" Value="Mauritânia"></asp:ListItem>
                          <asp:ListItem Text="México" Value="México"></asp:ListItem>
                          <asp:ListItem Text="Micronésia" Value="Micronésia"></asp:ListItem>
                          <asp:ListItem Text="Moçambique" Value="Moçambique"></asp:ListItem>
                          <asp:ListItem Text="Moldávia" Value="Moldávia"></asp:ListItem>
                          <asp:ListItem Text="Mônaco" Value="Mônaco"></asp:ListItem>
                          <asp:ListItem Text="Mongólia" Value="Mongólia"></asp:ListItem>
                          <asp:ListItem Text="Montenegro" Value="Montenegro"></asp:ListItem>
                          <asp:ListItem Text="Myanmar" Value="Myanmar"></asp:ListItem>
                          <asp:ListItem Text="Namíbia" Value="Namíbia"></asp:ListItem>
                          <asp:ListItem Text="Nauru" Value="Nauru"></asp:ListItem>
                          <asp:ListItem Text="Nepal" Value="Nepal"></asp:ListItem>
                          <asp:ListItem Text="Nicarágua" Value="Nicarágua"></asp:ListItem>
                          <asp:ListItem Text="Níger" Value="Níger"></asp:ListItem>
                          <asp:ListItem Text="Nigéria" Value="Nigéria"></asp:ListItem>
                          <asp:ListItem Text="Noruega" Value="Noruega"></asp:ListItem>
                          <asp:ListItem Text="Nova Zelândia" Value="Nova Zelândia"></asp:ListItem>
                          <asp:ListItem Text="Omã" Value="Omã"></asp:ListItem>
                          <asp:ListItem Text="Países Baixos" Value="Países Baixos"></asp:ListItem>
                          <asp:ListItem Text="Palau" Value="Palau"></asp:ListItem>
                          <asp:ListItem Text="Panamá" Value="Panamá"></asp:ListItem>
                          <asp:ListItem Text="Papua Nova Guiné" Value="Papua Nova Guiné"></asp:ListItem>
                          <asp:ListItem Text="Paquistão" Value="Paquistão"></asp:ListItem>
                          <asp:ListItem Text="Paraguai" Value="Paraguai"></asp:ListItem>
                          <asp:ListItem Text="Peru" Value="Peru"></asp:ListItem>
                          <asp:ListItem Text="Polônia" Value="Polônia"></asp:ListItem>
                          <asp:ListItem Text="Portugal" Value="Portugal"></asp:ListItem>
                          <asp:ListItem Text="Quênia" Value="Quênia"></asp:ListItem>
                          <asp:ListItem Text="Quirguistão" Value="Quirguistão"></asp:ListItem>
                          <asp:ListItem Text="Reino Unido" Value="Reino Unido"></asp:ListItem>
                          <asp:ListItem Text="República Centro-Africana" Value="República Centro-Africana"></asp:ListItem>
                          <asp:ListItem Text="República Checa" Value="República Checa"></asp:ListItem>
                          <asp:ListItem Text="República Democrática do Congo" Value="República Democrática do Congo"></asp:ListItem>
                          <asp:ListItem Text="República do Congo" Value="República do Congo"></asp:ListItem>
                          <asp:ListItem Text="República Dominicana" Value="República Dominicana"></asp:ListItem>
                          <asp:ListItem Text="Romênia" Value="Romênia"></asp:ListItem>
                          <asp:ListItem Text="Ruanda" Value="Ruanda"></asp:ListItem>
                          <asp:ListItem Text="Rússia" Value="Rússia"></asp:ListItem>
                          <asp:ListItem Text="Samoa" Value="Samoa"></asp:ListItem>
                          <asp:ListItem Text="San Marino" Value="San Marino"></asp:ListItem>
                          <asp:ListItem Text="Santa Lúcia" Value="Santa Lúcia"></asp:ListItem>
                          <asp:ListItem Text="São Cristóvão e Nevis" Value="São Cristóvão e Nevis"></asp:ListItem>
                          <asp:ListItem Text="São Tomé e Príncipe" Value="São Tomé e Príncipe"></asp:ListItem>
                          <asp:ListItem Text="São Vicente e Granadinas" Value="São Vicente e Granadinas"></asp:ListItem>
                          <asp:ListItem Text="Senegal" Value="Senegal"></asp:ListItem>
                          <asp:ListItem Text="Serra Leoa" Value="Serra Leoa"></asp:ListItem>
                          <asp:ListItem Text="Sérvia" Value="Sérvia"></asp:ListItem>
                          <asp:ListItem Text="Síria" Value="Síria"></asp:ListItem>
                          <asp:ListItem Text="Somália" Value="Somália"></asp:ListItem>
                          <asp:ListItem Text="Sri Lanka" Value="Sri Lanka"></asp:ListItem>
                          <asp:ListItem Text="Suazilândia" Value="Suazilândia"></asp:ListItem>
                          <asp:ListItem Text="Sudão" Value="Sudão"></asp:ListItem>
                          <asp:ListItem Text="Sudão do Sul" Value="Sudão do Sul"></asp:ListItem>
                          <asp:ListItem Text="Suécia" Value="Suécia"></asp:ListItem>
                          <asp:ListItem Text="Suíça" Value="Suíça"></asp:ListItem>
                          <asp:ListItem Text="Suriname" Value="Suriname"></asp:ListItem>
                          <asp:ListItem Text="Tailândia" Value="Tailândia"></asp:ListItem>
                          <asp:ListItem Text="Taiwan" Value="Taiwan"></asp:ListItem>
                          <asp:ListItem Text="Tajiquistão" Value="Tajiquistão"></asp:ListItem>
                          <asp:ListItem Text="Tanzânia" Value="Tanzânia"></asp:ListItem>
                          <asp:ListItem Text="Timor-Leste" Value="Timor-Leste"></asp:ListItem>
                          <asp:ListItem Text="Togo" Value="Togo"></asp:ListItem>
                          <asp:ListItem Text="Tonga" Value="Tonga"></asp:ListItem>
                          <asp:ListItem Text="Trinidad e Tobago" Value="Trinidad e Tobago"></asp:ListItem>
                          <asp:ListItem Text="Tunísia" Value="”Tunísia”"></asp:ListItem>
                          <asp:ListItem Text="Turcomenistão" Value="Turcomenistão"></asp:ListItem>
                          <asp:ListItem Text="Turquia" Value="Turquia"></asp:ListItem>
                          <asp:ListItem Text="Tuvalu" Value="Tuvalu"></asp:ListItem>
                          <asp:ListItem Text="Ucrânia" Value="Ucrânia"></asp:ListItem>
                          <asp:ListItem Text="Uganda" Value="Uganda"></asp:ListItem>
                          <asp:ListItem Text="Uruguai" Value="Uruguai"></asp:ListItem>
                          <asp:ListItem Text="Uzbequistão" Value="Uzbequistão"></asp:ListItem>
                          <asp:ListItem Text="Vanuatu" Value="Vanuatu"></asp:ListItem>
                          <asp:ListItem Text="Vaticano" Value="Vaticano"></asp:ListItem>
                          <asp:ListItem Text="Venezuela" Value="Venezuela"></asp:ListItem>
                          <asp:ListItem Text="Vietnã" Value="Vietnã"></asp:ListItem>
                          <asp:ListItem Text="Yemen" Value="Yemen"></asp:ListItem>
                          <asp:ListItem Text="Zâmbia" Value="Zâmbia"></asp:ListItem>
                          <asp:ListItem Text="Zimbábue" Value="Zimbábue"></asp:ListItem>

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

