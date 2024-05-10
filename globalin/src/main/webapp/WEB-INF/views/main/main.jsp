<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/main/style.css">
<link rel="stylesheet" type="text/css" href="/resources/commute/commute.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"
	charset="utf-8"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/easy-pie-chart/2.1.6/jquery.easypiechart.min.js"
	charset="utf-8"></script>
	<script src="https://cdn.canvasjs.com/ga/canvasjs.min.js"></script>
	<script src="https://cdn.canvasjs.com/ga/canvasjs.stock.min.js"></script>
	<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://cdn.canvasjs.com/jquery.canvasjs.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script type="text/javascript">
const exampleModal = document.getElementById('exampleModal')
if (exampleModal) {
  exampleModal.addEventListener('show.bs.modal', event => {
    // Button that triggered the modal
    const button = event.relatedTarget
    // Extract info from data-bs-* attributes
    const recipient = button.getAttribute('data-bs-whatever')
    // If necessary, you could initiate an Ajax request here
    // and then do the updating in a callback.

    // Update the modal's content.
    const modalTitle = exampleModal.querySelector('.modal-title')
    const modalBodyInput = exampleModal.querySelector('.modal-body input')

    modalTitle.textContent = `New message to ${recipient}`
    modalBodyInput.value = recipient
  })
}
</script>
<title>Main</title>
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

.box {
	width: 20%;
}

.box h2 {
	position: relative;
	left: 60px;
}

.box .chart {
	position: relative;
	width: 100%;
	height: 100%;
	line-height: 160px;
	height: 150px;
	color: #fff;
}

.box canvas {
	top: -12px;
	width: 90%;
}

.mainLink {
	font-size: 24px;
	color: #3D9970;
	position: relative;
	left: 3%;
	top: 3%;
}

.commute {
	position: relative;
	left: 25%;
	bottom: 40%;
	width: 35%;
	height: 20%;
}

.inButton, .outButton, .disagree, .disagree1, .proc, .proc1 {
	background-color: #3D9970;
	color: white;
	border: 2px solid #3D9970;
	border-radius: 15px;
	padding: 13px 20px;
	font-size: 16px;
	cursor: pointer;
}

.inButton:hover, .outButton:hover, .disagree:hover, .disagree1:hover, .proc:hover, .proc1:hover {
	background-color: white;
	color: #3D9970;
	transition-duration: 0.3s;
	border: 2px solid #3D9970;
	cursor: pointer;
}

.wrapper {
	border: 2px solid #3D9970;
	padding: 5px;
	border-radius: 13px;
	width: 200px;
	height: 150px;
	cursor: pointer;
	background-color: #3D9970;
	color: white;
}

.vacation {
	position: relative;
	left: 70%;
	bottom: 105%;
	font-size: 20px;
	display: flex;
	align-items: center;
}

.MainContainer {
	/* position: fixed; */
	width: 100%;
	height: 250px;
	margin-left: 20px;
	margin-bottom: 30px;
}

.main2 {
	top: 40%;
	    height: 290px;
}

.main3 {
	top: 65%;
	height: 150px;
}

.main4 {
	top: 65%;
	height: 150px;
}

.notice {
	position: relative;
	left: 19%;
}

.notice tr {
	background-color: #3D9970;
	color: white;
}

.approval {
	text-align: center;
	position: relative;
	left: 25%;
	height: 80px;
	font-size: 20px;
	padding: 10px 0px 10px 0px;
	display: flex;
	align-items: center;
	padding-left: 50px;
}

.unwritten {
	text-align: center;
	position: relative;
	left: 70%;
	bottom: 70%;
	height: 80px;
	font-size: 20px;
	padding: 10px 0px 10px 0px;
	display: flex;
	align-items: center;
	padding-left: 35px;
}

