<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
.board_title {

	font-weight : 700;

	font-size : 22pt;

	margin : 10pt;

}

.board_info_box {

	color : #6B6B6B;

	margin : 10pt;

}

.board_author {

	font-size : 10pt;

	margin-right : 10pt;

}

.board_date {

	font-size : 10pt;

}

.board_content {

	color : #444343;

	font-size : 12pt;

	margin : 10pt;

}
.bg-white{
	
	width: 1080px;
	margin-left: 100px;
	background-color: #E1F6FA;
}
.board_tag {

	font-size : 11pt;

	margin : 10pt;

	padding-bottom : 10pt;

}
.upde{
	margin-left: 850px;
		font-size: 1.2rem;
}

</style>
</head>

<body>
<header> 
<%@include file ="/WEB-INF/views/header.jsp" %>
</header>
	<article>
		<div style="margin-top: 200px; margin-bottom:50px;"class="container" >
 		<div class="bg-white rounded shadow-sm">
			<div class="board_title"> <c:out value="${data.nbo}"/>&nbsp; 
			<c:out value="${data.title}"/></div>
                        <div class="board_info_box">
                        <span class="board_author">
                        <c:out value="${data.emnum}"/></span>
                        <span class="board_date"><c:out value="${data.regdate}"/></span>
                        </div>
                            <div class="board_content"><c:out value="${data.content}"/></div>
                            
                            <span class="upde">
                    <a href="/UpdatePost.kaoni?nbo=${data.nbo}">수정</a>&nbsp;&nbsp;
                    <a href="/DeletePost.kaoni?nbo=${data.nbo}">삭제</a>
                           </span>
                    </div>    
        </div>
	</article>
<footer> <%@include file ="/WEB-INF/views/footer.jsp" %>      </footer>
</body>

</html>