<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.globalin.shine.domain.employee.EmployeeVO"%>
<%
EmployeeVO loginUser = (EmployeeVO) session.getAttribute("employee");
%>
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
						<h1>게시글 상세보기</h1>
					</header>
					<!-- Table -->
					<h3><a href="/board/list${criteria.params}" class="button small" style="text-decoration: none;">목록 보기</a></h3>
					<div class="content">
						<div class="form">
							<form action="/board/remove" name="deleteForm">
								<div class="fields">
									<div class="field">
										<h4>번호</h4>
										<input type="text" name="bno" value="${board.bno}" readonly>
									</div>
									<div class="field">
										<h4>제목</h4>
										<input type="text" name="title" value="${board.title}" readonly>
									</div>
									<div class="field">
										<h4>내용</h4>
										<textarea name="content" rows="6" style="resize: none;" readonly>${board.content}</textarea>
									</div>
									<div class="field">
										<h4>부서</h4>
										<input type="text" name="deptName" value="${board.deptName}" readonly>
									</div>
									<div class="field">
										<h4>작성자</h4>
										<input type="text" name="name" value="${board.name}" readonly>
									</div>
									<div class="field">
										<h4>첨부파일</h4>
										<div class="uploadResult">
											<ul></ul>
										</div>
									</div>
								</div>
								<ul class="actions special">
									<li>
										<c:if test="${sessionScope.employee.deptName eq board.deptName and sessionScope.employee.name eq board.name}">
											<input type="button" class="button" value="수정" onclick="location.href='/board/modify${criteria.params}&bno=${board.bno}'"/>
											<input type="submit" class="button" value="삭제"/>
										</c:if>
									</li>
								</ul>
								<ul class="icons" style="margin: 0;">
									<li class="comment">
										<span class="icon solid fa-envelope"></span>
										<strong>댓글</strong>
									</li>
								</ul>
								<a class="button primary small register" style="display: block; margin-bottom: 30px;">댓글 등록</a>
								<div class="fields register-form" style="display: none;">
									<div class="field">
										<h4 class="reply-h4">작성자</h4>
										<input name="replier" placeholder="Replier" type="text">
									</div>
									<div class="field">
										<h4 class="reply-h4">댓글</h4>
										<textarea name="reply" rows="6" placeholder="Reply" style="resize: none;"></textarea>
									</div>
									<div class="field registerButtons" style="text-align: right">
										<a href="javascript:void(0)" class="button primary small finish">등록</a>
										<a href="javascript:void(0)" class="button primary small cancel">취소</a>
									</div>
								</div>
								<ul class="replies"></ul>
							</form>
							<div class="paging" style="text-align: center"></div>
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
	<script src="/resources/assets/js/reply.js"></script>
	<script>
		let page = 1;
		let bno = "${board.bno}";
		const repliesUL = $("ul.replies");
		
		showList(page);
		
		function showReplyPage(total){
			let endNum = Math.ceil(page / 10.0) * 10;
			let startNum = endNum - 9;
			let prev = startNum != 1;
			let next = false;
			let str = "";
			
			if(endNum * 10 >= total){
				endNum = Math.ceil(total / 10.0);
			}
			
			if(endNum * 10  < total){
				next = true;
			}
			
			if(prev){
				str += `<a class='changePage' href=` + (startNum - 1) + `><code>&lt;</code></a>`;
			}
			
			for(let i = startNum; i <= endNum; i++){
				if(page == i){
					str += `<code>` + i + `</code>`;
				}else{
					str += `<a class='changePage' href=` + i + `><code>` + i + `</code></a>`;
				}
			}
			
			if(next){
				str += `<a class='changePage' href=` + (endNum + 1) + `><code>&gt;</code></a>`;
			}
			
			$("div.paging").html(str);
		}
		
		function showList(page){
			replyService.getList({
				bno: bno,
				page: page
			}, function(result){
				let list = result.list;
				let total = result.total;
				let str = "";
				let date = "";
				for(let i=0; i<list.length; i++){
					let check = false;
					check = list[i].replyDate == list[i].updateDate;
					date = check ? list[i].replyDate : list[i].updateDate;
					str += `<li id=` + list[i].rno + ` style="display: block;">`;
					str += `<div style="display: flex; justify-content: space-between">`;
					str += `<strong style="display: block;">` + list[i].replier + `</strong>`;
					str += `<div>`;
					str += `<a href=` + list[i].rno + ` class="modify-ready">수정</a>`;
					str += `<a href=` + list[i].rno + ` class="modify-finish" style="display: none">수정완료</a>`;
					str += `&nbsp;&nbsp;&nbsp;&nbsp;<a href=` + list[i].rno + ` class="remove">삭제</a>`;
					str += `</div>`;
					str += `</div>`;
					str += `<p class=` + list[i].rno +`>` + list[i].reply + `</p>`;
					str += `<strong style="display: block; text-align: right">` + (check ? "" : "*") + replyService.displayTime(date) + `</strong>`;
					str += `<div class="line"></div>`;
					str += `</li>`;
				}
				repliesUL.html(str);
				showReplyPage(total);
			});
		}
		
		$("div.paging").on("click", "a.changePage", function(e){
			e.preventDefault();
			page = $(this).attr("href");
			showList(page);
		})
		
		$("a.finish").on("click", function(e){
			e.preventDefault();
			replyService.add({
				bno: bno,
				reply: $("textarea[name='reply']").val(),
				replier: $("input[name='replier']").val()
			}, function(){
				$("textarea[name='reply']").val("");
				$("input[name='replier']").val("");
				showList(page);
			});
		});
		
		$("a.register").on("click", function(e){
			e.preventDefault();
			$("div.register-form").show();
			$(this).hide();
		});
		
		$("a.cancel").on("click", function(e){
			e.preventDefault();
			$("div.register-form").hide();
			$("a.register").show();
		});
		
		//이벤트 위임
		//DOM으로 추가한 태그들은 이벤트가 발생하지 않는다.
		//이런 경우에는 기존에 있는 태그에 이벤트를 걸어주고,
		//새롭게 추가될 태그의 선택자를 on("이벤트명", "자식요소 선택자", callback)메소드에 같이 전달한다.
		//기존에 있었던 태그의 이벤트가 새롭게 추가된 자식 요소에 위임된다.
		let check = false;
		$("ul.replies").on("click", "a.modify-ready", function(e){
			e.preventDefault();

			if(check) {
				alert("이미 수정중인 댓글이 있습니다.");
				return;
			}
			
			let finish = $("a.modify-finish");
			let rno = $(this).attr("href");
			const p = $("li#" + rno).find("p." + rno);
			const remove = $("a.remove");
			
			$(this).hide();
			for(let i=0; i<finish.length; i++){
				if(finish[i].getAttribute("href") == rno){
					$(finish[i]).show();
					$(remove[i]).attr("class", "modify-cancel");
					$(remove[i]).text("취소");
					break;
				}
			}
			p.html("<textarea class=" + rno + " style='resize: none;'>" + p.text() + "</textarea>");
			check = true;
		});
		
		$("ul.replies").on("click", "a.modify-finish", function(e){
			e.preventDefault();

			let rno = $(this).attr("href");
			const p = $("li#" + rno).find("p." + rno);
			
			replyService.modify({
				reply: $("textarea." + rno).val(),
				rno: $(this).attr("href")
			}, function(){
				p.html($("textarea." + rno).val());
				
				$(this).hide();
				$(this).prev().show();
				
				showList(page);
				check = false;
			});
		});
		
		$("ul.replies").on("click", "a.modify-cancel", function(e){
			e.preventDefault();
			
			let rno = $(this).attr("href");
			const p = $("li#" + rno).find("p." + rno);
			
			p.html($("textarea." + rno).text());
			
			$(this).attr("class", "remove");
			$(this).text("삭제");
			
			$(this).prev().hide();
			$(this).prev().prev().show();
			check = false;
		});
		
		$("ul.replies").on("click", "a.remove", function(e){
			e.preventDefault();
			
			if(confirm("정말 삭제하시겠습니까?")){
				replyService.remove($(this).attr("href"), function(){
					showList(page);
				});
			}
		});
		
		
		
		/* 첨부파일 */
		$(document).ready(function(e){
			var $uploadResult = $(".uploadResult ul");
			
			$.getJSON("files", {bno: "${board.bno}"}, function(files){
				showUploadResult(files);
			});
			
			function showUploadResult(files){
				var str = "";
				$(files).each(function(i, file){
					var thumbFileName = encodeURIComponent(file.uploadPath + "/t_" + file.uuid + "_" + file.fileName);
					var fileName = encodeURIComponent(file.uploadPath + "/" + file.uuid + "_" + file.fileName);
					if(!file.fileType){
						str += "<li data-filename='" + file.fileName + "' data-uuid='" + file.uuid + "' data-uploadpath='" + file.uploadPath + "' data-filetype='" + file.fileType + "'>";
						str += "<div>";
						str += "<a href='/download?fileName=" + fileName +"'>"
						str += "<img src='/resources/images/attach.png' width='100'>";
						str += "</a>"
						str += "</div>";
						str += "<span>" + file.fileName + "</span>"
						str += "</li>";
						
					}else{
						str += "<li data-filename='" + file.fileName + "' data-uuid='" + file.uuid + "' data-uploadpath='" + file.uploadPath + "' data-filetype='" + file.fileType + "'>";
						str += "<div>";
						str += "<a href='/download?fileName=" + fileName +"'>"
						str += "<img src='/display?fileName=" + thumbFileName + "' width='100'>";
						str += "</a>"
						str += "</div>";
						str += "<span>" + file.fileName + "</span>"
						str += "</li>";
					}
				});
				$uploadResult.append(str);
			}
		});
		
		$("input[type='submit']").on("click", function(e){
		    e.preventDefault();
		    var fileDeletionPromises = [];
		    $(".uploadResult ul li").each(function(i, obj){
		        var fileName = $(obj).data("filename");
		        if(fileName) {
		            var encodedFileName = encodeURIComponent($(obj).data("filetype") ? $(obj).data("uploadpath") + "/t_" + $(obj).data("uuid") + "_" + fileName : 
		                $(obj).data("uploadpath") + "/" + $(obj).data("uuid") + "_" + fileName);
		            var deletionPromise = $.ajax({
		                url: "/deleteFile",
		                type: "post",
		                data: {fileName: encodedFileName, fileType: $(obj).data("filetype")}
		            });
		            fileDeletionPromises.push(deletionPromise);
		        }
		    });
		    $.when.apply($, fileDeletionPromises).done(function(){
		        document.deleteForm.submit();
		    }).fail(function(){
		        // 에러 처리 로직
		    });
		});

	</script>
</html>




















