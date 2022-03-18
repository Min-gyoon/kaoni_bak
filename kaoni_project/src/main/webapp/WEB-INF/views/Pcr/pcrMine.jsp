<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
    <%@ page import="java.util.List" %>  
<%@ page import="com.kaoni.pcr.VO.PcrVO"%>  
<!DOCTYPE html>  
<html>  
<head>  
 
<style type="text/css">  
  
  
table tr td {  
border: 1px solid rgba(255, 0, 0, 2);  
border-right: none;  
border-top: none;  
border-left: none;  
border-color: black   
}  
  
  
</style>  
<script>  
function selectMember(pnum){  
  
var id = pnum.id;  
$("#pnum").val(id);  
  
$("#mineform").attr({  
"action":"/PcrUpdateForm.kaoni",  
"method":"GET",  
"enctype":"application/x-www-form-urlencoded"  
}).submit();  
}  
  
</script>  
<meta charset="UTF-8">  
<title>Insert title here</title>  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/journal/bootstrap.min.css" integrity="sha384-QDSPDoVOoSWz2ypaRUidLmLYl4RyoBWI44iA5agn6jHegBxZkNqgm2eHb6yZ5bYs" crossorigin="anonymous"> 
<%@include file ="/WEB-INF/views/header.jsp" %>  
  
</head>  
<body>  
<main style="padding-top:110px">  
<form id="mineform" name="mineform">  
<table  align="center" class="pcrmine" style="width:70%; text-align:center;">  
  
  <tr class="table-info">  
    <th>자가격리기간</th>  
    <th>치료여부</th>  
  </tr>  

<c:forEach items="${listmine}" var="PcrVO">
  <tr id={listmine.id} style="cursor: pointer;" onclick="selectMember(this)">    
  <td><${PcrVO.getIsolea()} ~ ${PcrVO.getIsoleb()}</td>  
  <td>${PcrVO.getPoutcome()}</td>  
  </tr>  
      </c:forEach>
  <tr>  
  <td><input type="hidden" id ="pnum" name="pnum"></td>  
  </tr>  
  </table>  
  </form>  
</main>  
<%@include file ="/WEB-INF/views/footer.jsp" %>  
</body>  
</html>