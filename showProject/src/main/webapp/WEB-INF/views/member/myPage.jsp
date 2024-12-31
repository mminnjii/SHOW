<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css" rel="stylesheet">
<style>
	div{
		border: 1px solid white;
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
		width: 70%;
		height: 100%;
		background-color: rgb(246, 246, 246);
	}

	/* 내 정보1 */
	#my-profile{
		height: 50%;
		width: 100%;
	}

	#my-list{
		height: 50%; 
		width: 100%;
	}

	#my-info{
		height: 100px;
		width: 450px;
		margin:auto;
		margin-top: 12%;

		border-radius: 12px;
		background-color: white;
	}

	#my-info>div{
		float: left;
	}
	
	#my-img{
		width: 80px;
		height: 80px;
		margin: 6px 15px;
		overflow: hidden;
		border-radius: 40px;
	}

	#profile{
		width:100%;
		height:100%;
		object-fit: cover;
	}

	#my-info-detail{
		margin: 35px 20px;
		width: 250px;
		text-align: left;
	}

	/* 내 정보2 */
	#my-list>table{
		height: 50%;
		width: 80%;
		margin: auto;
		margin-top: 3%;

		text-align: left;

		background-color: white;
	}

	#my-list td{
		border: 1px solid lightgray;
		width: 25%;
	}

	#my-list a{
		color: black;
	}

	#b1{
		color: white;
		text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
	}

	#b2{
		color: blue;
	}

	#b3{
		color: red;
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
					<div id="my-profile">
						<div id="my-info">
							<div id="my-img" style="border: 2px solid black;">
								<img src="${contextPath }/resources/profile/${loginUser.changeName}" id="profile">
							</div>
							<div id="my-info-detail">
								${loginUser.userName} 회원님 &nbsp;&nbsp;
								<c:choose>
									<c:when test="${loginUser.rank == 'WHITE'}">
										<b id="b1">${loginUser.rank}</b>
									</c:when>
									<c:when test="${loginUser.rank == 'BLUE'}">
										<b id="b2">${loginUser.rank}</b>
									</c:when>
									<c:when test="${loginUser.rank == 'RED'}">
										<b id="b3">${loginUser.rank}</b>
									</c:when>
									<c:otherwise>
										<b id="b4">${loginUser.rank}</b>
									</c:otherwise>
								</c:choose>
								등급
							</div>
						</div>
					</div>
					<div id="my-list">
						<table style="border: 1px solid lightgray;">
							<tr>
								<td>
									&nbsp;&nbsp;&nbsp;포인트 <br>
									&nbsp;&nbsp;&nbsp;1000 p
								</td>
								<td>
									&nbsp;&nbsp;&nbsp;<a href="">쿠폰</a><br>
									&nbsp;&nbsp;&nbsp;10 장
								</td>
								<td>
									&nbsp;&nbsp;&nbsp;<a href="">후기 작성</a> <br>
									&nbsp;&nbsp;&nbsp;5 건
								</td>
								<td>
									&nbsp;&nbsp;&nbsp;<a href="">내 공연</a><br>
									&nbsp;&nbsp;&nbsp;7 개
								</td>
							</tr>
						</table>
					</div>
				</div>
            </div>
		</div>
	</div>

	<script>
		// 스크롤 위치 저장
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