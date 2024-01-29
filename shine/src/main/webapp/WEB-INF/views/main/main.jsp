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
	top: -12px;
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
	bottom: 40%;
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
	bottom: 105%;
	font-size: 20px;
}

.MainContainer {
	/* position: fixed; */
	width: 100%;
	height: 250px;
	margin-left: 20px;
	margin-bottom: 30px;
}

.main2 {
	top: 40%;
	    height: 270px;
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

@media(max-width: 918px){
				body {transform: scale(1); overflow-x: hidden;}
				.deptName {display: none;}
				.name {display: none;}
				.regDate {display: none;}
				.updateDate {display: none;}
				.big-width {display: none;}
				.small-width {display: block;}
				select{
					width:100%;
				}
				
				input[name='keyword']{
					width:100%;
				}
				
				.search{
					width:100%;
				}
			}
			
.table-wrapper {
    overflow: auto;
    max-width: 100%;
    background: #fff;
    border-radius: 0.35em;
    box-shadow: 0 0.1em 0.25em rgba(0, 0, 0, 0.05);
}

.table-wrapper table {
    margin: 0 0 2em 0;
    width: 100%;
    border-collapse: collapse;
}

.table-wrapper table td, 
.table-wrapper table th {
    padding: 0.75em;
    text-align: center;
}

.table-wrapper table th {
    color: #3D9970;
    border-bottom: 2px solid #3D9970;
}

.table-wrapper table tr:nth-child(2n + 1) {
    background-color: #f7f7f7;
}
</style>
</head>
<body>
		<%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
	<div class="body_right">
		<div class="MainContainer main1" style="height:240px">
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
			<a href='/dayOff/read?no=<c:out value="${employee.no}"/>'>
			<div class="wrapper vacation">
				<br>
				<b>총 연차 : &nbsp;&nbsp;&nbsp;&nbsp; <span><c:out value="${total.total}"/></span> <br>
				<br>
				<br> 잔여 연차 : &nbsp;&nbsp;<span><c:out value="${remind.remind}"/></span></b>
			</div>
			</a>
		</div>
		<div class="MainContainer main2">
			<div style="margin-bottom: 10px; margin-top: 10px;"><a href="notice" class="mainLink"><b>공지게시판</b></a></div>
			<div class="table-wrapper">
			<table>
				<thead>
					<tr class="tHead">
						<th class="bno">번호</th>
						<th class="title">제목</th>
						<th class="deptName">부서</th>
						<th class="name">작성자</th>
						<th class="regDate">작성일</th>
						<th class="updateDate">수정일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${boardList}">
						<tr class="tBody">
							<td class="bno">${board.bno}</td>
							<td class="title"><a href="/board/read${pageDTO.criteria.params}&bno=${board.bno}">${board.title}</a></td>
							<td class="deptName">${board.deptName}</td>
							<td class="name">${board.name}</td>
							<td class="regDate">${board.regDate}</td>
							<td class="updateDate">${board.updateDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
		<div class="MainContainer main3">
			<b class="mainLink">전자결재</b>
			<a href='/approval/listInYet?loginNo=<c:out value="${employee.no}"/>'>
			<div class="wrapper approval">
				<br>
				<b>미결재 <span><c:out value="${inbox.countInbox}"/></span>건
				</b>
			</div>
			</a>
			<a href='/approval/temp?loginNo=<c:out value="${employee.no}"/>'>
			<div class="wrapper unwritten">
				<br>
				<b>작성문서 <span><c:out value="${temp.countTemp}"/></span>건
				</b>
			</div>
			</a>
		</div>
	</div>
	</div>
	<form name="pageForm" action="/board/list">
		<input type="hidden" name="pageNum" value="${pageDTO.criteria.pageNum}">
		<input type="hidden" name="type" value="${pageDTO.criteria.type}">
		<input type="hidden" name="keyword" value="${pageDTO.criteria.keyword}">
	</form>
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

	</script>
	<script src="/resources/main/main.js" type="text/javascript"></script>
</body>
</html>