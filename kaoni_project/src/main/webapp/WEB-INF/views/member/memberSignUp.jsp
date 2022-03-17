<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
  <!-- Bootstrap CSS --> 
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
  integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
  crossorigin="anonymous">
  
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
strong{
color: red;
}
</style>
</head>

<body>
<%@include file ="/WEB-INF/views/header.jsp" %>
<main id="main" style="padding-top:120px;">

<div class="container">
<div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card">
                        <div class="card-header" style="font-size: 1.1rem">회원가입</div>
                            <div class="card-body">

<form method="post" name ="userinfo" action="memberSignUp1.kaoni" class="form-horizontal">
    
            <div class="form-group">
            <label for="name" class="cols-sm-2 control-label">ID</label>
            	<div class="cols-sm-10">
            		<div class="input-group">
            <input type="text" name="id" id ="id" maxlength="20" class="form-control" placeholder="Enter your ID">
            		</div> 
            		<button type="button" onclick="fn_idCheck();" class="btn btn-primary"
            		style="margin-top: 8px;"
            		>중복 확인</button>
            	</div>
            </div>
           
           <spring:hasBindErrors name="memberVO">

            <c:if test="${errors.hasFieldErrors('id') }">                                     
               <strong>${errors.getFieldError( 'id' ).defaultMessage }</strong>
			</c:if>
			</spring:hasBindErrors>
             
            <div class="form-group">
            <label for="name" class="cols-sm-2 control-label">Password</label>
            	<div class="cols-sm-10">
            		<div class="input-group">
            <input type="password" id="passwd" name="passwd" maxlength="15" class="form-control" 
            oninput="checkPwd()" placeholder="Enter your Password">
           
            		</div> <div class="pwCheck"></div>
            	</div>
            </div>
               <spring:hasBindErrors name="memberVO">

            <c:if test="${errors.hasFieldErrors('passwd') }">                                     
               <strong>${errors.getFieldError( 'passwd' ).defaultMessage }</strong>
			</c:if>
			</spring:hasBindErrors>
            <div class="form-group">
            <label for="name" class="cols-sm-2 control-label">Password Check</label>
            	<div class="cols-sm-10">
            		<div class="input-group">
            <input type="password" id="passwd1" name="passwd1" maxlength="15" class="form-control" 
            oninput="checkPwd()" placeholder="Enter your Password" >
            		</div>
            	</div>
            </div>
                  
            <div class="form-group">
            <label for="name" class="cols-sm-2 control-label">Name</label>
            	<div class="cols-sm-10">
            		<div class="input-group">
            <input type="text" name="name" maxlength="40" class="form-control" placeholder="Enter your Name">
            		</div>
            	</div>
            </div>  
             <spring:hasBindErrors name="memberVO">

            <c:if test="${errors.hasFieldErrors('name') }">                                     
               <strong>${errors.getFieldError( 'name' ).defaultMessage }</strong>
			</c:if>
			</spring:hasBindErrors>
            
            <div class="form-group">
            <label for="name" class="cols-sm-2 control-label">Gender</label>
            	<div class="cols-sm-10">
            		<div class="input-group">
            &nbsp;&nbsp;<input type="radio" name="gender" value="남" checked>남&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="gender" value="여">여
            		</div>
            	</div>
            </div>  
             
            <div class="form-group">
            <label for="name" class="cols-sm-2 control-label">Department</label>
            	<div class="cols-sm-10">
            		<div class="input-group">
            <select name="Dname" class="form-control">
                    <option value="">Choice</option>
                    <option value="SS개발부">SS개발부</option>
                    <option value="ES개발부">ES개발부</option>
                    <option value="경영지원실">경영지원실</option>
                    <option value="사업부">사업부</option>
                </select>
            		</div>
            	</div>
            </div>  
             <spring:hasBindErrors name="memberVO">
            <c:if test="${errors.hasFieldErrors('Dname') }">                                     
               <strong>${errors.getFieldError( 'Dname' ).defaultMessage }</strong>
			</c:if>
			</spring:hasBindErrors>
            <div class="form-group">
            <label for="name" class="cols-sm-2 control-label">Position</label>
            	<div class="cols-sm-10">
            		<div class="input-group">
             <select name="position" class="form-control">
                    <option value="">Choice</option>
                    <option value="사원">사원</option>
                    <option value="대리">대리</option>
                    <option value="팀장">팀장</option>
                    <option value="과장">과장</option>
                </select>
            		</div>
            	</div>
            	 <spring:hasBindErrors name="memberVO">

            <c:if test="${errors.hasFieldErrors('position') }">                                     
               <strong>${errors.getFieldError( 'position' ).defaultMessage }</strong>
			</c:if>
			</spring:hasBindErrors>
            </div>  
        <input type="submit" value="가입" class="btn btn-primary" id="signupbtn" disabled="true"/>  
        <input type="button" value="취소" class="btn btn-primary">
    </form>
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