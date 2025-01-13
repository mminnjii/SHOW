<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/menubar.jsp" %>
    
    <br>
    <div align="center">
        <img src="https://cdn2.iconfinder.com/data/icons/oops-404-error/64/208_balloon-bubble-chat-conversation-sorry-speech-256.png">
        <br><br>
        <h1 style="font-weight:bold;"></h1>
    </div>
    <br>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
    <script>
		$(function(){
			var msg = "${errorMsg}";
			
			if(msg != ""){
				alert(msg);
				<c:remove var="errorMsg"/>
			}
		});
	</script>
	
	
</body>
</html>