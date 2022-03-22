<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>자가진단하기</title>

    <!-- Custom fonts for this template -->
        <!-- Bootstrap core JavaScript-->
    <script src="./resources/vendor/jquery/jquery.min.js"></script>
    <link href="./resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="./resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>
<script type="text/javascript">

$(document).ready(function(){
$(document).on("click", "#btn", function(){
	console.log("click btn");
	$("#selfform").attr({
		"action":"selfInsert.kaoni",
		"method":"GET",
		"enctype":"application/x-www-form-urlencoded"				
	}).submit();
});
});

function checkOnlyOne(element) {
	var clickname =  $(element).attr("name");
	  const checkboxes 
	      = document.getElementsByName(clickname);
	  checkboxes.forEach((cb) => {
	    cb.checked = false;
	  })
	  
	  element.checked = true;
	}
	
	</script>
<body>
<header style="float:left;">
<%@include file ="/WEB-INF/views/header2.jsp" %>
        </header>
                <!-- Begin Page Content -->
                <div class="container-fluid" style="width:80%; display:inline-block; margin-top: 20px;">
                    <!-- DataTales Example -->
                    <div>
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">자가진단하기</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            <form id="selfform" name="selfform">
                                <table class="table table-bordered"  width="100%" cellspacing="0" style="text-align:center;">
                                    <thead>
                                        <tr>
                                            <th>질문</th>
                                            <th>예</th>
                                            <th>아니오</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <tr>
   											<td>가족 중 코로나 19확진자 또는 자가격리자가 있습니까?</td>
										    <td><input type="checkbox" name="Selfcheck1" value="Y" onclick='; checkOnlyOne(this)'></td>
										    <td><input type="checkbox" name="Selfcheck1" value="N" onclick='; checkOnlyOne(this)'></td>
                                        </tr>
                                        <tr>
   											<td>밀접 접촉을 한 사람들 중 코로나19 확진자 또는 질병관리본부 자가격리 대상자가 있습니까?</td>
										    <td><input type="checkbox" name="Selfcheck2" value="Y" onclick='; checkOnlyOne(this)'></td>
										    <td><input type="checkbox" name="Selfcheck2" value="N" onclick='; checkOnlyOne(this)'></td>
                                        </tr>
                                        <tr>
   											<td>질병 관리 본부 접촉관리 대상자로 전화 혹은 문자를 받은 적이 있습니까?</td>
										    <td><input type="checkbox" name="Selfcheck3" value="Y" onclick='; checkOnlyOne(this)'></td>
										    <td><input type="checkbox" name="Selfcheck3" value="N" onclick='; checkOnlyOne(this)'></td>
                                        </tr>
                                        <tr>
   											<td>최근 14일 다중이용시설에 방문해 이용하셨습니까?</td>
										    <td><input type="checkbox" name="Selfcheck4" value="Y" onclick='; checkOnlyOne(this)'></td>
										    <td><input type="checkbox" name="Selfcheck4" value="N" onclick='; checkOnlyOne(this)'></td>
                                        </tr>
                                        <tr>
   											<td>최근 체온 측정에서 37.5도 이상이 나온적이 있습니까?</td>
										    <td><input type="checkbox" name="Selfcheck5" value="Y" onclick='; checkOnlyOne(this)'></td>
										    <td><input type="checkbox" name="Selfcheck5" value="N" onclick='; checkOnlyOne(this)'></td>
                                        </tr>
                                        <tr>
   											<td>최근 새로 시작되거나 악화 된 기침, 콧물, 인후통 등의 호흡기 증상이 있습니까?</td>
										    <td><input type="checkbox" name="Selfcheck6" value="Y" onclick='; checkOnlyOne(this)'></td>
										    <td><input type="checkbox" name="Selfcheck6" value="N" onclick='; checkOnlyOne(this)'></td>
                                        </tr>
									</tbody>
                                </table>
                                </form>
                                 <input type="button" id="btn" value="제출하기"  style="float: right;" class="btn btn-primary btn-icon-split btn-sm">
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>




    <script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="./resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="./resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="./resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="./resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="./resources/js/demo/datatables-demo.js"></script>

</body>

</html>