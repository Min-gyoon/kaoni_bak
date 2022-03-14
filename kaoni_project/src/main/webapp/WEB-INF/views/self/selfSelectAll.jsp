
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<%@ page import="java.util.List" %>
<%@ page import="com.kaoni.self.VO.SelfVO"%>
<head>


<title></title>


  <!-- bootswatch journal-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/journal/bootstrap.min.css" integrity="sha384-QDSPDoVOoSWz2ypaRUidLmLYl4RyoBWI44iA5agn6jHegBxZkNqgm2eHb6yZ5bYs" crossorigin="anonymous">
 <%@include file ="/WEB-INF/views/header.jsp" %>

  
<script type="text/javascript">

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
  <%
Object obj = request.getAttribute("listAll");
List<SelfVO> listAll = (List)obj;
SelfVO svo= null;

for(int i=0; i < listAll.size(); i++){
	svo = listAll.get(i);
}


%>
  <main id="main" style="padding-top:85px">
	<form id="selfform" name="selfform">
<table class="selfselectall" align="center">
<thead>
  <tr class="table-info">
    <td rowspan="2">Q1</td>
    <td colspan="2">가족 중 코로나 19확진자 또는 자가격리자가 있습니까?</td>
  </tr>
  <tr class="table-success">
    <td><%= svo.getSelfcheck1() %></td>
  </tr>
</thead>
<tbody>
  <tr class="table-info">
    <td rowspan="2">Q2</td>
    <td colspan="2">밀접 접촉을 한 사람들 중 코로나19 확진자 또는 질병관리본부 자가격리 대상자가 있습니까?</td>
  </tr>
  <tr class="table-success">
    <td><%= svo.getSelfcheck2() %></td>    
  </tr>
  <tr class="table-info">
    <td rowspan="2">Q3</td>
    <td colspan="2">질병 관리 본부 접촉관리 대상자로 전화 혹은 문자를 받은 적이 있습니까?</td>
  </tr>
  <tr class="table-success">
    <td><%= svo.getSelfcheck3() %></td>
  </tr>
  <tr class="table-info">
    <td rowspan="2">Q4</td>
    <td colspan="2">최근 14일 다중이용시설에 방문해 이용하셨습니까?</td>
  </tr>
  <tr class="table-success">
    <td><%= svo.getSelfcheck4() %></td>
  </tr>
  <tr class="table-info">
    <td rowspan="2">Q5</td>
    <td colspan="2">최근 체온 측정에서 37.5도 이상이 나온적이 있습니까?</td>
  </tr>
  <tr class="table-success">
    <td><%= svo.getSelfcheck5() %></td>
  </tr>
  <tr class="table-info">
    <td rowspan="2">Q6</td>
    <td colspan="2">최근 새로 시작되거나 악화 된 기침, 콧물, 인후통 등의 호흡기 증상이 있습니까?</td>
  </tr>
  <tr class="table-success">
    <td><%= svo.getSelfcheck6() %></td>
  </tr>
  
  
    <tr>
    <td rowspan="2"></td>
  </tr>
  <tr class="table-success">
    <td><%= svo.getSelfcheck6() %></td>
  </tr>

</tbody>
</table>
</form>

	
  </main><!-- End #main -->


<%@include file ="/WEB-INF/views/footer.jsp" %>

</body>

</html>