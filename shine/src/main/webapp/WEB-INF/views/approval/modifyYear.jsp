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


</style>
<script type="text/javascript">
$(function() {
	function handleRadioButtonClick() {
		if (((document.querySelector("#kind").value) * 10) % 10) == 5 ) {
		      alert("'반차'를 희망하고 있습니다. 반차 시간대를 선택해 주세요.");
		      document.querySelector("#am").setAttribute("required", "required");
		      document.querySelector("#pm").setAttribute("required", "required");
			}
		}
	}
	
	// 라디오 버튼 클릭 이벤트 리스너 등록
	document.querySelector("#etc").addEventListener("click", handleRadioButtonClick);
	document.querySelector("#send_list").addEventListener("click", () => {
		handleRadioButtonClick();
		document.querySelector(".send_temp_hidden").value = "상신";
	});
	
	function removeRequiredAttribute() {
		document.querySelectorAll("input, textarea").forEach(function(element) {
			element.removeAttribute("required");	
		});
	}

	// send_temp 버튼 클릭 이벤트 리스너 등록
	document.querySelector("#send_temp").addEventListener("click", () => {
		removeRequiredAttribute();
		document.querySelector(".send_temp_hidden").value = "임시저장";
	});
	
	function convertDateToString(dateString) {
		  const date = new Date(dateString);
		  const year = date.getFullYear();
		  const month = String(date.getMonth() + 1).padStart(2, '0');
		  const day = String(date.getDate()).padStart(2, '0');

		  const isoDate = `${year}-${month}-${day}`;
		  return isoDate;
		}

	var dateValueStart =  document.getElementById('start').value;
	dateValueStart = convertDateToString(dateValueStart);
	var dateValueEnd =  document.getElementById('end').value;
	dateValueEnd = convertDateToString(dateValueEnd);
});
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
	<form action="/approval/writeYear" method="post" class="write_border">
        <div class="table_two">
        <table class="table_one">
            <tr>
                <td class="index radius_top_left">문서종류</td>
                <td colspan="3">
					<select name="form" class="write_list" required>
			            <option value="" >문서종류를 선택해주세요.</option>
			            <option value="기안" ${detail.form eq '기안' ? 'selected' : ''}>기안</option>
			            <option value="품의" ${detail.form eq '품의' ? 'selected' : ''}>품의</option>
			            <option value="연차" ${detail.form eq '연차' ? 'selected' : ''}>연차</option>
			            <option value="보고" ${detail.form eq '보고' ? 'selected' : ''}>보고</option>
			            <option value="지출결의" ${detail.form eq '지출결의' ? 'selected' : ''}>지출결의</option>
			            <option value="출퇴근" ${detail.form eq '출퇴근' ? 'selected' : ''}>출퇴근</option>
			            <option value="기타" ${detail.form eq '기타' ? 'selected' : ''}>기타</option>
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
<<<<<<< HEAD
                    <input type="text" name="startDept" class="employee" /> > 
=======
                    <input type="text" name="startDept" class="startdept" /> > 
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
                    <input type="text" name="writer" />
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
				<td colspan="4"><input type="text" name="yearUseDays" placeholder="희망하는 연차일수를 입력하세요." required></td>
			</tr>
			<tr>
				<td colspan="4">희망 연차일자</td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="date" id="start" name="yearUseDateStart" data-placeholder="날짜 선택"> -
                    		<input type="date" id="end" name="yearUseDateEnd" data-placeholder="날짜 선택">
				</td>
			</tr>
			<tr>
				<td colspan="4">희망 반차시간대</td>
			</tr>
			<tr>
				<td colspan="4" >
					<input type="radio" id="am" name="YearAmPm" value="오전"><label for="am">오전</label>
                   			<input type="radio" id="pm" name="YearAmPm" value="오후"><label for="pm">오전</label>
				</td>
			</tr>
			<tr>
				<td colspan="4" >연차사유</td>
			</tr>		
			<tr>
				<td colspan="4"><input type="text" name="yearReason" placeholder="연차사유를 입력하세요." required></td>
			</tr>
        </table>
        </div>
        <div class="write_bottom year_bottom">
	        <div class="left_btn">
	            <button type="button" class="my_btn" onclick="location.href='/approval/temp'">저장목록</button>
	            <button type="submit" class="write_btn" id="send_temp" onclick="location.href='/approval/temp'">임시저장</button>  
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