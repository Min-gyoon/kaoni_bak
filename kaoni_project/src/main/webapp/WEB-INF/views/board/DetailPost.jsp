<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
$("#update").click(function () {
    $("form").attr("action", "ShowAllPost");
});

$("#delete").click(function () {
    $("form").attr("action", "/ShowAllPost.kaoni");
});

</script>
 <table>
                        <thead>
                            <tr>
                                <th>No.1</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                        
                            <tr>
                               <td><c:out value="${data.nbo}"/></td>
                               <td><c:out value="${data.title}"/></td>
                               <td><c:out value="${data.content}"/></td>
                            </tr>
                            <tr>
                            <td>
                      <a href="/UpdatePost.kaoni?nbo=${data.nbo}">수정</a>
                      <a href="/DeletePost.kaoni?nbo=${data.nbo}">삭제</a>
                            </td>
                            </tr>
                        </tbody>
                    </table>
</body>
</html>