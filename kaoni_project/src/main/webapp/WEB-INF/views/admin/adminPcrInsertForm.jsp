<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>

<html>
<head>
	
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>관리자용 감염정보 입력하기</title>
	<!-- jquery -->
	<script src="./resources/vendor/jquery/jquery.min.js"></script>
    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
	<!-- 데이트피커 -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>  
	<link rel="stylesheet"  
href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">  
    <!-- Custom styles for this template-->
    <link href="./resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>
<script type="text/javascript">  
  
$(document).ready(function(){  
$.datepicker.setDefaults({  
    dateFormat: 'yy-mm-dd',  
    prevText: '이전 달',  
    nextText: '다음 달',  
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],  
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],  
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],  
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],  
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],  
    showMonthAfterYear: true,  
    yearSuffix: '년'  
  });  
  $(function() {  
    $("#isolea, #isoleb").datepicker();  
  });  
$(document).on("click", "#pcrbtn", function(){  
$("#jindan").attr({  
"action":"adminPcrInsert.kaoni",  
"method":"GET",  
"enctype":"application/x-www-form-urlencoded"  
}).submit();  
});  
});  
function checkOnlyOne(element) {  
    
  const checkboxes   
      = document.getElementsByName("poutcome");  
    
  checkboxes.forEach((cb) => {  
    cb.checked = false;  
  })  
    
  element.checked = true;  
}  
function checkday(){  
console.log("checkdat---");  
var a = document.getElementById("isolea").value;  
var b = document.getElementById("isoleb").value;  
date1 = new Date(a);  
date2 = new Date(b);  
if(a==""){  
alert("시작일을 먼저 입력해주세요");  
document.getElementById("isoleb").value = "";  
}  
if(date1 > date2){  
alert("시작일보다 커야합니다");  
document.getElementById("isoleb").value = "";  
}  
}  
</script>  

<body class="bg-gradient-primary">
 <div id="wrapper" style="float:left;">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="http://localhost:8080/">
                <div class="sidebar-brand-icon rotate-n-15">
                </div>
                <div class="sidebar-brand-text mx-3">Kaoni</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">



            <!-- Divider -->
            <hr class="sidebar-divider">

 
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>코로나</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">코로나</h6>
                        <c:choose>
                        <c:when test="${emnum eq 'EM0000'}">
                        <a class="collapse-item" href="adminmain.kaoni">관리자용 사내 코로나 결과</a>
                        </c:when>
                        	
                        <c:otherwise>
                        <a class="collapse-item" href="http://localhost:8080/pcrForm.kaoni">내 코로나 결과 입력하기</a>
                        <a class="collapse-item" href="http://localhost:8080/pcrMine.kaoni">내 코로나 결과 모두보기</a>
                        <a class="collapse-item" href="http://localhost:8080/pcrSelectAll.kaoni">사내 코로나 정보 모두보기</a>
                       </c:otherwise>
                        	
                        </c:choose>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
           
           <c:choose>
           <c:when test="${emnum eq 'EM0000'}"></c:when>
           
           <c:otherwise>
           
            <li class="nav-item">
                <a class="nav-link collapsed" href="http://localhost:8080/pcrSelectAll.kaoni" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities" >
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>자가진단</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">자가진단</h6>
                        <a class="collapse-item" href="http://localhost:8080/selfForm.kaoni">자가진단하기</a>
                        <a class="collapse-item" href="http://localhost:8080/selfSelectAll.kaoni">내 자가진단 결과 모아보기</a>
                    </div>
                </div>
            </li>
            </c:otherwise>
			</c:choose>
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Nav Item - Charts -->
            <li class="nav-item">

                <a class="nav-link" href="ShowAllPost.kaoni">

                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>공지사항</span></a>
            </li>

            <!-- Nav Item - Tables -->
              <c:choose>
            <c:when test="${emnum eq 'EM0000'}">
            </c:when>
            <c:otherwise>
            <li class="nav-item">
                <a class="nav-link" href="updateInfo_pwCheck.kaoni">
                    <i class="fas fa-fw fa-table"></i>
                    <span>내정보 수정</span></a>
            </li>
            </c:otherwise>
            </c:choose>
            <li class="nav-item">
                <a class="nav-link" href="logOut.kaoni">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>로그아웃</span></a>
            </li>
            <c:choose>
            <c:when test="${emnum eq 'EM0000'}">
            <hr class="sidebar-divider d-none d-md-block">
            <li class="nav-item">
                <a class="nav-link" href="adminMemberlist.kaoni">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>회원관리하기(관리자)</span></a>
            </li>
            </c:when>
            <c:otherwise>
            
            </c:otherwise>
            </c:choose>
            

            <!-- Divider -->
            

        </ul>
        </div>
        <!-- End of Sidebar -->
         <div class="container" tyle="width:70%; display:inline-block; margin-left:60px;">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row" style="display:flex;justify-content:center;background:none;">
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">감염 정보 입력하기</h1>
                            </div>
                            <form name="jindan" id="jindan">
                                      <div class="form-group">
                                            <div align="center">
                                               &emsp;<input type="checkbox"  name="poutcome" value="Y" onclick='checkOnlyOne(this)'>
												<label>양성</label> &emsp;&emsp;
												<input type="checkbox"  name="poutcome"  value="N" onclick='checkOnlyOne(this)'>
                                                <label>음성</label>
                                            </div>
                                            </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user"
                                           autocomplete="off" name="isolea" id="isolea" placeholder="자가격리시작일">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user"
                                            onchange='checkday()' autocomplete="off" name="isoleb" id="isoleb" placeholder="자가격리종료일">
                                    </div>
                                </div>
                                    <div class="form-group">
                                    <textarea class="form-control form-control-user" name="pcontent" id="pcontent" maxlength="1000"
                                        placeholder="특이사항"></textarea>
                                </div>
                                 <div class="form-group">
                                        <input type="text" name="emnum" id="emnum" class="form-control" placeholder="사원번호 입력" value=""> 
                                        <input type="hidden" name="deleteyn" id="deleteyn" value="Y"> 
                                    </div>
                                <input type="button" id="pcrbtn" value="제출하기" class="btn btn-primary btn-user btn-block">
                                  	  
                                <hr>

                            </form>
                            <hr>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="./resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="./resources/js/sb-admin-2.min.js"></script>

</body>

</html>