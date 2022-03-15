
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <title>kaoni_prject index</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: eNno - v4.7.0
  * Template URL: https://bootstrapmade.com/enno-free-simple-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<head>

<style type="text/css">
div li{
float: left;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">

      <h1 class="logo"><a href="http://localhost:8080/">Kaoni</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
	<!-- 헤더 -->
      <nav id="navbar" class="navbar">
        <ul>
          <li>
          <li><a class="nav-link scrollto" href="http://localhost:8080/pcrSelectAll.kaoni">PcrSelectAll</a></li>
          <li><a class="nav-link scrollto " href="http://localhost:8080/pcrForm.kaoni">Pcrform</a></li>
          <li><a class="nav-link scrollto" href="http://localhost:8080/selfForm.kaoni">SelfForm</a></li>
		  <li><a class="nav-link scrollto" href="http://localhost:8080/ShowAllPost.kaoni">Notice</a></li>
		  <c:choose> 
		  <c:when test="${emnum eq 'admin'}">
		  <%-- 관리자 계정 --%>
		  <div style="width: 430px; padding-left:20px;">
		  <li class="nav-link scrollto" style="font-size: 1.1rem; color: black;">${member}님</li>
		  <li><a class="nav-link scrollto" href="http://localhost:8080/adminmain.kaoni">관리자페이지</a></li>
		  <li><a class="nav-link scrollto" href="http://localhost:8080/logOut.kaoni">로그아웃</a></li>
		  </div>
		  </c:when>
		  
		  <c:when test="${not empty emnum}">
		  <%-- 일반 계정 --%>
		     <div style="width: 430px; padding-left:20px;">
		     <li class="nav-link scrollto" style="font-size: 1.1rem; color: black;">${member}님</li>
		     <li><a class="nav-link scrollto" href="http://localhost:8080/">내 정보 수정</a></li>
		     <li><a class="nav-link scrollto" href="http://localhost:8080/logOut.kaoni">로그아웃</a></li>
		  </div>
		  </c:when>
		  <c:otherwise>
		  
		  <li><a class="nav-link scrollto" href="http://localhost:8080/memberSignUp.kaoni">Signup</a></li>
          <li><a class="getstarted scrollto" href="http://localhost:8080/memberLogin.kaoni">Login</a></li>
		 </c:otherwise>
		  </c:choose>
         
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

</body>
</html>

