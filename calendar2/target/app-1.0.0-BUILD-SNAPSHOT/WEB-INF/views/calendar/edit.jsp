<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='/resources/fullcalendar/add.css' rel='stylesheet' />
<title>일정편집</title>
</head>
<body>
	<div class="add" tabindex="-1" role="dialog" aria-labelledby="exampleaddLabel" aria-hidden="true">
        <div class="add-dialog" role="document">
            <form action="/calendar?method=list" method="get">
                <div class="add-header">
                	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-week" viewBox="0 0 16 16">
					  <path d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-5 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>
					  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
					</svg>
                	<input type="text" class="add-title" id="exampleaddLabel" placeholder="제목 추가">
                </div>
                <div class="add-body">
                    <div class="form-group">
                    	<div class="add-date">
                        	<input type="date" class="form-control" id="calendar_start_date" data-placeholder="날짜 선택" required aria-required="true" value={startDateValue} onChange={StartDateValueHandler}> -
                        	<input type="date" class="form-control" id="calendar_end_date" data-placeholder="날짜 선택" required aria-required="true" value={startDateValue} onChange={StartDateValueHandler}>
                        	<input type="checkbox" name="allday" class="add-allday"> 종일
                        </div>
                        <div>
                        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
  								<path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
								<path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
							</svg>
                        	<input type="text" class="add-location" placeholder="위치 추가">
                        </div>
                        <div>
                        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
  								<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3Zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z"/>
							</svg>
                        	<input type="text" class="add-attendee" placeholder="참석자 추가">
                        </div>
                        <div>
                        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
  								<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/>
							</svg>
							<div class="private-select">
								<button type="button" class="private-btn-select">
									공개 설정<span class="btn-select-tri">▼</span>
								</button>
								<ul class="private-list-member">
									<li><button type="button" class="private-list-btn" id="open" name="select">전체 공개</button></li>
									<li><button type="button" class="private-list-btn" id="private" name="select">비공개</button></li>
								</ul>
							</div>
                        </div>
                        <div>
                        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
							  <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
							</svg>
							<span class="writer">작성자&nbsp;&nbsp;&nbsp;</span>
							<div class="color-select" data-role="selectbox">
								<button type="button" class="color-btn-select">
									색상 설정<span class="btn-select-tri">▼</span>
								</button>
								<ul class="color-list-member">
									<li><button type="button" class="color-list-btn" id="btn-gray" name="select"><span class="dot-gray">●</span>&nbsp;&nbsp;GRAY</button></li>
									<li><button type="button" class="color-list-btn" id="btn-red" name="select"><span class="dot-red">●</span>&nbsp;&nbsp;RED</button></li>
									<li><button type="button" class="color-list-btn" id="btn-orange" name="select"><span class="dot-orange">●</span>&nbsp;&nbsp;ORANGE</button></li>
									<li><button type="button" class="color-list-btn" id="btn-yellow" name="select"><span class="dot-yellow">●</span>&nbsp;&nbsp;YELLOW</button></li>
									<li><button type="button" class="color-list-btn" id="btn-green" name="select"><span class="dot-green">●</span>&nbsp;&nbsp;GREEN</button></li>
									<li><button type="button" class="color-list-btn" id="btn-blue" name="select"><span class="dot-blue">●</span>&nbsp;&nbsp;BLUE</button></li>
									<li><button type="button" class="color-list-btn" id="btn-purple" name="select"><span class="dot-purple">●</span>&nbsp;&nbsp;PURPLE</button></li>
								</ul>
							</div>
                        </div>
                        <div>
	                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-justify-left" viewBox="0 0 16 16">
	  							<path fill-rule="evenodd" d="M2 12.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z"/>
							</svg>
	                        <textarea wrap=on class="add-content" placeholder="내용 추가"></textarea>
                        </div>
                    </div>
                </div>
                <div class="add-footer">
                    <input type="submit" class="btn" id="addCalendar" value="편집">
                    <input type="button" class="btn" id="close-add" value="닫기" onclick="location.href='calendar?method=list'">
                </div>
            </form>
        </div>
    </div>
	<script>
		const color_btn = document.querySelector('.color-btn-select');
		const color_list = document.querySelector('.color-list-member');
		const color_list_btn = document.querySelector('.color-list-btn');
		const btn_gray = document.querySelector('#btn-gray');
		const btn_red = document.querySelector('#btn-red');
		const btn_orange = document.querySelector('#btn-orange');
		const btn_yellow = document.querySelector('#btn-yellow');
		const btn_green = document.querySelector('#btn-green');
		const btn_blue = document.querySelector('#btn-blue');
		const btn_purple = document.querySelector('#btn-purple');

		color_btn.addEventListener('click', () => {
			color_btn.classList.toggle('on');
		});
		
		color_list.addEventListener('click', (event) => {
			if (event.target.nodeName === "BUTTON") {
				color_btn.innerHTML = event.target.innerHTML;

				if((btn_gray.name === 'select_on') || (btn_red.name === 'select_on') || (btn_orange.name === 'select_on') || (btn_yellow.name === 'select_on')
					|| (btn_green.name === 'select_on') || (btn_blue.name === 'select_on') || (btn_purple.name === 'select_on')) {
					btn_gray.style.backgroundColor = 'white';
					btn_gray.name = 'select'; 
					btn_red.style.backgroundColor = 'white';
					btn_red.name = 'select';
					btn_orange.style.backgroundColor = 'white';
					btn_orange.name = 'select';
					btn_yellow.style.backgroundColor = 'white';
					btn_yellow.name = 'select';
					btn_green.style.backgroundColor = 'white';
					btn_green.name = 'select';
					btn_blue.style.backgroundColor = 'white';
					btn_blue.name = 'select';
					btn_purple.style.backgroundColor = 'white';
					btn_purple.name = 'select';
				}

				event.target.name = 'select_on';	
				event.target.style.backgroundColor = 'rgb(224, 236, 258)';

				color_btn.classList.remove('on');
			}
		});

		const private_btn = document.querySelector('.private-btn-select');
		const private_list = document.querySelector('.private-list-member');
		const private_list_btn = document.querySelector('.private-list-btn');
		const btn_open = document.querySelector('#open');
		const btn_private = document.querySelector('#private');
		
		private_btn.addEventListener('click', () => {
			private_btn.classList.toggle('on');
		});
		
		var buttonTest=0; //0 아무것도 선택 안함, 1은 전체, 2은 비공개 -- 나누거나 or radio 버튼
		

		private_list.addEventListener('click', (event) => {
			if (event.target.nodeName === "BUTTON") {
				private_btn.innerHTML = event.target.innerHTML;
				
				if((btn_open.name === 'select_on') || (btn_private.name === 'select_on')) {
					btn_open.style.backgroundColor = 'white';
					btn_open.name = 'select'; 
					btn_private.style.backgroundColor = 'white';
					btn_private.name = 'select';
				}

				event.target.name = 'select_on';	
				event.target.style.backgroundColor = 'rgb(224, 236, 258)';

				private_btn.classList.remove('on');	
			}
		});
	</script>
</body>
</html>