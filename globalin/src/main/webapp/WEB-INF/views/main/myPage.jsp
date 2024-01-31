<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/main/style.css">
<title>마이페이지</title>
<style>
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

input[type='text'] {
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

.column {
	width:150px;
}

.modify {
	background-color: #3D9970;
	color: white;
	border: 2px solid #3D9970;
	border-radius: 15px;
	padding: 13px 15px;
	font-size: 16px;
}

.modify:hover {
	background-color: white;
	color: #3D9970;
	transition-duration: 0.3s;
	border: 2px solid #3D9970;
	cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
		<div class="MainContaine body_right" align="center">
			<div class="main">
				<table border="0" cellspacing="0" cellpadding="0" class="formContainer" width="950px">
					<tr>
						<th rowspan="4"><img src="/resources/photos/${employee.photo}" alt="Profile"/></th>
					</tr>
					<tr>
						<td class="column">이름</td>
						<th colspan="2"><input type="text" id="id" name="id" value="${employee.name }" readonly></th>
					</tr>
					<tr>
						<td class="column">생년월일</td>
						<th colspan="2"><input type="text" id="birth" name="birth" value="${employee.birth }" readonly></th>
					</tr>
					<tr>
						<td class="column">성별</td>
						<th colspan="2"><input type="text" id="gender" name="gender" value="${employee.gender }" readonly></th>
					</tr>
					<tr>
						<td class="column">아이디</td>
						<td><input type="text" id="id" name="id" value="${employee.id }" readonly></td>
					</tr>
					<tr>
						<td class="column">이메일</td>
						<td><input type="text" id="email" name="email" value="${employee.email }" readonly></td>
					
					<tr>
						<td class="column">사원번호</td>
						<td><input type="text" id="no" name="no" value="${employee.no }" readonly></td>
					</tr>
					<tr>
						<td class="column">직급</td>
						<td><input type="text" id="position" name="position" value="${employee.position }" readonly></td>
					</tr>
					<tr>
						<td class="column">부서명</td>
						<td><input type="text" id="deptName" name="deptName" value="${employee.deptName }" readonly></td>
					</tr>
					<tr>
						<td class="column">부서번호</td>
						<td><input type="text" id="deptNo" name="deptNo" value="${employee.deptNo }" readonly></td>
					</tr>
					<tr>
						<td class="column">사내전화번호</td>
						<td><input type="text" id="call" name="call" value="${employee.call }" readonly></td>
					</tr>
					<tr>
						<td class="column">개인전화번호</td>
						<td><input type="text" id="phone" name="phone" value="${employee.phone }" readonly></td>					
					</tr>
					<tr>
						<td class="column">입사일자</td>
						<td><input type="text" id="hireDate" name="hireDate" value="${employee.hireDate }" readonly></td>
					</tr>
					<tr>
						<td class="column">재직상태</td>
						<td><input type="text" id="status" name="status" value="${employee.status }" readonly></td>
					</tr>
				</table>			
			</div>
			<input type="button" class="modify" style="float:right;" value="수정하기" onclick="location.href='/update'">
		</div>
	</div>
</body>
</html>