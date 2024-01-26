<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${string }
<input type="button" value="창 닫기" onClick='window.close();'/>
<script>
var dup = opener.document.getElementById('duplicate'); // 생성한 부모 창에 데이터를 전달하기 위해서 부모 창의 input 태그에 결과 데이터를 삽입 
dup.value = '${result}';
</script>
</body>
</html>