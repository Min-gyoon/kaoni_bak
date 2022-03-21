<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Kaoni</title>

	<!-- jquery -->
	<script src="./resources/vendor/jquery/jquery.min.js"></script>
    <!-- Custom fonts for this template 푸터에 없음-->
    <link href="/resources/vendor/fontawesome-free/css/all.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template 푸터에 있음-->
    <link href="./resources/css/sb-admin-2.min.css" rel="stylesheet">
<script type="text/javascript">
  //코로나현황 데이터 가져오기. 
       function clickrefresh(){
         $.ajax({
            url : 'pcrdata.kaoni',
            dataType : 'json',
            success : function(data){
               document.getElementById('allmember').innerHTML=parseInt(data.allmember)+"명";
               document.getElementById('nowmember').innerHTML = parseInt(data.nowmember)+"명";
               document.getElementById('member').innerHTML = parseInt(data.member)+"명";
               document.getElementById('isolemember').innerHTML = parseInt(data.isolemember)+"명";
            },
            error : function(error){
               console.log(error);
            }   
         });
     }
       function numberWithCommas(x) {
    	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    	}
  $(document).ready(function(){
      
          $.ajax({
             url : 'pcrdata.kaoni',
             dataType : 'json',
             success : function(data){
                document.getElementById('allmember').innerHTML=parseInt(data.allmember)+"명";
                document.getElementById('nowmember').innerHTML = parseInt(data.nowmember)+"명";
                document.getElementById('member').innerHTML = parseInt(data.member)+"명";
                document.getElementById('isolemember').innerHTML = parseInt(data.isolemember)+"명";
             },
             error : function(error){
                console.log(error);
             }   
          });
      
	 
         $.ajax({
            url : 'pcrMain.kaoni',
            dataType : 'json',
            success : function(data2){
               for(var i =0; i< 10; i++){
               var addpcr ="";
               var isole = data2[i].isolea.split(" ")[0]+" ~ "+data2[i].isoleb.split(" ")[0];
               addpcr +="<tr>"
               addpcr +="<td>"+data2[i].memberVO.name+"</td>"
               addpcr +="<td>"+data2[i].memberVO.position+"</td>"
               addpcr +="<td>"+data2[i].memberVO.Dname+"</td>"
               addpcr +="<td>"+isole+"</td>"
               addpcr +="<td>"+data2[i].poutcome+"</td>"               
               addpcr +="</tr>"
               $("#addtable").append(addpcr);
               }
            },
            error : function(error){

               console.log(error);
            }   
         }); 
		       
         	//api data
         $.ajax({
             url : 'jungukdata.kaoni',
             dataType : 'json',
             success : function(data){
          	   var day = data.TbCorona19CountStatus.row[0].S_DT;
                 var hj = data.TbCorona19CountStatus.row[0].SN_HJ;
                 var death = data.TbCorona19CountStatus.row[0].S_DEATH;
                 var jhj = data.TbCorona19CountStatus.row[0].N_HJ;
                 var jdeath =data.TbCorona19CountStatus.row[0].DEATH;
                 hj = numberWithCommas(hj);
                 jhj = numberWithCommas(jhj);
                 death = numberWithCommas(death);
                 jdeath = numberWithCommas(jdeath);
                document.getElementById('hj').innerHTML=hj+"명";
                document.getElementById('death').innerHTML = death+"명";
                document.getElementById('jhj').innerHTML = jhj+"명";
                document.getElementById('jdeath').innerText = jdeath+"명";
                //document.getElementById('day').innerText = day+"기준";
             },
             error : function(error){
                console.log(error);
             }   
          });  
  });//ready
</script>

</head>

<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">

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
                        <a class="collapse-item" href="http://localhost:8080/pcrForm.kaoni">내 코로나 결과 입력하기(로그인시 jstl처리)</a>
                        <a class="collapse-item" href="http://localhost:8080/pcrMine.kaoni">내 코로나 결과 모두보기(로그인시 jstl처리)</a>
                        <a class="collapse-item" href="http://localhost:8080/pcrSelectAll.kaoni">사내 코로나 정보 모두보기</a>
                        <a class="collapse-item" href="http://localhost:8080/adminmain.kaoni">관리자용 사내 코로나 결과(관리자 로그인시 jstl처리)</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
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

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="http://localhost:8080/ShowAllPost.kaoni">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>공지사항</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span>내정보 수정</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>로그아웃</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>회원관리하기(관리자)(관리자 로그인시 노출 jstl처리)</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">


        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

             
                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Content Row -->

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">최근 확진자</h6>
                                </div>
                                
<div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align:center;">
                                    <thead>
                                        <tr>
                                            <th>이름</th>
                                            <th>직위</th>
                                            <th>부서</th>
                                            <th>자가격리기간</th>
                                            <th>검사결과</th>
                                        </tr>
                                    </thead>
                                    <tbody id="addtable">

									</tbody>
                                </table>
                            </div>
                        </div>
                            </div>
                        </div>

                        <!-- Pie Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Revenue Sources</h6>
                                    <div class="dropdown no-arrow">
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
					                    <!-- Content Row -->
                    <div class="row">
					
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1" style="text-align:center">
                                                	서울시 확진자</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800" id="hj" style="text-align:center"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1" style="text-align:center">
                                                	서울시 사망자</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800" id="death" style="text-align:center"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1" style="text-align:center">전국 확진자
                                            </div>
                                             <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800" id="jhj" style="text-align:center; align:center;"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1" style="text-align:center">
                                                		전국 사망자</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800" id="jdeath" style="text-align:center"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 사내 코로나  -->
                          <div class="row">
					
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1" style="text-align:center">
                                                	총확진자</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800" id="allmember" style="text-align:center"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1" style="text-align:center">
                                                	현재 확진자</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800" id="nowmember" style="text-align:center"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1" style="text-align:center">자가 격리자
                                            </div>
                                             <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800" id="member" style="text-align:center; align:center;"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1" style="text-align:center">
                                                		근무원 총원</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800" id="isolemember" style="text-align:center"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->


 
    <!-- Bootstrap core JavaScript-->
    
    <script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="./resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="./resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="./resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    
    

</body>

</html>