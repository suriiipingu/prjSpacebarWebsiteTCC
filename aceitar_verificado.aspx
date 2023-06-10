<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="aceitar_verificado.aspx.cs" Inherits="aceitar_verificado" %>

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

    <style>
        .image-35{
            border-radius:100%;
            margin-right:10px;
        }
        .text-block-41{
            color #000;
            margin-left: 10px;
        }
        .text-block-35{
            color: #000;
        }
        .div-block-53{
            border-bottom: 1px solid #e4e4e4;
            border-radius:0;
            padding:10px;
            display:flex;
        }

        .div-block-53:active{
            background-color:#ededed;
            border-radius:15px;
        }

        .div-block-60{
            align-items:center;
            margin-top:20px;
            margin-bottom:20px;
            display:flex;
        }

        .text-block-42{
            color #747474;
        }

        .bloco{
            width:30%;
            text-align:center;
            border: 1px solid #ffae00;
            border-radius:14px;
            padding: 10px 0;
            display: block;
        }
        .bloco.bloconegada{
            width:30%;
            border-color:#e2435b;
        }
        .bloco.semlinha{
            border-style:none;
        }
        .bloco.blocoaceita{
            width:30%;
            border-color: #00ff19;
        }
        
        .div-block-56{
            width:auto;
            max-width:none;
            grid-column-gap:10px;
            grid-row-gap:10px;
            object-fit:fill;
            border-radius:20px;
            flex-flow:row;
            align-items:center;
            padding:10px;
            display:flex;
            overflow:visible;
            box-shadow: 0 2px 7px rgba(0,0,0,.2);
        }

        .button-13{
            color: #c03e39;
            cursor:pointer;
            background-color:rgba(0,0,0,0);
            border: 1px #c03e39;
            border-radius:10px;
            margin-left:20px;
        }

        .text-block-40{
            color #000;
        }

        .button-12{
            color: #5fc658;
            cursor:pointer;
            background-color: rgba(0,0,0,0);
            border: 1px #5fc658;
            border-radius:10px;
        }

        .text-block-38{
            color: #363636;
            margin-top:0;
            margin-bottom:20px;
            padding-left:10px;
            font-size: 16px;

        }

        .div-block-58{
            margin-left:20px;
            margin-right:20px;
        }

        .div-block-54{
            text-align:justify;
            align-self:center;
        }

        .div-block-62{
            display:flex;
        }

        .solicitacao{
            padding-left:0;
        }

        .div-block-61{
            order:0;
            align-self: center;
        }

        .button-11{
            width:100%;
            color: #b31bff;
            text-align:center;
            cursor:pointer;
            background-color: rgba(0,0,0,0);
            border: 1px solid #b31bff;
            border-radius:13px;
            margin-left:0;
        }

        .button-11:hover{
            color: #fff;
            background-color: #b853ea;
            border-style:none;
        }

        .columns-7{
            margin-top: 40px;
        }

        .div-block-59{
            width:auto;
            float:none;
            justify-content:flex-start;
            align-items:flex-start;
            display:flex;
            overflow:visible;
        }

        .text-block-39{
            color: #000;
        }

        .text-block-39.pendentetxt{
            color: #ffae00;
        }
        .text-block-39.aceitatxt{
            color: #60ca64;
        }
        .text-block-39.negadatxt{
            color: #e2435b;
        }

        .div-block-57{
            border-radius:20px;
            justify-content:space-around;
            align-items:center;
            margin-top:20px;
            padding:20px;
            display:block;
            box-shadow: 0 2px 7px rgba(0,0,0, .2);
        }

        .text-block-37{
            color: #636363;
            font-size: 12px;
        }

        .div-block-55{
            align-self:center;
        }

        .div-block-64{
            align-items:center;
            display:flex;
        }

        .div-block-65{
            display:flex;
        }

        @media screen and (max-width: 991px){
            .div-block-53{
                flex-direction:row;
                display:flex;
            }
            
            .text-field{
                width:100%;
            }
            .div-block-54, .text-block-37{
                width:auto;
            }

            .div-block-55{
                flex:1;
            }
                         .bloco.semlinha{
                 display:none;
             }
        }

        @media screen and (max-width: 767px){
            .solicitacao{
                margin-bottom:20px;
                display:block;
            }



        }

         @media screen and (max-width: 479px){
             .bloco.semlinha{
                 display:none;
             }

         }


    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="A" Runat="Server">
