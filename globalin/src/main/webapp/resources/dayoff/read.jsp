<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연차 화면</title>

<link rel="stylesheet" href="../resources/css/style.css" type="text/css">
<jsp:include page="./header.jsp" flush="false" />
<jsp:include page="./navigation.jsp" flush="false" />
<style type="text/css">
.MainContainer {
	width: 1200px;
	height: 800px;
	margin-left: 300px;
	margin-top: 10px;
}

.name {
	font-size: 25px;
	padding: 10px;
	border-spacing: 60px 0;
	margin: 30px;
	width: 650px;
}

.dayOffInfo {
	font-size: 25px;
	width: 750px;
	height: 50px;
	margin: 30px;
}

.usedayOffInfo {
	font-size: 20px;
	width: 1000px;
	height: 50px;
	margin: 30px;
}

td {
	color: black;
	text-align: center;
}

th {
	background-color: #3D9970;
	color: white;
}

.title{
font-size: 25px;
	margin: 20px;
	background-color: #FDC500;
	width: 220px;
	font-size: 30px;
	border-radius: 15px;
}

</style>

</head>
<body>

	<div class="MainContainer" align="center">

		<h1>연차이용 현황페이지</h1>

		<table class="name">

			<tr>
				<th>사원명 :</th>
				<td>${dayOffInfo.name}</td>
				<th>사원번호 :</th>
				<td>${dayOffInfo.no}</td>		
			</tr>

		</table>

		<div class="title">
			<b>잔여연차</b>
		</div>

		<table class="dayOffInfo" border="1">

			<tr>
				<th width="250">총연차일수</th>
				<th width="250">총사용연차일수</th>
				<th width="250">잔여연차일수</th>
			</tr>
			
			<tr>
				<td>${dayOffInfo.total} 일</td>
				<td>${dayOffInfo.usedTotal} 일</td>
				<td>${dayOffInfo.remind} 일</td>
			</tr>

		</table>

		<div class="title">
			<b>연차사용정보</b>
		</div>

		<table class="usedayOffInfo" border="1">
			<thead>
				<tr>
					<th width="200">연차사용일</th>
					<th width="200">연차종류</th>
					<th width="500">연차사용이유</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="dayOffList" items="${dayOffList}"> 
					<tr>
						 <td>${dayOffList.useDate}</td>
						<td>${dayOffList.kind} 일</td>
						<td>${dayOffList.reason}</td> 
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<!-- 페이징 처리 -->


		<!-- 연차 신청하기버튼 -->
		<br>
		<button class="button" style="margin: 20px;" onclick="location.href='#'">연차 신청하기</button> 
	</div> 

</body>
</html>