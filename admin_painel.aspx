<%@ Page Title="Página de Admin" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="admin_painel.aspx.cs" Inherits="admin_painel" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="shortcut icon"
      href="assets/images/favicon.svg"
      type="image/x-icon"
    />
    <!-- ========== CSS ========= -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/lineicons.css" />
    <link rel="stylesheet" href="assets/css/materialdesignicons.min.css" />
    <link rel="stylesheet" href="assets/css/fullcalendar.css" />
    <link rel="stylesheet" href="assets/css/fullcalendar.css" />
    <link rel="stylesheet" href="assets/css/main.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="A" Runat="Server">
<body>

    <div class="container">

        <div class="row">
            <div class="col-xs-6">

   

    <div class="section-2 wf-section">
    <div class="div-block-3">
      <h4 class="heading">Painel de estatísticas</h4>
    </div>
  </div>
  <div class="conteudo wf-section" style="display:flex">
       <!-- ======== sidebar-nav start =========== -->
    <div>
      <div class="w-row">
        <div class="column-2 w-col w-col-3" style="display:flex">
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
              <li class="margin-bottom-24px fund1">
              <a href="aceitar_verificado.aspx" class="nav-link-2">Aceitar Verificado</a>
            </li>
          </ol>
        </div>

    <!-- ======== sidebar-nav end =========== -->

