<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>비밀번호 확인</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

<!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
   <link href="./resources/css/sb-admin-2.min.css" rel="stylesheet">
  
  <!-- Template Main CSS File -->  
  
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>  
<!-- include summernote css/js -->  
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">  
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>  
  

</head>

<body>

<body class="bg-gradient-primary">
  <!-- ======= Header ======= -->

<div class="container" >

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9" style="margin-top: 200px;" >

                <div class="card o-hidden border-0 shadow-lg my-5" >
                    <div class="card-body p-0" style="width: 810px;">
                        <!-- Nested Row within Card Body -->
                        <div class="row" >
                            
                            <div class="col-lg-6" style="margin-left: 250px; ">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">비밀번호 확인</h1>
                                    </div>
                                    <form name="frm" method="post" action="updateInfo_pwCheck1.kaoni" onsubmit="return login()" class="user">
                                        
                                        <div class="form-group">
                                            
<input type="text" id="id" name="id" class="form-control form-control-user"  value="${member}" readonly="readonly"/>
                                        </div>
                                        <div class="form-group">
                                             <input type="password" placeholder="비밀번호 확인" id="password" name="passwd" class="form-control form-control-user" />
                                        </div>
                                        
                                        <input type="submit" value="Check" class="btn btn-lg btn-success btn-block">
                                     
                                    </form>
                                    <hr>
                                   
                                    <div class="text-center">
                                        <a class="small" href="#">회원가입</a>&nbsp;&nbsp;&nbsp;
                                         <a class="small" href="#">돌아가기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

 <footer>
 <%@include file ="/WEB-INF/views/footer.jsp" %>
 </footer>




</body>

</html>