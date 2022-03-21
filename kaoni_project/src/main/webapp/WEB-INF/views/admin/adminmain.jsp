<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kaoni.pcr.VO.PcrVO"%> 
<%@ page import="com.kaoni.Member.VO.MemberVO"%>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>관리자용 감염정보 모두보기</title>

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
	<% 
	  
	Object obj = request.getAttribute("listAll");
	List<PcrVO> list = (List)obj;
	MemberVO mvo;
%>
<script>   
function selectMember(pnum){   
   
	var id = pnum.id;
	
	$("#pnum").val(id);
	
	
   
$("#adminpcrselect").attr({   
"action":"/adminPcrSelect.kaoni",   
"method":"GET",   
"enctype":"application/x-www-form-urlencoded"   
}).submit();   
}   
   
</script> 
</head>
<body>
<%@include file ="/WEB-INF/views/header2.jsp" %>
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">내 감염 정보 모두보기</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            <form id="adminpcrselect" name="adminpcrselect">   
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align:center;">
                                    <thead>
                            <tr>
								<th>사원번호</th>
								<th>이름</th>
								<th>직책</th>
								<th>부서</th>
								<th>자가격리기간</th>
								<th>확진여부</th>
							</tr>
                                    </thead>
                                    <tbody>
                                      <%   
                                      for(int i = 0; i < list.size(); i++){
                                    	  PcrVO pvo = list.get(i);
                                    	  mvo = pvo.getMemberVO();
                                    	  String isolea = pvo.getIsolea().split("\\s+")[0];
                                    	  String isoleb = pvo.getIsoleb().split("\\s+")[0];
                                    	  String outcome = pvo.getPoutcome(); 
                                    	  System.out.println("pnum-->"+pvo.getPnum());
										%>
							<tr id="<%= pvo.getPnum()%>" style="cursor: pointer;"
								onclick="selectMember(this)">
								<td><%=mvo.getEmnum()%></td>
								<td><%=mvo.getName()%></td>
								<td><%=mvo.getPosition()%></td>
								<td><%=mvo.getDname()%></td>
								<td><%=isolea%> ~ <%=isoleb%></td>
								<td><%=outcome%></td>
								<input type="hidden" id="emnum" name="emnum" value="">
								<input type="hidden" id="pnum" name="pnum" value="">
							</tr>
								
							
<%
}
%>
						
						</tbody>
                                </table>
                                </form>
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