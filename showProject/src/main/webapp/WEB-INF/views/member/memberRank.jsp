<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css" rel="stylesheet">
<style>
	div{
		border: 1px solid none;
		box-sizing: border-box;
	}
	.content{
		width: 80%;
		margin: auto;
	}
	.inner{
		width: 100%;
		margin: auto;
		padding-top: 5%;
		text-align: center;
	}

	#mypage{
		width: 100%;
		height: 500px;
		margin: auto;
	}

	#mypage>div{
		float: left;
	}
 
	#mypage-side{
		width: 30%;
		height: 450px;
	}

	#mypage-body{
		margin: auto;
		width: 70%;
		height: 100%;
		background-color: rgb(246, 246, 246);
	}

	#rank-body{
		margin: auto;
		padding-left: 130px;
		width: 80%;
		height: 120px;
	}

	#rank-body>div{
		float: left;
		width: 25%;
	}

	table{
		margin: auto;
		width: 90%;
	}

	table td,th{
		width: 300px;
		height: 50px;
		text-align: center;
		border: 1px solid rgb(110, 110, 110);
	}

	table th{
		background-color: white;
	}

	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/member/enrollHeader.jsp"/>
	
	<div class="content">
		<br><br>
		<div class="inner">
			<h3><a href="${contextPath}/myPage" style="text-decoration: none; color: black;">마이페이지</a></h3>
            <br><br>
            <div id="mypage">
				<div id="mypage-side">
					<%@ include file="/WEB-INF/views/member/myPageSide.jsp" %>
				</div>
				<div id="mypage-body">
					<br>
					<h5>등급 별 혜택</h5>
					<br>
					<div id="rank-body">
						<div style="height: 60px; margin-top: 60px; background-color: white;">
							WHITE
						</div>
						<div style="height: 80px; margin-top: 40px; background-color: rgb(55, 55, 255); color: white;">
							BLUE <br><br>
							<p style="font-size: 13px;">주문금액 10만원 이상</p>
						</div>
						<div style="height: 100px; margin-top: 20px; background-color: rgb(255, 78, 78); color: white;">
							RED<br><br>
							<p style="font-size: 13px;">주문금액 30만원 이상</p>
						</div>
						<div style="height: 120px; background-color: black; color: white;">
							BLACK<br><br>
							<p style="font-size: 13px;">주문금액 50만원 이상</p>
						</div>
					</div>
					<br>
					<table>
						<thead>
							<tr>
								<th>등급</th>
								<td>WHITE</td>
								<td>BLUE</td>
								<td>RED</td>
								<td>BLACK</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>
									pal-point <br>
									추가 적립
								</th>
								<td>/</td>
								<td>1.0% 적립</td>
								<td>3.0% 적립</td>
								<td>5.0% 적립</td>
							</tr>
							<tr>
								<th>쿠폰</th>
								<td>1000원권</td>
								<td>5000원권</td>
								<td>10000원권</td>
								<td>20000원권</td>
							</tr>
							<tr>
								<th>지급 기간</th>
								<td>매월</td>
								<td>매월</td>
								<td>매월</td>
								<td>매월</td>
							</tr>
							<tr>
								<th>시사회</th>
								<td>/</td>
								<td>/</td>
								<td>일반석</td>
								<td>VIP석</td>
							</tr>
						</tbody>
					</table>
				</div>
            </div>
		</div>
	</div>

	<script>
		window.addEventListener('beforeunload', function () {
       	 localStorage.setItem('scrollPosition', window.scrollY);
    	});

    	// 스크롤 위치 복원
    	window.addEventListener('load', function () {
        const scrollPosition = localStorage.getItem('scrollPosition');
        	if (scrollPosition) {
           	 window.scrollTo(0, parseInt(scrollPosition, 10));
       	 }
    	});
	</script>
	

    <br><br><br>
	<jsp:include page="/WEB-INF/views/member/enrollFooter.jsp"/>
</body>
</html>