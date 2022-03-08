<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%String id = (String)session.getAttribute("emnum");  %>
<h4>세션 사번 :<%=id%></h4>
<h4>세션 사번 :${emnum}</h4>
<h4>세션 이름 :${member}</h4>
<a href="http://localhost:8080/memberLogin.kaoni">로그인</a>
<a href="http://localhost:8080/pcrForm.kaoni">코로나진단</a>
 <div id="header" role="banner">상단</div>
  <div id="main" role="main">메인</div>
  <div id="footer" role="contentinfo">하단</div>

</body>
</html>