<div id="coluna-estatisticas" class="col-xs-6">

    <!-- ========== section start ========== -->
      <section class="section">
        <div class="container-fluid" id="section-fluid">
          <!-- ========== title-wrapper start ========== -->
          <div class="title-wrapper pt-30">
            <div class="row align-items-center">
              <div class="col-md-6">
                <div class="title mb-30">
                  <h2>Dashboard da Rede Social</h2>
                </div>
              </div>
              <!-- end col -->
              <div class="col-md-6">
                <div class="breadcrumb-wrapper mb-30">
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a href="#0">Dashboard</a>
                      </li>
                      <li class="breadcrumb-item active" aria-current="page">
                        Rede Social
                      </li>
                    </ol>
                  </nav>
                </div>
              </div>
              <!-- end col -->
            </div>
            <!-- end row -->
          </div>
          <!-- ========== title-wrapper end ========== -->
          <div class="row">
            <div class="col-xl-3 col-lg-4 col-sm-6">
              <div class="icon-card mb-30">
                  <!--icone do cardzinho-->
                <div class="icon purple">
                  <i class="lni lni-postcard"></i>
                </div>
                <div class="content">
                    <!-- === quantidades de postagens (últimas 24h === -->
                  <h6 class="mb-10">Novas Postagens</h6>
                    <!-- quantidade de postagens -->
                  <h3 class="text-bold mb-10"></h3>
                  <p class="text-sm text-success">
                    <i class="lni lni-arrow-up"></i> <asp:Label ID="lblQuantidadePostagens" runat="server" Text="+2"></asp:Label>
                    <span class="text-gray">(24 Horas)</span>
                  </p>
                </div>
              </div>
              <!-- End Icon Cart -->
            </div>
            <!-- End Col -->
            <div class="col-xl-3 col-lg-4 col-sm-6">
              <div class="icon-card mb-30">
                <div class="icon success">
                    <!-- icone de usuários -->
                  <i class="lni lni-users"></i>
                </div>
                <div class="content">
                  <h6 class="mb-10">Novos Usuários</h6>
                    <!-- lblquantidade usuario abaixo -->
                  <h3 class="text-bold mb-10"></h3>
                  <p class="text-sm text-success">
                    <i class="lni lni-arrow-up"></i> <asp:Label ID="lblQuantidadeUsuario" runat="server" Text="Label"></asp:Label>
                    <span class="text-gray">(24 Horas)</span>
                  </p>
                </div>
              </div>
              <!-- End Icon Cart -->
            </div>
            <!-- End Col -->
            <div class="col-xl-3 col-lg-4 col-sm-6">
              <div class="icon-card mb-30">
                <div class="icon primary">
                  <i class="lni lni-comments"></i>
                </div>
                <div class="content">
                  <h6 class="mb-10">Novos Comentários</h6>
                    <!-- abaixo, lbl quantidade de novos comentarios (24 horas) -->
                  <h3 class="text-bold mb-10"></h3>
                  <p class="text-sm text-success">
                    <i class="lni lni-arrow-up"></i> <asp:Label ID="lblQuantidadeComentarios" runat="server" Text="Label"></asp:Label>
                    <span class="text-gray">(24 Horas)</span>
                  </p>
                </div>
              </div>
              <!-- End Icon Cart -->
            </div>
            <!-- End Col -->
            <div class="col-xl-3 col-lg-4 col-sm-6">
              <div class="icon-card mb-30">
                <div class="icon orange">
                  <i class="lni lni-heart"></i>
                </div>
                <div class="content">
                  <h6 class="mb-10">Publicações Curtidas</h6>
                    <!-- numero de publicações curtidas (24h) -->
                  <h3 class="text-bold mb-10"></h3>
                  <p class="text-sm text-success">
                    <i class="lni lni-arrow-up"></i> <asp:Label ID="lblPostsLikes" runat="server" Text="Label"></asp:Label>
                    <span class="text-gray"> (24 Horas)</span>
                  </p>
                </div>
              </div>
              <!-- End Icon Cart -->
            </div>
            <!-- End Col -->
          </div>
          <!-- End Row -->
          <div class="row">
            <div class="col-lg-7">
              <div class="card-style mb-30">
                <div class="title d-flex flex-wrap justify-content-between">
                  <div class="left">

                      <!-- ====== Área para gráfico asp.net (chart control) ====== -->

                    <h6 class="text-medium mb-10">Quantidade usuários por data</h6>
                    <h3 class="text-bold"></h3>
                  </div>
                  <div class="right">

                    <!-- end select -->
                  </div>
                </div>
                <!-- End Title -->
                <div class="chart">

                    <asp:Chart ID="ChartUsuariosCriados" runat="server" BorderlineColor="Transparent" BorderlineDashStyle="Solid" BorderlineWidth="0" EnableTheming="True" Palette="Berry">
                        <Series>
                            <asp:Series Name="UsuariosCriados" ChartType="Spline" XValueType="DateTime" YValueType="Int32" YValuesPerPoint="2"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartAreaUsuariosCriados"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>

                </div>
                <!-- End Chart -->
              </div>
            </div>
            <!-- End Col -->
            <div class="col-lg-5">
              <div class="card-style mb-30">
                <div
                  class="title d-flex flex-wrap align-items-center justify-content-between">
                  <div class="left">
                    <h6 class="text-medium mb-30">Quantidade de usuário por tipo</h6>
                  </div>
                  <div class="right">
                    <!-- end select -->
                  </div>
                </div>
                <!-- End Title -->
                <div class="chart">

                    <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource1" BackColor="Transparent" Palette="Berry">
                        <Series>
                            <asp:Series Name="Series1" ChartType="Pie" XValueMember="Hierarquia" YValueMembers="QuantidadeUsuarios"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SpaceBarConnectionString %>" SelectCommand="ObterQuantidadeUsuariosPorHierarquia" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                </div>
                <!-- End Chart -->
              </div>
            </div>
            <!-- End Col -->
          </div>
          <!-- End Row -->
                  <!-- End Table -->
                </div>
              </div>
            </div>
            <!-- End Col -->
          </div>
          <!-- End Row -->
        </div>
        <!-- end container -->
      </section>
      <!-- ========== section end ========== -->
        
        </div>

    </div>

</div>
    <!-- ========= Linkando todos os arquivos necessário de JavaScript ======== -->
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/Chart.min.js"></script>
    <script src="assets/js/dynamic-pie-chart.js"></script>
    <script src="assets/js/moment.min.js"></script>
    <script src="assets/js/fullcalendar.js"></script>
    <script src="assets/js/jvectormap.min.js"></script>
    <script src="assets/js/world-merc.js"></script>
    <script src="assets/js/polyfill.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</asp:Content>

