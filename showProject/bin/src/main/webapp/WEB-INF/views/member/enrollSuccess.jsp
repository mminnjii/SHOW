<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입성공</title>
<style>
	.content{
		width: 100%;
		margin: auto;
	}
	.inner{
		width: 100%;
		margin: auto;
		padding-top: 15%;
		text-align: center;
	}

	#path{
        text-align: right;
        font-size: 12px;
    }

	/* 글자 관련 스타일 */
	#text1,#text2{
		font-weight: lighter;
		font-size: 80%;
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
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/member/enrollHeader.jsp"/>
	
	<div class="content">
		<br><br>
        <div id="path">
            <p>1.약관동의 - 2.정보입력 - <b>3.가입완료</b></p>
        </div>
		<div class="inner">
			<h2 id="title">TicketPal 회원가입</h2>
			<p id="text1">TicketPal 회원 가입에 성공했습니다</p>
			<p id="text2">더 많은 서비스를 이용해 보세요</p>
			<br>
			<button id="btn1">홈페이지로 이동</button>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/member/enrollFooter.jsp"/>
</body>
</html>