<!DOCTYPE html>
<%@ page import="java.util.List" %>
<%@ page import="com.kaoni.pcr.VO.PcrVO"%> 
<%@ page import="com.kaoni.Member.VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>내 감염 정보 모두보기</title>

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

Object obj = request.getAttribute("listmine");
List<PcrVO> list = (List)obj;
PcrVO pvo = null;
System.out.println("pcrminejsp---->"+list.size());
%>
<script>   
function selectMember(pnum){   
   
var id = pnum.id;   
$("#pnum").val(id);   
   
$("#mineform").attr({   
"action":"/PcrUpdateForm.kaoni",   
"method":"GET",   
"enctype":"application/x-www-form-urlencoded"   
}).submit();   
}   
   
</script> 
</head>
<body>
<header  style="float:left;">
<%@include file ="/WEB-INF/views/header2.jsp" %>
        </header>
                <!-- Begin Page Content -->
                <div class="container-fluid" style="width:80%; display:inline-block; margin-top: 20px;">
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">내 감염 정보 모두보기</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive" style="overflow-x:hidden;">
                            <form id="mineform" name="mineform">   
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align:center;">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>자가격리기간</th>
                                            <th>치료여부</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                      <%   
                                      System.out.println("2");
										for(int i=0; i <list.size(); i++){   
											System.out.println("3");
											 pvo = list.get(i);   
										String isolea = pvo.getIsolea().split("\\s+")[0];   
										String isoleb = pvo.getIsoleb().split("\\s+")[0];
										System.out.println("4");
										%> 
                                   <tr id="<%=pvo.getPnum() %>" style="cursor: pointer;" onclick="selectMember(this)">   
  									<td><%=i+1 %></td>   
  									<td><%=isolea%> ~ <%=isoleb %></td>   
  									<td><%=pvo.getPoutcome() %></td>   
  									</tr> 
<%
}
%>
									</tbody>
                                </table>
                                <input type="hidden" id ="pnum" name="pnum">
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