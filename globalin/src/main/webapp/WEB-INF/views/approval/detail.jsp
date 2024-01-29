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
    
    <link rel="stylesheet" href="/resources/approval/list.css" type="text/css">
<title>전자결재 > 상신문서</title>
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

.modal-dialog {
    max-width: 1200px !important;
}
</style>
<script type="text/javascript">
$(document).ready(function() {	
    // delete_btn 클릭 이벤트 처리
    $(".delete_btn").on("click", function() {
        alert("상신 문서가 삭제되었습니다.");
    });
	
	// 버튼 요소 가져오기
	var buttonSuccess1 = document.querySelector(".appNo1btnS");
	var buttonDanger1 = document.querySelector(".appNo1btnD");
	var buttonSuccess2 = document.querySelector(".appNo2btnS");
	var buttonDanger2 = document.querySelector(".appNo2btnD");
	var buttonSuccess3 = document.querySelector(".appNo3btnS");
	var buttonDanger3 = document.querySelector(".appNo3btnD");
	
	var appNo1dept = $(".appNo1dept").text();
	var appNo1name = $(".appNo1name").text();
	var appNo2dept = $(".appNo2dept").text();
	var appNo2name = $(".appNo2name").text();
	var appNo3dept = $(".appNo3dept").text();
	var appNo3name = $(".appNo3name").text();
	
	// AppNo1 승인 버튼 클릭 시 이벤트 처리 함수
	function showSuccess1Alert() {
	  if (appNo1dept === "${employee.deptName}" && appNo1name === "${employee.name}") {
		  var textSuccess = prompt("비밀번호를 입력하면, '결재' 처리가 완료됩니다.");
		  if(textSuccess === "${detail.appNo1pw}") {
			  var currentDate = getCurrentDate();
			  document.querySelector("input[name=appDay1]").value = currentDate;
			  document.querySelector(".appDay1_display").innerText = currentDate;
			  document.querySelector("input[name=appState1]").value = "결재";
			  buttonSuccess1.style.display = "none";
			  buttonDanger1.style.display = "none";
			  document.querySelector(".approve1_display").style.display = "block";
			  document.querySelector(".updateApp").action = "/approval/updateApp";
			  alert("'결재' 되었습니다. 3초 후 목록으로 이동합니다.");
		  } else {
			  alert("비밀번호가 틀렸습니다.");
			  document.querySelector(".updateApp").action = "/approval/updateAppFail";
		  }
	  } else {
		  alert("결재자 1(" + appNo1dept + " 소속 " + appNo1name +")에게만 결재권한이 있습니다.");
		  document.querySelector(".updateApp").action = "/approval/updateAppFail";
	  }
	}
	
	// AppNo1 반려 버튼 클릭 시 이벤트 처리 함수
	function showDanger1Alert() {
	  if (appNo1dept === "${employee.deptName}" && appNo1name === "${employee.name}") {
		  var textDanger = prompt("비밀번호를 입력하면, '반려' 처리가 완료됩니다.");
		  if(textDanger === "${detail.appNo1pw}") {
			  var currentDate = getCurrentDate();
			  document.querySelector("input[name=appDay1]").value = currentDate;
			  document.querySelector(".appDay1_display").innerText = currentDate;
			  document.querySelector("input[name=appState1]").value = "반려";
			  buttonSuccess1.style.display = "none";
			  buttonDanger1.style.display = "none";
			  document.querySelector(".reject1_display").style.display = "block";
			  document.querySelector(".updateApp").action = "/approval/updateApp";
			  alert("'반려' 되었습니다. 3초 후 목록으로 이동합니다.");
		  } else {
			  alert("비밀번호가 틀렸습니다.");
			  document.querySelector(".updateApp").action = "/approval/updateAppFail";
		  }
	  } else {
		  alert("결재자 1(" + appNo1dept + " 소속 " + appNo1name +")에게만 결재권한이 있습니다.");
		  document.querySelector(".updateApp").action = "/approval/updateAppFail";
	  }
	}

	// AppNo2 승인 버튼 클릭 시 이벤트 처리 함수
	function showSuccess2Alert() {
	  
	  if (appNo2dept === "${employee.deptName}" && appNo2name === "${employee.name}") {
		  var textSuccess = prompt("비밀번호를 입력하면, '결재' 처리가 완료됩니다.");
		  if(textSuccess === "${detail.appNo2pw}") {
			  var currentDate = getCurrentDate();
			  document.querySelector("input[name=appDay2]").value = currentDate;
			  document.querySelector(".appDay2_display").innerText = currentDate;
			  document.querySelector("input[name=appState2]").value = "결재";
			  buttonSuccess2.style.display = "none";
			  buttonDanger2.style.display = "none";
			  document.querySelector(".approve2_display").style.display = "block";
			  document.querySelector(".updateApp").action = "/approval/updateApp";
			  alert("'결재' 되었습니다. 3초 후 목록으로 이동합니다.");
		  } else {
			  alert("비밀번호가 틀렸습니다.");
			  document.querySelector(".updateApp").action = "/approval/updateAppFail";
		  }
	  } else {
		  alert("결재자 2(" + appNo2dept + " 소속 " + appNo2name +")에게만 결재권한이 있습니다.");
		  document.querySelector(".updateApp").action = "/approval/updateAppFail";
	  }
	}
	
	// AppNo2 반려 버튼 클릭 시 이벤트 처리 함수
	function showDanger2Alert() {
	  
	  if (appNo2dept === "${employee.deptName}" && appNo2name === "${employee.name}") {
		  var textDanger = prompt("비밀번호를 입력하면, '반려' 처리가 완료됩니다.");
		  if(textDanger === "${detail.appNo2pw}") {
			  var currentDate = getCurrentDate();
			  document.querySelector("input[name=appDay2]").value = currentDate;
			  document.querySelector(".appDay2_display").innerText = currentDate;
			  document.querySelector("input[name=appState2]").value = "반려";
			  buttonSuccess2.style.display = "none";
			  buttonDanger2.style.display = "none";
			  document.querySelector(".reject2_display").style.display = "block";
			  document.querySelector(".updateApp").action = "/approval/updateApp";
			  alert("'반려' 되었습니다. 3초 후 목록으로 이동합니다.");
		  } else {
			  alert("비밀번호가 틀렸습니다.");
			  document.querySelector(".updateApp").action = "/approval/updateAppFail";
		  }
	  } else {
		  alert("결재자 2(" + appNo2dept + " 소속 " + appNo2name +")에게만 결재권한이 있습니다.");
		  document.querySelector(".updateApp").action = "/approval/updateAppFail";
	  }
	  
	}	
	
	// AppNo3 승인 버튼 클릭 시 이벤트 처리 함수
	function showSuccess3Alert() {
	  
	  if (appNo3dept === "${employee.deptName}" && appNo3name === "${employee.name}") {
		  var textSuccess = prompt("비밀번호를 입력하면, '결재' 처리가 완료됩니다.");
		  if(textSuccess === "${detail.appNo3pw}") {
			  var currentDate = getCurrentDate();
			  document.querySelector("input[name=appDay3]").value = currentDate;
			  document.querySelector(".appDay3_display").innerText = currentDate;
			  document.querySelector("input[name=appState3]").value = "결재";
			  buttonSuccess3.style.display = "none";
			  buttonDanger3.style.display = "none";
			  document.querySelector(".approve3_display").style.display = "block";
			  document.querySelector(".updateApp").action = "/approval/updateApp";
			  alert("'결재' 되었습니다. 3초 후 목록으로 이동합니다.");
		  } else {
			  alert("비밀번호가 틀렸습니다.");
			  document.querySelector(".updateApp").action = "/approval/updateAppFail";
		  }
	  } else {
		  alert("결재자 3(" + appNo3dept + " 소속 " + appNo3name +")에게만 결재권한이 있습니다.");
		  document.querySelector(".updateApp").action = "/approval/updateAppFail";
	  }
	}
	
	// AppNo3 반려 버튼 클릭 시 이벤트 처리 함수
	function showDanger3Alert() {
	  
	  if (appNo3dept === "${employee.deptName}" && appNo3name === "${employee.name}") {
		  var textDanger = prompt("비밀번호를 입력하면, '반려' 처리가 완료됩니다.");
		  if(textDanger === "${detail.appNo3pw}") {
			  var currentDate = getCurrentDate();
			  document.querySelector("input[name=appDay3]").value = currentDate;
			  document.querySelector(".appDay3_display").innerText = currentDate;
			  document.querySelector("input[name=appState3]").value = "반려";
			  buttonSuccess3.style.display = "none";
			  buttonDanger3.style.display = "none";
			  document.querySelector(".reject3_display").style.display = "block";
			  document.querySelector(".updateApp").action = "/approval/updateApp";
			  alert("'반려' 되었습니다. 3초 후 목록으로 이동합니다.");
		  } else {
			  alert("비밀번호가 틀렸습니다.");
			  document.querySelector(".updateApp").action = "/approval/updateAppFail";
		  }
	  } else {
		  alert("결재자 3(" + appNo3dept + " 소속 " + appNo3name +")에게만 결재권한이 있습니다.");
		  document.querySelector(".updateApp").action = "/approval/updateAppFail";
	  }
	}
	
	// 현재 날짜와 현재 날짜를 반환하는 함수
	function getCurrentDate() {
	  var currentDate = new Date();
	  var year = currentDate.getFullYear();
	  var month = String(currentDate.getMonth() + 1).padStart(2, "0");
	  var day = String(currentDate.getDate()).padStart(2, "0");
	  var hours = String(currentDate.getHours()).padStart(2, "0");
	  var minutes = String(currentDate.getMinutes()).padStart(2, "0");
	  var seconds = String(currentDate.getSeconds()).padStart(2, "0");
	  return year + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds;
	}
	
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
	
	const BtnSuccess = document.querySelector(".btn-success");
	const BtnDanger = document.querySelector(".btn-danger");
	
	function disableSubmitButton(event) {
		alert("이미 반려된 상신문서입니다. 더 이상 결재를 진행할 수 없습니다.");
		event.preventDefault(); // 기본 이벤트 동작을 막습니다.
	}
	
	// 버튼 클릭 이벤트에 showAlert 함수 연결
	buttonSuccess1.addEventListener("click", showSuccess1Alert);
	buttonSuccess2.addEventListener("click", showSuccess2Alert);
	buttonSuccess3.addEventListener("click", showSuccess3Alert);
	buttonDanger1.addEventListener("click", showDanger1Alert);
	buttonDanger2.addEventListener("click", showDanger2Alert);
	buttonDanger3.addEventListener("click", showDanger3Alert);
	
	if(appState1 === "반려") {
		buttonSuccess2.removeEventListener("click", showSuccess2Alert);
		buttonSuccess3.removeEventListener("click", showSuccess3Alert);
		buttonDanger2.removeEventListener("click", showDanger2Alert);
		buttonDanger3.removeEventListener("click", showDanger3Alert);
	} else if(appState2 === "반려") {
		buttonSuccess1.removeEventListener("click", showSuccess1Alert);
		buttonSuccess3.removeEventListener("click", showSuccess3Alert);
		buttonDanger1.removeEventListener("click", showDanger1Alert);
		buttonDanger3.removeEventListener("click", showDanger3Alert);
	} else if(appState3 === "반려") {
		buttonSuccess1.removeEventListener("click", showSuccess1Alert);
		buttonSuccess2.removeEventListener("click", showSuccess2Alert);
		buttonDanger1.removeEventListener("click", showDanger1Alert);
		buttonDanger2.removeEventListener("click", showDanger2Alert);
	}
	
});

