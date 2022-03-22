<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>게시글 보기</title>
    
    <style type="text/css">
    
    #dataTable_length,#dataTable_filter{
    display:none;
    }
  	.dataTables_paginate, .paging_simple_numbers{
  	margin-left: 350px;
  	}
    
    </style>
</head>

<body id="page-top">
<%@include file ="/WEB-INF/views/header2.jsp" %>
    <!-- Page Wrapper -->
    <div id="wrapper" style="margin-left: 150px;margin-top: 150px;">
        
      

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column" style="width: 1250px; margin-left: 150px;">

            <!-- Main Content -->
            <div id="content" >             
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4" style="width: 1200px;">
                      
                        <div class="card-body" style="width: 1200px;">
                            <div class="table-responsive" style="overflow-x:hidden;">
                                <table class="table table-bordered" id="dataTable"  width="100%" >
                                    <thead>
                                        <tr>
                                      <td style="width: 150px;">중요도</td>
                                             <th style="width: 150px;">번호</th>
                                <th style="width: 150px;">작성자</th>
                                <th >제목</th>
                                <th style="width: 300px;">작성일</th>
                                        </tr>
                                    </thead>
                                   
                                    <tbody>
                     <!--  <form id="getNbo"> -->
                         <c:forEach items="${list}" var="BoardVO">
                            <tr>
                            	<c:choose>
                            	<c:when test="${BoardVO.getImpor() eq 3}">
                            	<td style="display: hidden;">${BoardVO.getImpor()} </td>
                            	<td style="color: red;">${BoardVO.getNbo()}</td>
                                <td style="color: red;">${BoardVO.getEmnum()}</td>
                                <td ><a href="/DetailPost.kaoni?nbo=${BoardVO.getNbo()}" style="color: red;">${BoardVO.getTitle()}</a></td> 
                            	</c:when>
                            	
                            	<c:when test="${BoardVO.getImpor() eq 2}">
                            	<td style="display: hidden;">${BoardVO.getImpor()}  </td>
                            	<td style="color: blue;">${BoardVO.getNbo()}</td>
                                <td style="color: blue;">${BoardVO.getEmnum()}</td>
                                <td ><a href="/DetailPost.kaoni?nbo=${BoardVO.getNbo()}" style="color: blue;">${BoardVO.getTitle()}</a></td> 
                            	</c:when>
                            	<c:otherwise>
                            	<td style="display: hidden;">${BoardVO.getImpor()}  </td>
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
                     <c:choose>
                     <c:when test="${emnum eq 'EM0000'}"> 
                           <button onclick="location='writePost.kaoni'" style="margin-left: 800px; width: 100px; margin-bottom: 15px;" class="btn btn-primary">글쓰기</button>
                     </c:when></c:choose>
  
                        </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    
 <%@include file ="/WEB-INF/views/footer.jsp" %>  
</body>
 </html>
