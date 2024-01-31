<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='/resources/fullcalendar/add.css' rel='stylesheet' />

<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src='https://momentjs.com/downloads/moment.js'></script>
<title>일정추가</title>
<script type="text/javascript">
$(function() {		
	  var request = $.ajax({
	    url: "/calendar/monthPlan",  // 데이터를 조회하는 API 엔드포인트 주소
	    method: "GET",
	    dataType: "json"
	  });

	  request.done(function(data) {
	    console.log(data);
	   
	  });
	  
/* 	  document.querySelector('#start').value= new Date(
			  new Date().getTime() - new Date().getTimezoneOffset() * 60000
	  ).toISOString().slice(0, 16);
	  document.querySelector('#end').value= new Date(
			  new Date().getTime() - new Date().getTimezoneOffset() * 60000
	  ).toISOString().slice(0, 16); */
	  
	  function convertDateTimeToString(datetime) {
		  const date = new Date(datetime);
		  const year = date.getFullYear();
		  const month = String(date.getMonth() + 1).padStart(2, '0');
		  const day = String(date.getDate()).padStart(2, '0');
		  const hours = String(date.getHours()).padStart(2, '0');
		  const minutes = String(date.getMinutes()).padStart(2, '0');
		  
		  const isoDateTime = '${year}-${month}-${day}"T"${hours}:${minutes}';
		  return isoDateTime;
	  }
	  
	  var datetimeValueStart =  document.getElementById('start').value;
	  datetimeValueStart = convertDateTimeToString(datetimeValueStart);
	  var datetimeValueEnd =  document.getElementById('end').value;
	  datetimeValueEnd = convertDateTimeToString(datetimeValueEnd);
	  
	  document.querySelector('#allday').addEventListener('change', function() {
		  document.querySelector('#allday').checked = this.checked ? true : false;
	  });
});
</script>
</head>
<body>
	<div class="add" tabindex="-1" role="dialog" aria-labelledby="exampleaddLabel" aria-hidden="true">
        <div class="add-dialog" role="document">
            <form action="/calendar/insert" method="get" id="insert_data">
                <div class="add-header">
                	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-week" viewBox="0 0 16 16">
					  <path d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-5 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>
					  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
					</svg>
                	<input type="text" class="add-title" name="title" id="exampleaddLabel" placeholder="제목 추가">
                </div>
                <div class="add-body">
                    <div class="form-group">
                    	<div class="add-date">
                        	<input type="datetime-local" class="form-date" id="start" name="startday" data-placeholder="일시 선택"> -
                        	<input type="datetime-local" class="form-date" id="end" name="endday" data-placeholder="일시 선택">
                        	<input type="checkbox" id="allday" name="allday" class="add-allday"> 종일
                        </div>
                        <div>
                        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
  								<path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
								<path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
							</svg>
                        	<input type="text" class="add-location" name="location" placeholder="위치 추가">
                        </div>
                        <div>
                        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
  								<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3Zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z"/>
							</svg>
                        	<input type="text" class="add-attendee" name="attendee" placeholder="참석자 추가">
                        </div>
                        <div>
                        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
  								<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/>
							</svg>
							<div class="privacy-select">
								<button type="button" class="privacy-btn-select">
									공개 설정<span class="btn-select-tri">▼</span>
								</button>
								<ul class="privacy-list-member">
									<li><button type="button" class="privacy-list-btn open" id="select" value="open">전체공개</button></li>
									<li><button type="button" class="privacy-list-btn notopen" id="select" value="notopen">비공개</button></li>
								</ul>
								<input type="hidden" class="privacy-input" name="privacy">
							</div>
                        </div>
                        <div>
                        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
							  <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
							</svg>
							<span class="writer"><input type="text" name="writer" value='<c:out value='${employee.name}'/>' readonly/></span>
							<div class="color-select" data-role="selectbox">
								<button type="button" class="color-btn-select">
									색상 설정<span class="btn-select-tri">▼</span>
								</button>
								<ul class="color-list-member">
									<li><button type="button" class="color-list-btn btn-gray" id="select" value="red"><span class="dot-gray">●</span>&nbsp;&nbsp;GRAY</button></li>
									<li><button type="button" class="color-list-btn btn-red" id="select" value="red"><span class="dot-red">●</span>&nbsp;&nbsp;RED</button></li>
									<li><button type="button" class="color-list-btn btn-orange" id="select" value="orange"><span class="dot-orange">●</span>&nbsp;&nbsp;ORANGE</button></li>
									<li><button type="button" class="color-list-btn btn-pink" id="select" value="hotpink"><span class="dot-pink">●</span>&nbsp;&nbsp;PINK</button></li>
									<li><button type="button" class="color-list-btn btn-green" id="select" value="green"><span class="dot-green">●</span>&nbsp;&nbsp;GREEN</button></li>
									<li><button type="button" class="color-list-btn btn-blue" id="select" value="blue"><span class="dot-blue">●</span>&nbsp;&nbsp;BLUE</button></li>
									<li><button type="button" class="color-list-btn btn-purple" id="select" value="mediumpurple"><span class="dot-purple">●</span>&nbsp;&nbsp;PURPLE</button></li>
								</ul>
								<input type="hidden" class="color-input" name="color">
							</div>
                        </div>
                        <div>
	                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-justify-left" viewBox="0 0 16 16">
	  							<path fill-rule="evenodd" d="M2 12.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z"/>
							</svg>
	                        <textarea wrap=on class="add-content" name="content" placeholder="내용 추가"></textarea>
                        </div>
                    </div>
                </div>
                <div class="add-footer">
                    <input type="submit" class="btn" id="addCalendar" value="추가">
                    <input type="button" class="btn" id="close-add" value="닫기" onclick="redirectToCalendar()">
                </div>
                <input type="hidden" name="empNo" value='<c:out value='${employee.no}'/>'>
            </form>
        </div>
    </div>
	<script>
		const color_btn = document.querySelector('.color-btn-select');
		const color_list = document.querySelector('.color-list-member');
		const color_list_btn = document.querySelector('.color-list-btn');
		const btn_gray = document.querySelector('.btn-gray');
		const btn_red = document.querySelector('.btn-red');
		const btn_orange = document.querySelector('.btn-orange');
		const btn_pink = document.querySelector('.btn-pink');
		const btn_green = document.querySelector('.btn-green');
		const btn_blue = document.querySelector('.btn-blue');
		const btn_purple = document.querySelector('.btn-purple');

		color_btn.addEventListener('click', () => {
			color_btn.classList.toggle('on');
		});
		
		color_list.addEventListener('click', (event) => {
			if (event.target.nodeName === "BUTTON") {
				color_btn.innerHTML = event.target.innerHTML;
				document.querySelector('.color-input').value = event.target.value;

				if((btn_gray.id === 'select_on') || (btn_red.id === 'select_on') || (btn_orange.id === 'select_on') || (btn_pink.id === 'select_on')
					|| (btn_green.id === 'select_on') || (btn_blue.id === 'select_on') || (btn_purple.id === 'select_on')) {
					btn_gray.style.backgroundColor = 'white';
					btn_gray.id = 'select'; 
					btn_red.style.backgroundColor = 'white';
					btn_red.id = 'select';
					btn_orange.style.backgroundColor = 'white';
					btn_orange.id = 'select';
					btn_pink.style.backgroundColor = 'white';
					btn_pink.id = 'select';
					btn_green.style.backgroundColor = 'white';
					btn_green.id = 'select';
					btn_blue.style.backgroundColor = 'white';
					btn_blue.id = 'select';
					btn_purple.style.backgroundColor = 'white';
					btn_purple.id = 'select';
				}

				event.target.id = 'select_on';	
				event.target.style.backgroundColor = 'rgb(224, 236, 258)';

				color_btn.classList.remove('on');
			}
		});

		const privacy_btn = document.querySelector('.privacy-btn-select');
		const privacy_list = document.querySelector('.privacy-list-member');
		const privacy_list_btn = document.querySelector('.privacy-list-btn');
		const btn_open = document.querySelector('.open');
		const btn_notopen = document.querySelector('.notopen');
		
		privacy_btn.addEventListener('click', () => {
			privacy_btn.classList.toggle('on');
		});

		privacy_list.addEventListener('click', (event) => {
			if (event.target.nodeName === "BUTTON") {				
				if((btn_open.id === "select_on") || (btn_notopen.id === "select_on")) {
					btn_open.style.backgroundColor = "white";
					btn_open.id = "select"; 
					btn_notopen.style.backgroundColor = "white";
					btn_notopen.id = "select";
				}
				privacy_btn.innerText = event.target.innerText;
				document.querySelector('.privacy-input').value = event.target.value;
				console.log(document.querySelector('.privacy-input').value);
				
				event.target.id = "select_on";	
				event.target.style.backgroundColor = "rgb(224, 236, 258)";

				privacy_btn.classList.remove('on');	
			}
		});
		
		function redirectToCalendar() {
	        var loginNo = '<c:out value="${employee.no}"/>';
	        var url = '/calendar/list?loginNo=' + loginNo;
	        location.href = url;
	    }
	</script>
</body>
</html>