<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>

<title>자가진단</title>

  <!-- bootswatch journal-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/journal/bootstrap.min.css" integrity="sha384-QDSPDoVOoSWz2ypaRUidLmLYl4RyoBWI44iA5agn6jHegBxZkNqgm2eHb6yZ5bYs" crossorigin="anonymous">
 <%@include file ="/WEB-INF/views/header.jsp" %>
<script type="text/javascript">

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

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">

      <h1 class="logo"><a href="http://localhost:8080/">Kaoni</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
	<!-- 헤더 -->
      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto" href="http://localhost:8080/pcrSelectAll.kaoni">pcrselectall</a></li>
          <li><a class="nav-link scrollto " href="http://localhost:8080/pcrForm.kaoni">pcrform</a></li>
          <li><a class="nav-link scrollto" href="http://localhost:8080/selfForm.kaoni">selffrom</a></li>
          <li><a class="nav-link scrollto" href="http://localhost:8080/memberSignUp.kaoni">signup</a></li>
          <li><a class="getstarted scrollto" href="http://localhost:8080/memberLogin.kaoni">login</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <main id="main" style="padding-top:90px">
<form id="selfform" name="selfform">
<table align = "center" class="selfForm" style="height:800px">
<thead>
  <tr class="table-info">
    <th rowspan="2">Q1</th>
    <th colspan="2">가족 중 코로나 19확진자 또는 자가격리자가 있습니까?</th>
  </tr>
  <tr class="table-success">
    <th class="shitcss"><input type="checkbox" name="Selfcheck1" value="Y" onclick='; checkOnlyOne(this)'>예</th>
    <th class="shitcss"><input type="checkbox" name="Selfcheck1" value="N" onclick='; checkOnlyOne(this)'>아니오</th>
  </tr>
</thead>
<tbody>
  <tr class="table-info">
    <td rowspan="2">Q2</td>
    <td colspan="2">밀접 접촉을 한 사람들 중 코로나19 확진자 또는 질병관리본부 자가격리 대상자가 있습니까?</td>
  </tr>
  <tr class="table-success">
    <td class="shitcss"><input type="checkbox" name="Selfcheck2" value="Y" onclick=' checkOnlyOne(this)'>예</td>
    <td class="shitcss"><input type="checkbox" name="Selfcheck2" value="N" onclick=' checkOnlyOne(this)'>아니오</td>
  </tr>
  <tr  class="table-info">
    <td rowspan="2">Q3</td>
    <td colspan="2">질병 관리 본부 접촉관리 대상자로 전화 혹은 문자를 받은 적이 있습니까?</td>
  </tr>
  <tr class="table-success">
    <td class="shitcss"><input type="checkbox" name="Selfcheck3" value="Y" onclick=' checkOnlyOne(this) '>예</td>
    <td class="shitcss"><input type="checkbox" name="Selfcheck3" value="N" onclick=' checkOnlyOne(this)'>아니오</td>
  </tr>
  <tr  class="table-info">
    <td rowspan="2">Q4</td>
    <td colspan="2">최근 14일 다중이용시설에 방문해 이용하셨습니까?</td>
  </tr>
  <tr class="table-success">
    <td class="shitcss"><input type="checkbox" name="Selfcheck4" value="Y" onclick=' checkOnlyOne(this) '>예</td>
    <td class="shitcss"><input type="checkbox" name="Selfcheck4" value="N" onclick=' checkOnlyOne(this)'>아니오</td>
  </tr>
  <tr  class="table-info">
    <td rowspan="2">Q5</td>
    <td colspan="2">최근 체온 측정에서 37.5도 이상이 나온적이 있습니까?</td>
  </tr>
  <tr class="table-success">
    <td class="shitcss"><input type="checkbox" name="Selfcheck5" value="Y" onclick=' checkOnlyOne(this) '>예</td>
    <td class="shitcss"><input type="checkbox" name="Selfcheck5" value="N" onclick=' checkOnlyOne(this)'>아니오</td>
  </tr>
  <tr  class="table-info">
    <td rowspan="2">Q6</td>
    <td colspan="2">최근 새로 시작되거나 악화 된 기침, 콧물, 인후통 등의 호흡기 증상이 있습니까?</td>
  </tr>
  <tr class="table-success">
    <td class="shitcss"><input type="checkbox" name="Selfcheck6" value="Y" onclick=' checkOnlyOne(this) '>예</td>
    <td class="shitcss"><input type="checkbox" name="Selfcheck6" value="N" onclick=' checkOnlyOne(this)'>아니오</td>
  </tr>
</tbody>
</table>
	<input type="button" align="p"id="btn" value="제출하기">
</form>

	
  </main><!-- End #main -->
<%@include file ="/WEB-INF/views/footer.jsp" %>


</body>

</html>