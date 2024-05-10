<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- fullcalendar -->
    <link href='/resources/fullcalendar/main.css' rel='stylesheet' />
    <script src='/resources/fullcalendar/main.js'></script>
    <script src='https://momentjs.com/downloads/moment.js'></script>
    
    <!-- modal -->
    <link href='/resources/fullcalendar/modal.css' rel='stylesheet' />
    
    <link rel="stylesheet" href="/resources/calendar/calendar.css" type="text/css">
    
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

.calendar_move {
	background-color: #3D9970;
	color: white !important;
}
   </style>
    <script>
	    $(function(){	    		
			var request = $.ajax({
			  url: "/calendar/monthPlan",
			  method: "GET",
			  dataType: "json"
			});

			request.done(function(data) {
				console.log(data);
					
					var calendarEl = document.getElementById('calendar');
					
				    var calendar = new FullCalendar.Calendar(calendarEl, {
					    initialView: 'dayGridMonth',
					    headerToolbar: {
					      left: 'prev,next today',
					      center: 'title',
					      right: 'dayGridMonth,timeGridWeek,timeGridDay'
					    },
					    editable: true,
					    dayMaxEvents: true,
					    eventDataTransform: function (event) {
					        if (moment(event.end).diff(moment(event.start), 'days') >= 1) {
					        	event.end = moment(event.end).add(1, 'days').toDate();
					            event.allDay = true;
					        }

					        return event;
					    },
					    events: data,
					    dateClick: function(info) {
					    	window.location.href = "/calendar/add";
					    },
					    eventClick: function(info) {					    	
					    	const modal = document.getElementById("modal");
							const closeModalBtn = document.getElementById("close-modal");						
							var no = info.event.extendedProps.no;
							
							document.getElementById("no").value = no;
							
							// 모달창 내용을 채우는 함수 호출
						    populateModalData(info.event.extendedProps);

						    // 모달창 보이기
						    modal.style.display = "block";
						    document.body.style.overflow = "hidden";
						    document.getElementById("modal").style.overflow = "hidden";
							
							// 모달창 닫기
							closeModalBtn.addEventListener("click", () => {
								modal.style.display = "none";
								document.body.style.overflow = "auto"; // 스크롤바 보이기
							});
							
							const editBtn = document.getElementById("editBtn");
						    
						    editBtn.addEventListener("click", () => {
						    	var link = "/calendar/edit?no=" + no;
								 
								window.location.href = link;
							});
						    
							
						    const trash = document.querySelector('.trash');
						    
						    trash.addEventListener("mouseup", () => {
						    	modal.style.display = "none";
								document.body.style.overflow = "auto"; // 스크롤바 보이기
								
								setTimeout(() => {
									eventDelete();
							        alert("일정이 삭제되었습니다."); // alert 실행
							    }, 300);
						    });
						    
						    function eventDelete() {	
						    	var form = document.getElementById("modalForm");
							    form.action = "/calendar/delete";
							    form.method= "GET;"
							    form.submit();	
							}	
						    
							}
						
						}); 	
				    
				    calendar.render();	
					    
				    function populateModalData(data) {
				    	document.getElementById('allday').value = data.allday;
				    	
						document.getElementById('title').innerText = data.titleModal;
						document.getElementById('start').innerText = data.startModal;
						document.getElementById('end').innerText = data.endModal;
						document.getElementById('location').innerText = data.location;
						document.getElementById('content').innerText = data.content;
						document.getElementById('attendee').innerText = data.attendee;
						document.getElementById('writer').innerText = data.writer;
												
						if(data.privacy == 'open') {
							document.getElementById('privacy').innerText = "전체공개";
						} else {
							document.getElementById('privacy').innerText = "비공개";
						}
						
						document.getElementById('color').style.color = data.colorModal;	
						
							
					}
				});
	    });
	</script>
    <title>캘린더</title>
  </head>
  <body>
	<%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
  	<div class="write_border">
    <div id="calendar"></div>
    </div> 
    <!-- modal 추가 -->
	<div id="modal" data-backdrop="static" data-keyboard="false">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <p class="modal-title" id="title"></p>
	        <span class="dot" id="color">●</span>
	      </div>
	      <div class="modal-body">
	      	<div class="modal-date">
	      		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-week" viewBox="0 0 16 16">
				  <path d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-5 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>
				  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
				</svg>
	      		<p id="start"></p><p id="bar">&nbsp;~&nbsp;</p><p id="end"></p>
	      		<input type="hidden" id="allday">
	      	</div>
	      	<div>
	      		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
  					<path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
					<path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
				</svg>
	      		<p id="location"></p>
	      	</div>
	      	<div>
	      		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-justify-left" viewBox="0 0 16 16">
  					<path fill-rule="evenodd" d="M2 12.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z"/>
				</svg>
	      		<p id="content"></p>
	      	</div>
	      	<div>
	      		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
  					<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3Zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z"/>
				</svg>
	      		<p id="attendee"></p>
	      	</div>
	      	<div>
	      		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
  					<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/>
				</svg>
	      		<p id="privacy"></p>
	      	</div>
	      	<div>
	      		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
					<path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
				</svg>
	      		<p id="writer"></p>
	      	</div>
	      </div>
	      <div class="modal-footer">
	      	<button class="trash" style="color:red;">
	      		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
					  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6Z"/>
					  <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1ZM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118ZM2.5 3h11V2h-11v1Z"/>
					</svg>
			</button>
	        <button type="button" style="color:black;" class="btn btn-secondary" id="close-modal">닫기</button>
	        <button type="button" class="btn btn-primary" id="editBtn">편집</button>
	      </div>
	      <form action="/calendar/list" method="get" id="modalForm">
	      	<input type="hidden" id="no" name="no">
	      </form>
	    </div>
	  </div>
	</div>
	</div>
  </body>
</html>