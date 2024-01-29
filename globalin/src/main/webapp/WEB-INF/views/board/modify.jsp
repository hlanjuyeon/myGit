<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Board</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="/resources/main/style.css">
		<link rel="stylesheet" type="text/css" href="/resources/board/board.css">
		<style>
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
div.line {
    border-bottom: 1px solid #ff8b77;
}

h4.reply-h4 {
    margin-bottom: 0;
}

.uploadResult {
    width: 100%;
}

.uploadResult ul {
    display: flex;
    justify-content: center;
}

.uploadResult ul li {
    list-style: none;
}

/* 게시글 상세보기 */
.content {
    background: #fff;
    padding: 20px;
    border-radius: 4px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
}

.content h4 {
    margin-bottom: 10px;
}

.content input[type="text"], .content textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    box-sizing: border-box;
    margin-bottom: 10px;
}

.content .button {
    margin-top: 10px;
}

/* 댓글 등록 */
.register-form {
    margin-top: 20px;
}

.register-form h4 {
    margin-bottom: 10px;
}

.register-form input[type="text"], .register-form textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    box-sizing: border-box;
    margin-bottom: 10px;
}

.register-form .button {
    margin-top: 10px;
}
		
			.sidenav {
				    position: fixed;
				    top: 0;
				    left: 0;
				    width: 200px;
				    height: 100%;
				    overflow-y: auto;
			}

			#main {
   					padding-left: 220px; /* navigation의 width(200px) + 추가 여백(20px) */
			}
			
			body > a, .header-right {
			    height: 100px; /* 원하는 높이로 설정 */
			}
			
			.sidenav, #main {
    			margin-top: 100px; /* header의 높이와 동일하게 설정 */
			}
			
			ul {
    list-style-type: none;
}
			h3 {
				text-align: right;
			}
			
			ul.actions {
				text-align: center;
			}

			.darkmode_div {
    position: absolute;
    margin-left: 20px;
    margin-left: 20px;
    bottom: 20px !important;
}
		</style>
	</head>
	<body class="is-preload">
		<%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
		<!-- Main -->
		<div id="main">
			<div class="wrapper">
				<div class="inner">

					<!-- Elements -->
					<header class="major">
						<h1>게시글 수정하기</h1>
					</header>
					<!-- Table -->
					<h3><a href="/board/list${criteria.params}" class="button small">목록 보기</a></h3>
					<div class="content">
						<div class="form">
							<form action="/board/modify" method="post">
								<input type="hidden" name="pageNum" value="${criteria.pageNum}">
								<input type="hidden" name="type" value="${criteria.type}">
								<input type="hidden" name="keyword" value="${criteria.keyword}">
								<div class="fields">
									<div class="field">
										<h4>번호</h4>
										<input type="text" name="bno" value="${board.bno}" readonly>
									</div>
									<div class="field">
										<h4>*제목</h4>
										<input type="text" name="title" value="${board.title}">
									</div>
									<div class="field">
										<h4>*내용</h4>
										<textarea name="content" rows="6" style="resize: none;">${board.content}</textarea>
									</div>
									<div class="field">
										<h4>부서</h4>
										<input type="text" name="deptName" value="${board.deptName}" readonly>
									</div>
									<div class="field">
										<h4>작성자</h4>
										<input type="text" name="name" value="${board.name}" readonly>
									</div>
								</div>
								<ul class="actions special">
									<li>
										<input type="submit" class="button" value="수정 완료"/>
									</li>
								</ul>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div> 
		</div>
	</body>
	<!-- Scripts -->
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
	<script src="/resources/assets/js/browser.min.js"></script>
	<script src="/resources/assets/js/breakpoints.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>
</html>