<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.List" %>
<%@ page import="com.kaoni.Member.VO.MemberVO"%>
<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

<title></title>
  <meta content="" name="description">
  <meta content="" name="keywords">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
  <%
  Object obj = request.getAttribute("list");
  List<MemberVO> list = (List)obj;
	  MemberVO mvo = list.get(0);
  out.print(mvo.getName());
  out.print(mvo.getPosition());
  %>
  
<script type="text/javascript">
$(document).ready(function(){
$(document).on("click", "#update", function(){
	$("#updateform").attr({
		"action":"updateInfo2.kaoni",
		"method":"POST",
		"enctype":"application/x-www-form-urlencoded"				
	}).submit();
});
});
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
	<h3>회원정보 수정</h3>
    <form id="updateform">
    <table>
        
              <tr>
                  <td>이름</td>
                  <td><%=mvo.getName() %></td>
              </tr>
              <tr>
                  <td>부서명</td>
                  <td><%=mvo.getDname() %></td>
              </tr>
              <tr>
                  <td>직책</td>
                  <td><select name="position">
					    <option value="<%=mvo.getPosition()%>"></option>
					    <option value="사원">사원</option>
					    <option value="대리">대리</option>
					    <option value="팀장">팀장</option>
					    <option value="과장">과장</option>
					</select></td>
              </tr>
              <tr>
                  <td>ID</td>
                  <td><input type ="text" name ="id" readonly="readonly" value=<%=mvo.getId() %>></td>
              </tr>
              <tr>
                  <td>PW</td>
                  <td><input type="password" name="passwd" value=""></td>
              </tr>
              <tr>
                  <td>PW 확인</td> 
                  <td><input type="password" name="password"></td>
                  <td><input type="button" value="체크"></td>
                  
              </tr>
              
              <tr>
                  <td><input type="hidden" id="emnum" name="emnum" value="">
                  	  <input type="hidden" id="name" name="name" value="<%=mvo.getName() %>">
                  	  <input type="hidden" id="dname" name="dname" value="<%=mvo.getDname() %>">
                  </td>
                  <td><input type="button" id="update" value="수정완료"></td>
                  
              </tr>
             
        
        </table>
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