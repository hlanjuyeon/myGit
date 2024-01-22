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
    
    <!-- bootstrap 4 -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- fullcalendar -->
    <link href='/resources/fullcalendar/main.css' rel='stylesheet' />
    <script src='/resources/fullcalendar/main.js'></script>
    
    <!-- modal -->
    <link href='/resources/fullcalendar/modal.css' rel='stylesheet' />
    <script>
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
	      // new FullCalendar.Calendar(대상 DOM객체, {속성:속성값, 속성2:속성값2..})

        var calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        initialDate: '2021-04-12', // 초기 로딩 날짜.
        navLinks: true, // can click day/week names to navigate views
        selectable: true,
        selectMirror: true,
        // 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용..
        select: function(arg) {
    	  console.log(arg);

        var title = prompt('입력할 일정:');
        // title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay,
            backgroundColor:"yellow",
            textColor:"blue"
          })
        }
        calendar.unselect();
        },
        eventClick: function(arg) {
    	    // 있는 일정 클릭시,
    	    console.log("#등록된 일정 클릭#");
    	    console.log(arg.event);
    	  
          if (confirm('Are you sure you want to delete this event?')) {
            arg.event.remove();
          }
        },

        editable: true,
        dayMaxEvents: true, // allow "more" link when too many events
        events: 
        	function(info, successCallback, failureCallback){
      	  		// ajax 처리로 데이터를 로딩 시킨다.
      	  		$.ajax({
      		 		type:"get",
      		 		url:"${path}/calendar?method=data",
      				dataType:"json"  
      	  		});
        	}
        });

        calendar.render();
      });
    </script>
    <title>일정관리</title>
  </head>
  <body>
    <div id='calendar'></div>
    <!-- modal 추가 -->
	<button type="button" class="open" id="open-modal">모달</button>
	<div id="modal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title">제목</h4>
	        <span class="color"></span>
	      </div>
	      <div class="modal-body">
	      	<div>
	      		<p>날짜</p>
	      	</div>
	      	<div>
	      		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
  					<path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
					<path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
				</svg>
	      		<p >위치</p>
	      	</div>
	      	<div>
	      		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-justify-left" viewBox="0 0 16 16">
  					<path fill-rule="evenodd" d="M2 12.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z"/>
				</svg>
	      		<p>모달 내용</p>
	      	</div>
	      	<div>
	      		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
  					<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3Zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z"/>
				</svg>
	      		<p>참석자</p>
	      	</div>
	      	<div>
	      		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
  					<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/>
				</svg>
	      		<p>공개</p>
	      	</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" id="close-modal">닫기</button>
	        <button type="button" class="btn btn-primary">편집</button>
	      </div>
	    </div>
	  </div>
	</div>
	<script type="text/javascript">
		const modal = document.getElementById("modal");
		const openModalBtn = document.getElementById("open-modal");
		const closeModalBtn = document.getElementById("close-modal");
		// 모달창 열기
		openModalBtn.addEventListener("click", () => {
		  modal.style.display = "block";
		  document.body.style.overflow = "hidden"; // 스크롤바 제거
		});
		// 모달창 닫기
		closeModalBtn.addEventListener("click", () => {
		  modal.style.display = "none";
		  document.body.style.overflow = "auto"; // 스크롤바 보이기
		});
	</script>
  </body>
</html>