<body>

    <div class="container">

        <div class="row">
            <div class="col-xs-6">


    <div class="section-2 wf-section">
    <div class="div-block-3">
      <h4 class="heading">Aceitar ou recusar pedidos de verificado</h4>
    </div>
  </div>
  <div class="conteudo wf-section">
<div>
<div class="w-row">
         <!-- ======== sidebar-nav start =========== -->
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
              <a href="perfil-config.aspx" class="nav-link-2">Aceitar Verificado</a>
            </li>
          </ol>
        </div>
    <!-- ======== sidebar-nav end =========== -->
    <div class="ctn-perfil w-col w-col-9">
         <div class="columns-7 w-row">
        <div class="solicitacao w-col w-col-5">
            <div class="div-block-65">
                <div class="text-block-38">Solicitações</div>
                <div class="text-block-38">(02)</div><!---label asp.net -->
            </div>
            <div class="div-block-53">
                <img class="image-35" /> <!---Img asp.net -->
                <div class="div-block-55">
                    <div class="text-block-35">Elisa </div> <!---label asp.net -->
                    <div class="text-block-37">@Elisa </div> <!---label asp.net -->
                </div>
            </div>
        </div>
        <div class="mostrar w-col w-col-7">
            <div class="div-block-58">
                <div class="div-block-56">
                    <div class="bloco blocoaceita">
                        <div class="text-block-39 aceitatxt">Aceita</div>
                        <div class="text-block-39 aceitatxt">06</div> <!---label asp.net -->
                    </div>
                    <div class="bloco bloconegada">
                        <div class="text-block-39 negadatxt">Negada</div>
                        <div class="text-block-39 negadatxt">06</div> <!---label asp.net -->
                    </div>
                    <div class="bloco">
                        <div class="text-block-39 pendentetxt">Pendente</div>
                        <div class="text-block-39 pendentetxt">06</div> <!---label asp.net -->
                    </div>
                    <div class="bloco semlinha">
                        <div class="text-block-39">Verificados</div>
                        <div class="text-block-40">06</div> <!---label asp.net -->
                    </div>
                </div>
                <div class="div-block-57">
                    <div>
                        <div class="div-block-62">
                            <img class="image-35" /> <!---imagem asp.net -->
                            <div class="div-block-63">
                                <div>
                                    <div class="text-block-35">Elisa Santos</div> <!---label asp.net -->
                                    <div class="text-block-42">@Elisa</div> <!---label asp.net -->
                                </div>
                            </div>
                        </div>
                        <div class="div-block-61">
                            <div class="div-block-60">
                                <a href="" class="button-11 w-button">Ver arquivo recebido</a> <!---botão asp.net -->
                                <div class="text-block-41">(1/1)</div> <!---label asp.net -->
                            </div>
                            <div>
                                <div class="w-form">
                                    <div class="field-wrap">
                                        <label for="Mensagem" class="field-label-4">Mensagem*</label>
                                        <input type="text" class="text-field login-txt w-input" maxlength="400" placeholder="Deixe uma mensagem" id="Mensagem" required="required" /> <!---text box igual ao do login asp.net -->
                                    </div>
                                </div>
                                <div class="div-block-59">
                                    <a href="" class="button-12 w-button">Aceitar</a> <!---botão asp.net -->
                                    <a href="" class="button-13 w-button">Recusar</a> <!---botão asp.net -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
   
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

    <script>
        // ======== jvectormap activation
        var markers = [
            { name: "Egypt", coords: [26.8206, 30.8025] },
            { name: "Russia", coords: [61.524, 105.3188] },
            { name: "Canada", coords: [56.1304, -106.3468] },
            { name: "Greenland", coords: [71.7069, -42.6043] },
            { name: "Brazil", coords: [-14.235, -51.9253] },
        ];

        var jvm = new jsVectorMap({
            map: "world_merc",
            selector: "#map",
            zoomButtons: true,

            regionStyle: {
                initial: {
                    fill: "#d1d5db",
                },
            },

            labels: {
                markers: {
                    render: (marker) => marker.name,
                },
            },

            markersSelectable: true,
            selectedMarkers: markers.map((marker, index) => {
                var name = marker.name;

                if (name === "Russia" || name === "Brazil") {
                    return index;
                }
            }),
            markers: markers,
            markerStyle: {
                initial: { fill: "#4A6CF7" },
                selected: { fill: "#ff5050" },
            },
            markerLabelStyle: {
                initial: {
                    fontWeight: 400,
                    fontSize: 14,
                },
            },
        });
        // ====== calendar activation
        document.addEventListener("DOMContentLoaded", function () {
            var calendarMiniEl = document.getElementById("calendar-mini");
            var calendarMini = new FullCalendar.Calendar(calendarMiniEl, {
                initialView: "dayGridMonth",
                headerToolbar: {
                    end: "today prev,next",
                },
            });
            calendarMini.render();
        });

        // =========== chart one start
        const ctx1 = document.getElementById("Chart1").getContext("2d");
        const chart1 = new Chart(ctx1, {
            // The type of chart we want to create
            type: "line", // also try bar or other graph types

            // The data for our dataset
            data: {
                labels: [
                    "Jan",
                    "Fab",
                    "Mar",
                    "Apr",
                    "May",
                    "Jun",
                    "Jul",
                    "Aug",
                    "Sep",
                    "Oct",
                    "Nov",
                    "Dec",
                ],
                // Information about the dataset
                datasets: [
                    {
                        label: "",
                        backgroundColor: "transparent",
                        borderColor: "#4A6CF7",
                        data: [
                            600, 800, 750, 880, 940, 880, 900, 770, 920, 890, 976, 1100,
                        ],
                        pointBackgroundColor: "transparent",
                        pointHoverBackgroundColor: "#4A6CF7",
                        pointBorderColor: "transparent",
                        pointHoverBorderColor: "#fff",
                        pointHoverBorderWidth: 5,
                        pointBorderWidth: 5,
                        pointRadius: 8,
                        pointHoverRadius: 8,
                    },
                ],
            },

            // Configuration options
            defaultFontFamily: "Inter",
            options: {
                tooltips: {
                    callbacks: {
                        labelColor: function (tooltipItem, chart) {
                            return {
                                backgroundColor: "#ffffff",
                            };
                        },
                    },
                    intersect: false,
                    backgroundColor: "#f9f9f9",
                    titleFontFamily: "Inter",
                    titleFontColor: "#8F92A1",
                    titleFontColor: "#8F92A1",
                    titleFontSize: 12,
                    bodyFontFamily: "Inter",
                    bodyFontColor: "#171717",
                    bodyFontStyle: "bold",
                    bodyFontSize: 16,
                    multiKeyBackground: "transparent",
                    displayColors: false,
                    xPadding: 30,
                    yPadding: 10,
                    bodyAlign: "center",
                    titleAlign: "center",
                },

                title: {
                    display: false,
                },
                legend: {
                    display: false,
                },

                scales: {
                    yAxes: [
                        {
                            gridLines: {
                                display: false,
                                drawTicks: false,
                                drawBorder: false,
                            },
                            ticks: {
                                padding: 35,
                                max: 1200,
                                min: 500,
                            },
                        },
                    ],
                    xAxes: [
                        {
                            gridLines: {
                                drawBorder: false,
                                color: "rgba(143, 146, 161, .1)",
                                zeroLineColor: "rgba(143, 146, 161, .1)",
                            },
                            ticks: {
                                padding: 20,
                            },
                        },
                    ],
                },
            },
        });

        // =========== chart one end

        // =========== chart two start
        const ctx2 = document.getElementById("Chart2").getContext("2d");
        const chart2 = new Chart(ctx2, {
            // The type of chart we want to create
            type: "bar", // also try bar or other graph types
            // The data for our dataset
            data: {
                labels: [
                    "Jan",
                    "Fab",
                    "Mar",
                    "Apr",
                    "May",
                    "Jun",
                    "Jul",
                    "Aug",
                    "Sep",
                    "Oct",
                    "Nov",
                    "Dec",
                ],
                // Information about the dataset
                datasets: [
                    {
                        label: "",
                        backgroundColor: "#4A6CF7",
                        barThickness: 6,
                        maxBarThickness: 8,
                        data: [
                            600, 700, 1000, 700, 650, 800, 690, 740, 720, 1120, 876, 900,
                        ],
                    },
                ],
            },
            // Configuration options
            options: {
                borderColor: "#F3F6F8",
                borderWidth: 15,
                backgroundColor: "#F3F6F8",
                tooltips: {
                    callbacks: {
                        labelColor: function (tooltipItem, chart) {
                            return {
                                backgroundColor: "rgba(104, 110, 255, .0)",
                            };
                        },
                    },
                    backgroundColor: "#F3F6F8",
                    titleFontColor: "#8F92A1",
                    titleFontSize: 12,
                    bodyFontColor: "#171717",
                    bodyFontStyle: "bold",
                    bodyFontSize: 16,
                    multiKeyBackground: "transparent",
                    displayColors: false,
                    xPadding: 30,
                    yPadding: 10,
                    bodyAlign: "center",
                    titleAlign: "center",
                },

                title: {
                    display: false,
                },
                legend: {
                    display: false,
                },

                scales: {
                    yAxes: [
                        {
                            gridLines: {
                                display: false,
                                drawTicks: false,
                                drawBorder: false,
                            },
                            ticks: {
                                padding: 35,
                                max: 1200,
                                min: 0,
                            },
                        },
                    ],
                    xAxes: [
                        {
                            gridLines: {
                                display: false,
                                drawBorder: false,
                                color: "rgba(143, 146, 161, .1)",
                                zeroLineColor: "rgba(143, 146, 161, .1)",
                            },
                            ticks: {
                                padding: 20,
                            },
                        },
                    ],
                },
            },
        });
        // =========== chart two end

        // =========== chart three start
        const ctx3 = document.getElementById("Chart3").getContext("2d");
        const chart3 = new Chart(ctx3, {
            // The type of chart we want to create
            type: "line", // also try bar or other graph types

            // The data for our dataset
            data: {
                labels: [
                    "Jan",
                    "Fab",
                    "Mar",
                    "Apr",
                    "May",
                    "Jun",
                    "Jul",
                    "Aug",
                    "Sep",
                    "Oct",
                    "Nov",
                    "Dec",
                ],
                // Information about the dataset
                datasets: [
                    {
                        label: "Revenue",
                        backgroundColor: "transparent",
                        borderColor: "#4a6cf7",
                        data: [80, 120, 110, 100, 130, 150, 115, 145, 140, 130, 160, 210],
                        pointBackgroundColor: "transparent",
                        pointHoverBackgroundColor: "#4a6cf7",
                        pointBorderColor: "transparent",
                        pointHoverBorderColor: "#fff",
                        pointHoverBorderWidth: 3,
                        pointBorderWidth: 5,
                        pointRadius: 5,
                        pointHoverRadius: 8,
                    },
                    {
                        label: "Profit",
                        backgroundColor: "transparent",
                        borderColor: "#9b51e0",
                        data: [
                            120, 160, 150, 140, 165, 210, 135, 155, 170, 140, 130, 200,
                        ],
                        pointBackgroundColor: "transparent",
                        pointHoverBackgroundColor: "#9b51e0",
                        pointBorderColor: "transparent",
                        pointHoverBorderColor: "#fff",
                        pointHoverBorderWidth: 3,
                        pointBorderWidth: 5,
                        pointRadius: 5,
                        pointHoverRadius: 8,
                    },
                    {
                        label: "Order",
                        backgroundColor: "transparent",
                        borderColor: "#f2994a",
                        data: [180, 110, 140, 135, 100, 90, 145, 115, 100, 110, 115, 150],
                        pointBackgroundColor: "transparent",
                        pointHoverBackgroundColor: "#f2994a",
                        pointBorderColor: "transparent",
                        pointHoverBorderColor: "#fff",
                        pointHoverBorderWidth: 3,
                        pointBorderWidth: 5,
                        pointRadius: 5,
                        pointHoverRadius: 8,
                    },
                ],
            },

            // Configuration options
            options: {
                tooltips: {
                    intersect: false,
                    backgroundColor: "#fbfbfb",
                    titleFontColor: "#8F92A1",
                    titleFontSize: 16,
                    titleFontFamily: "Inter",
                    titleFontStyle: "400",
                    bodyFontFamily: "Inter",
                    bodyFontColor: "#171717",
                    bodyFontSize: 16,
                    multiKeyBackground: "transparent",
                    displayColors: false,
                    xPadding: 30,
                    yPadding: 15,
                    borderColor: "rgba(143, 146, 161, .1)",
                    borderWidth: 1,
                    title: false,
                },

                title: {
                    display: false,
                },

                layout: {
                    padding: {
                        top: 0,
                    },
                },

                legend: false,

                scales: {
                    yAxes: [
                        {
                            gridLines: {
                                display: false,
                                drawTicks: false,
                                drawBorder: false,
                            },
                            ticks: {
                                padding: 35,
                                max: 300,
                                min: 50,
                            },
                        },
                    ],
                    xAxes: [
                        {
                            gridLines: {
                                drawBorder: false,
                                color: "rgba(143, 146, 161, .1)",
                                zeroLineColor: "rgba(143, 146, 161, .1)",
                            },
                            ticks: {
                                padding: 20,
                            },
                        },
                    ],
                },
            },
        });
        // =========== chart three end

        // ================== chart four start
        const ctx4 = document.getElementById("Chart4").getContext("2d");
        const chart4 = new Chart(ctx4, {
            // The type of chart we want to create
            type: "bar", // also try bar or other graph types
            // The data for our dataset
            data: {
                labels: ["Jan", "Fab", "Mar", "Apr", "May", "Jun"],
                // Information about the dataset
                datasets: [
                    {
                        label: "",
                        backgroundColor: "#4A6CF7",
                        barThickness: "flex",
                        maxBarThickness: 8,
                        data: [600, 700, 1000, 700, 650, 800],
                    },
                    {
                        label: "",
                        backgroundColor: "#d50100",
                        barThickness: "flex",
                        maxBarThickness: 8,
                        data: [690, 740, 720, 1120, 876, 900],
                    },
                ],
            },
            // Configuration options
            options: {
                borderColor: "#F3F6F8",
                borderWidth: 15,
                backgroundColor: "#F3F6F8",
                tooltips: {
                    callbacks: {
                        labelColor: function (tooltipItem, chart) {
                            return {
                                backgroundColor: "rgba(104, 110, 255, .0)",
                            };
                        },
                    },
                    backgroundColor: "#F3F6F8",
                    titleFontColor: "#8F92A1",
                    titleFontSize: 12,
                    bodyFontColor: "#171717",
                    bodyFontStyle: "bold",
                    bodyFontSize: 16,
                    multiKeyBackground: "transparent",
                    displayColors: false,
                    xPadding: 30,
                    yPadding: 10,
                    bodyAlign: "center",
                    titleAlign: "center",
                },

                title: {
                    display: false,
                },
                legend: {
                    display: false,
                },

                scales: {
                    yAxes: [
                        {
                            gridLines: {
                                display: false,
                                drawTicks: false,
                                drawBorder: false,
                            },
                            ticks: {
                                padding: 35,
                                max: 1200,
                                min: 0,
                            },
                        },
                    ],
                    xAxes: [
                        {
                            gridLines: {
                                display: false,
                                drawBorder: false,
                                color: "rgba(143, 146, 161, .1)",
                                zeroLineColor: "rgba(143, 146, 161, .1)",
                            },
                            ticks: {
                                padding: 20,
                            },
                        },
                    ],
                },
            },
        });
      // =========== chart four end
    </script>

</body>
</asp:Content>

