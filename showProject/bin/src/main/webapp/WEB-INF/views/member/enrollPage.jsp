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

	/* 글자 관련 스타일 */
	#text1{
		font-weight: lighter;
		font-size: 80%;
	}
	#text2{
		font-weight: lighter;
		font-size: 70%;
	}

	/* 버튼 */
	#btn1{
		background-color: #597C9B;
		border-radius: 8px;
		border: none;
		width: 300px;
		height: 40px;

		color: white;
		font-weight: bold;
		font-size: 16px;		
	}

	
	#btn2{
		background-color:  #2DB400;
		border-radius: 8px;
		border:none;
		color: white;
		font-weight: bold;
		font-size: 16px;
		font-family: 'NanumGothicExtraBold';
		padding-top: 7px;

		width: 300px;
		height: 40px;
	}

	lo{
		font-size: 90%;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/member/enrollHeader.jsp"/>
	
	<div class="content">
		<br><br>
		<div class="inner">
			<h2 id="title">TicketPal 회원가입</h2>
			<p id="text1">TicketPal에 가입하고 다양한 서비스를 경험해보세요</p>
			<br>
			<button id="btn1" onclick="toEnroll();">개인 회원가입</button>
			<br><br><br>
			<button id="btn2">N <lo>네이버로 회원가입</lo></button>
			<br>
			<p id="text2">SNS계정 회원가입(만 14세 이상 가능)</p>
		</div>
	</div>
	<script>
		function toEnroll(){
			location.href = '${contextPath}/toTOS';
		};
	</script>
	
	<jsp:include page="/WEB-INF/views/member/enrollFooter.jsp"/>
</body>
</html>