<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지_관리자</title>

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
	height: 700px;
}

.MainContainer {
	/* position: fixed; */
	width: 100%;
	height: 250px;
	margin-left: 20px;
	margin-bottom: 50px;
}

th{
font-size: 23px;
}

td {
    font-size: 20px;
	color: black;
	text-align: center;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
		<div class="MainContaine body_right" align="center">
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
					<td><a href="/shineInfo/viewDetails_admin?no=${shineInfoList.no}">${shineInfoList.name}</a></td>
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
		<input type="button" class="mayPage_admin" value="사원정보 생성하기" onclick="location.href='/insert'">
	</div>
	</div>
</body>
</html>