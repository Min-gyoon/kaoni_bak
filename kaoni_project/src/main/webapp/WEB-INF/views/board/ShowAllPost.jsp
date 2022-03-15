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
</head>
<script type="text/javascript">
</script>
<body>
 <%@include file ="/WEB-INF/views/header.jsp" %>
 <div class="container">
	<div class="row">
		<div class="col-md-9">
                    <table class="table table-list-search" style="margin-top:150px; font-size: 1.0rem;">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                            </tr>
                        </thead>
                        <tbody>
                     <!--  <form id="getNbo"> -->
                         <c:forEach items="${list}" var="BoardVO">
                            <tr>
                                <td>${BoardVO.getNbo()}</td>
                                <td>${BoardVO.getEmnum()}</td>
                                <td><a href="/DetailPost.kaoni?nbo=${BoardVO.getNbo()}">${BoardVO.getTitle()}></a></td> 
                                <td>${BoardVO.getRegdate()}</td>
                                
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

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li style="font-size: 1.5rem;"><a href="/ShowAllPost.kaoni${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li style="font-size: 1.5rem;"><a href="/ShowAllPost.kaoni${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
</div>
                  </div>
	</div>
</div>
  <%@include file ="/WEB-INF/views/footer.jsp" %>                  
</body>
</html>