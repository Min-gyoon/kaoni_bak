<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Date" %>
    <%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>

</head>
<body>
<header> 
<%@include file ="/WEB-INF/views/header.jsp" %>
</header>
<div id="wrapper">
<div id="content-wrapper" class="d-flex flex-column">
<div id="content" >
<div class="container-fluid" style="margin-left: 480px; margin-top: 170px; margin-bottom: 70px; width: 1800px;">
 <div class="row">
                        <div class="col-lg-6">


<form action="UpdatePost1.kaoni" method="post" class="user">

<input type="hidden" name="nbo" value="${data.nbo}">

<!-- Dropdown Card Example -->
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary"> 제목 :&nbsp;&nbsp;&nbsp;<input type="text" id="title" name="title" value="${data.title}"></h6>	
								<span style="margin-right: 60px;"> 중요도 : 
								<select name="impor">
                    		<option value="0">0</option>
                    		<option value="1">1</option>
                    		<option value="2">2</option>
                    		<option value="3">3</option>
               			</select></span>
								</div>
								  
                                    <textarea id="summernote" name="summernote" >${data.content}</textarea>
                              
							</div>
						<button type="submit" class="btn btn-primary" style="margin-left: 650px; width: 80px;">수정</button>
                        <button type="button" onclick="location='ShowAllPost.kaoni'" class="btn btn-primary" style="width: 80px;margin-left: 10px;">취소</button>
                        </form>
                        
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
        </div>
        <!-- End of Content Wrapper -->
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
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>  
<!-- include summernote css/js -->  
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">  
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>  

</html>

