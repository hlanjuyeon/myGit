<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>${deptName} 부서 직원 리스트</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <button id="backButton" class="close">&times;</button>
    <ul id="employeeList">
        <c:forEach var="employee" items="${employees}">
            <li class="employeeBtn" data-target="${employee.no}">${employee.name}</li>
        </c:forEach>
    </ul>

    <script>
        $(document).ready(function() {
            $(".employeeBtn").click(function() {
                var employeeName = $(this).data('target');
                window.location.href = "/employees/" + employeeName;
                console.log(employee.no);
            });

            $('#backButton').click(function(){
                window.location.href = '/employeeInfo';
            });
        });
    </script>
</body>
</html>
