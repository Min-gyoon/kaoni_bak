<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kaoni.self.VO.SelfVO"%>
<!DOCTYPE html>
<html>
<head>
<%
Object obj = request.getAttribute("listAll");
List<SelfVO> listAll = (List)obj;
SelfVO svo= null;

for(int i=0; i < listAll.size(); i++){
	svo = listAll.get(i);
}


%>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="selfform" name="selfform">
<table border ="3">
<thead>
  <tr>
    <td rowspan="2">Q1</td>
    <td colspan="2">가족 중 코로나 19확진자 또는 자가격리자가 있습니까?</td>
  </tr>
  <tr>
    <td class="shitcss"><input type="text" name="Selfcheck1" value=<%= svo.getSelfcheck1() %> readonly></td>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="2">Q2</td>
    <td colspan="2">밀접 접촉을 한 사람들 중 코로나19 확진자 또는 질병관리본부 자가격리 대상자가 있습니까?</td>
  </tr>
  <tr>
    <td class="shitcss"><input type="text" name="Selfcheck2" value="<%= svo.getSelfcheck2() %>" readonly></td>    
  </tr>
  <tr>
    <td rowspan="2">Q3</td>
    <td colspan="2">질병 관리 본부 접촉관리 대상자로 전화 혹은 문자를 받은 적이 있습니까?</td>
  </tr>
  <tr>
    <td class="shitcss"><input type="text" name="Selfcheck3" value="<%= svo.getSelfcheck3() %>" readonly></td>
  </tr>
  <tr>
    <td rowspan="2">Q4</td>
    <td colspan="2">최근 14일 다중이용시설에 방문해 이용하셨습니까?</td>
  </tr>
  <tr>
    <td class="shitcss"><input type="text" name="Selfcheck4" value="<%= svo.getSelfcheck4() %>" readonly></td>
  </tr>
  <tr>
    <td rowspan="2">Q5</td>
    <td colspan="2">최근 체온 측정에서 37.5도 이상이 나온적이 있습니까?</td>
  </tr>
  <tr>
    <td class="shitcss"><input type="text" name="Selfcheck5" value="<%= svo.getSelfcheck5() %>" readonly></td>
  </tr>
  <tr>
    <td rowspan="2">Q6</td>
    <td colspan="2">최근 새로 시작되거나 악화 된 기침, 콧물, 인후통 등의 호흡기 증상이 있습니까?</td>
  </tr>
  <tr>
    <td class="shitcss"><input type="text" name="Selfcheck6" value="<%= svo.getSelfcheck6() %>" readonly></td>
  </tr>
</tbody>
</table>
</form>
</body>
</html>