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
<script>
$(document).ready(function(){
	$(document).on("click", "#searchbtn", function(){
		console.log("click searchbtn");
		$("#searchform").attr({
			"action":"pcrSearch.kaoni",
			"method":"GET",
			"enctype":"application/x-www-form-urlencoded"				
		}).submit();
	});
	});

</script>
<style type="text/css">


table tr td {
border: 1px solid rgba(255, 0, 0, 2);
border-right: none;
border-top: none;
border-left: none;
border-color: black 
}


</style>

<body>
<% 
int pageSize = 0;
int groupSize = 0;
int curPage = 0;
int totalCount = 0;


Object obj = request.getAttribute("listAll");
List<PcrVO> list = (List)obj;

Object obj2 = request.getAttribute("pagingVO");
PcrVO pvo2 = (PcrVO)obj2;
MemberVO mvo;

pageSize = Integer.parseInt(pvo2.getPageSize());
groupSize = Integer.parseInt(pvo2.getGroupSize());
curPage = Integer.parseInt(pvo2.getCurPage());
totalCount = Integer.parseInt(pvo2.getTotalCount());
%>
<!-- 폼태그 넘기는 함수 하나 만들고 컨트롤러 하나 만들고 받아온 리스트 넘기는 jsp 하나 만들기.  -->
  <main id="main" style="padding-top:95px">
  <div id="wrap">
  <form id ="searchform" >
  
<table  align="center" class="selectall" style="width:80%;text-align:center;" >
<thead>

<tr>
	<td  colspan="2"></td>
	<td  colspan="2"></td>
	<td style="text-align:right"> <input type="text" id="search" name="search"></td>
	<td><input type="button" id="searchbtn" value="검색"></td>
	</tr>
	
  <tr class="table-info">
    <th style="width:20%;">이름</th>
    <th style="width:20%;">직책</th>
    <th style="width:20%;">부서</th>
    <th style="width:25%;">자가격리기간</th>
    <th style="width:15%;">확진여부</th>
  </tr>
  
  <%

for(int i = 0; i < list.size(); i++){

PcrVO pvo1 = list.get(i);
mvo = pvo1.getMemberVO();
String isolea = pvo1.getIsolea().split("\\s+")[0];
String isoleb = pvo1.getIsoleb().split("\\s+")[0];
String outcome = pvo1.getPoutcome();




%>
  <tr>
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
</form>
</div>
	
  </main><!-- End #main -->
<%@include file ="/WEB-INF/views/footer.jsp" %>


</body>

</html>