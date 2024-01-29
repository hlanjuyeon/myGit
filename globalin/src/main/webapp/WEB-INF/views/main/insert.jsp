<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
<title>사원 등록</title>
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
	    height: 800px !important;
}

.MainContainer {
	/* position: fixed; */
	width: 100%;
	height: 250px;
	margin-left: 20px;
	margin-bottom: 50px;
	overflow: auto;
}

input[type='text'], input[type='file'], input[type='date'], input[type='number'] {
	background-color: white;
	border: 2px solid #3D9970;
	border-radius: 15px;
	padding: 5px 10px;
	margin-left: 15px;
	font-size: 16px;
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

.checkdup, .submit {
	background-color: #3D9970;
	color: white;
	border: 2px solid #3D9970;
	border-radius: 10px;
	padding: 10px 10px;
	font-size: 16px;
}

.checkdup:hover, .submit:hover {
	background-color: white;
	color: #3D9970;
	transition-duration: 0.3s;
	border: 2px solid #3D9970;
	cursor: pointer;
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
	width: 100%;
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
.id-check {
	display: inline-block;
	color: #aaa;
	transition:.2s;
}
.preview{
	width:50px;
	height:100px;
}

.form-group {
	width: 200px;
	display:inline;
}
#checkdup {
	height: 45px;
	margin-top: 5px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
		<div class="MainContainer body_right" align="center">
			<div class="main">
	<form action="insert" method="post" class="formClass" enctype="multipart/form-data">
			<table border="0" cellspacing="0" cellpadding="0" class="formContainer" width="1000px">
			<tr>
				<td><b>아이디</b></td> 
				<td>
					<div class="form-group">
						<input type="text" width="200px" name="id" class="id" id="id">
						<input type="hidden" id="duplicate" name="duplicate" value=''/>
						<input type="button" id="checkdup" class="checkdup" value="중복 확인">
					</div>
				</td>
			</tr>
			<tr>
				<td><b>비밀번호</b></td>
				<td><input type="password" id="pw" width="200px" class="password" name="pw">
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
				<td><input type="text" width="200px" id="name" name="name"></td>
			</tr>
			<tr>
				<td><b>직책</b></td>
				<td><input type="text" width="200px" id="position" name="position"></td>
			</tr>
			<tr>
				<td><b>전화번호</b>
				<td><input type="text" width="200px" id="phone" name="phone"></td>
			</tr>
			<tr>
				<td><b>사내전화</b>
				<td><input type="text" width="200px" id="call" name="call"></td>
			</tr>
			<tr>
				<td><b>이메일</b>
				<td><input type="text" width="200px" id="email" name="email"></td>
			</tr>
			<tr>
				<td><b>성별</b>
				<td>
					<select name="gender" id="gender" class="selector" name="gender">
						<option value="남성">남성</option>
						<option value="여성">여성</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><b>생년월일</b></td>
				<td><input type="text" width="200px" id="birth" name="birth"></td>
			</tr>
			<tr>
				<td><b>부서이름</b></td>
				<td><input type="text" width="200px" id="deptName" name="deptName"></td>
			</tr>
			<tr>
				<td><b>부서번호</b></td>
				<td><input type="number" width="200px" id="deptNo" name="deptNo"></td>
			</tr>
			<tr>
				<td><b>입사일자</b></td>
				<td><input type="date" id="hireDate" name="hireDate"/></td>
			</tr>
			<tr>
				<td><b>재직상태</b></td>
				<td>
					<select name="status" id="status" class="selector" name="status">
						<option value="재직">재직</option>
						<option value="휴직">휴직</option>
						<option value="정직">정직</option>
						<option value="퇴사">퇴사</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><b>사원사진</b></td>
				<td><input type="file" id="photoFile" width="150px" name="photoFile"></td>
			</tr>
			<tr>
			<td></td>
			<td align="right">
			<input type=submit id="submit" class="submit" value="등록하기">
			</td>
			</tr>
			</table>
			</form>
			</div>
		</div>
	</div>
	<script>
	const inputImage = document.getElementById("photo")
	inputImage.addEventListener("change", e => {
	    if(e.target.files && e.target.files[0]) {
	        const reader = new FileReader()
	        reader.onload = e => {
	            const previewImage = document.getElementById("preview")
	            previewImage.src = e.target.result
	        }
	        reader.readAsDataURL(e.target.files[0])
	    }
	})
	</script>
	<script>
	
	
//	아이디 중복검사, 비밀번호 일치 검사 Script
	$(document).ready(function() {
		// 아이디 중복 검사
		$('#checkdup').click(function() {
			var id = document.getElementById("id").value; // ID에 입력된 값 가져오기
			if(id.length != 0) { // 입력된 값이 있으면
				var url = "/checkdup?id=" + id; // checkdup.jsp를 팝업으로 띄우기
				var popup = window.open(url, "아이디 중복 검사", "width=300, height=100, location=no");
				popup.addEventListener('beforeunload', function() { // 만약 팝업이 꺼지면,
					if(document.getElementById("duplicate").value == "success") { // 팝업에서 입력된 결과가 성공, 즉 중복이 없으면
						document.getElementById("id").readOnly = true; // 아이디 수정 금지
						document.getElementById("checkdup").disabled = true; // 중복 재검사 비활성화
					}
				});
			}
		});
		
		
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