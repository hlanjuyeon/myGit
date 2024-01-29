<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지_관리자</title>

<link rel="stylesheet" href="../resources/css/style.css" type="text/css">
<jsp:include page="./header.jsp" flush="false" />
<jsp:include page="./navigation.jsp" flush="false" />
<style type="text/css">
.MainContainer {
	width: 1400px;
	height: 800px;
	margin-top: 10px;
	margin-left: 250px;
}

table {
	font-size: 20px;
}

td {
	color: black;
	text-align: center;
}
</style>

</head>
<body>
	<div class="MainContainer" align="center">
		<h1>마이페이지_관리자</h1>

		<table border="1" width="1350">
			<tr>
				<th bgcolor="orange" width="100">사원명</th>
				<th bgcolor="orange" width="100">사원번호</th>
				<th bgcolor="orange" width="100">직급</th>
				<th bgcolor="orange" width="100">부서명</th>
				<th bgcolor="orange" width="100">부서번호</th>
				<th bgcolor="orange" width="100">사내번호</th>
				<th bgcolor="orange" width="150">이메일</th>
				<th bgcolor="orange" width="100">입사일</th>
				<th bgcolor="orange" width="100">퇴사일</th>
				<th bgcolor="orange" width="100">재직상태</th>
			</tr>

			<c:forEach var="shineInfoList" items="${shineInfoList}">
				<tr>
					<td><a href="/shineInfo/viewDetails_addmin?no=${shineInfoList.no}">${shineInfoList.name}</a></td>
					<td>${shineInfoList.no}</td>
					<td>${shineInfoList.position}</td>
					<td>${shineInfoList.deptName}</td>
					<td>${shineInfoList.deptNo}</td>
					<td>${shineInfoList.call}</td>
					<td>${shineInfoList.email}</td>
					<td>${shineInfoList.hireDate}</td>
					<td>${shineInfoList.exitDate}</td>
					<td>${shineInfoList.status}</td>
				</tr>
				</c:forEach>
		</table>
		
		<!-- 페이징 처리 
		<br>-->
		


		<!-- 검색 
		 <br>
		<form action="#" style="height: 50px;">
			<select name="searchWhat" style="height: 25px;">
				<option value="name">사원명</option>
				<option value="">부서명</option>
			</select> <input type="text" name="searchWhat" style="height: 20px;">
			<input type="submit" value="검색" style="width: 70px; height: 50px;">
		</form> -->

		<!-- 수정하기 버튼 -->
		<br>
		<button class="button" float="right" onclick="location.href='#'">사원정보 생성하기</button>
	</div>
</body>
</html>