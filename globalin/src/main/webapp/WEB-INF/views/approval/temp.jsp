<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
	
	<!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <link rel="stylesheet" href="/resources/approval/list.css" type="text/css">
<title>임시저장</title>
<style>
    	body {
	width: 1800px;
	height: 900px;
}

.body_css {
    display: flex;
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

.approval_move {
	background-color: #3D9970;
	color: white !important;
}
</style>
</head>
<script type="text/javascript">
$(document).ready(function() {
	
	var moveForm = $("#moveForm");
	
	$(".move").on("click", function(e){
        e.preventDefault();
        var formType = $(this).find(".item").text();
        var currentNo = $(this).attr("href");
        
        if(formType === '첨언') {
            moveForm.attr("action", "/approval/modifyReply");
        } else if(formType === '연차') {
            moveForm.attr("action", "/approval/modifyYear");
        } else {
            moveForm.attr("action", "/approval/modify");
        }
        
        moveForm.find("input[name='no']").remove();
        moveForm.append("<input type='hidden' name='no' value='"+ $(this).attr("href")+ "'>");
        moveForm.submit();
	});
	
	$(".pageInfo a").on("click", function(e){
        e.preventDefault();
        var pageNum = $(this).attr("href");
        moveForm.find("input[name='pageNum']").val(pageNum);
        moveForm.attr("action", "/approval/temp");
        moveForm.submit();
    });
	
});
</script>
<body>
    <%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
	<div class="temp_border">
        <div class="flex list_top"> 
            <p class="no">No</p>
            <p class="item">항목</p>
            <p class="title_temp">제목</p>
            <p class="writer">작성자</p>
            <p class="write_date">작성일시</p>
            <p class="payment_date">수정일시</p>
        </div>
        <c:forEach items="${temp}" var="item"> 
        <div class="a_move">
            <a class="move" href='<c:out value="${item.no}"/>'>
	        	<div class="list_item">
		            <p class="no"><c:out value="${item.no}"/></p>
		            <p class="item"><c:out value="${item.form}"/></p>
		            <p class="title_temp">
					    <c:out value="${item.form eq '첨언' ? item.titleReply : item.title}" escapeXml="false" />
					</p>
		            <p class="writer">
		            	<c:out value="${item.form eq '첨언' ? item.writerReply : item.writer}" escapeXml="false" />
		            </p>
		            <p class="write_date"><c:out value="${item.writeDay}"/></p>
		            <p class="payment_date"><c:out value="${item.updateDay}"/></p>
	            </div>
            </a>
            </div>
        </c:forEach>
    </div>
</div>
        <div class="main_bottom temp_bottom">
	    <div class="search_area">
	     	<select name="type" class="search_list">
	            <option value="" <c:out value="${pageMaker.criteria.type == null?'selected':'' }"/>>--</option>
	            <option value="T" <c:out value="${pageMaker.criteria.type eq 'T'?'selected':'' }"/>>제목</option>
	            <option value="C" <c:out value="${pageMaker.criteria.type eq 'C'?'selected':'' }"/>>내용</option>
	            <option value="W" <c:out value="${pageMaker.criteria.type eq 'W'?'selected':'' }"/>>작성자</option>
	            <option value="P" <c:out value="${pageMaker.criteria.type eq 'TC'?'selected':'' }"/>>상태</option>
	        </select>
	        <input type="text" class="search_text" name="keyword" value="${pageMaker.criteria.keyword}">
	        <button class="search_button">검색</button>
	    </div>
        <div class="pageInfo_wrap">
    <ul id="pageInfo" class="pageInfo">
        <!-- 이전페이지 버튼 -->
        <c:if test="${pageMaker.prev}">
            <li class="pageInfo_btn previous"><a href="${pageMaker.startPage - 1}">Prev</a></li>
        </c:if>
        <!-- 각 번호 페이지 버튼 -->
        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
            <li class="pageInfo_btn ${pageMaker.criteria.pageNum == num ? 'active' : ''}"><a href="${num}">${num}</a></li>
        </c:forEach>
        <!-- 다음페이지 버튼 -->
        <c:if test="${pageMaker.next}">
            <li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1}">Next</a></li>
        </c:if>
    </ul>
</div>
</div>

    <form id="moveForm" method="get">
    	<input type="hidden" name="pageNum" value="${pageMaker.criteria.pageNum}">
        <input type="hidden" name="amount" value="${pageMaker.criteria.amount}">   
        <input type="hidden" name="keyword" value="${pageMaker.criteria.keyword}">
    	<input type="hidden" name="type" value="${pageMaker.criteria.type}">
    	<input type="hidden" name="loginNo" value='<c:out value="${employee.no}"/>'>
    </form>
</body>
</html>