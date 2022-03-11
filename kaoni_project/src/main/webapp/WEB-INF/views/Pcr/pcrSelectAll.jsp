<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kaoni.pcr.VO.PcrVO"%> 
<%@ page import="com.kaoni.Member.VO.MemberVO"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

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
  <div id="wrapper">
<table  align="center" class="selectall">
<thead>
  <tr class="table-info">
    <th>이름</th>
    <th>직책</th>
    <th>부서</th>
    <th>자가격리기간</th>
    <th>확진여부</th>
  </tr>
  <%
  //세션, 쿼리 조인 후 직책 부서 추가. 
  
Object obj = request.getAttribute("listAll");
List<PcrVO> list = (List)obj;
MemberVO mvo;
for(int i = 0; i < list.size(); i++){
PcrVO pvo = list.get(i);
mvo = pvo.getMemberVO();
String isolea = pvo.getIsolea().split("\\s+")[0];
String isoleb = pvo.getIsoleb().split("\\s+")[0];
String outcome = pvo.getPoutcome();
System.out.println("isolea--->"+isolea);

%>
  <tr class="table-success">
  <!--  
    <td><input type="text" value="<%--mvo.getName() --%>"></td>
    <td><input type="text" value="<%--mvo.getPosition() --%>"></td>
    <td><input type="text" value="<%--mvo.getDname() --%>"></td>
    <td><input type="text" value="<%--isolea --%>"> ~ <input type="text" value="<%--isoleb --%>"></td>
    <td><%-- outcome--%></td>
    -->
    <td><%=mvo.getName() %></td>
    <td><%=mvo.getPosition() %></td>
    <td><%=mvo.getDname() %></td>
    <td><%=isolea %> ~ <%=isoleb %></td>
    <td><%= outcome%></td>
  </tr>
<%
}
%>
</table>

	</div>
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