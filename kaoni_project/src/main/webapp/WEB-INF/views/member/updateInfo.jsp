<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<%@ page import="java.util.List" %> 
<%@ page import="com.kaoni.Member.VO.MemberVO"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
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
  out.print(mvo.getDeleteyn()); 
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
$(document).on("click", "#delete", function(){
$('#deleteyn').val('N'); 
$('#passwd').val($('#passwd3').val());
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
    <option value=<%=mvo.getPosition()%>><%=mvo.getPosition()%></option> 
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
          <input type="password" class="form-control" name="passwd" value="" id="passwd" oninput="checkPwd()"> 
        </div> 
      </div> 
       
      <div class="form-group"> 
        <label class="col-sm-3 control-label" for="card-number">PassWord Check</label> 
        <div class="col-sm-9"> 
          <input type="password" class="form-control" name="passwd1" value="" id="passwd1" oninput="checkPwd()"> 
        </div> 
      </div> 
       <spring:hasBindErrors name="memberVO"> 
 
            <c:if test="${errors.hasFieldErrors('passwd') }">                                      
               <strong>${errors.getFieldError( 'passwd' ).defaultMessage }</strong> 
</c:if> 
</spring:hasBindErrors> 
 
                  <input type="hidden" id="emnum" name="emnum" value="<%=mvo.getEmnum()%>"> 
                  <input type="hidden" id="name" name="name" value="<%=mvo.getName() %>"> 
                  <input type="hidden" id="dname" name="dname" value="<%=mvo.getDname() %>"> 
                  <input type="hidden" id="deleteyn" name="deleteyn" value="<%=mvo.getDeleteyn()%>"> 
                  <input type="hidden" id="passwd3" value="<%=mvo.getPasswd() %>">
                  <input type="button" id="update" value="수정완료" class="btn btn-primary"> 
                  <input type="button" id="delete" value="삭제하기" class="btn btn-primary"> 
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
 
<script type="text/javascript"> 
function checkPwd() { 
    var pw = $('#passwd').val(); 
    var pw1 = $('#passwd1').val(); 
   
    if(pw == pw1){ 
     $("#passwd1").css("background-color", "#B0F6AC"); 
         $("#update").prop("disabled", false); 
         $("#update").css("background-color", "#0D6EFD"); 
    } 
     else if (pw != pw1 ) { 
        $("#update").prop("disabled", true); 
        $("#update").css("background-color", "#aaaaaa"); 
        $("#passwd1").css("background-color", "#FFCECE"); 
    }  
    } 
 
</script> 
 
</body> 
 
</html>