<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kaoni.pcr.VO.PcrVO"%> 
<%@ page import="com.kaoni.Member.VO.MemberVO"%>
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
  //세션, 쿼리 조인 후 직책 부서 추가. 
  
Object obj = request.getAttribute("listAll");
List<PcrVO> list = (List)obj;
MemberVO mvo;
for(int i = 0; i < list.size(); i++){
PcrVO pvo = list.get(i);
mvo = pvo.getMemberVO();
String isolea = pvo.getIsolea().split("\\s+")[0];
String isoleb = pvo.getIsoleb().split("\\s+")[0];
String outcome = pvo.getPoutcome();
System.out.println("isolea--->"+isolea);

%>
  <tr class="table-success">
  <!--  
    <td><input type="text" value="<%--mvo.getName() --%>"></td>
    <td><input type="text" value="<%--mvo.getPosition() --%>"></td>
    <td><input type="text" value="<%--mvo.getDname() --%>"></td>
    <td><input type="text" value="<%--isolea --%>"> ~ <input type="text" value="<%--isoleb --%>"></td>
    <td><%-- outcome--%></td>
    -->
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

	</div>
  </main><!-- End #main -->
<%@include file ="/WEB-INF/views/footer.jsp" %>


</body>

</html>