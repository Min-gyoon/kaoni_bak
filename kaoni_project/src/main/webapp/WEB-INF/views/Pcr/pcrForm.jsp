
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>
 <!-- bootswatch journal-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/journal/bootstrap.min.css" integrity="sha384-QDSPDoVOoSWz2ypaRUidLmLYl4RyoBWI44iA5agn6jHegBxZkNqgm2eHb6yZ5bYs" crossorigin="anonymous">
<title>코로나 진단표</title>
 <%@include file ="/WEB-INF/views/header.jsp" %>

  <!-- =======================================================
  * Template Name: eNno - v4.7.0
  * Template URL: https://bootstrapmade.com/enno-free-simple-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
		"action":"pcrInsert.kaoni",
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

</script>
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
          <li><a class="nav-link scrollto" href="http://localhost:8080/pcrSelectAll.kaoni">pcrselectall</a></li>
          <li><a class="nav-link scrollto " href="http://localhost:8080/pcrForm.kaoni">pcrform</a></li>
          <li><a class="nav-link scrollto" href="http://localhost:8080/selfForm.kaoni">selffrom</a></li>

          <li><a class="nav-link scrollto" href="http://localhost:8080/memberSignUp.kaoni">signup</a></li>
          <li><a class="getstarted scrollto" href="http://localhost:8080/memberLogin.kaoni">login</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <main id="main" style="padding-top:80px">
<section id="pcrform" class="pcrform">
	<form name="jindan" id="jindan">
		<input type="hidden" name="emnum" id="emnum">
		<table style="table-layout: fixed;" align="center" >
			<thead>
				<tr>
					<th colspan="3" style="text-align:center">코로나 진단표</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>검사 결과</td>
					<td><input type="checkbox" name="poutcome" class="abc" value="Y"
						onclick='checkOnlyOne(this)'>양성</td>
					<td><input type="checkbox" name="poutcome" class="abc" value="N"
						onclick='checkOnlyOne(this)'>음성</td>
				</tr>
				<tr>
					<td>격리기간</td>
					<td>시작일: <input type="text" id="isolea" name="isolea" ></td>
					<td>종료일: <input type="text" id="isoleb" name="isoleb"></td>
				</tr>
				<tr>
					<td>특이사항</td>
					<td colspan="2"><textarea rows="4" cols="50" id="pcontent" name="pcontent" placeholder="사내 식사 혹은 대화 여부를 적어주세요."></textarea></td>
				</tr>
			</tbody>
		</table>
		<div style='width: 80px; float: right;'>
	  	<button type="button" style="align:left;" class="btn btn-success" id="pcrbtn"> 제출하기</button>
	<!--  <input type="button" id="pcrbtn" value="제출하기">-->
		</div>
	</form>
	</section>
	
  </main><!-- End #main -->

<%@include file ="/WEB-INF/views/footer.jsp" %>

</body>

</html>