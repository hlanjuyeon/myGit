<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/main/navigation.css">
<link rel="stylesheet" type="text/css" href="/resources/main/darkmode.css">
<link rel="stylesheet" type="text/css" href="/resources/main/style.css">
<script type="text/javascript">
$(document).ready(function() {
	$(".year_move").on("click", function(e){
		// employee.id 변수를 JavaScript 변수로 정의하고, 해당 변수의 값에 따라 분기 처리합니다.
		var employeeId = "${employee.id}";
		
		if(employeeId === "admin") {
			document.querySelector(".year_move").href = "/dayOff/list";
		}
	});
	
	$(".mypage_move").on("click", function(e){
		// employee.id 변수를 JavaScript 변수로 정의하고, 해당 변수의 값에 따라 분기 처리합니다.
		var employeeId = "${employee.id}";
		
		if(employeeId === "admin") {
			document.querySelector(".mypage_move").href = "/shineInfo/myPage_admin";
		}
	});
	
	var links = document.getElementsByTagName("a");
	for (var j = 0; j < links.length; j++) {
	  links[j].addEventListener("click", function () {
	    for (var k = 0; k < links.length; k++) {
	      links[k].classList.remove("visited");
	    }
	    this.classList.add("visited");
	  });
	}
	
	const exampleModal = document.getElementById('exampleModal')
	if (exampleModal) {
	  exampleModal.addEventListener('show.bs.modal', event => {
	    // Button that triggered the modal
	    const button = event.relatedTarget
	    // Extract info from data-bs-* attributes
	    const recipient = button.getAttribute('data-bs-whatever')
	    // If necessary, you could initiate an Ajax request here
	    // and then do the updating in a callback.

	    // Update the modal's content.
	    const modalTitle = exampleModal.querySelector('.modal-title')
	    const modalBodyInput = exampleModal.querySelector('.modal-body input')

	    modalTitle.textContent = `New message to ${recipient}`
	    modalBodyInput.value = recipient
	  })
	}
});
</script>
</head>
<body>
	<div class="sidenav">
		<b><a class="mypage_move" href="/myPage">마이페이지</a></b>
		<button class="dropdown-btn"><b>근태관리</b></button>
		<div class="dropdown-container">
		<ul>
			<li><b><a style="font-size: 17px;" class="dayWork_move" href="/commute/dayWork">일간근태관리</a></b></li>
			<li><b><a style="font-size: 17px;" class="weekWork_move" href="/commute/weekWork">주간근태관리</a></b></li>
			<li><b><a style="font-size: 17px;" class="monthWork_move" href="/commute/monthWork">월간근태관리</a></b></li>
			<li><b><a style="font-size: 17px;" class="year_move" href='/dayOff/read?no=<c:out value="${employee.no}"/>'>연차현황</a></b></li>
		</ul>
		</div>
	<b><a class="calendar_move" href="/calendar/list?loginNo=<c:out value="${employee.no}"/>">캘린더</a></b>
	<b><a class="approval_move" href='/approval/listIn?loginNo=<c:out value="${employee.no}"/>'>전자결재</a></b>
	<b><a class="board_move" href="/board/notice">공지사항</a></b>
	<b><a class="orgchart_move" href="/orgchart/employeeInfo">조직도</a></b>
	<div class="darkmode_div">
		<b>다크모드</b><input role="switch" type="checkbox" class="darkmode" onclick="darkMode()">
	</div>
	</div>
	<script type="text/javascript" src="/resources/main/darkmode.js"></script>
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
	</script>
</body>
</html>