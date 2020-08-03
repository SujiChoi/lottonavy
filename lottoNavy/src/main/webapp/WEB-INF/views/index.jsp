<%@page import="java.util.Vector"%>
<%@page import="javax.inject.Inject"%>
<%@page import="com.bit.lottoNavy.controller.thislotto" %>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="lnum" class="com.bit.lottoNavy.controller.thislotto"/>

<% 
	Vector<String> nlist = lnum.nlist();
	Vector<String> plist = lnum.plist();	

	thislotto bonus = new thislotto();
	bonus.bonusNum();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

 <meta charset="UTF-8" /> -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
<meta name="author" content="" />
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

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/css/styles.css">
<style>
#numberFlex {
  display: flex;
  justify-content: space-evenly;
  margin-top: 40px;
}
.numberCircle {
  border-radius: 50%;
  width: 5rem;
  height: 5rem;
  color: white;
  font-size: 2rem;
  padding: 0.9rem 0;
  text-align: center;
}
.plus {
  border-radius: 50%;
  width: 5rem;
  height: 5rem;
  color: white;
  font-size: 2rem;
  padding: 0.9rem 0;
  text-align: center;
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
</style>
</head>

<body id="page-top">

	<!-- Navigation-->
	
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="#page-top">LottoNAVY</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="index2" >Data Analysis</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="randomNumber" >Number Recommendation</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    <header class="masthead">
     <div class="container h-100">
                <div class="row h-100 align-items-center justify-content-center text-center">
                    <div class="col-lg-10 align-self-end">
                        <h1 class="text-uppercase text-white font-weight-bold">이번주 로또 당첨번호</h1>
                        <div id="numberFlex">
                        	<%
	                        	for (int i=0; i<=5; i++) {
	                        		
	                        		String Lottonum = nlist.get(i);
	                        		int num = Integer.parseInt(Lottonum);
	                        		
		                        	if(num <= 10) {%>
		                        		<div class="numberCircle" id="num_1">
		                          <%}else if(num <= 20){%>
		                          		<div class="numberCircle" id="num_2">
		                          <%}else if(num <= 30){%>
		                          		<div class="numberCircle" id="num_3">
		                          <%}else if(num <= 40){%>
		                          		<div class="numberCircle" id="num_4">
		                          <%}else{%>
		                          		<div class="numberCircle" id="num_5">
		                          <%}%>
	                        	<%=nlist.get(i)%></div>
	                          <%}%>
	                          
					          <div class="numberCircle"><img src="./resources/assets/img/plus.png" width="40" height="40"></div>
					          
						         <%int bonusNum = Integer.parseInt(bonus.bonusNum());
	                        		
						         	if(bonusNum <= 10) {%>
			                        		<div class="numberCircle" id="num_1">
			                          <%}else if(bonusNum <= 20){%>
			                          		<div class="numberCircle" id="num_2">
			                          <%}else if(bonusNum <= 30){%>
			                          		<div class="numberCircle" id="num_3">
			                          <%}else if(bonusNum <= 40){%>
			                          		<div class="numberCircle" id="num_4">
			                          <%}else{%>
			                          		<div class="numberCircle" id="num_5">
			                          <%}%>
			                          <%=bonus.bonusNum()%></div>
					    </div>
                       <br> <br>
                    </div>
                    <div class="col-lg-8 align-self-baseline">
                    	<h3 class="text-uppercase font-weight-bold" style="color:orange;">1등 상금 : <%=plist.get(1)%></h3> <br>
                        <p class="text-white-75 font-weight-light mb-5">This site provides Lotto number analysis and number recommendations <br>in the last year.</p>
                        <a class="btn btn-primary btn-xl js-scroll-trigger" href="index2">Data Analysis</a>
                        <a class="btn btn-primary btn-xl js-scroll-trigger" style="margin-left:10px;" href="randomNumber">Number Recommendation</a>
                    </div>
                </div>
            </div>
        </header>
        
<!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>

</body>
</html>