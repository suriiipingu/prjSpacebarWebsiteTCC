<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="atualizar-pais.aspx.cs" Inherits="atualizar_pais" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/normalize.css" rel="stylesheet" type="text/css">
  <link href="../css/webflow.css" rel="stylesheet" type="text/css">

  <link href="../css/site-spacebar.webflow.css" rel="stylesheet" type="text/css">

    <style>
        .body-2{
            background-color:white;
        }

        .btn-atualizar{
            width:100%;
            margin-top:20px;
            background-color: #c108ff;
            padding:10px;
            border-radius:10px;
        }

        .btn-atualizar:hover{
            background-color: #d863ff;
        }

        .espaco{
            margin-bottom:10px;
        }

        .text-field.login-txt{
            border-radius:10px;
        }

        .lblErro{
            color:red;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="A" Runat="Server">
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
                <div class="text-block-4">Minha conta</div>
              </div>
              <nav class="dropdown-list w-dropdown-list">
                <a href="perfil-config.aspx" class="w-dropdown-link">Meu perfil</a>
                <a href="minha-conta.aspx" aria-current="page" class="dropdown-link-4 w-dropdown-link w--current">Minha conta</a>
                <a href="criador de conteudo.aspx"" class="w-dropdown-link">Criador de conteúdo</a>
                <a href="verificado.aspx" class="w-dropdown-link">Verificado</a>
              </nav>
            </div>
          </div>
          <ol role="list" class="sidebar-config">
            <li class="margin-bottom-24px fund1">
              <a href="perfil-config.aspx" class="nav-link-2">Meu perfil</a>
            </li>
            <li class="margin-bottom-24px">
              <a href="minha-conta.aspx" aria-current="page" class="nav-link-2 w--current">Minha conta</a>
            </li>
            <li class="margin-bottom-24px">
              <a href="criador de conteudo.aspx" class="nav-link-2">Criador de conteúdo</a>
            </li>
            <li class="margin-bottom-24px">
              <a href="verificado.aspx" class="nav-link-2">Verificado</a>
            </li>
          </ol>
        </div>


          <div class="ctn-perfil w-col w-col-9">
          <div class="cnt-perfil ctn-conta w-container">
            <div class="div-block-7 divblockconta">
              <h4 class="heading-2">País</h4>
              <p class="paragraph">Atualize seu país.</p>
            </div>
            <div class="div-block-8">
              <div class="div-input-texto">
                <div class="div-texto">
                  <div class="text-block txtatualizar">Atual</div>
                  <div class="text-block txtatualizar">Novo</div>
                </div>
                <div class="div-input">
                  <div class="w-form">
                      <div class="espaco">
                          <asp:Label ID="lblPais" runat="server" Text="Label" CssClass="field-label-5"></asp:Label>
                      </div>

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
                      <asp:Label ID="lblErro" runat="server" Text=""></asp:Label>

                       <asp:Button ID="btnAtualizar" runat="server" Text="Atualizar" CssClass="btn-atualizar w-button" OnClick="btnAtualizar_Click" />
                    
                  </div>
                </div>
              </div>
            </div>
               
          </div>
        </div>
      </div>
    </div>
    </div>
</asp:Content>

