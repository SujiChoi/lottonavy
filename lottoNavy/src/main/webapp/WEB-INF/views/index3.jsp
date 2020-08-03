<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link rel="stylesheet" href="resources/css/bootstrap.css" />
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="resources/assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
<!-- Third party plugin CSS-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css" rel="stylesheet" />
<!-- Title -->
<title>LottoNAVY</title>
    <style>
    	* {
		  box-sizing: border-box;
		}
		html,
		body {
		  margin: 0;
		  width: 100%;
		  height: 100%;

		}
		#tomain {
		  color: #fff;
		  font-size: 3rem;
		}
		#contentWrap {
		  width: 100%;
		  height: 100%;
		  background: linear-gradient(to bottom, rgba(92, 77, 66, 0.8) 0%, rgba(92, 77, 66, 0.8) 100%), url("resources/assets/img/bg-masthead.jpg");
		}
		#randomNum {
		  border-radius: 0 0 30% 30%;
		  background-position: center;
		  background-size: cover;
		  width: 100%;
		  height: 100%;
		  padding: 8% 15%;
		  text-align: center;
		}
		#title {
		  font-size: 3rem;
		  text-align: center;
		  color:white;
		  cursor:default;
		  margin-top:80px;
		}
		#numberFlex {
		  display: flex;
		  justify-content: space-evenly;
		  margin-top: 40px;
		}
		.numberCircle {
		  border-radius: 50%;
		  width: 7rem;
		  height: 7rem;
		  color: white;
		  font-size: 3.2rem;
		  padding: 1.2rem 0;
		  text-align: center;
		  cursor:default;
		}
		#num_1 {
		  background-color: #fbc400;
		}
		#num_2 {
		  background-color: #69c8f2;
		}
		#num_3 {
		  background-color: #ff7272;
		}
		#num_4 {
		  background-color: #aaaaaa;
		}
		#num_5 {
		  background-color: #b0d840;
		}
		#botButtons {
		  margin-top: 80px;
		  height:auto;
		  display:flex;
		  justify-content: space-evenly;
		  padding:0 35%;
		  width:100%;
		  text-align:center;
		}
    	.pl{
    		padding-left:20px;
    	}
    	#loading{
    		display:none;
    		margin-top:20px;
    	}
    	.spinner {
		  margin: 40px auto 0;
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
    <title>LottoNAVY</title>
    <script>
    	function showload(){
    		var loaddiv=document.getElementById('loading');
    		loaddiv.style.display="block";
    		location.href='selectNumber';
    	}
    </script>
  </head>
  <body>
    <div id="contentWrap">
      <section id="randomNum">
    <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="#page-top" style="color:rgba(255, 255, 255, 0.7);">LottoNAVY</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="index2" style="color:rgba(255, 255, 255, 0.7);">데이터 분석</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="randomNumber" style="color:rgba(255, 255, 255, 0.7);" >번호 추천</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        
        <div class="pl">
        </div>
        <h1 class="text-uppercase text-white font-weight-bold" style="font-size: 56px;padding-bottom: 80px;">${desc} 로또 당첨번호</h1>
         <div id="numberFlex">
          <div class="numberCircle" id="num_${colorlist[0]}">${numberlist[0]}</div>
          <div class="numberCircle" id="num_${colorlist[1]}">${numberlist[1]}</div>
          <div class="numberCircle" id="num_${colorlist[2]}">${numberlist[2]}</div>
          <div class="numberCircle" id="num_${colorlist[3]}">${numberlist[3]}</div>
          <div class="numberCircle" id="num_${colorlist[4]}">${numberlist[4]}</div>
          <div class="numberCircle" id="num_${colorlist[5]}">${numberlist[5]}</div>
        </div>
        <div id="botButtons">
        	<button type="button" title="랜덤으로 선정된 6자리의 번호를 보여줍니다." onClick="location.href='randomNumber'" class="btn btn-danger btn-lg">
          	랜덤 추천
	        </button>
	        <button type="button" title="최근 반년간 가장 많이 나온 6자리의 번호들을 보여줍니다." onClick="showload()" class="btn btn-success btn-lg">
	          	추천 번호
	        </button>
        </div>
        <div id="loading">
			<div class="spinner">
			  <div class="rect1"></div>
			  <div class="rect2"></div>
			  <div class="rect3"></div>
			  <div class="rect4"></div>
			  <div class="rect5"></div>
			</div>
			로딩 중입니다. 잠깐만 기다려주세요...
		</div>
      </section>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script
      src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
      integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
      integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
