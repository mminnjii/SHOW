<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css" rel="stylesheet">
<style>
	.content{
		width: 100%;
		margin: auto;
	}
	.inner{
		width: 100%;
		margin: auto;
		padding-top: 5%;
		text-align: center;
	}

	#toHome{
		background-color: #597C9B;
		border-radius: 8px;
		border: none;
		width: 300px;
		height: 40px;

		color: white;
		font-weight: bold;
		font-size: 16px;
	}

	#headLogo{
		width: 160px;
		height: 100px;
	}


</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/member/enrollHeader.jsp"/>
	
	<div class="content">
		<div class="inner">
			<a id="title" href="${contextPath}">
				<img src="${contextPath}\resources\images\로고.jpg" id="headLogo">
			</a>
			<br>
			<h1>회원 탈퇴 성공!</h1>
			<br>
			<p>지금까지 저희 서비스를 이용해주셔서 감사합니다.</p>
			<br><br><br>
			<button id="toHome" onclick="toHome();">홈페이지로</button>
		</div>
	</div>
	<script>
		function toHome(){
			location.href = '${contextPath}';
		};
	</script>
	<br><br><br><br>
	<jsp:include page="/WEB-INF/views/member/enrollFooter.jsp"/>
</body>
</html>