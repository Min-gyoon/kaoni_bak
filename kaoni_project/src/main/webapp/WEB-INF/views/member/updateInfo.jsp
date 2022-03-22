<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<%@ page import="java.util.List" %> 
<%@ page import="com.kaoni.Member.VO.MemberVO"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<html> 
<head> 

<!-- jquery -->
	<script src="./resources/vendor/jquery/jquery.min.js"></script>
  <meta charset="utf-8"> 
  <meta content="width=device-width, initial-scale=1.0" name="viewport"> 
 
<title>회원 정보 수정</title> 
  <meta content="" name="description"> 
  <meta content="" name="keywords"> 
  <link href="/resources/vendor/fontawesome-free/css/all.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
   <link href="./resources/css/sb-admin-2.min.css" rel="stylesheet">
  <% 
 
  Object obj = request.getAttribute("list"); 
  List<MemberVO> list = (List)obj; 
  MemberVO mvo = list.get(0);  
  System.out.println("update"+mvo.getDeleteyn());
  System.out.println("update"+mvo.getDname());
  System.out.println("update"+mvo.getEmnum());
 
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
 
<body class="bg-gradient-primary"> 
 
  <!-- ======= Header ======= --> 

 
  <main id="main" style="padding-top:120px;">

<div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5" style="width: 780px; margin-left: 150px;">
            <div class="card-body p-0" >
                <!-- Nested Row within Card Body -->
                <div class="row" >
                  
                    <div class="col-lg-7">
                        <div class="p-5" style="width: 700px; margin-left: 30px;">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">회원 정보 수정</h1>
                            </div>
                            <form class="user" id="updateform">

                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" name="id" id ="id" maxlength="20" 
                                        class="form-control form-control-user" placeholder="아이디" value="<%=mvo.getId() %>" readonly="readonly"	>
                                    </div>       
                                </div>
                               
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" id="passwd" name="passwd"class="form-control form-control-user" 
                                        oninput="checkPwd()" placeholder="비밀번호">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" id="passwd1" name="passwd1" class="form-control form-control-user"
                                        oninput="checkPwd()" placeholder="비밀번호 확인" >
                                    </div>

                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" name="name" maxlength="40" class="form-control form-control-user" placeholder="이름" value="<%=mvo.getName() %>">
                                    </div>
                                </div>

                               
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <select name="dname" class="form-control">
                                            <option name="dname" value="<%=mvo.getDname() %>"><%=mvo.getDname() %></option>
                                            <option value="SS개발부">SS개발부</option>
                                            <option value="ES개발부">ES개발부</option>
                                            <option value="경영지원실">경영지원실</option>
                                            <option value="사업부">사업부</option>
                                        </select>
                                    </div>
										 <div class="col-sm-6 mb-3 mb-sm-0">
                                        <select name="position" class="form-control">
                                            <option value="<%=mvo.getPosition() %>"><%=mvo.getPosition() %></option>
                                            <option value="사원">사원</option>
                                            <option value="대리">대리</option>
                                            <option value="팀장">팀장</option>
                                            <option value="과장">과장</option>
                                        </select>
                                    </div>
                                   

                                </div>

                                <div class="form-group row">
                                   
                                </div>
		      			<input type="button" id="update" value="수정완료" class="btn btn-primary" disabled="true"> 

                  	      <input type="button" id="delete" value="삭제하기" class="btn btn-primary">  
                            <input type="hidden" name="emnum" value="<%=mvo.getEmnum()%>">
                            <input type="hidden" name="deleteyn" value="<%=mvo.getDeleteyn()%>">

                            </form>
                            <hr>
                          
                            <div class="text-center">
                                <a class="small" href="#">홈으로 돌아가기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
<br><br><br>

  </main><!-- End #main --> 
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
 <%@include file ="/WEB-INF/views/footer.jsp" %>
</body> 
 
</html>