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
  
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>  
<!-- include summernote css/js -->  
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">  
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>  
  <!-- =======================================================  
  * Template Name: eNno - v4.7.0  
  * Template URL: https://bootstrapmade.com/enno-free-simple-bootstrap-template/  
  * Author: BootstrapMade.com  
  * License: https://bootstrapmade.com/license/  
  ======================================================== -->  
 
<script> 
$(function() { 
    function slideMenu() { 
        var activeState = $("#menu-container .menu-list").hasClass("active"); 
        $("#menu-container .menu-list").animate({right: activeState ? "0%" : "-100%"}, 400); 
    } 
    $("#menu-wrapper").click(function(event) { 
        event.stopPropagation(); 
        $("#hamburger-menu").toggleClass("open"); 
        $("#menu-container .menu-list").toggleClass("active"); 
        slideMenu(); 
 
        $("body").toggleClass("overflow-hidden"); 
    }); 
 
    $(".menu-list").find(".accordion-toggle").click(function() { 
        $(this).next().toggleClass("open").slideToggle("fast"); 
        $(this).toggleClass("active-tab").find(".menu-link").toggleClass("active"); 
 
        $(".menu-list .accordion-content").not($(this).next()).slideUp("fast").removeClass("open"); 
        $(".menu-list .accordion-toggle").not(jQuery(this)).removeClass("active-tab").find(".menu-link").removeClass("active"); 
    }); 
}); // jQuery load 
 
</script> 
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
      <nav id="navbar" class="navbar" style="margin-left: 250px; width: 700px;"> 
        <ul> 
          <li> 
          <li><a class="nav-link scrollto" href="http://localhost:8080/pcrSelectAll.kaoni">Pcr정보모두보기</a></li> 
          <li><a class="nav-link scrollto " href="http://localhost:8080/pcrForm.kaoni">내Pcr정보입력하기</a></li> 
          <li><a class="nav-link scrollto" href="http://localhost:8080/selfForm.kaoni">자가진단해보기</a></li> 
  <li><a class="nav-link scrollto" href="http://localhost:8080/ShowAllPost.kaoni">공지사항</a></li> 
  <c:choose>  
  <c:when test="${emnum eq 'admin'}"> 
  <%-- 관리자 계정 --%> 
  <div style="width: 430px; padding-left:20px;"> 
  <li class="nav-link scrollto" style="font-size: 1.1rem; color: black;">${member}님</li> 
  
  </div> 
  </c:when> 
   
  <c:when test="${not empty emnum}"> 
  <%-- 일반 계정 --%> 
     <div style="width: 430px; padding-left:20px;"> 
     <li class="nav-link scrollto" style="font-size: 1.1rem; color: black;">${member}님</li> 
    
  </div> 
  </c:when> 
  <c:otherwise> 
   
  <li><a class="nav-link scrollto" href="http://localhost:8080/memberSignUp.kaoni">회원가입</a></li> 
          <li><a class="getstarted scrollto" href="http://localhost:8080/memberLogin.kaoni">로그인</a></li> 
 </c:otherwise> 
  </c:choose> 
        </ul> 
        <i class="bi bi-list mobile-nav-toggle"></i> 
      </nav><!-- .navbar --> 
       
<div id="menu-container"> 
            <div id="menu-wrapper"> 
                <div id="hamburger-menu"><span></span><span></span><span></span></div> 
                <!-- hamburger-menu --> 
            </div> 
            <!-- menu-wrapper --> 
            <ul class="menu-list accordion"> 
            
<c:choose>  
  <c:when test="${emnum eq 'admin'}"> 
  <%-- 관리자 계정 --%> 
  
     <li id="nav1" class="toggle accordion-toggle">
     <span class="icon-plus"></span> 
     <a class="menu-link" href="http://localhost:8080/adminmain.kaoni">관리자 페이지</a></li> 
   
      <li id="nav2" class="toggle accordion-toggle">  
      <span class="icon-plus"></span> 
      <a class="menu-link" href="http://localhost:8080/logOut.kaoni">로그아웃</a></li>
      
  </c:when> 
  
  <c:when test="${not empty emnum}"> 
  <%-- 일반 계정 --%> 
     
     <li id="nav1" class="toggle accordion-toggle">
     <span class="icon-plus"></span> 
     <a class="menu-link" href="http://localhost:8080/updateInfo_pwCheck.kaoni">내 정보 수정</a></li> 
     	
      <li id="nav2" class="toggle accordion-toggle">  
      <span class="icon-plus"></span> 
      <a class="menu-link" href="http://localhost:8080/pcrMine.kaoni">내PCR검사수정하기</a></li>
                     
     <li id="nav3" class="toggle accordion-toggle">
     <span class="icon-plus"></span> 
     <a class="menu-link" href="http://localhost:8080/logOut.kaoni">로그아웃</a></li> 
 
  </c:when> 
  <c:otherwise> 
  <h5>로그인 후 이용해주세요</h5>
 </c:otherwise> 
  </c:choose> 
            </ul> 
            <!-- menu-list accordion--> 
        </div> 
       
       
 
    </div> 
  </header><!-- End Header --> 
 
</body> 
</html>