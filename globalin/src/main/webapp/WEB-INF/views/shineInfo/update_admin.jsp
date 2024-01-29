<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정_관리자</title>

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
th {
	background-color: #3D9970;
	color: white;
	width: 100px;
	border-radius: 15px;
}

td {
	width: 150px;
	padding-left: 50px;
	font-size: 19px;
}

.update_admin{
margin-top: 20px;
margin-right: 200px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
		<div class="MainContaine body_right" align="center">
		<h2 align="center">사원정보 수정_관리자</h2>

		<form action="/shineInfo/modifyAdmin" method="post">
			<table border="0" heigh="400" width="600" align="center"
				style="margin-left: 300px;">
				<tr>
					<th>이름</th>
					<td><input type="text" id="name" placeholder="${shineInfo.name}" name="name"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" id="birth" name="birth"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
					   <input type="radio" name="gender" value="남자">남자
					   <input type="radio" name="gender" value="여자">여자
					</td>
				</tr>

				<tr>
					<th>아이디</th>
					<td><input type="text" id="id" placeholder="${shineInfo.id}" name="id"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="password" name="pw"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" id="password-retype"></td>
				</tr>
<%-- 				<tr>
					<th>사원번호</th>
					<td><input type="number" id="no" placeholder="${shineInfo.no}"></td>
				</tr> --%>
				<tr>
					<th>직급</th>
					<td>
					   <input type="radio" name="position" value="사원">사원
					   <input type="radio" name="position" value="주임">주임
					   <input type="radio" name="position" value="과장">과장
					   <input type="radio" name="position" value="부장">부장
					   <input type="radio" name="position" value="사장">사장
					</td>
				</tr>
				<tr>
					<th>부서명</th>
					<td>
					   <input type="radio" name="deptName" value="인사">인사
					   <input type="radio" name="deptName" value="총무">총무
					   <input type="radio" name="deptName" value="회계">회계
					   <input type="radio" name="deptName" value="마케팅">마케팅
					   <input type="radio" name="deptName" value="영업1">영업1
					</td>
				</tr>
				<tr>
					<th>부서번호</th>
					<td>
					  <input type="number">
					</td>
				</tr>
				<tr>
					<th>사내전화번호</th>
					<td><input type="text" id="call" placeholder="${shineInfo.call}" name="call"></td>
				</tr>
				<tr>
					<th>개인전화번호</th>
					<td><input type="text" id="phone" placeholder="${shineInfo.phone}" name="phone"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="email" id="email" placeholder="${shineInfo.email}" name="email"></td>
				</tr>
				<tr>
					<th>입사일자</th>
					<td><input type="date" id="hireDate" placeholder="${shineInfo.hireDate}" name="hireDate"></td>
				</tr>
				<tr>
					<th>퇴사일자</th>
					<td><input type="date" id="exitDate" placeholder="${shineInfo.exitDate}" name="exitDate"></td>
				</tr>
				<tr>
					<th>재직현황</th>
					<td>
					   <input type="radio" name="status" value="재직">재직
					   <input type="radio" name="status" value="휴직">휴직
					   <input type="radio" name="status" value="퇴사">퇴사
					</td>
				</tr>

			</table>
			<input type="hidden" id="no" name="no" value="${shineInfo.no}"> 

			<input type="submit" class="update_admin" value="수정 완료" />
		</form>
	</div>
	</div>
	<script type="text/javascript">
		console.log(document.getElementById("no").value);
	</script>
</body>
</html>