.canvasjs-chart-credit
{
    display: none !important;
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
			
.table-wrapper {
    overflow: auto;
    max-width: 100%;
    background: #fff;
    border-radius: 0.35em;
    box-shadow: 0 0.1em 0.25em rgba(0, 0, 0, 0.05);
}

.table-wrapper table {
    margin: 0 0 2em 0;
    width: 100%;
    border-collapse: collapse;
}

.table-wrapper table td, 
.table-wrapper table th {
    padding: 0.75em;
    text-align: center;
}

.table-wrapper table th {
    color: #3D9970;
    border-bottom: 2px solid #3D9970;
}

.table-wrapper table tr:nth-child(2n + 1) {
    background-color: #f7f7f7;
}
</style>
</head>
<body>
		<%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
	<div class="body_right">
		<div class="MainContainer main1" style="height:240px">
			<b class="mainLink">근태관리</b>
			<div class="box">
 				<h2 class="time">&nbsp;&nbsp;&nbsp;&nbsp;  ${sumtimeH}:${sumtimeM}</h2>
				<div class="chart" id="chart"></div>
			</div>
			<div class="commute">
				<!-- <b>00:00</b> --> 
				<b> ${mintime}</b>&nbsp;&nbsp;
				<button style="width:100px;" class="button inButton" id="inButton" ${canCommute}>출근</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="modal" id="modal">
					<div class="commuteModal">
						<span class="close">&times;</span>
						<p>출근처리하시겠습니까?</p>
						<form action="commute" method="post" class="commuteAction" style="display:inline-block;">
							<input name="no" type="hidden" value="${no}"> 
							<input type="submit" value="예" class="proc">
						</form>
						<button id="disagree" class="disagree">아니오</button>
					</div>
				</div>
<!-- 				<b>00:00</b> -->
				<b>${mouttime}</b>&nbsp;&nbsp;
				<button style="width:100px;" class="button outButton" id="outButton">퇴근</button>
				<div class="modal1" id="modal1">
					<div class="leaveModal">
						<span class="close">&times;</span>
						<p>퇴근처리하시겠습니까?</p>
						<form action="leave" method="post" class="commuteAction" style="display:inline-block;">
							<input name="no" type="hidden" value="${no}"> 
							<input type="submit" value="예" class="proc1">
						</form>
						<button class="disagree1">아니오</button>
					</div>
				</div>
			</div>
			<br>
			<div class="wrapper vacation">
			<a style="color:white;" href='/dayOff/read?no=<c:out value="${employee.no}"/>'>
				&nbsp;<b>총 연차 : &nbsp;&nbsp;<span><c:out value="${total.total}"/></span> <br>
				<br>
				&nbsp;<b>잔여 연차 : &nbsp;&nbsp;<span><c:out value="${remind.remind}"/></span></b>
			</a>
			</div>
		</div>
		<div class="MainContainer main2">
			<div style="margin-bottom: 10px; margin-top: 10px;"><b class="mainLink">공지게시판</b></div>
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
			</div>
		</div>
		<div style="display: inline-flex;">
		<div style="width: 1200px;" class="MainContainer main3">
			<b class="mainLink">전자결재</b>
			<div class="wrapper approval">
			<a style="color:white;" href='/approval/listInYet?loginNo=<c:out value="${employee.no}"/>'>
				<b>미결재 <span><c:out value="${inbox.countInbox}"/></span>건</b>
			</a>
			</div>
			<br>
			<div class="wrapper unwritten">
			<a style="color:white;" href='/approval/temp?loginNo=<c:out value="${employee.no}"/>'>
			
				<b>작성문서 <span><c:out value="${temp.countTemp}"/></span>건</b>
			</a>
			</div>
		</div>
		<div style="width: 400px; padding-left: 20px" class="MainContainer main4">
			<b class="mainLink">이메일</b>
			<br>
			<button style="border: none; margin-left: 80px; color: 	T#F1C93B;" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">
			<svg style="" xmlns="http://www.w3.org/2000/svg" width="200" height="100" fill="currentColor" class="bi bi-envelope-at-fill" viewBox="0 0 16 16">
			  <path d="M2 2A2 2 0 0 0 .05 3.555L8 8.414l7.95-4.859A2 2 0 0 0 14 2H2Zm-2 9.8V4.698l5.803 3.546L0 11.801Zm6.761-2.97-6.57 4.026A2 2 0 0 0 2 14h6.256A4.493 4.493 0 0 1 8 12.5a4.49 4.49 0 0 1 1.606-3.446l-.367-.225L8 9.586l-1.239-.757ZM16 9.671V4.697l-5.803 3.546.338.208A4.482 4.482 0 0 1 12.5 8c1.414 0 2.675.652 3.5 1.671Z"/>
			  <path d="M15.834 12.244c0 1.168-.577 2.025-1.587 2.025-.503 0-1.002-.228-1.12-.648h-.043c-.118.416-.543.643-1.015.643-.77 0-1.259-.542-1.259-1.434v-.529c0-.844.481-1.4 1.26-1.4.585 0 .87.333.953.63h.03v-.568h.905v2.19c0 .272.18.42.411.42.315 0 .639-.415.639-1.39v-.118c0-1.277-.95-2.326-2.484-2.326h-.04c-1.582 0-2.64 1.067-2.64 2.724v.157c0 1.867 1.237 2.654 2.57 2.654h.045c.507 0 .935-.07 1.18-.18v.731c-.219.1-.643.175-1.237.175h-.044C10.438 16 9 14.82 9 12.646v-.214C9 10.36 10.421 9 12.485 9h.035c2.12 0 3.314 1.43 3.314 3.034v.21Zm-4.04.21v.227c0 .586.227.8.581.8.31 0 .564-.17.564-.743v-.367c0-.516-.275-.708-.572-.708-.346 0-.573.245-.573.791Z"/>
			</svg>
			</button>
		</div>
		</div>
	</div>
	</div>
	<form name="pageForm" action="/board/list">
		<input type="hidden" name="pageNum" value="${pageDTO.criteria.pageNum}">
		<input type="hidden" name="type" value="${pageDTO.criteria.type}">
		<input type="hidden" name="keyword" value="${pageDTO.criteria.keyword}">
	</form>

  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h3 id="exampleModalLabel">Email</h3>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form method="post" action="/mail/send">
            <div class="mb-3">
              <label for="recipient-name" class="col-form-label">보내는사람</label>
              <input type="text" name="name" class="form-control" id="recipient-name" value='<c:out value="${employee.name}"/>'>
              <input type="email" name="emailfrom" class="form-control" id="recipient-name" value='<c:out value='${employee.email}'/>' readonly/>     
              <input type="text" name="password" class="form-control" id="recipient-name" placeholder="비밀번호를 입력하세요.">
            </div>
            <div class="mb-3">
              <label for="recipient-name" class="col-form-label">받는사람</label>
			  <select name="emailto" class="form-control" id="recipient-name" class="write_list">
			      <option value=0>받는사람을 선택해주세요.</option>
			      	<c:forEach items="${user}" var="user">
			      		<option value="${user.email}">
			  				<c:out value="${user.deptName}"/> 소속
			  				<c:out value="${user.name}"/>
			  				<c:out value="${user.email}"/> 
			     		</option>
			      </c:forEach>
			  </select>
            </div>
            <div class="mb-3">
              <label for="recipient-name" class="col-form-label">제목</label>
              <input type="text" name="title" class="form-control" id="recipient-name">
            </div>
            <div class="mb-3">
              <label for="message-text" class="col-form-label">내용</label>
              <textarea name="body" class="form-control" id="message-text"></textarea>
            </div>
            <div class="mb-3">
              <label for="recipient-name" class="col-form-label">첨부파일</label>
              <input type="file" class="form-control" id="recipient-name">
            </div>
            <div class="modal-footer">
	          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	          <button type="submit" class="btn btn-primary">Send message</button>
	        </div>
          </form>
        </div>
      </div>
    </div>
  </div>
	<script type="text/javascript">
		// 근무시간 합계 그래프
		
		var h = ${sumtimeH};
		var m = ${sumtimeM};
		// 근무시간 / 52시간을 구하기 위한 연산	
		var t = ((h * 60 + m) / (52*60)) * 100;
				
		window.onload = function () {
 
		var options = {
			data: [{
				type: "doughnut",
				innerRadius: "40%",
				showInLegend: false,
				dataPoints: [
					{ y: ((52*60) - (h * 60 + m)), name:"남은 시간"},
					{ y: (h * 60 + m), name:"근무시간"},
				]
			}]
		};
		$("#chart").CanvasJSChart(options);
		 
		}

	</script>
	<script src="/resources/main/main.js" type="text/javascript"></script>
</body>
</html>