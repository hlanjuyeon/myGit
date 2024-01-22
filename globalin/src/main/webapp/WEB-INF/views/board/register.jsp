<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Board</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="/resources/main/style.css">
		<link rel="stylesheet" type="text/css" href="/resources/board/board.css">
		<style>
body {
	width: 1800px;
	height: 900px;
}
.body_css {
    /* display: flex; */
    margin-left: 100px;
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
div.line {
    border-bottom: 1px solid #ff8b77;
}

h4.reply-h4 {
    margin-bottom: 0;
}

.uploadResult {
    width: 100%;
}

.uploadResult ul {
    display: flex;
    justify-content: center;
}

.uploadResult ul li {
    list-style: none;
}

/* 게시글 상세보기 */
.content {
    background: #fff;
    padding: 20px;
    border-radius: 4px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
}

.content h4 {
    margin-bottom: 10px;
}

.content input[type="text"], .content textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    box-sizing: border-box;
    margin-bottom: 10px;
}

.content .button {
    margin-top: 10px;
}

/* 댓글 등록 */
.register-form {
    margin-top: 20px;
}

.register-form h4 {
    margin-bottom: 10px;
}

.register-form input[type="text"], .register-form textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    box-sizing: border-box;
    margin-bottom: 10px;
}

.register-form .button {
    margin-top: 10px;
}
		
			.sidenav {
				    position: fixed;
				    top: 20px;
				    left: 0;
				    width: 200px;
				    /* height: 100%; */
				   /*  overflow-y: auto; */
			}

			#main {
   					padding-left: 220px; /* navigation의 width(200px) + 추가 여백(20px) */
			}
			
			body > a, .header-right {
			    height: 100px; /* 원하는 높이로 설정 */
			}
			
			.sidenav, #main {
    			margin-top: 100px; /* header의 높이와 동일하게 설정 */
			}
			
			ul {
			    list-style-type: none;
			}
			
			h3 {
				text-align: right;
			}
			
			ul.actions {
				text-align: center;
			}
			
			.comment {
				margin: 20px 0px;
				text-align: right;
			}
			
			.comment > strong {
				font-size: 1.3em;
			}
			
			.darkmode_div {
    position: absolute;
    margin-left: 20px;
    margin-left: 20px;
    bottom: 20px !important;
}
			
		</style>
	</head>
<!-- 		<style>
			body {transform: scale(0.8); margin-top: -50px;}
			.uploadResult {
				width: 100%;
			}
			
			.uploadResult ul {
				display: flex;
				justify-content: center;
			}
			
			.uploadResult ul li {
				list-style: none;
			}
		</style> -->
	<body class="is-preload">
		<%@ include file="/WEB-INF/views/main/header.jsp"%>
    <div class="body_css">
    
	<%@ include file="/WEB-INF/views/main/navigation.jsp" %>
		<!-- Main -->
		<div id="main">
			<div class="wrapper">
				<div class="inner">

					<!-- Elements -->
					<header class="major">
						<h1>게시글 등록</h1>
						<!-- <p></p> -->
					</header>
					<!-- Table -->
					<h3><a href="/board/list" class="button small" style="text-decoration: none;">목록 보기</a></h3>
					<div class="content">
						<div class="form">
							<form method="post" action="/board/register" id="registForm" name="registForm" enctype="multipart/form-data">
								<div class="fields">
									<div class="field">
										<h4>제목</h4>
										<input name="title" placeholder="Title" type="text" />
									</div>
									<div class="field">
										<h4>내용</h4>
										<textarea name="content" rows="6" placeholder="Content" style="resize:none"></textarea>
									</div>
									<div class="field">
										<h4>부서</h4>
										<input name="deptName" value="${sessionScope.employee.deptName}" placeholder="DeptName" type="text" readonly />
									</div>
									<div class="field">
										<h4>작성자</h4>
										<input name="name" value="${sessionScope.employee.name}" placeholder="Name" type="text" readonly />
									</div>
									<div class="field">
										<h4>첨부파일</h4>
										<input name="multipartFiles" type="file" multiple/>
									</div>
									<div class="field">
										<div class="uploadResult">
											<ul></ul>
										</div>
									</div>
								</div>
								<ul class="actions special">
									<li><input type="submit" class="button" value="등록" /></li>
								</ul>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div> 
		</div>
	</body>
	<!-- Scripts -->
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
	<script src="/resources/assets/js/browser.min.js"></script>
	<script src="/resources/assets/js/breakpoints.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>
	<script>
		$(document).ready(function(e){
			var $uploadResult = $(".uploadResult ul");
			var regex = new RegExp("(.*/)\.(exe|sh|zip|alz)$");
			var maxSize = 1024 * 1024 * 20; //20MB
			
			function showUploadResult(files){
				var str = "";
				$(files).each(function(i, file){
					if(!file.fileType){
						str += "<li data-filename='" + file.fileName + "' data-uuid='" + file.uuid + "' data-uploadpath='" + file.uploadPath + "' data-filetype='" + file.fileType + "'>";
						str += "<div>";
						str += "<img src='/resources/images/attach.png' width='100'>";
						str += "</div>";
						str += "<span>" + file.fileName + "</span>"
						str += "</li>";
						
					}else{
						var fileName = encodeURIComponent(file.uploadPath + "/t_" + file.uuid + "_" + file.fileName);
						console.log(file.fileType);
						str += "<li data-filename='" + file.fileName + "' data-uuid='" + file.uuid + "' data-uploadpath='" + file.uploadPath + "' data-filetype='" + file.fileType + "'>";
						str += "<div>";
						str += "<img src='/display?fileName=" + fileName + "' width='100'>";
						str += "</div>";
						str += "<span>" + file.fileName + "</span>"
						str += "</li>";
					}
				});
				$uploadResult.append(str);
			}
			
			$("input[type='file']").change(function(e){
				$(".uploadResult ul li").remove();
				
				var formData = new FormData();
				var $inputFile = $(this);
				var files = $inputFile[0].files;
				console.log(files);
				
				for(let i=0; i<files.length; i++){
					if(!checkExtension(files[i].name, files[i].size)){
						return false;
					}
					formData.append("multipartFiles", files[i]);
				}
				$.ajax({
					url: '/upload',
					processData: false,
					contentType: false,
					data: formData,
					type: "post",
					dataType: "json",
					success: function(result){
						console.log(result);
						showUploadResult(result);
					}
				});
			});
			
			$("input[type='submit']").on("click", function(e){
				e.preventDefault();
				var $form = $(document.registForm);
				var str = "";
				
				$(".uploadResult ul li").each(function(i, li){
					str += "<input type='hidden' name='files[" + i + "].uuid' value='" + $(li).data("uuid") +"'>";
					str += "<input type='hidden' name='files[" + i + "].uploadPath' value='" + $(li).data("uploadpath") +"'>";
					str += "<input type='hidden' name='files[" + i + "].fileName' value='" + $(li).data("filename") +"'>";
					str += "<input type='hidden' name='files[" + i + "].fileType' value='" + $(li).data("filetype") +"'>";
				});
				$form.append(str).submit();
			});
			
			
			function checkExtension(fileName, fileSize){
				if(regex.test(fileName)){
					alert("업로드할 수 없는 파일의 형식입니다.")
					return false;
				}	
				
				if(fileSize >= maxSize) {
					alert("파일 사이즈 초과");
					return false;
				}
				
				return true;
			}
		});
	</script>
</html>















