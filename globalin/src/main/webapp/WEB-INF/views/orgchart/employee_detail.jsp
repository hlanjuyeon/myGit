<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>${employeeDto.name} 직원 정보</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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

.modal {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start; /* 모달을 화면 위쪽으로 이동 */
    height: 100vh;
    background-color: #f0f0f0;
    border-radius: 5px;
    box-shadow: 0px 0px 0px rgba(0, 0, 0, 0.1);
    padding-top: 10%; /* 화면 위쪽으로부터의 간격 조정 */
    animation: modalOpen 0.5s ease-out; /* 애니메이션 효과 추가 */
}

.modal-content {
    padding: 30px;
    border-radius: 5px;
    background-color: #00c853;
    color: #ffffff;
    width: 350px;
    text-align: center;
    transition: background-color 0.3s ease;
    transform: scale(0); /* 초기에는 모달 크기를 0으로 설정 */
    animation: modalContentOpen 0.5s ease-out forwards; /* 애니메이션 효과 추가 */
}

@keyframes modalOpen {
    from { padding-top: 0%; }
    to { padding-top: 10%; }
}

@keyframes modalContentOpen {
    from { transform: scale(0); }
    to { transform: scale(1); }
}


        .close {
            border: none;
            color: #ffffff;
            background-color: #00c853;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            margin: 20px 2px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease;
            font-size: 1.2em;
        }

        .close:hover {
            background-color: #009624;
            transform: scale(1.05);
        }

        p {
            margin-bottom: 15px;
            font-size: 1.1em;
            color: #ffffff;
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
    <div id="employee1" class="modal defaultCursor">
        <div class="modal-content">
            <span class="close">&times;</span>
            <p>이름: ${no.name}</p>
            <p>부서명: ${no.deptName}</p>
            <p>직급: ${no.position}</p>
            <p>이메일: ${no.email}</p>
            <p>사내전화: ${no.call}</p>
        </div>
    </div>
</div>
    <script>
    $(document).ready(function(){
        $('.close').click(function(){
            window.location.href = '/orgchart/departments/${no.deptName}';
        });
    });
    </script>
</body>
</html>
