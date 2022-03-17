
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<%@ page import="java.util.List" %>
<%@ page import="com.kaoni.self.VO.SelfVO"%>
<head>
<style>
table tr td {
border: 1px solid rgba(255, 0, 0, 2);
border-right: none;
border-top: none;
border-left: none;
border-color: black 
}
.q{
padding-left:85px;
}
</style>
<title></title>
  <!-- bootswatch journal-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/journal/bootstrap.min.css" integrity="sha384-QDSPDoVOoSWz2ypaRUidLmLYl4RyoBWI44iA5agn6jHegBxZkNqgm2eHb6yZ5bYs" crossorigin="anonymous">
 <%@include file ="/WEB-INF/views/header.jsp" %>
<script type="text/javascript">
</script>
</head>
<body>

<main id="main" style="padding-top:90px">
<div class="question" align ="center">
</div>
  
<table  align="center" class="selectall" style="text-algin:center;">
<thead>
  <tr class="table-info">
  	<th>Q1</th>
    <th>Q2</th>
    <th>Q3</th>
    <th>Q4</th>
    <th>Q5</th>
    <th>Q6</th>
    <th>입력일</th>
  </tr>
    <%
Object obj = request.getAttribute("listAll");
List<SelfVO> listAll = (List)obj;
SelfVO svo= null;

for(int i=0; i < listAll.size(); i++){
	svo = listAll.get(i);



%>
 <tr>
  	<td><%=svo.getSelfcheck1() %></td>
    <td><%=svo.getSelfcheck2() %></td>
    <td><%=svo.getSelfcheck3()%></td>
    <td><%=svo.getSelfcheck4()%></td>
    <td><%=svo.getSelfcheck5()%></td>
    <td><%=svo.getSelfcheck6()%></td>
    <td><%=svo.getInsertdate() %></td>
    <%
}
    %>
    </tr>
</table>
<ul class="q">
<li>Q1=가족 중 코로나 19확진자 또는 자가격리자가 있습니까?</li>
<li>Q2=밀접 접촉을 한 사람들 중 코로나19 확진자 또는 질병관리본부 자가격리 대상자가 있습니까?</li>
<li>Q3=질병 관리 본부 접촉관리 대상자로 전화 혹은 문자를 받은 적이 있습니까?</li>
<li>Q4=최근 14일 다중이용시설에 방문해 이용하셨습니까?</li>
<li>Q5=최근 체온 측정에서 37.5도 이상이 나온적이 있습니까?</li>
<li>Q6=최근 새로 시작되거나 악화 된 기침, 콧물, 인후통 등의 호흡기 증상이 있습니까?</li>
</ul>
	
  </main><!-- End #main -->


<%@include file ="/WEB-INF/views/footer.jsp" %>

</body>

</html>