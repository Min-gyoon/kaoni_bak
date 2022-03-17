<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="java.util.Date" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<style type="text/css">
.contact-form{ margin-top:15px;}
.contact-form .textarea{ min-height:220px; resize:none;}
.form-control{ box-shadow:none; border-color:#eee; height:49px;}
.form-control:focus{ box-shadow:none; border-color:#00b09c;}
.form-control-feedback{ line-height:50px;}
.main-btn{ background:#00b09c; border-color:#00b09c; color:#fff;}
.main-btn:hover{ background:#00a491;color:#fff;}
.form-control-feedback {
line-height: 50px;
top: 0px;
}
</style>
</head>

<body>
<header>
 <%@include file ="/WEB-INF/views/header.jsp" %>
</header>



<div class="container" style="margin-top: 150px;">
	<div class="row">
	<form action="writePost1.kaoni" method="post" id="contact-form" class="contact-form">
		<div class="row"> 
			<div class="col-md-6">
            	<span class="form-group" >
            		제목 : 
            	</span>
            		<input type="text" id="title" name="title">
                 <span>중요도 : </span> 
                		<select name="impor">
                    		<option value="0">0</option>
                    		<option value="1">1</option>
                    		<option value="2">2</option>
                    		<option value="3">3</option>
               			</select>
            </div>
        </div>
        <br>
        <div class="row">
        	<div class="col-md-12">
            	<div class="form-group">
           <span>내용 :</span><textarea id="summernote" name="summernote"></textarea>
            	</div>
            </div>
       </div>
           
        <div class="row">
       		<div class="col-md-12">
            	<button type="submit" class="btn btn-primary" 
            	style="margin-left: 1000px; width: 100px; margin-bottom: 15px; margin-top: 15px;" >
            	등록</button>
            	<button type="button" onclick="location='ShowAllPost.kaoni'" style="width: 100px;" class="btn btn-primary">취소</button>
            
        	</div>
        </div>
	</form>
	
	</div>
</div>


<footer><%@include file ="/WEB-INF/views/footer.jsp"%></footer>	

</body>
<script>
$(document).ready(function() { 
	$('#summernote').summernote({
	 height: 300,                 // 에디터 높이
	  minHeight: null,             // 최소 높이
	  maxHeight: null,             // 최대 높이
	  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	  lang: "ko-KR",					// 한글 설정
	  placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
	  toolbar: [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview','fullscreen', 'help']]
		  ],
		  // 추가한 글꼴
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		 // 추가한 폰트사이즈
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	}); 
	});
</script>
</html>

