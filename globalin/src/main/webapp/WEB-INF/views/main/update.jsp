<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원정보 수정하기</title>
<link rel="stylesheet" type="text/css" href="/resources/main/style.css">
</head>
<style>
.MainContainer {
	/* position: fixed; */
	width: 100%;
	height: 120%;
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


input[type='text'], input[type='password'] {
	background-color: white;
	border: 2px solid #3D9970;
	padding: 5px 10px;
	margin-left: 15px;
	font-size: 16px;
	margin-top:5px;
	margin-bottom:5px;
	width: 320px;
}

.formContainer {
	margin-top:5px;
	margin-bottom:5px;
}

td {
	text-align:center;
}

.column {
	border-bottom: 1px solid #3D9970;
}

.modify {
	margin-right: 20px;
}

img {
width: 150px;
height: 150px;
}

.update {
	background-color: #3D9970;
	color: white;
	border: 2px solid #3D9970;
	border-radius: 15px;
	padding: 13px 15px;
	font-size: 16px;
}

.update:hover {
	background-color: white;
	color: #3D9970;
	transition-duration: 0.3s;
	border: 2px solid #3D9970;
	cursor: pointer;}
</style>
<body>
	<form action="/update" method="post">
		<%@ include file="/WEB-INF/views/main/header.jsp"%>
		<div class="body_css">
		
		<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
		<div class="MainContainer body_right" align="center">
			<div class="main">
				<table border="0" cellspacing="0" cellpadding="0" class="formContainer" width="950px">
					<tr>
						<th rowspan="4"><img src="/resources/photos/${employee.photo }" alt="Profile"/></th>
					</tr>
					<tr>
						<td class="column">이름</td>
						<th colspan="2"><input type="text" value="${employee.name }" readonly disabled></th>
					</tr>
					<tr>
						<td class="column">생년월일</td>
						<th colspan="2"><input type="text"value="${employee.birth }" readonly disabled></th>
					</tr>
					<tr>
						<td class="column">성별</td>
						<th colspan="2"><input type="text" value="${employee.gender }" readonly disabled></th>
					</tr>
					<tr>
						<td class="column">아이디</td>
						<td><input type="text" value="${employee.id }" id="id" name="id" class="id" readonly></td>
					</tr>
					<tr>
						<td class="column">비밀번호</td>
						<td><input type="password" name="pw" id="pw"></td>
					</tr>
					<tr>
						<td class="column">* 이메일</td>
						<td><input type="text" id="email" name="email" value="${employee.email }"></td>
					
					<tr>
						<td class="column">사원번호</td>
						<td><input type="text" value="${employee.no }" readonly disabled></td>
					</tr>
					<tr>
						<td class="column">직급</td>
						<td><input type="text" id="position" name="position" value="${employee.position }" readonly disabled></td>
					</tr>
					<tr>
						<td class="column">부서명</td>
						<td><input type="text" value="${employee.deptName }" readonly disabled></td>
					</tr>
					<tr>
						<td class="column">부서번호</td>
						<td><input type="text" value="${employee.deptNo }" readonly disabled></td>
					</tr>
					<tr>
						<td class="column">사내전화번호</td>
						<td><input type="text" value="${employee.call }" readonly disabled></td>
					</tr>
					<tr>
						<td class="column">* 개인전화번호</td>
						<td><input type="text" id="phone" name="phone" value="${employee.phone }"></td>					
					</tr>
					<tr>
						<td class="column">입사일자</td>
						<td><input type="text" value="${employee.hireDate }" readonly disabled></td>
					</tr>
					<tr>
						<td class="column">재직상태</td>
						<td><input type="text" value="${employee.status }" readonly disabled></td>
					</tr>
				</table>			
			</div>
			<input type="submit" value="수정하기" style="margin-right: 20px; float:right;" class="update">
		</div>
		</div>
	</form>
</body>
</html>