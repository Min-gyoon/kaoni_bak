<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kaoni.pcr.VO.PcrVO"%> 
<!DOCTYPE html>
<html>

<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
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
    $("#isoleb").datepicker();
  });
$(document).on("click", "#pcrbtn", function(){
	$("#jindan").attr({
		"action":"pcrUpdate.kaoni",
		"method":"GET",
		"enctype":"application/x-www-form-urlencoded"				
	}).submit();
});
$(document).on("click", "#curebtn", function(){
	 document.getElementById("poutcome").value="N"; 
	 document.getElementById("deleteyn").value="Y";
	 $("#jindan").attr({
			"action":"pcrUpdate.kaoni",
			"method":"GET",
			"enctype":"application/x-www-form-urlencoded"				
		}).submit();
	alert("완치로 저장하겠습니다.");
	
});//curebtn click
});

</script>
<title>코로나 진단표</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- bootswatch journal-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/journal/bootstrap.min.css" integrity="sha384-QDSPDoVOoSWz2ypaRUidLmLYl4RyoBWI44iA5agn6jHegBxZkNqgm2eHb6yZ5bYs" crossorigin="anonymous">
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
<script type="text/javascript">
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

  <main id="main" style="padding-top:85px">
		  <%
  //세션, 쿼리 조인 후 직책 부서 추가. 
  
Object obj = request.getAttribute("list");
List<PcrVO> list = (List)obj;
PcrVO pvo = list.get(0);
String isolea = pvo.getIsolea().split("\\s+")[0];
String isoleb = pvo.getIsoleb().split("\\s+")[0];

%>
	<form name="jindan" id="jindan">
		<input type="hidden" name="emnum" id="emnum" value="<%=pvo.getEmnum()%>">
		<table align="center" class="pcrupdatetable">

			<thead>
				<tr class="table-info">
					<th colspan="3">코로나 진단표</th>
				</tr>
			</thead>
			<tbody>
				<tr class="table-success">
					<td>검사 결과</td>
					<td colspan="2"><input type="text" id="poutcome" name="poutcome" value="<%= pvo.getPoutcome()%>"></td>
				</tr>
				<tr class="table-success">
					<td>자가격리기간</td>
					<td>시작일: <input type="text" id="isolea" name="isolea" value="<%=isolea %>" readonly></td>
					<td>종료일: <input type="text" id="isoleb" name="isoleb" value="<%=isoleb %>"></td>
				</tr>
				<tr class="table-success">
					<td>특이사항</td><!-- -->
					<td colspan="2"><textarea rows="4" cols="50" id="pcontent" name="pcontent"><%=pvo.getPcontent() %></textarea></td>
				</tr>
			</tbody>
		</table>
		<div style='width: 80px; float: right;'>
			<input type="button" id="pcrbtn" value="제출하기">
			<input type="button" id="curebtn" value="치료완료">
			<input type="hidden" id="deleteyn" name="deleteyn" value="<%=pvo.getDeleteyn() %>">
		</div>
	</form>

	
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">

    <div class="footer-top">

      <div class="container">

<!-- footer내용 넣기 -->
        <div class="row  justify-content-center">
          <div class="col-lg-6">
            <h3>Kaoni</h3>
            <p>Et aut eum quis fuga eos sunt ipsa nihil. Labore corporis magni eligendi fuga maxime saepe commodi placeat.</p>
          </div>
        </div>

      </div>
    </div>

  </footer><!-- End Footer -->


  <!-- Vendor JS Files -->
  <script src="assets/vendor/purecounter/purecounter.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>