<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "com.kaoni.Member.VO.MemberVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	Object obj = request.getAttribute("listAll");
	
	List<MemberVO> list = (List)obj;
	int count = list.size();

%>
<title>Insert title here</title>
</head>
<body>

</body>
</html>