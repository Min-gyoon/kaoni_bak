<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kaoni.pcr.VO.PcrVO"%> 
<!DOCTYPE html>
<html>

<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/journal/bootstrap.min.css" integrity="sha384-QDSPDoVOoSWz2ypaRUidLmLYl4RyoBWI44iA5agn6jHegBxZkNqgm2eHb6yZ5bYs" crossorigin="anonymous">
 <%@include file ="/WEB-INF/views/header.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	$.datepicker.setDefaults({
    	dateFormat: 'yy-mm-dd',
    	prevText: '이전 달',
    	nextText: '다음 달',
    	monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    	dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    	showMonthAfterYear: true,
    	yearSuffix: '년'
  });
$(function() {
    $("#isoleb").datepicker();
  });
$(document).on("click", "#pcrbtn", function(){
	$("#jindan").attr({
		"action":"pcrUpdate.kaoni",
		"method":"GET",
		"enctype":"application/x-www-form-urlencoded"				
	}).submit();
});
$(document).on("click", "#curebtn", function(){
	 document.getElementById("poutcome").value="N"; 
	 document.getElementById("deleteyn").value="Y"; 
	 $("#jindan").attr({
			"action":"pcrUpdate.kaoni",
			"method":"GET",
			"enctype":"application/x-www-form-urlencoded"				
		}).submit();
	alert("완치로 저장하겠습니다.");
	
});//curebtn click
});

</script>
<title>코로나 진단표 수정</title>


  <!-- bootswatch journal-->

<script type="text/javascript">
</script>
</head>

<body>
  <main id="main" style="padding-top:85px">
		  <%
  //세션, 쿼리 조인 후 직책 부서 추가. 
  
Object obj = request.getAttribute("list");
List<PcrVO> list = (List)obj;
PcrVO pvo = list.get(0);
String isolea = pvo.getIsolea().split("\\s+")[0];
String isoleb = pvo.getIsoleb().split("\\s+")[0];

%>
	<form name="jindan" id="jindan">
		<input type="hidden" name="emnum" id="emnum" value="<%=pvo.getEmnum()%>">
		<table align="center" class="pcrupdatetable">

			<thead>
				<tr class="table-info">
					<th colspan="3">코로나 진단표</th>
				</tr>
			</thead>
			<tbody>
				<tr class="table-success">
					<td>검사 결과</td>
					<td colspan="2"><input type="text" id="poutcome" name="poutcome" value="<%= pvo.getPoutcome()%>"></td>
				</tr>
				<tr class="table-success">
					<td>자가격리기간</td>
					<td>시작일: <input type="text" id="isolea" name="isolea" value="<%=isolea %>" readonly></td>
					<td>종료일: <input type="text" id="isoleb" name="isoleb" value="<%=isoleb %>"></td>
				</tr>
				<tr class="table-success">
					<td>특이사항</td><!-- -->
					<td colspan="2"><textarea rows="4" cols="50" id="pcontent" name="pcontent"><%=pvo.getPcontent() %></textarea></td>
				</tr>
			</tbody>
		</table>
		<div style='width: 80px; float: right;'>
			<input type="button" id="pcrbtn" value="제출하기">
			<input type="button" id="curebtn" value="치료완료">
			<input type="hidden" id="deleteyn" name="deleteyn" value="<%=pvo.getDeleteyn() %>">
		</div>
	</form>

	
  </main><!-- End #main -->

<%@include file ="/WEB-INF/views/footer.jsp" %>

</body>

</html>