$(function() {
	const myModal = document.getElementById('myModal')
	const myInput = document.getElementById('myInput')

	myModal.addEventListener('shown.bs.modal', () => {
	  myInput.focus()
	})
});
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
	<form action="/approval/delete" method="post" class="write_border updateApp"> 
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
                <td colspan="2"><c:out value="${detail.startDept}"/>&nbsp;>&nbsp;<c:out value="${detail.endDept}"/></td>
            </tr>
            <tr>
                <td class="index">상신자</td>
                <td colspan="2"><c:out value="${detail.writer}"/></td>
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
            		<input type="hidden" name="appDay1">
            		<input type="hidden" name="appState1">
            		<span class="appDay1_display"></span>
            		<span ><c:out value="${detail.appDay1}"/></span>
            	</td>
            	<td>
            		<input type="hidden" name="appDay2">
            		<input type="hidden" name="appState2">
            		<span class="appDay2_display"></span>
            		<span ><c:out value="${detail.appDay2}"/></span>
            	</td>
            	<td>
            		<input type="hidden" name="appDay3">
            		<input type="hidden" name="appState3">
            		<span class="appDay3_display"></span>
            		<span ><c:out value="${detail.appDay3}"/></span>
            	</td>
            </tr>
            <tr>
                <td class="index">참고자</td>
                <td><c:out value="${detail.refNo1dept}"/>&nbsp;<c:out value="${detail.refNo1name}"/></td>
                <td><c:out value="${detail.refNo2dept}"/>&nbsp;<c:out value="${detail.refNo2name}"/></td>
            </tr>
        </table>
        <table class="table_one">
            <tr class="index">
                <td colspan="3" class="content_index">
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
                <td colspan="3" class="content_text reply_content">
                    <c:out value="${detail.content}" escapeXml="false"/>
                </td>
            </tr>
        </table>
        </div>
        <div class="write_bottom year_bottom">
	        <div class="left_btn">
			    <button type="button" class="my_btn" onclick="location.href='/approval/list?pageNum=${pageMaker.criteria.pageNum}&amount=${pageMaker.criteria.amount}'">목록이동</button>
			</div>
			<div class="right_btn">
			    <button type="button" class="my_btn" onclick="location.href='/approval/reply?no=<c:out value="${detail.docNo}" />'">첨언하기</button>
			    <button type="submit" class="write_btn delete_btn">삭제하기</button>
			</div>
			<input type="hidden" name="no" value='<c:out value="${detail.docNo}"/>' >
			<input type="hidden" name="pageNum" value="${pageMaker.criteria.pageNum}"> 
	        <input type="hidden" name="amount" value="${pageMaker.criteria.amount}"> 
    		<input type="hidden" name="keyword" value="${pageMaker.criteria.keyword}">
    		<input type="hidden" name="type" value="${pageMaker.criteria.type}">
    		
    		<input type="hidden" name="state">
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