

<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head> 
  <meta charset="utf-8"> 
  <meta content="width=device-width, initial-scale=1.0" name="viewport"> 
  <title>kaoni_prject index</title> 
  <meta content="" name="description"> 
  <meta content="" name="keywords"> 
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>   
   <!-- bootstrap-->
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
  integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
  crossorigin="anonymous">
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<title>코로나 진단</title>

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
      <nav id="navbar" class="navbar">
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
                <li id="nav1" class="toggle accordion-toggle"> 
                    <span class="icon-plus"></span>
                    <a class="menu-link" href="http://localhost:8080/pcrSelectAll.kaoni">내정보수정</a>
                </li>
               
                <li id="nav2" class="toggle accordion-toggle"> 
                    <span class="icon-plus"></span>
                    <a class="menu-link" href="http://localhost:8080/pcrMine.kaoni">내PCR검사수정하기</a>
                </li>
               
                <li id="nav3" class="toggle accordion-toggle"> 
                    <span class="icon-plus"></span>
                    <a class="menu-link" href="http://localhost:8080/pcrSelectAll.kaoni">어쩔저쩔어쩔저쩔</a>
                </li>
                
            </ul>
            <!-- menu-list accordion-->
        </div>
      
      
		
    </div>
  </header><!-- End Header -->

  <main id="main" style="padding-top:90px">
<div class="container">
<div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card">
                        <div class="card-header" style="font-size: 1.1rem">PCR정보입력</div>
                            <div class="card-body">
        <form name="jindan" id="jindan">
        
        <div class="form-group">
            <label for="name" class="cols-sm-2 control-label">검사결과</label>
            	<div class="cols-sm-10">
            		<div class="input-group">
            &nbsp;&nbsp;<input type="checkbox" name="poutcome" value="Y" onclick='checkOnlyOne(this)'>양성&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="checkbox" name="poutcome"  value="N" onclick='checkOnlyOne(this)'>음성
            		</div>
            	</div>
            </div>  
        <!-- 날짜 -->
        <div class="form-group">
            <label for="name" class="cols-sm-2 control-label">자가격리기간</label>
            	<div class="cols-sm-10">
            		<div class="input-group">
            시작일: <input type="text" autocomplete="off" name="isolea" id="isolea" class="form-control">
            종료일: <input type="text" onchange='checkday()' autocomplete="off" name="isoleb" id="isoleb" class="form-control">
            		</div>
            	</div>
            </div>
            <!-- 특이사항 -->
             <div class="form-group">
            <label for="name" class="cols-sm-2 control-label">특이사항</label>
            	<div class="cols-sm-10">
            		<div class="input-group">
            <textarea name="pcontent" id="pcontent" maxlength="1000" class="form-control" placeholder="특이사항을 입력하시오"> </textarea>
            	</div>
            </div>
            <!-- emnum 입력 -->
               <div class="form-group">
            <label for="name" class="cols-sm-2 control-label">사원번호입력</label>
            	<div class="cols-sm-10">
            		<div class="input-group">
            <input type="text" name="emnum" id="emnum" class="form-control" placeholder="사원번호 입력" value=""> 
            		</div>
            	</div>
            </div>
       		 <input type="button" id="pcrbtn" value="제출하기" class="btn btn-primary">
        
        </form>                   
                     
	</div>
	</div>
	</div>
	</div>
	</div>
  </main><!-- End #main -->

<%@include file ="/WEB-INF/views/footer.jsp" %>

</body>
<script type="text/javascript">

$(document).ready(function(){
	$.datepicker.setDefaults({
    	dateFormat: 'yy-mm-dd',
    	prevText: '이전 달',
    	nextText: '다음 달',
    	monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    	dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    	showMonthAfterYear: true,
    	yearSuffix: '년'
  });
  $(function() {
    $("#isolea, #isoleb").datepicker();
  });
$(document).on("click", "#pcrbtn", function(){
	$("#jindan").attr({
		"action":"adminPcrInsert.kaoni",
		"method":"GET",
		"enctype":"application/x-www-form-urlencoded"				
	}).submit();
});
});
function checkOnlyOne(element) {
	  
	  const checkboxes 
	      = document.getElementsByName("poutcome");
	  
	  checkboxes.forEach((cb) => {
	    cb.checked = false;
	  })
	  
	  element.checked = true;
	}
function checkday(){
	console.log("checkdaty---");
	var a = document.getElementById("isolea").value;
	var b = document.getElementById("isoleb").value;
	date1 = new Date(a);
	date2 = new Date(b);
	if(a==""){
		alert("시작일을 먼저 입력해주세요");
		document.getElementById("isoleb").value = "";
	}
	if(date1 > date2){
		alert("시작일보다 커야합니다");
		document.getElementById("isoleb").value = "";
	}	
}
</script>

</html>