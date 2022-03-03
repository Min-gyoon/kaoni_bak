<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%String id = (String)session.getAttribute("member");  %>
<h4>세션 아이디 :<%=id%></h4>
<h4>세션 아이디 : ${member}</h4>
</body>
</html>