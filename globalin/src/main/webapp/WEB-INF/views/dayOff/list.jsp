<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연차관리 리스트_관리자</title>

<link rel="stylesheet" type="text/css" href="/resources/css/style.css">

<style type="text/css">
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
.MainContainer {
	/* position: fixed; */
	width: 100%;
	height: 800px;
	margin-left: 20px !important;
	margin-bottom: 50px;
	overflow: auto;
}

th{
font-size: 25px;
}

td {
    font-size: 20px;
	color: black;
	text-align: center;
}
</style>

</head>
<body>
</head>
<body>
<%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
	<div class="MainContainer body_right" align="center">
		<h1>연차 이용 현황페이지_관리자</h1>

		<table class="list" border="1"  width="1350px">
			<tr>
				<th bgcolor="orange" width="100">사원명</th>
				<th bgcolor="orange" width="100">사원번호</th>
				<th bgcolor="orange" width="100">총연차일수</th>
				<th bgcolor="orange" width="100">총연차 사용일수</th>
				<th bgcolor="orange" width="100">잔여연차일수</th>
			</tr>

			<c:forEach var="dayOffInfo" items="${dayOffInfo}"> 
				<tr>
					<td><a href="/dayOff/viewDetails?no=${dayOffInfo.no}">${dayOffInfo.name}</a></td>
					<td>${dayOffInfo.no}</td>
					<td>${dayOffInfo.total}  일</td>
					<td>${dayOffInfo.usedTotal}  일</td>
					<td>${dayOffInfo.remind}  일</td>
				</tr>
			</c:forEach>
		</table>
		
		<!-- <br>
		페이징 처리 -->

		<!-- 검색 
		<br>
		 form action="" style="height: 50px;">
			<select name="searchWhat" style="height: 25px;">
				<option value="name">사원명</option>
				<option value="">사원번호</option>
			</select> <input type="text" name="searchWhat" style="height: 20px;">
			<input type="submit" value="검색" style="width: 70px; height: 50px;">
		</form> -->

	</div>
	</div>
</body>
</html>