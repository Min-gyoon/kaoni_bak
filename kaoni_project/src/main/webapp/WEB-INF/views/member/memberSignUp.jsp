<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<html>
<head>
<title></title>
 <%@include file ="/WEB-INF/views/header.jsp" %>
</head>

<body>
  <main id="main" style="padding-top:90px">
		<form method="post" name ="userinfo" action="memberSignUp1.kaoni">
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
                <td><form:errors path="pw" cssClass="error"/></td>

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
            <td id="title">부서</td>
            <td>
            <select name="Dname">
                    <option value=""></option>
                    <option value="SS개발부">SS개발부</option>
                    <option value="ES개발부">ES개발부</option>
                    <option value="경영지원실">경영지원실</option>
                    <option value="사업부">사업부</option>
                </select>
            </td>
            </tr>
            <tr>
            <td id ="title">직책</td>
            <td>
            <select name="position">
                    <option value=""></option>
                    <option value="사원">사원</option>
                    <option value="대리">대리</option>
                    <option value="팀장">팀장</option>
                    <option value="과장">과장</option>
                </select>
            </td>
                
            </tr>
        </table>
        <br>
        <input type="submit" value="가입"/>  <input type="button" value="취소">
    </form>
  </main><!-- End #main -->
<%@include file ="/WEB-INF/views/footer.jsp" %>
</body>

</html>