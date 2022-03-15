<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<%@ page import="com.kaoni.pcr.VO.PcrVO"%>
<!DOCTYPE html>
<html>
<head>
<%
Object obj = request.getAttribute("listmine");
List<PcrVO> list = (List)obj;
%>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file ="/WEB-INF/views/header.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/journal/bootstrap.min.css" integrity="sha384-QDSPDoVOoSWz2ypaRUidLmLYl4RyoBWI44iA5agn6jHegBxZkNqgm2eHb6yZ5bYs" crossorigin="anonymous">
</head>
<body>
<main style="padding-top:110px">
<table  align="center" class="pcrmine">

  <tr class="table-info">
    <th>번호</th>
    <th>자가격리기간</th>
    <th>치료여부</th>
  </tr>
  <%
for(int i=0; i <list.size(); i++){
	PcrVO pvo = list.get(i);
	String isolea = pvo.getIsolea().split("\\s+")[0];
	String isoleb = pvo.getIsoleb().split("\\s+")[0];
%>
  <tr class="table-success" onclick="">
  	<td><%=i+1 %></td>
  	<td><%=isolea%> ~ <%=isoleb %></td>
  	<td><%=pvo.getPoutcome() %></td>
  </tr>
  <%
}
  %>
  </table>
</main>
<%@include file ="/WEB-INF/views/footer.jsp" %>
</body>
</html>