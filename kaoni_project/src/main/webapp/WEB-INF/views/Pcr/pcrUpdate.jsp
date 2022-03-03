<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
    $("#isolea, #isoleb").datepicker();
  });
$(document).on("click", "#pcrbtn", function(){
	$("#jindan").attr({
		"action":"pcrInsert.kaoni",
		"method":"GET",
		"enctype":"application/x-www-form-urlencoded"				
	}).submit();
});
$(document).on("click", "#curebtn", function(){
	document.getElementsByName('putoutcome').value("N");
	alert("제출하기를 눌러주세요.");
	
});//curebtn click
});
function checkOnlyOne(element) {
	  
	  const checkboxes 
	      = document.getElementsByName("poutcome");
	  
	  checkboxes.forEach((cb) => {
	    cb.checked = false;
	  })
	  
	  element.checked = true;
	}

</script>
<style type="text/css">
table {
	width: 100%;
	border: 1px solid #444444;
}

th, td {
	border: 1px solid #444444;
}

body {
	width: 100%;
}

#submit {
	align: right;
}
</style>
<meta charset="UTF-8">
<title>코로나 진단표</title>
</head>
<body>
	<form name="jindan" id="jindan">
		<input type="hidden" name="enmum" id="enmum">
		<table>
			<thead>
				<tr>
					<th colspan="3">코로나 진단표</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>검사 결과</td>
					<td><input type="checkbox" name="poutcome" value="Y"
						onclick='checkOnlyOne(this)'>양성</td>
					<td><input type="checkbox" name="poutcome" value="N"
						onclick='checkOnlyOne(this)'>음성</td>
				</tr>
				<tr>
					<td>자가격리기간</td>
					<td>시작일: <input type="text" id="isolea" name="isolea" readonly></td>
					<td>종료일: <input type="text" id="isoleb" name="isoleb"></td>
				</tr>
				<tr>
					<td>특이사항</td><!-- -->
					<td colspan="2"><textarea rows="4" cols="50" id="pcontent" name="pcontent" ></textarea></td>
				</tr>
			</tbody>
		</table>
		<div style='width: 80px; float: right;'>
			<input type="button" id="pcrbtn" value="제출하기">
			<input type="button" id="curebtn" value="치료완료">
		</div>
	</form>
</body>
</html>