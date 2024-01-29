<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일간근태관리</title>
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
	height: 1000px;
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
	border-color:#3D9970;
}

td {
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
	<div class="MainContainer body_right">
		<b style="margin-left:20px; font-size:24px;">일간근태관리</b>
		<div class="calendar" align="right" style="margin-right:10px">
		<form action="dayWork" method="get" id="daywork">
		<input type="date" name="startDate" class="startDate" id="startDate" onchange="javascript:document.getElementById('daywork').submit();"> ~ <input type="date" name="endDate" class="endDate" id="endDate" onchange="javascript:document.getElementById('daywork').submit();">
		</form>
		</div>
		<br>
		<div class="wrapper">
			<table class="commute" border="1" width="1100px">
				<thead>
					<tr class="tHead">
						<th>날짜</th>
						<th>출근시간</th>
						<th>퇴근시간</th>
						<th>초과근무시간</th>
						<th>야간근무시간</th>
						<th>휴일근무시간</th>
						<th>합계근무시간</th>
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
	<script>
		var s = "<%=request.getParameter("startDate")%>";
		var e = "<%=request.getParameter("endDate")%>";
		if(s == "null" || e == "null") {
			var tz = (new Date()).getTimezoneOffset() * 60000;
			var d = new Date(Date.now() - tz);
	  		document.getElementById('startDate').value = new Date(new Date(d.getFullYear(), d.getMonth(), 1) - tz).toISOString().substring(0,10);
	  		document.getElementById('endDate').value = d.toISOString().substring(0,10);
		} else {
			document.getElementById('startDate').value = s;
	  		document.getElementById('endDate').value = e;
		}
		
	</script>
</body>
</html>