<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            
            <div class="form-group">
            <label for="name" class="cols-sm-2 control-label">Password</label>
            	<div class="cols-sm-10">
            		<div class="input-group">
            <input type="password" id="passwd" name="passwd" maxlength="15" class="form-control" 
            oninput="checkPwd()" placeholder="Enter your Password">
           
            		</div> <div class="pwCheck"></div>
            	</div>
            </div>
                
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
            </div>  
        <input type="submit" value="가입" class="btn btn-primary" id="signupbtn"/>  
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
    
    var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
   /*  if(pw != pw1 && false === reg.test(pw)) {
    	document.getElementById('pwCheck').innerHTML = "비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.";#
    	
    	}else {
    	console.log("통과");
    	} */

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