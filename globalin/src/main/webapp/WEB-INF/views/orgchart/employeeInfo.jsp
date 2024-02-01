<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>조직도</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
			.darkmode_div {
    position: absolute;
    margin-left: 20px;
    margin-left: 20px;
    bottom: 20px !important;
}
body {
	width: 1800px;
	height: 900px;
}
.body_css {
    /* display: flex; */
    margin-left: 100px;
}
.header_css {
    margin: 20px;
    display: flex;
        width: 1850px;
}
.body_right {
    min-width: 90%;
height: 100%;
}
        body {
            background-color: #f0f0f0;
        }

        .company {
            list-style-type: none;
            padding: 0;
            text-align: center;
        }
        .company > li {
            margin-bottom: 20px;
            cursor: pointer;
        }
        
        .departments {
            display: flex;
            flex-wrap:wrap;
            justify-content: space-around;
            list-style-type: none;
            padding: 0;
            margin-top: 20px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .departments > li {
            border: 1px solid #00c853;
            padding: 10px;
            width: 100px;
            text-align: center;
            cursor: pointer;
            margin: 10px;
            border-radius: 5px;
            color: #ffffff;
            background-color: #00c853;
            transition: background-color 0.3s ease;
        }
        .departments > li:hover {
            background-color: #009624;
        }
        
        .sidenav {
            border: 2px solid #3D9970;
            border-radius: 20px;
            width: 200px;
            position: fixed;
            z-index: 1;
            top: 110px; /* Adjust this value based on your header's height */
            height: 70%;
            left: 10px;
            overflow-x: hidden;
            padding-top: 20px;
        }

        .wrapper {
            margin-left: 250px; /* Adjust this value based on your navigation's width */
        }
        
.dropdown-btn {
	color: #3D9970;
	padding: 10px 0 10px 0;
	text-decoration: none;
	font-size: 20px;
	display: block;
	border: none;
	width: 100%;
	text-align: center;
	cursor: pointer;
	outline: none;
}
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
	<div class="wrapper">
	    <ul class="departments">
	        <li class="myBtn" data-target="경영진">경영진</li>
	    </ul>
	    <ul class="departments">
	        <li class="myBtn" data-target="인사부">인사부</li>
	        <li class="myBtn" data-target="마케팅부">마케팅부</li>
	        <li class="myBtn" data-target="재무부">재무부</li>
	        <li class="myBtn" data-target="회계부">회계부</li>
	        <li class="myBtn" data-target="운영부">운영부</li>
	        <li class="myBtn" data-target="고객서비스부">고객서비스부</li>
	        <li class="myBtn" data-target="제품개발부">제품개발부</li>
	        <li class="myBtn" data-target="정보기술부">정보기술부</li>
	        <li class="myBtn" data-target="법무부">법무부</li>
	        <li class="myBtn" data-target="물류부">물류부</li>
	        <li class="myBtn" data-target="품질관리부">품질관리부</li>
	    </ul>
	</div>
    </div>
    <script>
        $(document).ready(function() {
            $(".myBtn").click(function() {
                var deptName = $(this).data('target');
                window.location.href = "/orgchart/departments/" + deptName;
            });
        });
    </script>
</body>
</html>
