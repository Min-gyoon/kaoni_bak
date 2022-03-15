<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<!-- bootswatch journal-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/journal/bootstrap.min.css" integrity="sha384-QDSPDoVOoSWz2ypaRUidLmLYl4RyoBWI44iA5agn6jHegBxZkNqgm2eHb6yZ5bYs" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <title>kaoni_prject index</title>

  <script type="text/javascript">
  //코로나현황 데이터 가져오기. 
  $(document).ready(function(){
	alert("test");
			$.ajax({
				url : 'pcrdata.kaoni',
				dataType : 'json',
				success : function(data){
					document.getElementById('allmember').innerHTML=parseInt(data.allmember);
					document.getElementById('nowmember').innerHTML = parseInt(data.nowmember);
					document.getElementById('member').innerHTML = parseInt(data.member);
					document.getElementById('isolemember').innerHTML = parseInt(data.isolemember);
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
  });//ready
</script>
</head>

<body>
<%@include file ="/WEB-INF/views/header.jsp" %>
	<section>
	<div>
	   <main id="main" style="padding-top:85px" >
	   
	  	<table align ="center" style="width:85%">
		<thead>
 		 <tr class="table-info">
   		 <th>이름</th>
   		 <th>직책</th>
   		 <th>부서</th>
    	<th>자가격리기간</th>
    	<th>확진여부</th>
 	 	</tr>
 	 	</thead>
 	 	<tbody id="addtable">
  	
  </tbody>
  		
  		</table>
</div>
</section>
      <!-- ======= Counts Section ======= -->
    <section id="counts" class="counts">
      <div class="container">
 	  <div class="row counters" >
 		<h5 align ="left">사내 코로나 현황</h5>
          <div class="col-lg-3 col-6 text-center">
            <span id = "allmember" data-purecounter-start="0" data-purecounter-end="" data-purecounter-duration="1" class="purecounter"></span>
            <p>총 확진자(누적)</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
            <span id="nowmember" data-purecounter-start="0" data-purecounter-end="" data-purecounter-duration="1" class="purecounter"></span>
            <p>현재 확진자</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
            <span id="isolemember" data-purecounter-start="0" data-purecounter-end="" data-purecounter-duration="1" class="purecounter"></span>
            <p>자가 격리자</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
            <span id="member" data-purecounter-start="0" data-purecounter-end="" data-purecounter-duration="1" class="purecounter"></span>
            <p>근무원 총원</p>            
          </div>
			<a href="http://localhost:8080/pcrSelectAll.kaoni">더 자세히보기</a>
			
        </div>

      </div>
    </section><!-- End Counts Section -->
</main>
  	
<%@include file ="/WEB-INF/views/footer.jsp" %>

</body>

</html>