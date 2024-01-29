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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <link rel="stylesheet" href="/resources/approval/list.css" type="text/css" media="all">
	<title>전자결재</title>
<script type="text/javascript">
$(document).ready(function() {
    alert('한 번 상신된 문서는 수정할 수 없습니다. \n수정이 필요한 경우, 삭제 후 다시 작성해주시기 바랍니다.');
    
    var moveForm = $("#moveForm");
    
    $(".move").on("click", function(e){
        e.preventDefault();
        var formType = $(this).find(".item").text();
        var currentNo = $(this).attr("href");
        
        if (formType === '첨언') {
            moveForm.attr("action", "/approval/detailReply");
        } else if(formType === '연차') {
            moveForm.attr("action", "/approval/detailYear");
        } else {
            moveForm.attr("action", "/approval/detail");
        }
        
        moveForm.find("input[name='no']").remove();
        moveForm.append("<input type='hidden' name='no' value='"+ $(this).attr("href")+ "'>");
        moveForm.submit();
    });

    $(".pageInfo a").on("click", function(e){
        e.preventDefault();
        var pageNum = $(this).attr("href");
        moveForm.find("input[name='pageNum']").val(pageNum);
        moveForm.attr("action", "/approval/listOut");
        moveForm.submit();
    });
    
    $(".search_area button").on("click", function(e){
        e.preventDefault();
        
        var type = $(".search_area select").val();
        var keyword = $(".search_area input[name='keyword']").val();
        
        if(!type){
            alert("검색 종류를 선택하세요.");
            return false;
        }
        
        if(!keyword){
            alert("키워드를 입력하세요.");
            return false;
        }        
        
        moveForm.find("input[name='type']").val(type);
        moveForm.find("input[name='keyword']").val(keyword);
        moveForm.find("input[name='pageNum']").val(1);
        moveForm.submit();
    });
    
    document.querySelector('#outbox').checked = true;
});
</script>
<style type="text/css">
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
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
	<div class="list_border">
        <div class="flex list_top"> 
            <p class="no">No</p>
            <p class="item">항목</p>
            <p class="title">제목</p>
            <p class="writer">작성자</p>
            <p class="write_date">작성일시</p>
            <p class="payment_date">결재일시</p>
            <p class="progress">상태</p>
        </div>
        <c:forEach items="${list}" var="item"> 
        	<div class="a_move">
            <a class="move" href='<c:out value="${item.no}"/>'>
	        	<div class="list_item">
		            <p class="no"><c:out value="${item.no}"/></p>
		            <p class="item"><c:out value="${item.form}"/></p>
		            <p class="title">
                        <span class="reply_img">
                        	<c:out value="${item.groupOrd > 0 ? '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-arrow-return-right\" viewBox=\"0 0 16 16\"><path fill-rule=\"evenodd\" d=\"M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z\"/></svg>' : ''}" escapeXml="false" />
			            </span>&nbsp;&nbsp;
                        <c:out value="${item.form == '첨언' ? item.titleReply : item.title}" escapeXml="false" />
                    </p>
		            <p class="writer">
						<c:out value="${item.form == '첨언' ? item.writerReply : item.writer}" escapeXml="false" />
					</p>
		            <p class="write_date"><c:out value="${item.writeDay}"/></p>
		            <p class="payment_date"><c:out value="${item.appDay1}"/></p>
		            <p class="progress"><c:out value="${item.state}"/></p>
	            </div>
            </a>
            </div>
        </c:forEach>
    </div>
    </div>
    <div class="main_bottom">
    <div class="save_tap">
        <input type="radio" name="mystore" value="inbox" id="inbox">
       <label class="inbox" for="inbox" onclick="window.location.href = '/approval/listIn?loginNo=<c:out value="${employee.no}"/>';">
       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
		  <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
		</svg>
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope-open" viewBox="0 0 16 16">
		  <path d="M8.47 1.318a1 1 0 0 0-.94 0l-6 3.2A1 1 0 0 0 1 5.4v.817l5.75 3.45L8 8.917l1.25.75L15 6.217V5.4a1 1 0 0 0-.53-.882l-6-3.2ZM15 7.383l-4.778 2.867L15 13.117V7.383Zm-.035 6.88L8 10.082l-6.965 4.18A1 1 0 0 0 2 15h12a1 1 0 0 0 .965-.738ZM1 13.116l4.778-2.867L1 7.383v5.734ZM7.059.435a2 2 0 0 1 1.882 0l6 3.2A2 2 0 0 1 16 5.4V14a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V5.4a2 2 0 0 1 1.059-1.765l6-3.2Z"/>
		</svg>	
		수신함
       </label>
    	<input type="radio" name="mystore" value="outbox" id="outbox">
    	<label class="outbox" for="outbox" onclick="window.location.href = '/approval/listOut?loginNo=<c:out value="${employee.no}"/>';">
   		 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
	  		<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
		</svg>
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope-open" viewBox="0 0 16 16">
	 		<path d="M8.47 1.318a1 1 0 0 0-.94 0l-6 3.2A1 1 0 0 0 1 5.4v.817l5.75 3.45L8 8.917l1.25.75L15 6.217V5.4a1 1 0 0 0-.53-.882l-6-3.2ZM15 7.383l-4.778 2.867L15 13.117V7.383Zm-.035 6.88L8 10.082l-6.965 4.18A1 1 0 0 0 2 15h12a1 1 0 0 0 .965-.738ZM1 13.116l4.778-2.867L1 7.383v5.734ZM7.059.435a2 2 0 0 1 1.882 0l6 3.2A2 2 0 0 1 16 5.4V14a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V5.4a2 2 0 0 1 1.059-1.765l6-3.2Z"/>
		</svg>	
    	발신함
    	</label>
    </div>
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
        <div class="link_btn">
            <button type="button" class="write_btn" onclick="location.href='/approval/write'">문서작성</button>
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