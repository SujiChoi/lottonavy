<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bit.lottoNavy.controller.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>LottoNAVY</title>

  <!-- Custom fonts for this template-->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin-2.css" rel="stylesheet">

<!-- 추가  -->
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Third party plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />

<!-- 추가  끝-->

          <script language="javascript">
              function loaded()//작동 시 아래 기능적용
              {
            	  	document.getElementById('loading').style.display = 'none';//ID로딩 (GIF이미지 및 문구) 없어져라!
            	  	document.getElementById('wrap').style.display = 'block';//ID wrap 생겨라!
               }
           </script>
			<style type="text/css">
				.spinner {
				  margin: 100px auto;
				  width: 50px;
				  height: 40px;
				  text-align: center;
				  font-size: 10px;
				}
				
				.spinner > div {
				  background-color: #333;
				  height: 100%;
				  width: 6px;
				  display: inline-block;
				  
				  -webkit-animation: sk-stretchdelay 1.2s infinite ease-in-out;
				  animation: sk-stretchdelay 1.2s infinite ease-in-out;
				}
				
				.spinner .rect1 {
				  background-color: #25edc1;
				}
				
				
				.spinner .rect2 {
				  -webkit-animation-delay: -1.1s;
				  animation-delay: -1.1s;
				  background-color: #b0b5b8;
				}
				
				.spinner .rect3 {
				  -webkit-animation-delay: -1.0s;
				  animation-delay: -1.0s;
				  background-color: #ff994c;
				}
				
				.spinner .rect4 {
				  -webkit-animation-delay: -0.9s;
				  animation-delay: -0.9s;
				  background-color: #fb4949;
				}
				
				.spinner .rect5 {
				  -webkit-animation-delay: -0.8s;
				  animation-delay: -0.8s;
				  background-color: #e41937;
				}
				
				@-webkit-keyframes sk-stretchdelay {
				  0%, 40%, 100% { -webkit-transform: scaleY(0.4) }  
				  20% { -webkit-transform: scaleY(1.0) }
				}
				
				@keyframes sk-stretchdelay {
				  0%, 40%, 100% { 
				    transform: scaleY(0.4);
				    -webkit-transform: scaleY(0.4);
				  }  20% { 
				    transform: scaleY(1.0);
				    -webkit-transform: scaleY(1.0);
				  }
				}
			
			</style>
</head>

<body id="page-top h-100" class="h-100" onload="loaded();"><!--모두 로딩되면 위 loaded 함수가 작동됩니다.-->

                       <!--로딩이미지와 글귀 시작 -->
                      <div id="loading" runat="server">
							<div class="spinner">
							  <div class="rect1"></div>
							  <div class="rect2"></div>
							  <div class="rect3"></div>
							  <div class="rect4"></div>
							  <div class="rect5"></div>
							</div>                    
                      </div>
                      <!--로딩이미지와 글귀 끝!-->
                      
                      
                      <!--기존 페이지 내용 시작!-->
                      <div id="wrap" runat="server" style="DISPLAY:none">                      

    <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="index">LottoNAVY</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="index2">데이터 분석</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="randomNumber">번호 추천</a></li>
 
                    </ul>
                </div>
            </div>
        </nav>
    <!-- Masthead-->
        <header class="masthead">


<% 

ArrayList<Double> listlotto = a.getlotto(); 
		  
%>


