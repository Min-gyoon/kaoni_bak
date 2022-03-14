<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kaoni.pcr.VO.PcrVO"%> 
<%@ page import="com.kaoni.Member.VO.MemberVO"%>

<% 

Object obj = request.getAttribute("listAll");
List<PcrVO> list = (List)obj;

MemberVO mvo;

%>
<!DOCTYPE html>
<html>

<head>
<!-- bootswatch journal-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/journal/bootstrap.min.css" integrity="sha384-QDSPDoVOoSWz2ypaRUidLmLYl4RyoBWI44iA5agn6jHegBxZkNqgm2eHb6yZ5bYs" crossorigin="anonymous">
<title>코로나 진단표</title>
 <%@include file ="/WEB-INF/views/header.jsp" %>
</head>

<body>
  <main id="main" style="padding-top:85px">
  <div id="wrapper">
<table  align="center" class="selectall">
<thead>
  <tr class="table-info">
    <th>이름</th>
    <th>직책</th>
    <th>부서</th>
    <th>자가격리기간</th>
    <th>확진여부</th>
  </tr>
  <%
for(int i = 0; i < list.size(); i++){

PcrVO pvo = list.get(i);
mvo = pvo.getMemberVO();
String isolea = pvo.getIsolea().split("\\s+")[0];
String isoleb = pvo.getIsoleb().split("\\s+")[0];
String outcome = pvo.getPoutcome();

%>
  <tr class="table-success">
    <td><%=mvo.getName() %></td>
    <td><%=mvo.getPosition() %></td>
    <td><%=mvo.getDname() %></td>
    <td><%=isolea %> ~ <%=isoleb %></td>
    <td><%= outcome%></td>
  </tr>
<%
}
%>
</table>
<!-- /WEB-INF/views/Pcr/pcrPaging.jsp? -->

	</div>
  </main><!-- End #main -->
<%@include file ="/WEB-INF/views/footer.jsp" %>


</body>

</html>