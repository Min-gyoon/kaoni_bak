<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table { table-layout:fixed; }
.shitcss {width:300px;}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
$(document).ready(function(){
$(document).on("click", "#btn", function(){
	console.log("click btn");
	$("#selfform").attr({
		"action":"selfInsert.kaoni",
		"method":"GET",
		"enctype":"application/x-www-form-urlencoded"				
	}).submit();
});
});
/*
var nCnt=0;
function listcount(name){
	문제가 해제 했다가 다시하면 또 ++가 되어서 계속 추가됨.. 이거 나중에 해결하자. 
	var name =  $(name).attr("name");
	var test = document.getElementsByName(name)[0].value;
	if(test === 'Y'){
		nCnt = parseInt(nCnt)+1;	
	}else if(test==='N'||"NaN"){
		nCnt = parseInt(nCnt)-1;
	}
	console.log(nCnt);
	nCnt = document.getElementById("sCnt").value;
	
	nCnt = parseInt(nCnt)+1;	
	console.log("nCnt->>"+nCnt);
	$('#sCnt').val(nCnt);
}
function listminuscount(){
	nCnt = parseInt(nCnt)-1;	
	console.log("nCnt->>"+nCnt);
	$('#sCnt').val(nCnt);
}
var sCnt=0;
function test(sname){
	var testname = $(sname).attr("name");	

	for(var i=0; i<2; i++){
	if($("input[name="+testname+"]")[i].checked==true){
		if($("input[name="+testname+"]")[i].val()=='Y'){
			sCnt = parseInt(sCnt)+1;
		$("#sCnt").val(sCnt);	
		}//first if
	}//second if
	
	}// for
}//test
*/

function checkOnlyOne(element) {
	var clickname =  $(element).attr("name");
	  const checkboxes 
	      = document.getElementsByName(clickname);
	  checkboxes.forEach((cb) => {
	    cb.checked = false;
	  })
	  
	  element.checked = true;
	}
	
	</script>
</head>
<body>
<form id="selfform" name="selfform">
<table border ="3">
<thead>
  <tr>
    <th rowspan="2">Q1</th>
    <th colspan="2">가족 중 코로나 19확진자 또는 자가격리자가 있습니까?</th>
  </tr>
  <tr>
    <th class="shitcss"><input type="checkbox" name="Selfcheck1" value="Y" onclick='; checkOnlyOne(this)'>예</th>
    <th class="shitcss"><input type="checkbox" name="Selfcheck1" value="N" onclick='; checkOnlyOne(this)'>아니오</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="2">Q2</td>
    <td colspan="2">밀접 접촉을 한 사람들 중 코로나19 확진자 또는 질병관리본부 자가격리 대상자가 있습니까?</td>
  </tr>
  <tr>
    <td class="shitcss"><input type="checkbox" name="Selfcheck2" value="Y" onclick=' checkOnlyOne(this)'>예</td>
    <td class="shitcss"><input type="checkbox" name="Selfcheck2" value="N" onclick=' checkOnlyOne(this)'>아니오</td>
  </tr>
  <tr>
    <td rowspan="2">Q3</td>
    <td colspan="2">질병 관리 본부 접촉관리 대상자로 전화 혹은 문자를 받은 적이 있습니까?</td>
  </tr>
  <tr>
    <td class="shitcss"><input type="checkbox" name="Selfcheck3" value="Y" onclick=' checkOnlyOne(this) '>예</td>
    <td class="shitcss"><input type="checkbox" name="Selfcheck3" value="N" onclick=' checkOnlyOne(this)'>아니오</td>
  </tr>
  <tr>
    <td rowspan="2">Q4</td>
    <td colspan="2">최근 14일 다중이용시설에 방문해 이용하셨습니까?</td>
  </tr>
  <tr>
    <td class="shitcss"><input type="checkbox" name="Selfcheck4" value="Y" onclick=' checkOnlyOne(this) '>예</td>
    <td class="shitcss"><input type="checkbox" name="Selfcheck4" value="N" onclick=' checkOnlyOne(this)'>아니오</td>
  </tr>
  <tr>
    <td rowspan="2">Q5</td>
    <td colspan="2">최근 체온 측정에서 37.5도 이상이 나온적이 있습니까?</td>
  </tr>
  <tr>
    <td class="shitcss"><input type="checkbox" name="Selfcheck5" value="Y" onclick=' checkOnlyOne(this) '>예</td>
    <td class="shitcss"><input type="checkbox" name="Selfcheck5" value="N" onclick=' checkOnlyOne(this)'>아니오</td>
  </tr>
  <tr>
    <td rowspan="2">Q6</td>
    <td colspan="2">최근 새로 시작되거나 악화 된 기침, 콧물, 인후통 등의 호흡기 증상이 있습니까?</td>
  </tr>
  <tr>
    <td class="shitcss"><input type="checkbox" name="Selfcheck6" value="Y" onclick=' checkOnlyOne(this) '>예</td>
    <td class="shitcss"><input type="checkbox" name="Selfcheck6" value="N" onclick=' checkOnlyOne(this)'>아니오</td>
  </tr>
</tbody>
</table>
	<!--  <input type="hidden" id="sCnt" name="sCnt" value="">-->
	<input type="button" id="btn" value="제출하기">
</form>
</body>
</html>