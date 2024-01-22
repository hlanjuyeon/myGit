<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/main/style.css">
<link rel="stylesheet" type="text/css" href="/resources/commute/commute.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"
	charset="utf-8"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/easy-pie-chart/2.1.6/jquery.easypiechart.min.js"
	charset="utf-8"></script>
	<script src="https://cdn.canvasjs.com/ga/canvasjs.min.js"></script>
	<script src="https://cdn.canvasjs.com/ga/canvasjs.stock.min.js"></script>
	<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://cdn.canvasjs.com/jquery.canvasjs.min.js"></script>
<title>Main</title>
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
	top: 0;
	width: 90%;
}

.mainLink {
	font-size: 24px;
	color: #3D9970;
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

.inButton, .outButton, .disagree, .disagree1, .proc, .proc1 {
	background-color: #3D9970;
	color: white;
	border: 2px solid #3D9970;
	border-radius: 15px;
	padding: 13px 20px;
	font-size: 16px;
	cursor: pointer;
}

.inButton:hover, .outButton:hover, .disagree:hover, .disagree1:hover, .proc:hover, .proc1:hover {
	background-color: white;
	color: #3D9970;
	transition-duration: 0.3s;
	border: 2px solid #3D9970;
	cursor: pointer;
}

.wrapper {
	border: 2px solid #3D9970;
	padding: 5px;
	border-radius: 13px;
	width: 150px;
	height: 150px;
	cursor: pointer;
	background-color: #3D9970;
	color: white;
}

.vacation {
	position: relative;
	left: 70%;
	bottom: 90%;
	font-size: 20px;
}

.MainContainer {
	/* position: fixed; */
	width: 100%;
	height: 250px;
	margin-left: 20px;
	margin-bottom: 50px;
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
	position: relative;
	left: 19%;
}

.notice tr {
	background-color: #3D9970;
	color: white;
}

.approval {
	text-align: center;
	position: relative;
	left: 25%;
	height: 80px;
	font-size: 20px;
	padding: 10px 0px 10px 0px;
}

.unwritten {
	text-align: center;
	position: relative;
	left: 70%;
	bottom: 70%;
	height: 80px;
	font-size: 20px;
	padding: 10px 0px 10px 0px;
}

.canvasjs-chart-credit
{
    display: none !important;
}
</style>
</head>
<body>
		<%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
	<div class="body_right">
		<div class="MainContainer main1" style="height:280px">
			<a href="/commute/dayWork" class="mainLink"><b>근태관리</b></a>
			<div class="box">
 				<h2 class="time">&nbsp;&nbsp;&nbsp;&nbsp;  ${sumtimeH}:${sumtimeM}</h2>
				<div class="chart" id="chart"></div>
			</div>
			<div class="commute">
				<!-- <b>00:00</b> --> 
				<b> ${mintime}</b>
				<button class="button inButton" id="inButton" ${canCommute }>출근</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="modal" id="modal">
					<div class="commuteModal">
						<span class="close">&times;</span>
						<p>출근처리하시겠습니까?</p>
						<form action="commute" method="post" class="commuteAction" style="display:inline-block;">
							<input name="no" type="hidden" value="${no}"> 
							<input type="submit" value="예" class="proc">
						</form>
						<button id="disagree" class="disagree">아니오</button>
					</div>
				</div>
<!-- 				<b>00:00</b> -->
				<b>${mouttime}</b>
				<button class="button outButton" id="outButton">퇴근</button>
				<div class="modal1" id="modal1">
					<div class="leaveModal">
						<span class="close">&times;</span>
						<p>퇴근처리하시겠습니까?</p>
						<form action="leave" method="post" class="commuteAction" style="display:inline-block;">
							<input name="no" type="hidden" value="${no}"> 
							<input type="submit" value="예" class="proc1">
						</form>
						<button class="disagree1">아니오</button>
					</div>
				</div>
			</div>
			<div class="wrapper vacation" onclick="clickDayoff()">
				<br>
				<b>총 연차 : &nbsp;&nbsp;&nbsp;&nbsp; <span><c:out value="${total.total}"/></span> <br>
				<br>
				<br> 잔여 연차 : &nbsp;&nbsp;<span><c:out value="${remind.remind}"/></span></b>
			</div>
		</div>
		<div class="MainContainer main2">
			<a href="notice" class="mainLink"><b>공지게시판</b></a>
			<table border="1" cellpadding="0" cellspacing="0" width="800" class="notice">
				<thead>
				<tr>
					<th class="bno" width="50">번호</th>
					<th class="title" width="200">제목</th>
					<th class="writer" width="100">작성자</th>
					<th class="regDate" width="150">작성일자</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td class="bno"></td>
					<td class="title"></td>
					<td class="writer"></td>
					<td class="regDate"></td>
				</tbody>
			</table>
		</div>
		<div class="MainContainer main3">
			<a href="/dayOff/read?no=" class="mainLink"><b>전자결재</b></a>
			<div class="wrapper approval" onclick="clickHandler()">
				<br>
				<b>미결재 <span>0</span>건
				</b>
			</div>
			<div class="wrapper unwritten" onclick="clickEvent()">
				<br>
				<b>작성문서 <span><c:out value="${temp.countTemp}"/></span>건
				</b>
			</div>
		</div>
	</div>
	</div>
</div>
	<script type="text/javascript">
		// 근무시간 합계 그래프
		
		var h = ${sumtimeH};
		var m = ${sumtimeM};
		// 근무시간 / 52시간을 구하기 위한 연산	
		var t = ((h * 60 + m) / (52*60)) * 100;
				
		window.onload = function () {
 
		var options = {
			data: [{
				type: "doughnut",
				innerRadius: "40%",
				showInLegend: false,
				dataPoints: [
					{ y: ((52*60) - (h * 60 + m)), name:"남은 시간"},
					{ y: (h * 60 + m), name:"근무시간"},
				]
			}]
		};
		$("#chart").CanvasJSChart(options);
		 
		}

		// 페이지 이동 스크립트
		function clickHandler() {
			window.location.href = "approval";
		}

		function clickEvent() {
			window.location.href = "approval";
		}

		function clickDayoff() {
			window.location.href = "/commute/dayOff";
		}
	</script>
	<script src="/resources/main/main.js" type="text/javascript"></script>
</body>
</html>