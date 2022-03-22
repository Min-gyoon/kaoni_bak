<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<meta charset="UTF-8">
<title>게시판</title>

</head>

<body id="page-top" >
<header style="float: left"> 
<%@include file ="/WEB-INF/views/header2.jsp" %>
</header>
    <!-- Page Wrapper -->
    <div id="wrapper"> 
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column"> 
            <!-- Main Content -->
             <div id="content" style="height: 100%;"> 
                <!-- Begin Page Content -->
                <div class="container-fluid"  style="width:70%; display:inline-block; margin-bottom: 135px;">
                    <div class="row">
                        <div class="col-lg-6">

                            <!-- Dropdown Card Example -->
                            <div class="card shadow mb-4" style="width: 1500px; margin-left: 50px; margin-top: 150px; height: 620px;">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary"><c:out value="번호 : ${data.nbo}"/></h6>
                                    <h6 class="m-0 font-weight-bold text-primary"><c:out value="제목 : ${data.title}"/></h6>
                                    <br>
                                    <h6 style="padding-top: 10px;"> <c:out value="작성자 : 관리자"/></h6>

                                      <c:choose>
                        <c:when test="${data.regdate eq data.updatedate}">
                        등록일 : <c:out value="${data.regdate}"></c:out>
                       
                        </c:when>
                         <c:otherwise>
                        등록일 : <c:out value="${data.regdate}"></c:out> &nbsp;&nbsp;
                        수정일 : <c:out value="${data.updatedate}"></c:out>
                        </c:otherwise>
                        </c:choose>
                                   
                                        
                                        <c:choose>
                                        <c:when test="${emnum eq 'EM0000'}">
                                         <div class="dropdown no-arrow" >
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                          <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink" >
                                            <div class="dropdown-header" style="font-size: 0.8rem">정보</div>
                                            <div class="dropdown-divider"></div>
                                            <a href="/UpdatePost.kaoni?nbo=${data.nbo}" style="margin-left: 25px; font-size: 1.0rem; ">수정</a>&nbsp;&nbsp;<br><br>
                            				<a href="/DeletePost.kaoni?nbo=${data.nbo}" style="margin-left: 25px; font-size: 1.0rem; margin-bottom: 15px;">삭제</a>&nbsp;&nbsp;
                                       </div> </div>
                                        </c:when>
                                        <c:otherwise>
                                        </c:otherwise>
                                        </c:choose>
                                      
                                    
                                </div>
                                <!-- Card Body -->
                                <div class="card-body" style="margin-left: 15px; margin-top: 10px;">
                                    <c:out value="${data.content}"/>
                                </div>
                                <a href="/ShowAllPost.kaoni" style="margin-left: 1200px; margin-bottom: 15px;">돌아가기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
             </div>
            <!-- End of Main Content -->
        </div>
     <!--    End of Content Wrapper -->
    </div> 
<footer> <%@include file ="/WEB-INF/views/footer.jsp" %>      </footer>
</body>

</html>