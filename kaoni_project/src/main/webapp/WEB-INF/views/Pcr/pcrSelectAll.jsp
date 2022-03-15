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
  <main id="main" style="padding-top:85px">
  <div id="wrapper">
<table  align="center" class="selectall">
<thead>
  <tr class="table-info">
    <th>이름</th>
    <th>직책</th>
    <th>부서</th>
    <th>자가격리기간</th>
    <th>확진여부</th>
  </tr>
  <%

for(int i = 0; i < list.size(); i++){

PcrVO pvo1 = list.get(i);
mvo = pvo1.getMemberVO();
String isolea = pvo1.getIsolea().split("\\s+")[0];
String isoleb = pvo1.getIsoleb().split("\\s+")[0];
String outcome = pvo1.getPoutcome();




%>
  <tr class="table-success">
    <td><%=mvo.getName() %></td>
    <td><%=mvo.getPosition() %></td>
    <td><%=mvo.getDname() %></td>
    <td><%=isolea %> ~ <%=isoleb %></td>
    <td><%= outcome%></td>
  </tr>
<%
}
%>
<tr>
<td colspan="6">
				<jsp:include page="pcrPaging.jsp" flush="true">
					<jsp:param name="url" value="pcrSelectAll.kaoni" />
					<jsp:param name="str" value=""/>
					<jsp:param name="curPage" value="<%=curPage %>" />
					<jsp:param name="pageSize" value="<%=pageSize %>" />
					<jsp:param name="groupSize" value="<%=groupSize %>" />
					<jsp:param name="totalCount" value="<%=totalCount %>" />
				</jsp:include>
</td>
</tr>
</table>
<!-- /WEB-INF/views/Pcr/pcrPaging.jsp? -->

	</div>
  </main><!-- End #main -->
<%@include file ="/WEB-INF/views/footer.jsp" %>


</body>

</html>