<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
<title>사원 등록</title>
<%@ include file="/WEB-INF/views/main/header.jsp"%>
<%@ include file="/WEB-INF/views/main/navigation.jsp"%>
<style>
.MainContainer {
	position: fixed;
	width: 60%;
	height: 85%;
	left: 25%;
	overflow:auto;
}

input[type='text'], input[type='file'], input[type='date'] {
	background-color: white;
	border: 2px solid #3D9970;
	border-radius: 15px;
	padding: 5px 10px;
	font-size: 16px;
	margin-left: 15px;
	margin-top:5px;
	margin-bottom:5px;
}

input[type='password'] {
	background-color: white;
	border: 2px solid #3D9970;
	border-radius: 15px;
	padding: 5px 10px;
	font-size: 16px;
	margin-top: 20px;
	margin-left: 15px;
}

.progress-bar_text {
	display: inline-block;
	color: #aaa;
	transition:.2s;
	width: 500px;
}

.progress-bar_text-rep {
	display: inline-block;
	color: #aaa;
	transition:.2s;
	width: 500px;
}

.progress-bar_wrap {
  width: 300px;
  height: 5px;
  background: #F6F6FA;
  display: inline-block;
  vertical-align: middle;
  overflow: hidden;
  border-radius: 5px;
	margin-left: 15px;
}

.formClass .progress-bar_item {
	display:inline-block;
	height: 100%;
	width: 32.5%;
	margin-right: .8%;
	border-radius: 5px;
	float:left;
	
	transition: background-color .2s, visisility .1s;
}

.formClass .progress-bar_item-rep {
	display:inline-block;
	height: 100%;
	width: 32.5%;
	margin-right: .8%;
	border-radius: 5px;
	float:left;
	
	transition: background-color .2s, visisility .1s;
}
.progress-bar_item-1 {
  
}

.progress-bar_item-2 {

}

.progress-bar_item-3 {

}

.formClass .progress-bar_item-1.active {
	background-color: #FF4B47;
}

.formClass .progress-bar_item-2.active {
	background-color:#F9AE35;
}

.formClass .progress-bar_item-3.active {
	background0-color:#2DAF7D;
}

