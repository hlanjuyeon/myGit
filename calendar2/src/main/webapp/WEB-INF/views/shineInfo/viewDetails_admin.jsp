<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원정보 상세보기_관리자</title>

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
background-color: #3D9970;
color: white;
width: 100px;
border-radius: 15px;
}

td{
width: 150px;
padding-left: 50px;
color: black;
font-size: 20px;
font-weight : 700;
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
		<div class="MainContaine body_right" align="center">
<h2 align="center" >사원정보 상세보기</h2>

    <table border="0" heigh="400" width="600" align="center" style="margin-left: 300px;">
        <tr>
            <th>이름</th>
            <td >${viewDetailsShineInfo.name}</td>
        </tr>
        <tr>
            <th>생년월일</th>
            <td >${viewDetailsShineInfo.birth}</td>
        </tr>
        <tr>
            <th>성별</th>
            <td >${viewDetailsShineInfo.gender}</td>
        </tr>

        <tr>
            <th>아이디</th>
            <td>${viewDetailsShineInfo.id}</td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td>${viewDetailsShineInfo.pw}</td>
        </tr>
        <tr>
            <th>사원번호</th>
            <td>${viewDetailsShineInfo.no}</td>
        </tr>
        <tr>
            <th>직급</th>
            <td>${viewDetailsShineInfo.position}</td>
        </tr>
        <tr>
            <th>부서명</th>
            <td>${viewDetailsShineInfo.deptName}</td>
        </tr>
        <tr>
            <th>부서번호</th>
            <td>${viewDetailsShineInfo.deptNo}</td>
        </tr>
        <tr>
            <th>사내전화번호</th>
            <td>${viewDetailsShineInfo.phone}</td>
        </tr>
        <tr>
            <th>개인전화번호</th>
            <td>${viewDetailsShineInfo.call}</td>
        </tr>
        <tr>
            <th>이메일</th>
            <td>${viewDetailsShineInfo.email}</td>
        </tr>
        <tr>
            <th>입사일자</th>
            <td>${viewDetailsShineInfo.hireDate}</td>
        </tr>
        <tr>
            <th>퇴사일자</th>
            <td>${viewDetailsShineInfo.exitDate}</td>
        </tr>
        <tr>
            <th>재직현황</th>
            <td>${viewDetailsShineInfo.status}</td>
        </tr>
        
    </table>
    
   <button class="button" style="margin-right: 90px" onclick="location.href='/shineInfo/update_admin?no=${viewDetailsShineInfo.no}'">사원정보수정 하기</button>
    
</div>
</div>
</body>
</html>