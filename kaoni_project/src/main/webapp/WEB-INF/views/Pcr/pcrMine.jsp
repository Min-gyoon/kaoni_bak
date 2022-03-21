<%@ page language="java" contentType="text/html; charset=UTF-8"   
    pageEncoding="UTF-8"%>   
    <%@ page import="java.util.List" %>   
<%@ page import="com.kaoni.pcr.VO.PcrVO"%>   
<!DOCTYPE html>   
<html>   
<head>   
<%   
Object obj = request.getAttribute("listmine");   
List<PcrVO> list = (List)obj;   
%>   
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
    <th>번호</th>   
    <th>자가격리기간</th>   
    <th>치료여부</th>   
  </tr>   
  <%   
for(int i=0; i <list.size(); i++){   
PcrVO pvo = list.get(i);   
String isolea = pvo.getIsolea().split("\\s+")[0];   
String isoleb = pvo.getIsoleb().split("\\s+")[0];   
%>   
  <tr id="<%=pvo.getPnum() %>" style="cursor: pointer;" onclick="selectMember(this)">   
  <td><%=i+1 %></td>   
  <td><%=isolea%> ~ <%=isoleb %></td>   
  <td><%=pvo.getPoutcome() %></td>   
  </tr>   
     
  <%   
}   
  %>   
  <tr>   
  <td><input type="hidden" id ="pnum" name="pnum"></td>   
  </tr>   
  </table>   
  </form>   
</main>   
<%@include file ="/WEB-INF/views/footer.jsp" %>   
</body>   
</html>