.selector {
	background-color: white;
	border: 2px solid #3D9970;
	border-radius: 15px;
	width: 220px;
	margin-left: 15px;
	margin-top:5px;
	margin-bottom:5px;
}
</style>
</head>
<body>
	<form action="join.do" method="post" class="formClass">
		<div class="MainContainer" align="center">
			<div class="main">
			<table border="0" cellspacing="0" cellpadding="0" class="formContainer" width="950px">
			<tr>
				<td><b>아이디</b></td> 
				<td><input type="text" width="200px" ></td>
			</tr>
			<tr>
				<td><b>비밀번호</b></td>
				<td><input type="password" id="pw" width="200px" class="password">
				<br>
				<div class="progress-bar_wrap">
					<div class="progress-bar_item progress-bar_item-1"></div>
					<div class="progress-bar_item progress-bar_item-2"></div>
					<div class="progress-bar_item progress-bar_item-3"></div>
				</div>
				<span class="progress-bar_text">비밀번호가 비어있습니다.</span> 
				</td>
			</tr>
			<tr>
				<td><b>비밀번호 확인</b></td>
				<td><input type="password" width="200px;" class="passwordRepeat">
				<br>
				<div class="progress-bar_wrap">
					<div class="progress-bar_item-rep progress-bar_item-1-rep"></div>
					<div class="progress-bar_item-rep progress-bar_item-2-rep"></div>
					<div class="progress-bar_item-rep progress-bar_item-3-rep"></div>
				</div>
				<span class="progress-bar_text-rep">비밀번호가 비어있습니다.</span>
				</td>
			</tr>
			<tr>
				<td><b>이름</b></td> 
				<td><input type="text" width="200px" id="name"></td>
			</tr>
			<tr>
				<td><b>직책</b></td>
				<td><input type="text" width="200px" id="position"></td>
			</tr>
			<tr>
				<td><b>전화번호</b>
				<td><input type="text" width="200px" id="phone"></td>
			</tr>
			<tr>
				<td><b>사내전화</b>
				<td><input type="text" width="200px" id="call"></td>
			</tr>
			<tr>
				<td><b>이메일</b>
				<td><input type="text" width="200px" id="email"></td>
			</tr>
			<tr>
				<td><b>성별</b>
				<td>
					<select name="gender" id="gender" class="selector">
						<option value="male">남성</option>
						<option value="female">여성</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><b>생년월일</b></td>
				<td><input type="text" width="200px" id="birth"></td>
			</tr>
			<tr>
				<td><b>부서이름</b></td>
				<td><input type="text" width="200px" id="deptName"></td>
			</tr>
			<tr>
				<td><b>부서번호</b></td>
				<td><input type="text" width="200px" id="deotNo"></td>
			</tr>
			<tr>
				<td><b>입사일자</b></td>
				<td><input type="date"/></td>
			</tr>
			<tr>
				<td><b>퇴사일자</b></td>
				<td><input type="date"/></td>
			</tr>
			<tr>
				<td><b>재직상태</b></td>
				<td>
					<select name="status" id="status" class="selector">
						<option value="work">재직</option>
						<option value="rest">휴직</option>
						<option value="stop">정직</option>
						<option value="exit">퇴사</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><b>사원사진</b></td>
				<td><input type="file" id="photo" width="150px"></td>
			</tr>
			<tr>
			<td></td>
			<td align="right">
			<input type="submit" id="submit" value="등록하기">
			</td>
			</tr>
			</table>
			</div>
		</div>
	</form>
	
	<script>
	$(document).ready(function() {
		const changeText = function(el, text, color) {
			el.text(text).css('color',color);
		};
		
		$('.password').keyup(function(){
			let len = this.value.length;
			const pbText = $('.formClass .progress-bar_text');
			
			if (len === 0) {
				$('.formClass .progress-bar_item').each(function(){
					$(this).removeClass('active')
				});
				changeText(pbText, '비밀번호가 비어있습니다.');
			} else if(len > 0 && len <= 4) {
				$('.formClass .progress-bar_item-1').addClass('active');
				$('.formClass .progress-bar_item-2').removeClass('active');
				$('.formClass .progress-bar_item-3').removeClass('active');
				changeText(pbText, '비밀번호가 너무 짧습니다');				
			} else if(len > 4 && len <= 8) {
				$('.formClass .progress-bar_item-2').addClass('active');
				$('.formClass .progress-bar_item-3').removeClass('active');
				changeText(pbText, '비밀번호 길이는 최소 8자 이상이어야 합니다');
			} else {
				$('.formClass .progress-bar_item').each(function(){
					$(this).addClass('active');
				});
				changeText(pbText, 'OK!');
			}
		});
			$('.passwordRepeat').keyup(function(){
				len = this. value. length;
				const pbText = $('.progress-bar_text-rep');
				
				if(len === 0) {
					$('.progress-bar_item-rep').each(function() {
						$(this).removeClass('active').css('background-color','#F6F6FA');
					});
					changeText(pbText, '비밀번호를 입력해주세요.');
				} else if($('.password').val() != $('.passwordRepeat').val()) {
					$(' .progress-bar_item-1-rep').addClass('active').css('background-color','#FF4B47');
		            $(' .progress-bar_item-2-rep').removeClass('active').css('background-color','#FF4B47');
		            $(' .progress-bar_item-3-rep').removeClass('active').css('background-color','#FF4B47');
					changeText(pbText, '비밀번호가 다릅니다');
				} else {
					$('.progress-bar_item-rep').each(function(){
						$(this).addClass('active').css('background-color','#2DAF7D');
					});
					changeText(pbText, '비밀번호가 일치합니다');
				}
			});
		});

	
	
	</script>
</body>
</html>