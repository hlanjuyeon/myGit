<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정_관리자</title>

<link rel="stylesheet" href="../resources/css/style.css" type="text/css">
<jsp:include page="./header.jsp" flush="false" />
<jsp:include page="./navigation.jsp" flush="false" />
<style type="text/css">
.MainContainer {
	width: 1200px;
	height: 815px;
	font-size: 18px;
	line-height: 2;;
	padding-left: 70px;
	margin-left: 300px;
	margin-top: 10px;
}

th {
	background-color: #3D9970;
	color: white;
	width: 100px;
}

td {
	width: 150px;
	padding-left: 50px;
}
</style>
</head>
<body>

	<div class=MainContainer align="right">
		<h2 align="center">사원정보 수정_관리자</h2>

 <!-- 사원 사진  ${shine.photo}-->
		<img alt="" src="Logo.png" width=180 height=180 align="left">


		<form action="/shineInfo/myPage_update" method="post">
			<table border="0" heigh="400" width="600" align="center"
				style="margin-left: 300px;">
				<tr>
					<th>이름</th>
					<td><input type="text" id="name"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" id="birth"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
					   <input type="radio" name="gender" value="남자">
					   <input type="radio" name="gender" value="여자">
					</td>
				</tr>

				<tr>
					<th>아이디</th>
					<td><input type="text" id="id"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="password"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" id="password-retype"></td>
				</tr>
				<tr>
					<th>사원번호</th>
					<td><input type="number" id="no"></td>
				</tr>
				<tr>
					<th>직급</th>
					<td>
					   <input type="radio" name="position" value="사원">
					   <input type="radio" name="position" value="주임">
					   <input type="radio" name="position" value="과장">
					   <input type="radio" name="position" value="부장">
					   <input type="radio" name="position" value="사장">
					</td>
				</tr>
				<tr>
					<th>부서명</th>
					<td>
					   <input type="radio" name="deptName" value="인사">
					   <input type="radio" name="deptName" value="총무">
					   <input type="radio" name="deptName" value="회계">
					   <input type="radio" name="deptName" value="마케팅">
					   <input type="radio" name="deptName" value="영업1">
					   <input type="radio" name="deptName" value="영업2">
					</td>
				</tr>
				<tr>
					<th>부서번호</th>
					<td>
					  <input type="radio" name="deptNo" value="1">
					   <input type="radio" name="deptNo" value="2">
					   <input type="radio" name="deptNo" value="3">
					   <input type="radio" name="deptNo" value="4">
					   <input type="radio" name="deptNo" value="5">
					   <input type="radio" name="deptNo" value="6">
					</td>
				</tr>
				<tr>
					<th>사내전화번호</th>
					<td><input type="text" id="call"></td>
				</tr>
				<tr>
					<th>개인전화번호</th>
					<td><input type="text" id="phone"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="email" id="email"></td>
				</tr>
				<tr>
					<th>입사일자</th>
					<td><input type="date" id="hireDate"></td>
				</tr>
				<tr>
					<th>퇴사일자</th>
					<td><input type="date" id="exitDate"></td>
				</tr>
				<tr>
					<th>재직현황</th>
					<td>
					   <input type="radio" name="status" value="재직">
					   <input type="radio" name="status" value="휴직">
					   <input type="radio" name="status" value="퇴사">
					</td>
				</tr>

			</table>
			<input type="hidden" id="no" name="no" value="${viewDetailsShineInfo.no}">

			<input type="submit" class="button" value="수정 완료" />
		</form>
	</div>
	<script type="text/javascript">
		console.log(document.getElementById("no").value);
	</script>
</body>
</html>