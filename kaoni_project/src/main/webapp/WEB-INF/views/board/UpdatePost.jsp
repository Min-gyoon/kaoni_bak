<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Date" %>
    <%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>

</head>
<body>
<header> <%@include file ="/WEB-INF/views/header.jsp" %></header>
<% Date now = new Date(); %>
<%
SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd");
String today = sf.format(now);
String update = sf.format(now);
%>
<%=update%><br>
<div style="margin-top: 150px;">

<div class="container" style="margin-top: 150px;">
	<div class="row">
<form action="UpdatePost1.kaoni" method="post">
<input type="hidden" name="nbo" value="${data.nbo}">

           <div class="row">
			<div class="col-md-6">
            	<span class="form-group" >
            		제목 : 
            	</span>
            		<input type="text" id="title" name="title" value="${data.title}">
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
           <span>내용 :</span><textarea id="summernote" name="summernote" >${data.content}</textarea>
            	</div>
            </div>
       </div>
        <span class="row">
       		<span class="col-md-12">
            	<button type="submit" class="btn btn-primary" 
            	style="margin-left: 1000px; width: 100px; margin-bottom: 15px; margin-top: 15px;" >
            	수정</button>
            	<button type="button" onclick="location='ShowAllPost.kaoni'" style="width: 100px;" class="btn btn-primary">취소</button>
    		 <input type="text" name="updatedate" value=<%=update%>>
        	</span>
        </span>
	</form>
	
		</div>
</div>
	
	</div>
	<footer> <%@include file ="/WEB-INF/views/footer.jsp" %>      </footer>
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

