<%@page import="com.kaoni.Board.VO.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrawpcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
ul{
   list-style:none;
   }
</style>

</head>

<script type="text/javascript">
</script>
<body>
 <%@include file ="/WEB-INF/views/header.jsp" %>
 
 
 <div class="card-body">
		<div class="col-sm-12" style="margin-left: 150px; margin-top: 150px">
                    <table class="table table-bordered dataTable">
                        <thead>
                            <tr >
                                <th>번호</th>
                                <th>작성자</th>
                                <th>제목</th>
                                <th>작성일</th>
                            </tr>
                        </thead>
                        <tbody>
                     <!--  <form id="getNbo"> -->
                         <c:forEach items="${list}" var="BoardVO">
                            <tr>
                            	<c:choose>
                            	<c:when test="${BoardVO.getImpor() eq 3}">
                            	<td style="color: red;">${BoardVO.getNbo()}</td>
                                <td style="color: red;">${BoardVO.getEmnum()}</td>
                                <td ><a href="/DetailPost.kaoni?nbo=${BoardVO.getNbo()}" style="color: red;">${BoardVO.getTitle()}</a></td> 
                            	</c:when>
                            	
                            	<c:when test="${BoardVO.getImpor() eq 2}">
                            	<td style="color: blue;">${BoardVO.getNbo()}</td>
                                <td style="color: blue;">${BoardVO.getEmnum()}</td>
                                <td ><a href="/DetailPost.kaoni?nbo=${BoardVO.getNbo()}" style="color: blue;">${BoardVO.getTitle()}</a></td> 
                            	</c:when>
                            	<c:otherwise>
                            	<td>${BoardVO.getNbo()}</td>
                                <td>${BoardVO.getEmnum()}</td>
                                <td style="color: blue;"><a href="/DetailPost.kaoni?nbo=${BoardVO.getNbo()}">${BoardVO.getTitle()}</a></td> 
                            	</c:otherwise>
                            	</c:choose>
                                
                                <c:choose>
                                <c:when test="${BoardVO.getUpdatedate() eq BoardVO.getRegdate()}">
                               	<td>${BoardVO.getUpdatedate()}</td>
                                </c:when>
                                <c:otherwise>
                                <td> ${BoardVO.getUpdatedate()} (수정)</td>
                                </c:otherwise>
                                </c:choose>
                            </tr>
                        </c:forEach>
                      <!--  </form>  -->
                      <tr>
                      <td> 
                      </td>
                      </tr>
                        </tbody>
                    </table>
<div class="row">
<div class="col-sm-12 col-md-7">
<div class="dataTables_paginate paging_simple_numbers"  id="dataTable_paginate" >
  
  <ul class="pagination">
    <c:if test="${pageMaker.prev}">
    	<li style="font-size: 1.5rem;"><a href="/ShowAllPost.kaoni${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 
 
    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li class="paginate_button page-item active" style="font-size: 1.5rem; margin-right: 7px; "><a href="/ShowAllPost.kaoni${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>
    <div style="margin-left: 385px;">
 </div>
    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li style="font-size: 1.5rem;"><a href="/ShowAllPost.kaoni${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
       <c:choose>
                     <c:when test="${emnum eq 'EM0000'}"> 
                           <button onclick="location='writePost.kaoni'" style="margin-left: 800px; width: 100px; margin-bottom: 15px;" class="btn btn-primary">글쓰기</button>
                     </c:when></c:choose>
  
</div>
</div>
</div>
</div>
</div>
  <%@include file ="/WEB-INF/views/footer.jsp" %>                  
</body>
</html>