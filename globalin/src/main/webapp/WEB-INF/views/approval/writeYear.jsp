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

.approval_move {
	background-color: #3D9970;
	color: white !important;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	alert("[연차]는 숫자를 입력하세요. \n[반차]는 0.5를 입력하세요. \n\nex) 연차 : 1,2,3 ... / 반차 : 0.5");
	
    document.querySelector("#send_list").addEventListener("click", () => {
    	document.querySelector("input[name=temp]").value = "상신";
    });

    document.querySelector("#send_temp").addEventListener("click", () => {
    	document.querySelector("input[name=temp]").value = "임시저장";
    });

})
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
	<form action="/approval/writeYear" method="post" class="write_border write_form">
        <div class="table_two">
        <table class="table_one">
            <tr>
                <td class="index radius_top_left">문서종류</td>
                <td colspan="3">
					<select name="form" class="write_list" required>
			            <option value="" >문서종류를 선택해주세요.</option>
			            <option value="기안" disabled>기안</option>
			            <option value="품의" disabled>품의</option>
			            <option value="연차" selected>연차</option>
			            <option value="보고" disabled>보고</option>
			            <option value="지출결의" disabled>지출결의</option>
			            <option value="출퇴근" disabled>출퇴근</option>
			            <option value="기타" disabled>기타</option>
			        </select>
				</td>
            </tr>
            <tr>
                <td class="index">제목</td>
                <td colspan="3">
                    <input type="text" name="title" class="title_input" placeholder="제목을 입력하세요." required>
                </td>
            </tr>
            <tr>
                 <td class="index">
                    <span>상신부서</span> > <span>수신부서</span>
                </td>
                <td colspan="3">
                    <input type="text" name="startDept" class="employee" value='<c:out value='${employee.deptName}'/>' readonly/> > 
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
                	<input type="text" name="writer" class="employee" value='<c:out value='${employee.name}'/>' readonly/>
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
            		<select name="refNo2" class="write_list">
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
                <td colspan="4" class="content_index">연차 내용</td>
            </tr>
            <tr>
				<td colspan="4">희망 연차일수</td>
			</tr>
			<tr>
				<td colspan="4"><input type="number" step="0.1" name="yearUseDays" class="input_yearUseDays" placeholder="희망하는 연차일수를 입력하세요." required></td>
			</tr>
			<tr>
				<td colspan="4">희망 연차일자</td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="date" id="start" name="yearUseDateStart" class="input_yearDate"> ~
                    		<input type="date" id="end" name="yearUseDateEnd" class="input_yearDate">
				</td>
			</tr>
			<tr>
				<td colspan="4">희망 연차시간대</td>
			</tr>
			<tr>
				<td colspan="4" >
					<input type="radio" id="am" name="YearAmPm"  value="오전"><label for="am">오전</label>
                   	<input type="radio" id="pm" name="YearAmPm"  value="오후"><label for="pm">오후</label>
                   	<input type="radio" id="allday" name="YearAmPm"  value="종일"><label for="allday">종일</label>
				</td>
			</tr>
			<tr>
				<td colspan="4" >연차사유</td>
			</tr>		
			<tr>
				<td colspan="4"><input type="text" class="input_yearReason" name="yearReason" placeholder="연차사유를 입력하세요." required></td>
			</tr>
        </table>
        </div>
        <div class="write_bottom year_bottom">
	        <div class="left_btn">
	            <button type="button" class="my_btn" onclick="location.href='/approval/temp'">저장목록</button>
	            <button type="submit" class="write_btn" id="send_temp">임시저장</button>  
	            <input type="hidden" class="send_temp_hidden" name="temp">
	            
	        </div>
	        <div class="right_btn">
	            <button type="button" class="my_btn" onclick="location.href='/approval/list'">취소하기</button>
	            <button type="submit" class="write_btn" id="send_list">상신하기</button>
	        </div>
    	</div>
    </form>	
	</div>
</body>
</html>