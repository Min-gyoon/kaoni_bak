<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<script type="text/javascript">
function checkValue()
{
    if(!document.userInfo.id.value){
        alert("아이디를 입력하세요.");
        return false;
    }
    
    if(!document.userInfo.password.value){
        alert("비밀번호를 입력하세요.");
        return false;
    }
    
    // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
    if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
        alert("비밀번호를 동일하게 입력하세요.");
        return false;
    }
}


출처: https://all-record.tistory.com/114 [세상의 모든 기록]
</script>

<div id="wrap">
        <br><br>
        <b><font size="6" color="gray">회원가입</font></b>
        <br><br><br>
        <form method="post" name ="userinfo" action="memberSignUp2.kaoni">
        <input type="hidden" name="emnum" id="emnum">
            <table>
                <tr>
                    <td id="title">아이디</td>
                    <td>
                        <input type="text" name="id" maxlength="20">
                        <input type="button" value="중복확인" >    
                    </td>
                  
                </tr>
                        
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="passwd" maxlength="15">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">비밀번호 확인</td>
                    <td>
                        <input type="password" name="password" maxlength="15">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이름</td>
                    <td>
                        <input type="text" name="name" maxlength="40">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">성별</td>
                    <td>
                        <input type="radio" name="gender" value="남" checked>남
                        <input type="radio" name="gender" value="여" checked>여
                    </td>
                </tr>
                <tr>
                <td id ="title">직책</td>
                <td>
                <select name="position">
					    <option value=""></option>
					    <option value="학생">사원</option>
					    <option value="회사원">대리</option>
					    <option value="팀장">팀장</option>
					    <option value="기타">과장</option>
					</select>
                </td>
					
                </tr>
            </table>
            <br>
            <input type="submit" value="가입"/>  <input type="button" value="취소">
        </form>
    </div>


</body>
</html>