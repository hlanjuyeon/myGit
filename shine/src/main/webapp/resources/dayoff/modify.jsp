<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연차 상세보기_관리자</title>

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
	border-spacing: 50px 0;
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

.input {
	width: 120px;
	height: 25px;
	font-size: 30px;
	text-align: center;
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
<form action="/dayOff/modify" method="post">
       
			<table class="name">

				<tr>
					<th>사원명 :</th>
					<td>${dayOffInfo.name}</td>
					<th>사원번호 :</th>
					<td>${dayOffInfo.no}</td>
				</tr>

			</table>

			<div>
				<b class=title>잔여연차</b>
			</div>
            
			<table class="dayOffInfo" border="1">
             
				<tr>
					<th width="250">총연차일수</th>
					<th width="250">총사용연차일수</th>
					<th width="250">잔여연차일수</th>
				</tr>
				
				 
				<tr>
					<td><input class=input type="number" name="total" value="${dayOffInfo.total}"> 일</td>
					<td>${dayOffInfo.usedTotal}일</td>
					<td>${dayOffInfo.remind}일</td>
				</tr>

			</table>

			<div>
				<b class=title>연차사용정보</b>
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

			<!-- 수정하기 버튼 -->
			<br> 
			<input type="hidden" id="no" name="no" value="${dayOffInfo.no}">
			<input type="submit" class="button" value="수정 완료" />
			 </form> 
	</div>
	
	<script type="text/javascript">
		console.log(document.getElementById("no").value);
	</script>
</body>
</html>