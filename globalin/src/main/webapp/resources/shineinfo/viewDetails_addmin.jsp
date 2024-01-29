<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원정보 상세보기_관리자</title>

<link rel="stylesheet" href="../resources/css/style.css" type="text/css">
<jsp:include page="./header.jsp" flush="false" />
<jsp:include page="./navigation.jsp" flush="false" />

<style type="text/css">
.MainContainer{
width: 1200px;
	height: 815px;
	font-size: 18px;
	line-height: 2;;
	padding-left: 70px;
	margin-left: 300px;
	margin-top: 10px;
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

<div class=MainContainer align="right">
<h2 align="center" >사원정보 상세보기</h2>

 <!-- 사원 사진  ${shine.photo}-->
<img alt="" src="Logo.png" width=180 height=180 align="left">


    <table border="0"  heigh="400" width="600" align="center" style="margin-left: 300px;">
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
    
   <button class="button" style="margin-right: 90px" onclick="location.href='/shineInfo/update_addmin'">사원정보수정 하기</button>
    
</div>

</body>
</html>