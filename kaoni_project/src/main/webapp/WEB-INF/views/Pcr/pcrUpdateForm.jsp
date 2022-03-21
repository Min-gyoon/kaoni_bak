<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.List" %> 
<%@ page import="com.kaoni.pcr.VO.PcrVO"%>  

<html>
<head>
	
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>내 감염정보 수정하기</title>
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
"action":"pcrUpdate.kaoni",  
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

<% 
Object obj = request.getAttribute("list"); 
List<PcrVO> list = (List)obj; 
PcrVO pvo = list.get(0); 
String isolea = pvo.getIsolea().split("\\s+")[0]; 
String isoleb = pvo.getIsoleb().split("\\s+")[0]; 
%> 
<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">감염 정보 입력하기</h1>
                            </div>
                            <form name="jindan" id="jindan">
                                      <div class="form-group">
                                            <div>
                                               &emsp;<input type="checkbox"  name="poutcome" value="Y" onclick='checkOnlyOne(this)'>
												<label>양성</label> &emsp;&emsp;
												<input type="checkbox"  name="poutcome"  value="N" onclick='checkOnlyOne(this)'>
                                                <label>음성</label>
                                            </div>
                                            </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user"
                                           autocomplete="off" name="isolea" id="isolea" value="<%=isolea %>">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user"
                                            onchange='checkday()' autocomplete="off" name="isoleb" id="isoleb" value="<%=isoleb %>">
                                    </div>
                                </div>
                                    <div class="form-group">
                                    <textarea class="form-control form-control-user" name="pcontent" id="pcontent" maxlength="1000"
                                        placeholder="특이사항"><%=pvo.getPcontent() %></textarea>
                                </div>
                                <input type="button" id="pcrbtn" value="제출하기" class="btn btn-primary btn-user btn-block">
                                  	    <input type="hidden" id="deleteyn" name="deleteyn" value="<%=pvo.getDeleteyn() %>"> 
										<input type="hidden" id="pnum" name="pnum" value="<%=pvo.getPnum() %>"> 
										<input type="hidden" id="emnum" name="emnum" value="<%=pvo.getEmnum() %>"> 
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