<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>

	.info{
		margin-left: 150px;
	}
	

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
		<%@include file="/WEB-INF/views/show/showInfo/detail.jsp" %>
	
		<br><br>
		<div class="info">
	        <!-- 아래 일반 본문 -->
	        <h2>공연상세 / 정보</h2>
	        <p>여기에 긴 내용을 작성하면 스크롤을 할 수 있습니다.</p>
	        <img src="https://ticketimage.interpark.com/240145112024/10/08/dcf9f4a0.jpg" alt="예제 이미지">
	        <p style="margin-top: 1000px;">끝부분에 도달했습니다.</p>
        </div>
        
       	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>