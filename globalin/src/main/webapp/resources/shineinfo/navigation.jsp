<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/darkmode.css" type="text/css">
<link rel="stylesheet" href="../resources/css/navigation.css" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<div class="sidenav">
		<b><a href="#">마이 페이지</a></b>
		<button class="dropdown-btn"><b>근태관리</b></button>
		<div class="dropdown-container">
		<ul>
			<li><b><a href="#">일간근태관리</a></b></li>
			<li><b><a href="#">주간근태관리</a></b></li>
			<li><b><a href="#">월간근태관리</a></b></li>
			<li><b><a href="#">연차현황</a></b></li>
		</ul>
	</div>
	<b><a href="#">일정관리</a></b>
	<b><a href="#">전자결재</a></b>
	<b><a href="#">공지사항</a></b>
	<b><a href="#">주소록</a></b>
	<div class="darkmode_div">
		<b>다크모드</b><input role="switch" type="checkbox" class="darkmode" onclick="darkMode()">
	</div>
	</div>
	
	<script>
	// dropdown script
	var dropdown = document.getElementsByClassName("dropdown-btn");
	var i;
	
	for (i = 0; i < dropdown.length; i++) {
		dropdown[i].addEventListener("click",function() {
			this.classList.toggle("active");
			var dropdownContent = this.nextElementSibling;
			if(dropdownContent.style.display === "block") {
				dropdownContent.style.display = "none";
			} else {
				dropdownContent.style.display = "block";
			}
		});
	}
	
	// darkmode script
	function darkMode() {
		var dropdown = document.querySelector(".dropdown-btn");
		var element = document.body;
		var dark = document.querySelector(".darkmode_div");
		element.classList.toggle('on');
		dropdown.classList.toggle('on');
		dark.classList.toggle('on');
	}
	</script>
</body>
</html>