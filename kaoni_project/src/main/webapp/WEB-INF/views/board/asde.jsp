<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <% String listBox1[] = {"서울/인천","서울/김포","부산","제주","청주","광주","대구","여수","울산","포항","원주","군산"}; %>
  <% String listBox2[] = {"ICN","GMP","PUS","CJU","CJJ","KWJ","TAE","RSU","USN","KPO","WJU","KUV"}; %>
  	<div class="input_date_box">
		<div class="dropdown">
      	<label><input type="text" id="search" onkeyup="filter()" placeholder="출발지" name="departure" size="20" style="height:40px;text-align:center"/></label>
  		<div class="dropdown_content">
		<% for(int i = 0 ; i<listBox1.length;i++){%>  
	  <div class="listInner" onclick="reply_click()" >
        <span class="country"><a href="#"><%=listBox1[i]%></a></span> &nbsp;
        <span class="city"><%=listBox2[i]%></span>	 
      </div>
		<%} %></div>
	</div>



 function filter() {
        let search = document.getElementById("search").value.toLowerCase();
        let listInner = document.getElementsByClassName("listInner");

        for (let i = 0; i < listInner.length; i++) {
          city = listInner[i].getElementsByClassName("city");
          country = listInner[i].getElementsByClassName("country");
          if (city[0].innerHTML.toLowerCase().indexOf(search) != -1 ||
            country[0].innerHTML.toLowerCase().indexOf(search) != -1
          ) {
            listInner[i].style.display = "flex"
          } else {
            listInner[i].style.display = "none"
          }
        }
</body>
</html>