<div class="align-items-center justify-content-center text-center" style="margin-top: 10%;">

  <!-- Page Wrapper -->
  <div id="wrapper">


    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <div style="display: flex;">

            <!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">최근 1년간 로또 당첨번호 횟수</h6>
                </div>
                
                
                <!-- Card Body  class chartjs-render-monitor-->
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="myAreaChart"></canvas>
                  </div>
                </div>
              </div>
            </div>

            <!-- Pie Chart -->
            <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">최근 1년간 로또 당첨번호 구간별 출현 비중</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-pie pt-4 pb-2">
                    <canvas id="myPieChart"></canvas>
                  </div>
                  <div class="mt-4 text-center small">                  
                    <span class="mr-2">
                      <i class="fas fa-circle" style="color:#f2a241;"></i> 1~10
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle" style="color:#ed9595;"></i> 11~20
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle" style="color:#f5e269;"></i> 21~30
                    </span>
                     <span class="mr-2">
                      <i class="fas fa-circle" style="color:#d2e663;"></i> 31~40
                    </span>
                     <span class="mr-2">
                      <i class="fas fa-circle" style="color:#52c4c4;"></i> 41~45
                    </span>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">Ã</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>
  
  </div>

        </header>
                        </div>
                       <!--기존 페이지 내용 끝!-->

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="resources/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="resources/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="resources/js/demo/chart-area-demo.js"></script>
  <script src="resources/js/demo/chart-pie-demo.js"></script>
  
  
 <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>


		<script>
		//Area Chart Example
		var ctx = document.getElementById("myAreaChart");
		var myLineChart = new Chart(ctx, {
		  type: 'line',
		  data: {
		    labels: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12","13","14","15","16","17","18",
		    	"19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30","31","32","33","34","35","36",
		    	 "37", "38","39","40","41","42","43","44","45"],
		    datasets: [{
		      label: "Earnings",
		      lineTension: 0.3,
		      backgroundColor: "rgba(253, 217, 152, 0.2)",
		      borderColor: "rgba(253, 217, 152, 1)",
		      pointRadius: 2.5,
		      pointBackgroundColor: "rgba(253, 217, 152, 1)",
		      pointBorderColor: "rgba(253, 217, 152, 1)",
		      pointHoverRadius: 2.5,
		      pointHoverBackgroundColor: "rgba(253, 217, 152, 1)",
		      pointHoverBorderColor: "rgba(253, 217, 152, 1)", //rgba(78, 115, 223, 1)
		      pointHitRadius: 10,
		      pointBorderWidth: 2,
		      data: [<%=listlotto.get(0)%>, <%=listlotto.get(1)%>, <%=listlotto.get(2)%>, <%=listlotto.get(3)%>, <%=listlotto.get(4)%>, <%=listlotto.get(5)%>,<%=listlotto.get(6)%>,<%=listlotto.get(7)%>,<%=listlotto.get(8)%>,<%=listlotto.get(9)%>, <%=listlotto.get(10)%>,<%=listlotto.get(11)%>,
		    	  <%=listlotto.get(12)%>, <%=listlotto.get(13)%>, <%=listlotto.get(14)%>, <%=listlotto.get(15)%>, <%=listlotto.get(16)%>, <%=listlotto.get(17)%>,<%=listlotto.get(18)%>,<%=listlotto.get(19)%>,<%=listlotto.get(20)%>,<%=listlotto.get(21)%>, <%=listlotto.get(22)%>,<%=listlotto.get(23)%>,
		    	  <%=listlotto.get(24)%>, <%=listlotto.get(25)%>, <%=listlotto.get(26)%>, <%=listlotto.get(27)%>, <%=listlotto.get(28)%>, <%=listlotto.get(29)%>,<%=listlotto.get(30)%>,<%=listlotto.get(31)%>,<%=listlotto.get(32)%>,<%=listlotto.get(33)%>, <%=listlotto.get(34)%>,<%=listlotto.get(35)%>,
		    	  <%=listlotto.get(36)%>, <%=listlotto.get(37)%>, <%=listlotto.get(38)%>, <%=listlotto.get(39)%>, <%=listlotto.get(40)%>,<%=listlotto.get(41)%>,<%=listlotto.get(42)%>,<%=listlotto.get(43)%>,<%=listlotto.get(44)%>],
		    }],
		  },
		  options: {
		    maintainAspectRatio: false,
		    layout: {
		      padding: {
		        left: 10,
		        right: 25,
		        top: 25,
		        bottom: 0
		      }
		    },
		    scales: {
		      xAxes: [{
		        time: {
		          unit: 'date'
		        },
		        gridLines: {
		          //display: false,
		          color: "rgb(234, 236, 244)",
		          zeroLineColor: "rgb(234, 236, 244)",
		          drawBorder: true,
		          borderDash: [2],
		          zeroLineBorderDash:[2]
		        },
		        ticks: {
		          fontSize: 14,
		          maxTicksLimit: 45
		        }
		      }],
		      yAxes: [{
		        ticks: {
		          min: 0,
		          padding: 0,
		          fontSize: 13,
		          //y축 라벨
		          callback: function(value, index, values) {
		            return number_format(value)+"회";
		          }
		        },
		        gridLines: {
		          color: "rgb(234, 236, 244)",
		          zeroLineColor: "rgb(234, 236, 244)",
		          drawBorder: false,
		          borderDash: [2],
		          zeroLineBorderDash:[2]
		        }
		      }],
		    },
		    legend: {
		      display: false
		    },
		    tooltips: {
		      backgroundColor: "rgb(255,255,255)",
		      bodyFontColor: "#858796",
		      titleMarginBottom: 10,
		      titleFontColor: '#6e707e',
		      titleFontSize: 20,//14
		      borderColor: '#dddfeb',
		      borderWidth: 1,
		      xPadding: 15,
		      yPadding: 15,
		      displayColors: false,
		      intersect: false,
		      mode: 'index',
		      caretPadding: 10,
		      callbacks: {
		        label: function(tooltipItem, chart) {
		          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
		          return number_format(tooltipItem.yLabel)+"회";
		        }
		      }
		    }
		  }
		});
		
		
		var ctx = document.getElementById("myPieChart");
		var myPieChart = new Chart(ctx, {
		  type: 'pie',
		  data: {
		    labels: ["1 ~ 10", "11 ~ 20", "21 ~ 30","31 ~ 40","40 ~ 45"],
		    datasets: [{
		      data: [<%=listlotto.get(45)%>, <%=listlotto.get(46)%>, <%=listlotto.get(47)%>,<%=listlotto.get(48)%>,<%=listlotto.get(49)%>],
		      backgroundColor: ['#f5b971', '#f1c5c5', '#faf0af','#e5edb7', '#8bcdcd'],
		      hoverBackgroundColor: ['#f2a241', '#ed9595', '#f5e269','#d2e663', '#52c4c4'],
		      hoverBorderColor: "rgba(234, 236, 244, 1)",
		    }],
		  },
		  options: {
		    maintainAspectRatio: false,
		    tooltips: {
		      backgroundColor: "rgb(255,255,255)",
		      bodyFontColor: "#858796",
		      borderColor: '#dddfeb',
		      borderWidth: 2,
		      xPadding: 15,
		      yPadding: 15,
		      displayColors: false,
		      caretPadding: 10,
		    },
		    legend: {
		      display: false
		    },
		    cutoutPercentage: 50,
		  },
		  
		});
		
		</script>

</body>

</html>
