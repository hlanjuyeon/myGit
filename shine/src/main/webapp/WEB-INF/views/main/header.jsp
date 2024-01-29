<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/main/header.css">
<<<<<<< HEAD
<script src="/resources/main/alertify.min.js" type="text/javascript"></script>
<script src="/resources/main/jquery-3.4.1.js" type="text/javascript"></script>
=======
<script src="/resources/js/alertify.min.js" type="text/javascript"></script>
<script src="/resources/js/jquery-3.4.1.js" type="text/javascript"></script>
>>>>>>> origin/master
<style>
	body {
	width: 1800px;
}
.logout {
	background-color: #3D9970;
	color: white;
	border: 2px solid #3D9970;
	border-radius: 15px;
	padding: 13px 15px;
	font-size: 16px;
}

.logout:hover {
	background-color: white;
	color: #3D9970;
	transition-duration: 0.3s;
	border: 2px solid #3D9970;
	cursor: pointer;
}
</style>
</head>  
<body>
	<div class="header_css">
	<a href='/main?no=<c:out value="${employee.no}"/>'><img class="logo" src="/resources/main/Logo.png"></a>
	<div class="header-right">
		<c:out value='${employee.name}님'/>&nbsp;&nbsp;
	<form action="/logout">
		<input type="submit" class="logout" value="로그아웃">
	</form>
	</div>
</div>
</body>
</html>