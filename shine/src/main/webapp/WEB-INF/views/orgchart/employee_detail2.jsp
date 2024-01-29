<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>${employee.name} 직원 정보</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <div id="employee1" class="modal defaultCursor">
        <div class="modal-content">
            <span class="close">&times;</span>
            <p>이름: ${employee.name}</p>
            <p>부서명: ${employee.deptName}</p>
            <p>직급: ${employee.position}</p>
            <p>이메일: ${employee.email}</p>
            <p>사내전화: ${employee.call}</p>
        </div>
    </div>

    <script>
    $(document).ready(function(){
        $('.close').click(function(){
            window.location.href = '/departments/${employee.deptName}';
        });
    });
    </script>
</body>
</html>
