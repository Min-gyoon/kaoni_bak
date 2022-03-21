<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>

<title>자가진단</title>

  <!-- bootswatch journal-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/journal/bootstrap.min.css" integrity="sha384-QDSPDoVOoSWz2ypaRUidLmLYl4RyoBWI44iA5agn6jHegBxZkNqgm2eHb6yZ5bYs" crossorigin="anonymous">
 <%@include file ="/WEB-INF/views/header.jsp" %>
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
	<style type="text/css">
	.features_table h1{
    font-size:25px !important;
	
}
li{
    list-style:none;
    }
h1{
     font-size:21px !important;
    }    
.features-table li {
    background: #da9748 none repeat scroll 0 0;
    border-bottom: 2px solid #e5a253;
    color: #f1f1f1;
    font-size: 16px;
    padding: 15px 24px;
}
.features-table li:hover{
	background:  #e5a253;
	cursor:pointer;
	-webkit-transition: all .35s;
    -moz-transition: all .35s;
    transition: all .35s;
}
.features-table-free li, .features-table-paid li {
    background: #efefef none repeat scroll 0 0;
    border-bottom: 2px solid #d4d4d4;
	text-align:center;
    padding: 16.4px 21px;
	cursor:pointer;
}
.features-table-free h1, .features-table-paid h1 {
    text-align: center;
}
.features-table-free li:hover, .features-table-paid li:hover {
    background: #dedede none repeat scroll 0 0;
	-webkit-transition: all .35s;
    -moz-transition: all .35s;
    transition: all .35s;
}
.features_table h1 {
    font-size: 23px !important;
}
.features-table h1, .features-table-free h1, .features-table-paid h1 {
    background: #6b6b6b none repeat scroll 0 0;
    color: #fff;
    font-weight: 600;
    margin: 0;
    padding: 19px 21px;
    text-transform: uppercase;
}
.features-table h1 {
    border-top-left-radius: 20px;
	text-align:center;
}
.features-table-paid h1 {
    border-top-right-radius: 20px;
}
.features-table-free li {
    border-right: 2px solid #d4d4d4;
}

.fa.fa-check {
    color: #2cc14f;
}
.fa.fa-times {
    color: #BA5340;
}
.fa{
	font-size:30px;
}
.no-padding{
	padding:0;
}
ul{
	padding:0;
}

body {
  counter-reset: section;                   /* Set the section counter to 0 */
}
.features-table li::before {
  counter-increment: section;               /* Increment the section counter*/
  content: "" counter(section) ": "; /* Display the counter */
}
	</style>
</head>

<body>

  <!-- ======= Header ======= -->
 <header>
 <%@include file ="/WEB-INF/views/header.jsp" %>
 </header>
  

  <main id="main" style="padding-top:90px">
<form id="selfform" name="selfform">
<section class="features_table">
        <div class="container ">
        	<div class="col-sm-8 col-8 col-xs-12 no-padding">
            	<div class="features-table">
                	<ul>
                    	<h1>질문</h1>
                    	<li style="width: 712px;">가족 중 코로나 19확진자 또는 자가격리자가 있습니까? </li>
                    	<li style="width: 712px;">밀접 접촉을 한 사람들 중 코로나19 확진자 또는 질병관리본부 자가격리 대상자가 있습니까? </li>
                    	<li style="width: 712px;">질병 관리 본부 접촉관리 대상자로 전화 혹은 문자를 받은 적이 있습니까? </li>
                    	<li style="width: 712px;">최근 14일 다중이용시설에 방문해 이용하셨습니까? </li>
                    	<li style="width: 712px;">최근 체온 측정에서 37.5도 이상이 나온적이 있습니까? </li>
                    	<li style="width: 712px;">최근 새로 시작되거나 악화 된 기침, 콧물, 인후통 등의 호흡기 증상이 있습니까? </li>
                    </ul>
                </div>
            </div>
            <div class="col-sm-2 col-2 col-xs-12 no-padding" style="margin-left: 714px; margin-top: -81.5px;">
            <div class="features-table-free">
                	<ul>
                    	<h1>예</h1>
                        <li style="width: 155px;height:55px; margin-top: -280px;"><input type="checkbox" name="Selfcheck1" value="Y" onclick='; checkOnlyOne(this)'></li>
                        <li style="width: 155px;height:55px; margin-top: -223px;"><input type="checkbox" name="Selfcheck2" value="Y" onclick='; checkOnlyOne(this)'></li>
                        <li style="width: 155px;height:55px; margin-top: -167px;"><input type="checkbox" name="Selfcheck3" value="Y" onclick='; checkOnlyOne(this)'></li>
                        <li style="width: 155px;height:55px; margin-top: -113px;"><input type="checkbox" name="Selfcheck4" value="Y" onclick='; checkOnlyOne(this)'></li>
                        <li style="width: 155px;height:55px; margin-top: -57px;"><input type="checkbox" name="Selfcheck5" value="Y" onclick='; checkOnlyOne(this)'></li>
                        <li style="width: 155px;height:55px;"><input type="checkbox" name="Selfcheck6" value="Y" onclick='; checkOnlyOne(this)'></li>
                    </ul>
                </div>
            
            </div>
             <div class="col-sm-2 col-2 col-xs-12 no-padding" style="margin-left: 869px; margin-top: -81.5px; " >
             	 <div class="features-table-paid">
                	<ul>
                    	<h1 style="width: 173px;">아니요</h1>
                        <li style="width: 170px;height:55px;margin-top:-280px; margin-left: 2px;"><input type="checkbox" name="Selfcheck1" value="N" onclick='; checkOnlyOne(this)'></li>
                        <li style="width: 170px;height:55px;margin-top:-223px; margin-left: 2px;"><input type="checkbox" name="Selfcheck2" value="N" onclick='; checkOnlyOne(this)'></li>
                        <li style="width: 170px;height:55px;margin-top:-167px; margin-left: 2px;"><input type="checkbox" name="Selfcheck3" value="N" onclick='; checkOnlyOne(this)'></li>
                        <li style="width: 170px;height:55px;margin-top:-113px; margin-left: 2px;"><input type="checkbox" name="Selfcheck4" value="N" onclick='; checkOnlyOne(this)'></li>
                        <li style="width: 170px;height:55px;margin-top:-57px; margin-left: 2px;"><input type="checkbox" name="Selfcheck5" value="N" onclick='; checkOnlyOne(this)'></li>
                        <li style="width: 170px;height:55px; margin-left: 2px;"><input type="checkbox" name="Selfcheck6" value="N" onclick='; checkOnlyOne(this)'></li>
                    
                    </ul>
                </div>
             </div>
        </div>
    </section>
        <input type="button" align="p"id="btn" value="제출하기" class="btn btn-primary" style="margin-left: 1280px; margin-top: -90px">     
</form>
  </main><!-- End #main -->
 
<%@include file ="/WEB-INF/views/footer.jsp" %>


</body>
</html>