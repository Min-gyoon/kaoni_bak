<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>자가진단</title>
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

$(document).ready(function(){
$(document).on("click", "#btn", function(){
	console.log("click btn");
	$("#selfform").attr({
		"action":"selfInsert.kaoni",
		"method":"GET",
		"enctype":"application/x-www-form-urlencoded"				
	}).submit();
});
});

function checkOnlyOne(element) {
	var clickname =  $(element).attr("name");
	  const checkboxes 
	      = document.getElementsByName(clickname);
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

  <main id="main" style="padding-top:90px">
<form id="selfform" name="selfform">
<table align = "center" class="selfForm" style="height:800px">
<thead>
  <tr class="table-info">
    <th rowspan="2">Q1</th>
    <th colspan="2">가족 중 코로나 19확진자 또는 자가격리자가 있습니까?</th>
  </tr>
  <tr class="table-success">
    <th class="shitcss"><input type="checkbox" name="Selfcheck1" value="Y" onclick='; checkOnlyOne(this)'>예</th>
    <th class="shitcss"><input type="checkbox" name="Selfcheck1" value="N" onclick='; checkOnlyOne(this)'>아니오</th>
  </tr>
</thead>
<tbody>
  <tr class="table-info">
    <td rowspan="2">Q2</td>
    <td colspan="2">밀접 접촉을 한 사람들 중 코로나19 확진자 또는 질병관리본부 자가격리 대상자가 있습니까?</td>
  </tr>
  <tr class="table-success">
    <td class="shitcss"><input type="checkbox" name="Selfcheck2" value="Y" onclick=' checkOnlyOne(this)'>예</td>
    <td class="shitcss"><input type="checkbox" name="Selfcheck2" value="N" onclick=' checkOnlyOne(this)'>아니오</td>
  </tr>
  <tr  class="table-info">
    <td rowspan="2">Q3</td>
    <td colspan="2">질병 관리 본부 접촉관리 대상자로 전화 혹은 문자를 받은 적이 있습니까?</td>
  </tr>
  <tr class="table-success">
    <td class="shitcss"><input type="checkbox" name="Selfcheck3" value="Y" onclick=' checkOnlyOne(this) '>예</td>
    <td class="shitcss"><input type="checkbox" name="Selfcheck3" value="N" onclick=' checkOnlyOne(this)'>아니오</td>
  </tr>
  <tr  class="table-info">
    <td rowspan="2">Q4</td>
    <td colspan="2">최근 14일 다중이용시설에 방문해 이용하셨습니까?</td>
  </tr>
  <tr class="table-success">
    <td class="shitcss"><input type="checkbox" name="Selfcheck4" value="Y" onclick=' checkOnlyOne(this) '>예</td>
    <td class="shitcss"><input type="checkbox" name="Selfcheck4" value="N" onclick=' checkOnlyOne(this)'>아니오</td>
  </tr>
  <tr  class="table-info">
    <td rowspan="2">Q5</td>
    <td colspan="2">최근 체온 측정에서 37.5도 이상이 나온적이 있습니까?</td>
  </tr>
  <tr class="table-success">
    <td class="shitcss"><input type="checkbox" name="Selfcheck5" value="Y" onclick=' checkOnlyOne(this) '>예</td>
    <td class="shitcss"><input type="checkbox" name="Selfcheck5" value="N" onclick=' checkOnlyOne(this)'>아니오</td>
  </tr>
  <tr  class="table-info">
    <td rowspan="2">Q6</td>
    <td colspan="2">최근 새로 시작되거나 악화 된 기침, 콧물, 인후통 등의 호흡기 증상이 있습니까?</td>
  </tr>
  <tr class="table-success">
    <td class="shitcss"><input type="checkbox" name="Selfcheck6" value="Y" onclick=' checkOnlyOne(this) '>예</td>
    <td class="shitcss"><input type="checkbox" name="Selfcheck6" value="N" onclick=' checkOnlyOne(this)'>아니오</td>
  </tr>
</tbody>
</table>
	<input type="button" align="p"id="btn" value="제출하기">
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