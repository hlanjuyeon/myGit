<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월간근태관리</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<style>
.MainContainer {
	/* position: fixed; */
	width: 100%;
	height: 250px;
	margin-left: 20px;
	margin-bottom: 50px;
	overflow: auto;
}

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
	height: 700px;
}


.commute {
	margin-left:20px;
	border-color: black;
	border-spacing: 0px;
    margin-bottom: 20px;
}

td {
	text-align: center;
}

.calendar {
	width: 300px;
    float: right;
    margin-right: 242px;
    margin-bottom: 20px;
}

.title {
	margin-left : 20px;
}

.monthWork_move {
	background-color: #3D9970;
	color: white !important;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
	<div class="MainContainer body_right">
			<div>
				<h1 class="title">월간근태관리</h1>
				<div class="calendar">		
			<form action="/commute/monthWork" method="get" id="monthWork">
			<input type="month" class="calendar" id="calendar" name="calendar"  value="<%=request.getParameter("calendar")%>" onchange="javascript:document.getElementById('monthWork').submit();">
			</form>
		</div>
		</div>
		<br>
		<div class="wrapper">
			<table class="commute" border="1" width="1100px">
				<thead style="background:#F1C93B;">
					<tr class="tHead">
						<th class="date">날짜</th>
						<th class="inDateTime">출근시간</th>
						<th class="outTime">퇴근시간</th>
						<th class="overTime">초과근무시간</th>
						<th class="nightTime">야간근무시간</th>
						<th class="holyTime">휴일근무시간</th>
						<th class="summaryTime">합계근무시간</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="commute" items="${list}">
					<tr class="tBody">
						<td>${commute.date}</td>
						<td>${commute.intime}</td>
						<td>${commute.outtime}</td>
						<td>${commute.overtime}</td>
						<td>${commute.nighttime}</td>
						<td>${commute.holidaytime}</td>
						<td>${commute.sumtime}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</div>
</body>
</html>