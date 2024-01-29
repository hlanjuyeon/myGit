<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
	
	<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    	
	<!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <!-- summerNote -->
    <script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/summernote-ko-KR.js"></script>
	
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
    
    <link rel="stylesheet" href="/resources/approval/list.css" type="text/css">
<title>전자결재 > 첨언문서 작성</title>
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

.note-editor.note-frame .note-editing-area {
    height: 250px !important;
}

</style>
<script type="text/javascript">
$(document).ready(function() {

	var toolbar = [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview','fullscreen', 'help']]
		  ];

	var setting = {
            height : 196,
            focus : true,
            lang : 'ko-KR',
            toolbar : toolbar,
            placeholder: '내용을 입력하세요.',
            tabsize: 4
         };

	$('#summernote').summernote(setting);
    
    document.querySelector("#send_list").addEventListener("click", () => {
    	document.querySelector("input[name=temp]").value = "상신";
    });

    document.querySelector("#send_temp").addEventListener("click", () => {
    	document.querySelector("input[name=temp]").value = "임시저장";
    });
    
	const BtnSuccess = document.querySelector(".btn-success");
	const BtnDanger = document.querySelector(".btn-danger");
	
	function disableSubmitButton(event) {
		alert("이미 반려된 상신문서입니다. 더 이상 결재를 진행할 수 없습니다.");
		event.preventDefault(); // 기본 이벤트 동작을 막습니다.
	}
    
	var buttonSuccess1 = document.querySelector(".appNo1btnS");
	var buttonDanger1 = document.querySelector(".appNo1btnD");
	var buttonSuccess2 = document.querySelector(".appNo2btnS");
	var buttonDanger2 = document.querySelector(".appNo2btnD");
	var buttonSuccess3 = document.querySelector(".appNo3btnS");
	var buttonDanger3 = document.querySelector(".appNo3btnD");
    
	var appState1 = "${detail.appState1}";
	var appState2 = "${detail.appState2}";
	var appState3 = "${detail.appState3}";
	
	if(appState1 === "결재") {
		buttonSuccess1.style.display = "none";
		buttonDanger1.style.display = "none";
		document.querySelector(".approve1_display").style.display = "block";
	} else if(appState1 === "반려") {
		buttonSuccess1.style.display = "none";
		buttonDanger1.style.display = "none";
		document.querySelector(".reject1_display").style.display = "block";
		buttonSuccess2.addEventListener("click", disableSubmitButton);
		buttonSuccess3.addEventListener("click", disableSubmitButton);
		buttonDanger2.addEventListener("click", disableSubmitButton);
		buttonDanger3.addEventListener("click", disableSubmitButton);
	}
	
	if(appState2 === "결재") {
		buttonSuccess2.style.display = "none";
		buttonDanger2.style.display = "none";
		document.querySelector(".approve2_display").style.display = "block";
	} else if(appState2 === "반려") {
		buttonSuccess2.style.display = "none";
		buttonDanger2.style.display = "none";
		document.querySelector(".reject2_display").style.display = "block";
		buttonSuccess1.addEventListener("click", disableSubmitButton);
		buttonSuccess3.addEventListener("click", disableSubmitButton);
		buttonDanger1.addEventListener("click", disableSubmitButton);
		buttonDanger3.addEventListener("click", disableSubmitButton);		
	}
	
	if(appState3 === "결재") {
		buttonSuccess3.style.display = "none";
		buttonDanger3.style.display = "none";
		document.querySelector(".approve3_display").style.display = "block";
	} else if(appState3 === "반려") {
		buttonSuccess3.style.display = "none";
		buttonDanger3.style.display = "none";
		document.querySelector(".reject3_display").style.display = "block";
		buttonSuccess1.addEventListener("click", disableSubmitButton);
		buttonSuccess2.addEventListener("click", disableSubmitButton);
		buttonDanger1.addEventListener("click", disableSubmitButton);
		buttonDanger2.addEventListener("click", disableSubmitButton);
	}
});
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
	<form action="/approval/reply" method="post" class="write_border">
		<div class="table_two">
        <table class="table_one">
            <tr>
                <td class="index radius_top_left">상신 제목</td>
                <td colspan="2">[<c:out value="${detail.form}"/>]&nbsp;<c:out value="${detail.title}"/></td>
            	
            </tr>
            <tr>
                <td class="index">
                    <span>상신부서</span> > <span>수신부서</span>
                </td>
                <td colspan="2"><c:out value="${detail.startDept}"/>&nbsp;&nbsp;>&nbsp;&nbsp;<c:out value="${detail.endDept}"/></td>
            </tr>
            <tr>
                <td class="index">상신자</td>
                <td colspan="2"><c:out value="${detail.writer}"/></td>
            </tr>
            <tr class="index">
                <td colspan="3">
                	상신 내용&nbsp;
                	<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
						확대&nbsp;
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-zoom-in" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
							<path d="M10.344 11.742c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1 6.538 6.538 0 0 1-1.398 1.4z"/>
							<path fill-rule="evenodd" d="M6.5 3a.5.5 0 0 1 .5.5V6h2.5a.5.5 0 0 1 0 1H7v2.5a.5.5 0 0 1-1 0V7H3.5a.5.5 0 0 1 0-1H6V3.5a.5.5 0 0 1 .5-.5z"/>
						</svg>
					</button>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="content_text">
                    <p><c:out value="${detail.content}" escapeXml="false"/></p>
                </td>
            </tr>
            <tr class="index">
                <td colspan="3" class="content_index">결재자</td>
            </tr>
           <tr>
                <td>
                	<span class="appNo1dept"><c:out value="${detail.appNo1dept}"/></span>&nbsp;
                	<span class="appNo1name"><c:out value="${detail.appNo1name}"/></span>
                </td>
                <td>
                	<span class="appNo2dept"><c:out value="${detail.appNo2dept}"/></span>&nbsp;
                	<span class="appNo2name"><c:out value="${detail.appNo2name}"/></span>
                </td>
                <td>
                	<span class="appNo3dept"><c:out value="${detail.appNo3dept}"/></span>&nbsp;
                	<span class="appNo3name"><c:out value="${detail.appNo3name}"/></span>
                </td>
            </tr>
            <tr>
            	<td>
            		<input type="submit" class="btn btn-success appNo1btnS" value="결재"/>
            		<input type="submit" class="btn btn-danger appNo1btnD" value="반려"/>
            		<img class="approve approve1_display" src="/resources/approval/approve.png">
            		<img class="approve reject1_display" src="/resources/approval/reject.png">
            	</td>
            	<td>
            		<input type="submit" class="btn btn-success appNo2btnS" value="결재"/>
            		<input type="submit" class="btn btn-danger appNo2btnD" value="반려"/>
            		<img class="approve approve2_display" src="/resources/approval/approve.png">
            		<img class="approve reject2_display" src="/resources/approval/reject.png">
            	</td>
            	<td>
            		<input type="submit" class="btn btn-success appNo3btnS" value="결재"/>
            		<input type="submit" class="btn btn-danger appNo3btnD" value="반려"/>
            		<img class="approve approve3_display" src="/resources/approval/approve.png">
            		<img class="approve reject3_display" src="/resources/approval/reject.png">
            	</td>
            </tr>
            <tr>
            	<td>
            		<span class="appDay1_display"></span>
            		<span><c:out value="${detail.appDay1}"/></span>
            	</td>
            	<td>
            		<span class="appDay2_display"></span>
            		<span><c:out value="${detail.appDay2}"/></span>
            	</td>
            	<td>
            		<span class="appDay3_display"></span>
            		<span><c:out value="${detail.appDay3}"/></span>
            	</td>
            </tr>
            <tr>
                <td class="index">참고자</td>
                <td><c:out value="${detail.refNo1dept}"/>&nbsp;<c:out value="${detail.refNo1name}"/></td>
                <td><c:out value="${detail.refNo2dept}"/>&nbsp;<c:out value="${detail.refNo2name}"/></td>
            </tr>
        </table>
        <table class="table_one">
            <tr>
                <td class="index">첨언 제목</td>
                <td colspan="2" class="radius_top_right"><input type="text" name="titleReply" class="title_input" placeholder="제목을 입력하세요." required></td>
            </tr>
            <tr>
                <td class="index">첨언 부서</td>
                <td colspan="2">
					<input type="text" name="replyDept" class="employee" value='<c:out value='${employee.deptName}'/>' readonly/>
                </td>
            </tr>
            <tr>
                <td class="index">첨언자</td>
                <td colspan="2">
                	<input type="text" name="writerReply" class="employee" value='<c:out value='${employee.name}'/>' readonly/>
                	<input type="hidden" name="writerReplyNo" value='<c:out value='${employee.no}'/>'>
                </td>
            </tr>
            <tr class="index">
                <td colspan="3" class="content_index">
                	첨언 내용
                </td>
            </tr>
            <tr>
                <td colspan="3" class="content_text reply_content summernote">
                    <textarea id="summernote" name="contentReply" class="content_input" placeholder="내용을 입력하세요." required></textarea>
                </td>
            </tr>
        </table>
        </div>
        <div class="write_bottom year_bottom">
	        <div class="left_btn">
	            <button type="button" class="my_btn" onclick="location.href='/approval/temp?loginNo=<c:out value="${employee.no}"/>'">저장목록</button>
	            <button type="submit" class="write_btn" id="send_temp">임시저장</button>  
	            <input type="hidden" class="send_temp_hidden" name="temp">
	        </div>
	        <div class="right_btn">
	            <button type="button" class="my_btn" onclick="location.href='/approval/listIn?loginNo=<c:out value="${employee.no}"/>'">취소하기</button>
	            <button type="submit" class="write_btn" id="send_list">첨언하기</button>
	        </div>
	        <input type="hidden" name="no" value='<c:out value="${detail.docNo}" />'>
	        <input type="hidden" name="originNo" value='<c:out value="${detail.docNo}" />'>
    		<input type="hidden" name="form" value="첨언">
    		<input type="hidden" name="title" value='<c:out value="${detail.title}"/>' >
    		<input type="hidden" name="startDept" value='<c:out value="${detail.startDept}"/>' >
    		<input type="hidden" name="endDept" value='<c:out value="${detail.endDept}"/>' >
    		<input type="hidden" name="content" value='<c:out value="${detail.content}"/>' >
    		<input type="hidden" name="appNo1" value='<c:out value="${detail.appNo1}"/>' >
    		<input type="hidden" name="appNo2" value='<c:out value="${detail.appNo2}"/>' >
    		<input type="hidden" name="appNo3" value='<c:out value="${detail.appNo3}"/>' >
    		<input type="hidden" name="refNo1" value='<c:out value="${detail.refNo1}"/>' >
    		<input type="hidden" name="refNo2" value='<c:out value="${detail.refNo2}"/>' >
    		<input type="hidden" name="writer" value='<c:out value="${detail.writer}"/>' >
    		<input type="hidden" name="appState1" value='<c:out value="${detail.appState1}"/>' >
    		<input type="hidden" name="appState2" value='<c:out value="${detail.appState2}"/>' >
    		<input type="hidden" name="appState3" value='<c:out value="${detail.appState3}"/>' >
    		<input type="hidden" name="appDay1" value='<c:out value="${detail.appDay1}"/>' >
    		<input type="hidden" name="appDay2" value='<c:out value="${detail.appDay2}"/>' >
    		<input type="hidden" name="appDay3" value='<c:out value="${detail.appDay3}"/>' >
    	</div>
    </form> 
	</div>
    <!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">상신 내용</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<c:out value="${detail.content}" escapeXml="false"/>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>