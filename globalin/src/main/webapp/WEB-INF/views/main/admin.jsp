<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js" charset="utf-8"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/easy-pie-chart/2.1.6/jquery.easypiechart.min.js" charset="utf-8"></script>
<title>Insert title here</title>
<style>

body {
	width: 1800px;
	height: 900px;
}

.body_css {
    display: flex;
}

.header_css {
    margin: 20px;
    display: flex;
        width: 1850px;
}

.body_right {
    min-width: 90%;
	height: 100%;
}
.box {
	width: 20%;
}

.box h2 {
	position: relative;
	top: 10px;
	left: 60px;
}

.box .chart {
	position: relative;
	width: 100%;
	height: 100%;
	line-height: 160px;
	height: 150px;
	color: #fff;
}

.box canvas {
	color: #3D9970;
	position: absolute;
	top: 0;
	left: 20px;
	width: 70%;
}

.mainLink {
	font-size: 24px; 
	color : #3D9970;
	position: relative;
	left: 3%;
	top: 3%;
}

.commute {
	position: relative;
	left: 25%;
	bottom: 25%;
	width: 45%;
	height: 20%;
}

.inButton {
	background-color: #3D9970;
	color: white;
	border: 2px solid #3D9970;
	border-radius: 15px;
	padding: 13px 20px;
	font-size: 16px;
	cursor: pointer;
}

.outButton {
	background-color: #3D9970;
	color: white;
	border: 2px solid #3D9970;
	border-radius: 15px;
	padding: 13px 20px;
	font-size: 16px;
	cursor: pointer;
}

.wrapper {
	border: 2px solid #3D9970;
	padding: 5px;
	border-radius: 13px;
	width: 150px;
	height: 150px;
	cursor:pointer;
	background-color: #3D9970;
	color:white;
}

.vacation {
	position: relative;
	left: 70%;
	bottom: 90%;
	font-size:20px;
}

.MainContainer {
	position: fixed;
	width: 1000px;
	height: 250px;
	left: 30%;
}

.main2 {
	top: 40%;
	height: 200px;
}

.main3 {
	top: 65%;
	height: 150px;
}

.notice {
	position:relative;
	left: 19%;
}


.notice tr {
	background-color:#3D9970;
	color: white;	
}

.insert {
	text-align:center;
	position:relative;
	left: 10%;
	top: 15%;
	height: 80px;
	font-size: 20px;
	padding: 10px 0px 10px 0px;
}

.dayoff {
	text-align:center;
	position:relative;
	left: 45%;
	bottom: 185px;
	height: 80px;
	font-size: 20px;
	padding: 10px 0px 10px 0px;
}

.update {
	text-align:center;
	position:relative;
	left:75%;
	bottom: 54%;
	height:80px;
	font-size: 20px;
	padding: 10px 0px 10px 0px;
}

</style>
</head>
<body>
		<%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
	<div>
		<div class="MainContainer main1">
			<a href="#" class="mainLink"><b>근태관리</b></a>
			<div class="box">
				<h2 class="time">00:00</h2>
				<div class="chart"></div>
			</div>
			<div class="commute">
				<b>00:00</b>
				<button class="button inButton">출근</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<b>00:00</b>
				<button class="button outButton">퇴근</button>
			</div>
			<div class="wrapper vacation" onclick="clickDayoff()">
				<br><b>총 연차 : &nbsp;&nbsp;&nbsp;&nbsp; <span>00</span> <br><br><br> 잔여 연차 : &nbsp;&nbsp;<span>00</span></b>
			</div>
		</div>
		<div class="MainContainer main2">
			<a href="#" class="mainLink"><b>공지게시판</b></a>
			<table border="1" cellpadding="0" cellspacing="0" width="800" class="notice">
				<tr>
					<th width="200">번호</th>
					<th width="200">제목</th>
					<th width="200">작성자</th>
					<th width="200">작성일자</th>
				</tr>
			</table>
		</div>
		<div class="MainContainer main3">
			<div class="wrapper insert" onclick="clickInsert()">
				<br><b>사원등록</b>
			</div>
			<div class="wrapper update" onclick="clickUpdate()">
				<br><b>회원정보 수정</b>
			</div>
			<div class="wrapper dayoff" onclick="clickdayOff()">
				<br><b>연차현황</b>
			</div>			
		</div>
	</div>
	</div>
	<script type="text/javascript">
		// 근무시간 합계 그래프
		$(function() {
			$('.chart').easyPieChart({
				size : 160,
				barColor : "#2ae836",
				scaleLength : 0,
				lineWidth : 15,
				trackColor : "#525151",
				lineCap : "circle",
				animate : 2000,
			});
		});
		
		// 페이지 이동 스크립트
		function clickInsert() {
			window.location.href="insert";
		}
		
		function clickUpdate() {
			window.location.href="update";
		}
		
		function clickdayOff(){
			window.location.href="dayOff";
		}
	</script>

</body>
</html>