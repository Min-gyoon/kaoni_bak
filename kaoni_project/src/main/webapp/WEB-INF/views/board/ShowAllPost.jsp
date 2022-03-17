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
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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
 <div class="container" style="transform: translateX(13%);">
	<div class="row">
		<div class="col-md-9">
                    <table class="table table-list-search" style="margin-top:150px; font-size: 1.0rem;">
                        <thead>
                            <tr style="background-color: #d2d2d2;">
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
                                <td>${BoardVO.getNbo()}</td>
                                <td>${BoardVO.getEmnum()}</td>
                                <td><a href="/DetailPost.kaoni?nbo=${BoardVO.getNbo()}">${BoardVO.getTitle()}</a></td> 
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
                    <div>
  <ul>
    <c:if test="${pageMaker.prev}">
    	<li style="font-size: 1.5rem;"><a href="/ShowAllPost.kaoni${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

<div style="margin-left: 385px;">
    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li style="font-size: 1.5rem; margin-right: 7px; "><a href="/ShowAllPost.kaoni${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>
</div>
    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li style="font-size: 1.5rem;"><a href="/ShowAllPost.kaoni${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
       <c:choose>
                     <c:when test="${emnum eq 'admin'}"> 
                           <button onclick="location='writePost.kaoni'" style="margin-left: 800px; width: 100px; margin-bottom: 15px;" class="btn btn-primary">글쓰기</button>
                     </c:when></c:choose>
  
</div>
                  </div>
	</div>
</div>

  <%@include file ="/WEB-INF/views/footer.jsp" %>                  
</body>
</html>