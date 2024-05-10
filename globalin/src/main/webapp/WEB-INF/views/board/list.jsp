<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Board</title>
		
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!-- <link rel="stylesheet" href="/resources/assets/css/main.css" /> -->
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

/* 			body {transform: scale(0.8);}*/
			.big-width {display: block;}
			.small-width {display: none;}
			.table-wrapper {overflow-x: hidden;} 
			select{
				width:15%;
				display:inline;
			}
			
			input[name='keyword']{
				display:inline;
				width:60%;
			}
			
			.search{
				width:20%;
			}
			
			@media(max-width: 918px){
				body {transform: scale(1); overflow-x: hidden;}
				.deptName {display: none;}
				.name {display: none;}
				.regDate {display: none;}
				.updateDate {display: none;}
				.big-width {display: none;}
				.small-width {display: block;}
				select{
					width:100%;
				}
				
				input[name='keyword']{
					width:100%;
				}
				
				.search{
					width:100%;
				}
			}
			
			.sidenav {
				    position: fixed;
				    top: 20px;
				    left: 0;
				    width: 200px;
				    /* height: 100%; */
				   /*  overflow-y: auto; */
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
			
			.major > h1 > a {
			    color: black;
			    text-decoration: none;
			}
			
			.major > h1 > a:visited {
			    color: gray;
			}
			
			.major > h1 > a:hover {
			    color: green;
			}
			
			.major > h1 > a:active {
			    color: blue;
			}

			.darkmode_div {
    position: absolute;
    margin-left: 20px;
    margin-left: 20px;
    bottom: 20px !important;
}

.board_move {
	background-color: #3D9970;
	color: white !important;
}
		</style>
	</head>
	<body class="is-preload">
	<% Boolean isUserLoggedIn = (session.getAttribute("employee") != null); %>
	<%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
		<!-- Main -->
		<div id="main">
			<div class="wrapper">
				<div class="inner">
					<!-- Elements -->
					<header class="major">
						<h1><a href="/board/list">공지게시판</a></h1>
						<!-- <p>게시판 목록</p> -->
					</header>
					<!-- Table -->
					<h3><a href="/board/register" class="button small" style="text-decoration: none;">글 등록</a></h3>
					<div class="table-wrapper">
						<table>
							<thead>
								<tr class="tHead">
									<th class="bno">번호</th>
									<th class="title">제목</th>
									<th class="deptName">부서</th>
									<th class="name">작성자</th>
									<th class="regDate">작성일</th>
									<th class="updateDate">수정일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="board" items="${boardList}">
									<tr class="tBody">
										<td class="bno">${board.bno}</td>
										<td class="title"><a href="/board/read${pageDTO.criteria.params}&bno=${board.bno}">${board.title}</a></td>
										<td class="deptName">${board.deptName}</td>
										<td class="name">${board.name}</td>
										<td class="regDate">${board.regDate}</td>
										<td class="updateDate">${board.updateDate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<form action="/board/list" name="searchForm">
							<div class="fields">
								<div class="field" style="text-align: center;">
									<select name="type">
										<option value="" ${pageDTO.criteria.type == null? 'selected' : ''}>검색 기준</option>
										<option value="TCW" ${pageDTO.criteria.type == 'TCW' ? 'selected' : ''}>전체</option>
										<option value="T" ${pageDTO.criteria.type == 'T' ? 'selected' : ''}>제목</option>
										<option value="C" ${pageDTO.criteria.type == 'C' ? 'selected' : ''}>내용</option>
										<option value="D" ${pageDTO.criteria.type == 'D' ? 'selected' : ''}>부서</option>
										<option value="W" ${pageDTO.criteria.type == 'W' ? 'selected' : ''}>작성자</option>
										<option value="TW" ${pageDTO.criteria.type == 'TW' ? 'selected' : ''}>제목 또는 작성자</option>
										<option value="TC" ${pageDTO.criteria.type == 'TC' ? 'selected' : ''}>제목 또는 내용</option>
									</select>
									<input type="text" name="keyword" value="${pageDTO.criteria.keyword}">
									<input type="hidden" name="pageNum" value="${pageDTO.criteria.pageNum}">
									<a href="javascript:send()" class="search button primary icon solid fa-search" style="text-decoration: none;">검색</a>
								</div>
							</div>
						</form>
						<div style="text-align: center;" class="big-width">
							<c:if test="${pageDTO.prev}">
								<a class="changePage" href="${pageDTO.startPage - 1}"><code>&lt;</code></a>
							</c:if>
							<c:forEach var="num" begin="${pageDTO.startPage}" end="${pageDTO.endPage}">
								<c:choose>
									<c:when test="${pageDTO.criteria.pageNum == num}">
										<code><c:out value="${num}"/></code>
									</c:when>
									<c:otherwise>
										<a class="changePage" href="${num}"><code><c:out value="${num}"/></code></a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${pageDTO.next}">
								<a class="changePage" href="${pageDTO.endPage + 1}"><code>&gt;</code></a>
							</c:if>
						</div>
						<div style="text-align: center;" class="small-width">
							<c:if test="${pageDTO.criteria.pageNum > 1}">
								<a class="changePage" href="${pageDTO.criteria.pageNum - 1}"><code>&lt;</code></a>
							</c:if>
							<code><c:out value="${pageDTO.criteria.pageNum}"/></code>
							<c:if test="${pageDTO.realEnd > pageDTO.criteria.pageNum}">
								<a class="changePage" href="${pageDTO.criteria.pageNum + 1}"><code>&gt;</code></a>
							</c:if>
						</div>
						<form name="pageForm" action="/board/list">
							<input type="hidden" name="pageNum" value="${pageDTO.criteria.pageNum}">
							<input type="hidden" name="type" value="${pageDTO.criteria.type}">
							<input type="hidden" name="keyword" value="${pageDTO.criteria.keyword}">
						</form>
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
	<script>
		//페이지 이동을 하기 위해 a태그를 클릭하면 이벤트 실행
		$("a.changePage").on("click", function(e){
			e.preventDefault();
			//form태그 가져오기
			let $form = $(document.pageForm);
			//form태그 자식 요소 중 pageNum이 이름인 input태그 가져오기
			//기존의 value값을 사용자가 이동하고자 하는 페이지 번호로 변경하기
			$form.find("input[name='pageNum']").val($(this).attr("href"));
			$form.submit();
		});
	
		function send(){
			let $form = $(document.searchForm);
			if(!$form.find("option:selected").val()){
				alert("검색 종류를 선택하세요.");
				return;
			}
			
			if(!$form.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요.");
				return;
			}
			
			$form.submit();
		}
		
		$(document).ready(function() {
		    var isUserLoggedIn = "<%=isUserLoggedIn%>";
		    if (isUserLoggedIn == "false") {
		        $(".button.small").attr("href", "#");
		        $(".button.small").css("pointer-events", "none");
		        $(".button.small").css("background", "#ccc");
		    }
		});

	</script>
</html>