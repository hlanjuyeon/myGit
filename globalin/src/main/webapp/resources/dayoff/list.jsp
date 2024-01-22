<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연차관리 리스트_관리자</title>

<link rel="stylesheet" href="../resources/css/style.css" type="text/css">
<jsp:include page="./header.jsp" flush="false" />
<jsp:include page="./navigation.jsp" flush="false" />
<style type="text/css">
.MainContainer {
	width: 1400px;
	height: 800px;
}

.list {
	font-size: 18px;
}

.list.td {
	color: black;
	text-align: center;
}
</style>

</head>
<body>
</head>
<body>
	<div class="MainContainer" align="center"
		style="margin-left: 250px; margin-top: 15px;">
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
		
		<br>
		<!-- 페이징 처리 -->

		<!-- 검색 -->
		<br>
		<!-- form action="" style="height: 50px;">
			<select name="searchWhat" style="height: 25px;">
				<option value="name">사원명</option>
				<option value="">사원번호</option>
			</select> <input type="text" name="searchWhat" style="height: 20px;">
			<input type="submit" value="검색" style="width: 70px; height: 50px;">
		</form> -->

	</div>
</body>
</html>