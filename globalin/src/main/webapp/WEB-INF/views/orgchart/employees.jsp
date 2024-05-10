<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>${deptNo} 부서 직원 리스트</title>

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
    
    .wrapper {
	    margin-left: 250px;
    }

    #backButton {
        border: 1px solid #00c853;
        padding: 10px;
        text-align: center;
        cursor: pointer;
        margin: 10px;
        border-radius: 5px;
        color: #ffffff;
        background-color: #00c853;
        transition: background-color 0.3s ease;
    }

    #backButton:hover {
        background-color: #009624;
    }

    #employeeList {
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

    #employeeList > li {
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

    #employeeList > li:hover {
        background-color: #009624;
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
	background-color: #f0f0f0;
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
        .orgchart_move {
	background-color: #3D9970;
	color: white !important;
}
</style>
</head>
<body>
    <%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
    <div class="wrapper">
        <button id="backButton" class="close">&times;</button>
        <ul id="employeeList">
            <c:forEach var="employee" items="${employees}">
                <li class="employeeBtn" data-target="${employee.no}">${employee.name}</li>
            </c:forEach>
        </ul>
    </div>
    </div>

    <script>
        $(document).ready(function() {
            $(".employeeBtn").click(function() {
                var employeeName = $(this).data('target');
                window.location.href = "/orgchart/employees/" + employeeName;
                console.log(employee.no);
            });

            $('#backButton').click(function(){
                window.location.href = '/orgchart/employeeInfo';
            });
        });
    </script>
</body>
</html>
