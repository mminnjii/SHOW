<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<% String msg = (String)session.getAttribute("alertMsg"); %>
<head>
    
</head>
<body>
	<script>
	    var msg = "${alertMsg}";
	    if (msg != null && msg != "") {
	        alert(msg);
	        <% session.removeAttribute("alertMsg"); %>
	    }
	</script>

	<h3>일단 임시용 매니저 로그인 페이지</h3>
	<form action="${contextPath}/managerLogin" method="post">
		아이디 : <input type="text" name="managerId"> <br>
		비밀번호 : <input type="password" name="managerPw"> <br>
		<button type="submit">로그인</button>
	</form> 
</body>
</html>