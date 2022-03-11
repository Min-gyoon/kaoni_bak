<%@page import="com.kaoni.Board.VO.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
                         <c:forEach items="${list}" var="BoardVO">
                            <tr>
                                <td>${BoardVO.getEmnum()}</td>
                                <td>${BoardVO.getRegdate()}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
</body>
</html>