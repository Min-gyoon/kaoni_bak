
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
  //코로나현황 데이터 가져오기. 
  $(document).ready(function(){
	alert("test");
			$.ajax({
				url : 'pcrdata.kaoni',
				dataType : 'json',
				success : function(data){
					document.getElementById('allmember').innerHTML=parseInt(data.allmember);
					document.getElementById('nowmember').innerHTML = parseInt(data.nowmember);
					document.getElementById('member').innerHTML = parseInt(data.member);
					document.getElementById('isolemember').innerHTML = parseInt(data.isolemember);
				},
				error : function(error){
					console.log(error);
				}	
			});
  });//ready
</script>
</head>

<body>

  <!-- ======= Header ======= -->
   <%@include file ="/WEB-INF/views/header.jsp" %>

  <main id="main" style="padding-top:100px">
  <section id="forapi" class="d-flex align-items-center">
	   <div class="container">
	   <div class="kovid19" style="text-align: center;">
	   <h2>국내 코로나 상황 넣을 곳 </h2>
	   </div>
	   </div>
</section>
      <!-- ======= Counts Section ======= -->
    <section id="counts" class="counts">
      <div class="container">
 	  <div class="row counters" >
 		<h5>사내 코로나 현황</h5>
          <div class="col-lg-3 col-6 text-center">
            <span id = "allmember" data-purecounter-start="0" data-purecounter-end="" data-purecounter-duration="1" class="purecounter"></span>
            <p>총 확진자(누적)</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
            <span id="nowmember" data-purecounter-start="0" data-purecounter-end="" data-purecounter-duration="1" class="purecounter"></span>
            <p>현재 확진자</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
            <span id="isolemember" data-purecounter-start="0" data-purecounter-end="" data-purecounter-duration="1" class="purecounter"></span>
            <p>자가 격리자</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
            <span id="member" data-purecounter-start="0" data-purecounter-end="" data-purecounter-duration="1" class="purecounter"></span>
            <p>근무원 총원</p>            
          </div>
			<a href="http://localhost:8080/pcrSelectAll.kaoni">더 자세히보기</a>
			
        </div>

      </div>
    </section><!-- End Counts Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <%@include file ="/WEB-INF/views/footer.jsp" %>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

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