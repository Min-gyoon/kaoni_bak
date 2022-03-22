<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<style type="text/css">
strong{
color: red;
}
</style>
 <link href="/resources/vendor/fontawesome-free/css/all.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
   <link href="./resources/css/sb-admin-2.min.css" rel="stylesheet">
</head>

<body class="bg-gradient-primary">

<main id="main" style="padding-top:120px;">

<div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5" style="width: 780px; margin-left: 150px;">
            <div class="card-body p-0" >
                <!-- Nested Row within Card Body -->
                <div class="row" >
                  
                    <div class="col-lg-7">
                        <div class="p-5" style="width: 700px; margin-left: 30px;">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
                            </div>
                            <form action="memberSignUp1.kaoni" method="post" class="user">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" name="id" id ="id" maxlength="20" class="form-control form-control-user" placeholder="아이디">
                                    </div>
                                    <div class="col-sm-6">
                                        <button type="button" onclick="fn_idCheck();" class="btn btn-primary"
            		                style="margin-top: 8px;">중복 확인</button>
                                    </div>
                                    <spring:hasBindErrors name="memberVO">
            <c:if test="${errors.hasFieldErrors('id') }">                                     
               <strong>${errors.getFieldError( 'id' ).defaultMessage }</strong>
			</c:if>
			</spring:hasBindErrors>
                                    
                                </div>
                                
            
                                <div class="pwCheck"></div>
                                <div class="form-group">
                                    
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

                                    <spring:hasBindErrors name="memberVO">

                                    <c:if test="${errors.hasFieldErrors('passwd') }">                                     
                                       <strong>${errors.getFieldError( 'passwd' ).defaultMessage }</strong>
                                    </c:if>
                                    </spring:hasBindErrors>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" name="name" maxlength="40" class="form-control form-control-user" placeholder="이름">
                                    </div>
                                    <spring:hasBindErrors name="memberVO">

                                        <c:if test="${errors.hasFieldErrors('name') }">                                     
                                           <strong>${errors.getFieldError( 'name' ).defaultMessage }</strong>
                                        </c:if>
                                        </spring:hasBindErrors>

                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        &nbsp;&nbsp;<input type="radio" name="gender" value="남" checked>남&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="gender" value="여">여
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <select name="Dname" class="form-control">
                                            <option value="">부서를 선택해주세요</option>
                                            <option value="SS개발부">SS개발부</option>
                                            <option value="ES개발부">ES개발부</option>
                                            <option value="경영지원실">경영지원실</option>
                                            <option value="사업부">사업부</option>
                                        </select>
                                    </div>
                                    <spring:hasBindErrors name="memberVO">
                                        <c:if test="${errors.hasFieldErrors('Dname') }">                                     
                                           <strong>${errors.getFieldError( 'Dname' ).defaultMessage }</strong>
                                        </c:if>
                                        </spring:hasBindErrors>

                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <select name="position" class="form-control">
                                            <option value="">직책을 선택해주세요</option>
                                            <option value="사원">사원</option>
                                            <option value="대리">대리</option>
                                            <option value="팀장">팀장</option>
                                            <option value="과장">과장</option>
                                        </select>
                                    </div>
                                    <spring:hasBindErrors name="memberVO">

                                        <c:if test="${errors.hasFieldErrors('position') }">                                     
                                           <strong>${errors.getFieldError( 'position' ).defaultMessage }</strong>
                                        </c:if>
                                        </spring:hasBindErrors>
                                </div>



                                <input type="submit" value="가입" class="btn btn-primary" id="signupbtn" disabled="true"/>  
                                <input type="button" value="취소" class="btn btn-primary">
                                <hr>
                                
                            </form>
                            <hr>
                          
                            <div class="text-center">
                                <a class="small" href="http://localhost:8080/memberLogin.kaoni">로그인창으로 가기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
<br><br><br>

  </main><!-- End #main -->
<%@include file ="/WEB-INF/views/footer.jsp" %>
</body>
<script type="text/javascript">


function fn_idCheck() {
	
	var id = $("#id").val();
		console.log(id);
		
		$.ajax({
			url : 'idCheck.kaoni',
			type :'POST',
			dataType :'json',
			data : {id},
			success : function(data){
				if(data == 1){
					alert("중복된 아이디입니다");
					 $("#signupbtn").prop("disabled", true);
				        $("#signupbtn").css("background-color", "#aaaaaa");
				}else if(data == 0){
					alert("사용가능한 아이디입니다");
					 $("#signupbtn").prop("disabled", false);
				        $("#signupbtn").css("background-color", "#0D6EFD");
				}
			}
		})
	}
	
function checkPwd() {
    var pw = $('#passwd').val();
    var pw1 = $('#passwd1').val();
  
    if(pw == pw1){
    	 $("#passwd1").css("background-color", "#B0F6AC");
         $("#signupbtn").prop("disabled", false);
         $("#signupbtn").css("background-color", "#0D6EFD");
    }
     else if (pw != pw1 ) {
        $("#signupbtn").prop("disabled", true);
        $("#signupbtn").css("background-color", "#aaaaaa");
        $("#passwd1").css("background-color", "#FFCECE");
    } 
    }
</script>
</html>