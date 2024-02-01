<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연차 상세보기_관리자</title>

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
	margin-left: 20px;
	margin-bottom: 50px;
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
<%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
	<div class="MainContainer body_right" align="center">

		<h1>연차이용 현황페이지</h1>

			<table class="name">

				<tr>
					<th>사원명 : </th>
					<td>${dayOffInfo.name}</td>
					<th>사원번호 : </th>
					<td>${dayOffInfo.no}</td>
				</tr>

			</table>

			<div class="title">
				<b>잔여 연차</b>
			</div>

			<table class="dayOffInfo" border="1">

				<tr>
					<th width="250">총연차일수</th>
					<th width="250">총사용연차일수</th>
					<th width="250">잔여연차일수</th>
				</tr>

				<tr>
					<td>${dayOffInfo.total} 일</td>
					<td>${dayOffInfo.usedTotal}일</td>
					<td>${dayOffInfo.remind}일</td>
				</tr>

			</table>

			<div class="title">
				<b>연차사용정보</b>
			</div>

			<table class="usedayOffInfo" border="1">
				<thead>
					<tr>
					<th width="300">연차종류(반차/연차)</th>
					<th width="200">반차 시간대</th>
					<th width="600">연차사용기간</th>
					<th width="500">연차사유</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="dayOffList" items="${dayOffList}"> 
					<tr>
						<td>${dayOffList.yearUseDays} 일 (${dayOffList.yearUseDays > 0.5 ? '연차' : '반차 '})</td>
						<td>${dayOffList.yearAmPm}</td> 
						<td>${dayOffList.yearUseDateStart} ~ ${dayOffList.yearUseDateEnd} </td>						
						<td>${dayOffList.yearReason}</td> 
					</tr>
				</c:forEach>
				</tbody>
			</table>
			
			<!-- 페이징 처리 -->
			

			<!-- 수정하기 버튼 -->
			<br> <br>
			<input type="button" class="viewDetails" value="사원목록 보기" onclick="location.href='/dayOff/list'"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="viewDetails" value="수정 하러 가기" onclick="location.href='/dayOff/modify?no=${dayOffInfo.no}'"/>
	</div>
	</div>
</body>
</html>