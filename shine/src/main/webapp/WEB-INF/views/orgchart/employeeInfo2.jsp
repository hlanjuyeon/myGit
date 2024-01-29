<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>회사 조직도</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
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
            justify-content: space-around;
            list-style-type: none;
            padding: 0;
        }
        .departments > li {
            border: 1px solid black;
            padding: 10px;
            width: 100px;
            text-align: center;
            cursor: pointer;
        }
        .modal {
            display: none; 
            position: fixed; 
            z-index: 1; 
            left: 0;
            top: 0;
            width: 100%; 
            height: 100%; 
            overflow: auto; 
            background-color: rgb(0,0,0); 
            background-color: rgba(0,0,0,0.4); 
        }
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; 
            padding: 20px;
            border: 1px solid #888;
            width: 80%; 
        }

        .defaultCursor .modal-content p {
        cursor: default;
        }

        .modal-content p {
        cursor: pointer;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
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

    <script>
        $(document).ready(function() {
            $(".myBtn").click(function() {
                var deptName = $(this).data('target');
                window.location.href = "/departments/" + deptName;
            });
        });
    </script>
</body>
</html>
