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
<<<<<<< HEAD
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
=======
>>>>>>> origin/master
    
    <link rel="stylesheet" href="/resources/approval/list.css" type="text/css">
    
    <!-- summerNote -->
    <script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/summernote-ko-KR.js"></script>
	
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
<title>전자결재 > 상신문서 작성</title>
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
    height: 450px !important;
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
    
    const selectElement = document.querySelector('.write_list');
    selectElement.addEventListener('change', function() {
        const selectedOption = this.options[this.selectedIndex];
        if (selectedOption.value === "") {
            selectedOption.value = null;
        }
    });
<<<<<<< HEAD
=======
    
 /*    $(".write_btn").on("click", function(e){
    	$("#write_form").append("?nameId=${employee.name}");
    	$("#write_form").submit();
    }); */
>>>>>>> origin/master
})
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
	<form action="/approval/write" method="post" class="write_border write_form">
	
       <div class="table_two">
        <table class="table_one">
            <tr>
                <td class="index radius_top_left">문서종류</td>
                <td colspan="3">
					<select name="form" class="write_list" required>
			            <option value="" >문서종류를 선택해주세요.</option>
			            <option value="기안">기안</option>
			            <option value="품의">품의</option>
			            <option value="연차" disabled>연차</option>
			            <option value="보고">보고</option>
			            <option value="지출결의">지출결의</option>
			            <option value="출퇴근">출퇴근</option>
			            <option value="기타">기타</option>
			        </select>
				</td>
            </tr>
            <tr>
                <td class="index">제목</td>
                <td colspan="3">
                    <input type="text" name="title" class="title_input" placeholder="제목을 입력하세요.">
                </td>
            </tr>
            <tr>
                 <td class="index">
                    <span>상신부서</span> > <span>수신부서</span>
                </td>
                <td colspan="3">
<<<<<<< HEAD
                    <input type="text" class="employee" name="startDept" value='<c:out value='${employee.deptName}'/>' readonly/> > 
=======
                    <input type="text" name="startDept" value='<c:out value='${employee.deptName}'/>' readonly/> > 
>>>>>>> origin/master
                    <select name="endDept" class="write_list">
			            <option value="" >수신부서를 선택해주세요.</option>
			            <c:forEach items="${emp}" var="emp">
			            	<option value="${emp.deptName}">
			     				<c:out value="${emp.deptName}"/>
			           		</option>
			            </c:forEach>
					</select>
                </td>
            </tr>
            <tr>
                <td class="index">상신자</td>
                <td colspan="3">
<<<<<<< HEAD
                    <input type="text" class="employee" name="writer" value='<c:out value='${employee.name}'/>' readonly/>
=======
                    <input type="text" name="writer" value='<c:out value='${employee.name}'/>' readonly/>
>>>>>>> origin/master
                    <input type="hidden" name="writerNo" value='<c:out value='${employee.no}'/>'>
                </td>
            </tr>
            <tr>
            	<td rowspan="3" class="index">결재자</td>
            	<td colspan="3"> 
            		<select name="appNo1" class="write_list">
			            <option value=0>결재자 1을 선택해주세요.</option>
			            <c:forEach items="${user}" var="user">
			            	<option value="${user.no}">
			     				<c:out value="${user.deptName}"/> 소속
			     				<c:out value="${user.name}"/>
			           		</option>
			            </c:forEach>
			        </select>
            	</td>
            </tr>
           	<tr>
            	<td colspan="3">
            		<select name="appNo2" class="write_list">
			            <option value=0>결재자 2를 선택해주세요.</option>
			            <c:forEach items="${user}" var="user">
			            	<option value="${user.no}">
			     				<c:out value="${user.deptName}"/> 소속
			     				<c:out value="${user.name}"/>
			           		</option>
			            </c:forEach>
			        </select>
            	</td>
            </tr>
            <tr>
            	<td colspan="3">
            		<select name="appNo3" class="write_list">
			            <option value=0>결재자 3을 선택해주세요.</option>
			            <c:forEach items="${user}" var="user">
			            	<option value="${user.no}">
			     				<c:out value="${user.deptName}"/> 소속
			     				<c:out value="${user.name}"/>
			           		</option>
			            </c:forEach>
			        </select>
            	</td>
            </tr>
            <tr>
            	<td rowspan="2" class="index">참고자</td>
            	<td colspan="3">
            		<select name="refNo1" class="write_list">
			            <option value=0>참고자 1을 선택해주세요.</option>
			            <c:forEach items="${user}" var="user">
			            	<option value="${user.no}">
			     				<c:out value="${user.deptName}"/> 소속
			     				<c:out value="${user.name}"/>
			           		</option>
			            </c:forEach>
			        </select>
            	</td>
            </tr>
            <tr>
            	<td colspan="3">
            		<select name="refNo2" class="write_list replydept_inpu">
			            <option value=0>참고자 2를 선택해주세요.</option>
			            <c:forEach items="${user}" var="user">
			            	<option value="${user.no}">
			     				<c:out value="${user.deptName}"/> 소속
			     				<c:out value="${user.name}"/>
			           		</option>
			            </c:forEach>
			        </select>
            	</td>
            </tr>
        </table>
        <table class="table_one">
            <tr class="index">
                <td colspan="4" class="content_index">상신 내용</td>
            </tr>
             <tr> 
                <td colspan="4" class="content_text summernote">
                    <textarea id="summernote" name="content" class="content_input" placeholder="내용을 입력하세요."></textarea>
                </td>
            </tr>
        </table>
        </div>
	</div>
        <div class="write_bottom">
	        <div class="left_btn">
	            <button type="button" class="my_btn" onclick="location.href='/approval/temp?loginNo=<c:out value="${employee.no}"/>'">저장목록</button>
	            <button type="submit" class="write_btn" id="send_temp">임시저장</button>  
	            <input type="hidden" name="temp">
	        </div>
	        <div class="right_btn">
	            <button type="button" class="my_btn" onclick="location.href='/approval/list'">취소하기</button>
	            <button type="submit" class="write_btn" id="send_list">상신하기</button>
	        </div>
    </form>
</div>
</body>
</html>