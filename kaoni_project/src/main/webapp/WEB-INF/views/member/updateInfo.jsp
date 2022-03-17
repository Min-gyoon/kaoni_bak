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
  System.out.println("updateinfojsp");
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
  <header><%@include file ="/WEB-INF/views/header.jsp" %></header>
<div class="container">

  <main id="main" style="padding-top:80px">
  <legend>회원정보 수정</legend>
    <form id="updateform">
    <div class="form-group">
        <label class="col-sm-3 control-label" for="card-holder-name">Name</label>
        <div class="col-sm-9">
          <input type="text" class="form-control" name="card-holder-name" id="card-holder-name" placeholder="Card Holder's Name" value="<%=mvo.getName() %>" readonly="readonly">
        </div>
      </div>
      
       <div class="form-group">
        <label class="col-sm-3 control-label" for="card-number">Depart</label>
        <div class="col-sm-9">
          <select name="Dname" class="form-control col-sm-2">
                    <option value=""><%=mvo.getDname() %></option>
                    <option value="SS개발부">SS개발부</option>
                    <option value="ES개발부">ES개발부</option>
                    <option value="경영지원실">경영지원실</option>
                    <option value="사업부">사업부</option>
                </select>
        </div>
      </div>
      
       <div class="form-group">
        <label class="col-sm-3 control-label" for="card-number">Position</label>
        <div class="col-sm-9">
         <select class="form-control col-sm-2" name="position">
					    <option value=""><%=mvo.getPosition()%></option>
					    <option value="사원">사원</option>
					    <option value="대리">대리</option>
					    <option value="팀장">팀장</option>
					    <option value="과장">과장</option>
					</select>
        </div>
      </div>
      
       <div class="form-group">
        <label class="col-sm-3 control-label" for="card-number">ID</label>
        <div class="col-sm-9">
          <input type ="text"  class="form-control" name ="id" readonly="readonly" value="<%=mvo.getId() %>"> 
        </div>
      </div>
      
      <div class="form-group">
        <label class="col-sm-3 control-label" for="card-number">PassWord</label>
        <div class="col-sm-9">
          <input type="password" class="form-control" name="passwd" value="">
        </div>
      </div>
      
      <div class="form-group">
        <label class="col-sm-3 control-label" for="card-number">PassWord Check</label>
        <div class="col-sm-9">
          <input type="password" class="form-control" name="passwd1" value="">
        </div>
      </div>
                  <input type="button" value="체크" class="btn btn-primary">
                  <input type="hidden" id="emnum" name="emnum" value="<%=mvo.getEmnum()%>">
                  	  <input type="hidden" id="name" name="name" value="<%=mvo.getName() %>">
                  	  <input type="hidden" id="dname" name="dname" value="<%=mvo.getDname() %>">
                
                  <input type="button" id="update" value="수정완료" class="btn btn-primary">
        </form>
	</div>
  <!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer><%@include file ="/WEB-INF/views/footer.jsp" %></footer>


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