<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>회원정보 수정</h3>
    <table>
        <form method="post">
              <tr>
                  <td>이름</td>
                  <td></td>
              </tr>
              <tr>
                  <td>부서명</td>
                  <td></td>
              </tr>
              <tr>
                  <td>직책</td>
                  <td><select name="position">
					    <option value=""></option>
					    <option value="학생">사원</option>
					    <option value="회사원">대리</option>
					    <option value="팀장">팀장</option>
					    <option value="기타">과장</option>
					</select></td>
              </tr>
              <tr>
                  <td>ID</td>
                  <td><input type ="text" name ="id" readonly="readonly" value=${id}></td>
              </tr>
              <tr>
                  <td>PW</td>
                  <td><input type="password" name="passwd"></td>
              </tr>
              <tr>
                  <td>PW 확인</td> 
                  <td><input type="password" name="password"></td>
                  <td><input type="button" value="체크"></td>
              </tr>
              <tr>
                  <td></td>
                  <td><button type="submit">수정완료</button></td>
                  
              </tr>
             
        </form>
        </table>
</body>
</html>