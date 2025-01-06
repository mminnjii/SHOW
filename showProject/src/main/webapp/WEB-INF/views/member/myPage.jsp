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

	/*쿠폰 모달*/
	#mtotal{
		width: 500px;
		height: 350px;
		
	}

	table td,th{
		height: 50px;
		border: 1px solid lightblue;
	}

	.modal-body{
		overflow: auto; 
	}

	/*링크관련*/
	.link{
		font-weight: bold;
	}
	.link:hover{
		cursor: pointer;
		text-decoration: underline;
	}
	.to{
		background-color: white;
		border: none;
		font-weight: lighter;
	}

	.to:hover{
		text-decoration: underline;
	}

	.to:focus{
        border: none;
        outline: none;
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
								<c:choose>
									<c:when test="${loginUser.changeName == null}">
										<img src="${contextPath }/resources/profile/noimg.png" id="profile">
									</c:when>
									<c:otherwise>
										<img src="${contextPath }/resources/profile/${loginUser.changeName}" id="profile">
									</c:otherwise>
								</c:choose>
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
						<table style="border: 1px solid rgb(234, 234, 234);">
							<tr>
								<td>
									&nbsp;&nbsp;&nbsp;<b>포인트</b> <br>
									&nbsp;&nbsp;&nbsp;<span id="c1">${loginUser.point}</span> p
								</td>
								<td>
									&nbsp;&nbsp;&nbsp;<a class="link" data-toggle="modal" data-target="#modal1">쿠폰</a><br>
									&nbsp;&nbsp;&nbsp;<span id="c2"></span> 장
								</td>
								<td>
									<form action="${contextPath}/review" method="get">
										<input type="hidden" name="userNo" value="${loginUser.userNo}">
										&nbsp;&nbsp;&nbsp;<button class="to">후기 작성</button> <br>
										&nbsp;&nbsp;&nbsp;<span id="c3"></span> 건
									</form>
								</td>
								<td>
									<form action="${contextPath}/show" method="get">
										<input type="hidden" name="userNo" value="${loginUser.userNo}">
									&nbsp;&nbsp;&nbsp;<button class="to">내 공연</button><br>
									&nbsp;&nbsp;&nbsp;<span id="c4"></span> 개
									</form>
								</td>
							</tr>
						</table>
					</div>
				</div>
            </div>
		</div>
	</div>
	
	 <div class="modal fade" id="modal1" >
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content"id="mtotal">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">내 쿠폰</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                   <table id="coupon-table">
                   </table>
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

		$(function(){
			showCount();
			couponCount();
			reviewCount();
			couponList();
		});

		function couponCount(){
			$.ajax({
				url: "couponCount",
				data : {
					userNo : "${loginUser.userNo}"
				},
				success : function(cno){
					$("#c2").text(cno);
				},
				error : function(){
					console.log("error2");
				}
			});
		}

		function reviewCount(){
			$.ajax({
				url: "reviewCount",
				data : {
					userNo : "${loginUser.userNo}"
				},
				success : function(rno){
					$("#c3").text(rno);
				},
				error : function(){
					console.log("error3");
				}
			});
		}

		
		function showCount(){
			$.ajax({
				url: "showCount",
				data : {
					userNo : "${loginUser.userNo}"
				},
				success : function(sno){
					$("#c4").text(sno);
				},
				error : function(){
					console.log("error4");
				}
			});
		}

		function couponList(){
			$.ajax({
				url : "couponList",
				data : {
					userNo : "${loginUser.userNo}"
				},
				success : function(list){
					var co = "";
					console.log(list);
					for(var i=0;i<list.length;i++){
						co += "<tr>"
							+ "<td width='50px' align='center' style='background-color: rgb(217, 245, 255);'>"
							+ "<svg xmlns='http://www.w3.org/2000/svg' width='25' height='25' fill='currentColor' class='bi bi-ticket-perforated' viewBox='0 0 16 16'>"
							+ "<path d='M4 4.85v.9h1v-.9zm7 0v.9h1v-.9zm-7 1.8v.9h1v-.9zm7 0v.9h1v-.9zm-7 1.8v.9h1v-.9zm7 0v.9h1v-.9zm-7 1.8v.9h1v-.9zm7 0v.9h1v-.9z'/>"
							+ "<path d='M1.5 3A1.5 1.5 0 0 0 0 4.5V6a.5.5 0 0 0 .5.5 1.5 1.5 0 1 1 0 3 .5.5 0 0 0-.5.5v1.5A1.5 1.5 0 0 0 1.5 13h13a1.5 1.5 0 0 0 1.5-1.5V10a.5.5 0 0 0-.5-.5 1.5 1.5 0 0 1 0-3A.5.5 0 0 0 16 6V4.5A1.5 1.5 0 0 0 14.5 3zM1 4.5a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 .5.5v1.05a2.5 2.5 0 0 0 0 4.9v1.05a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-1.05a2.5 2.5 0 0 0 0-4.9z'/>"
							+ "</svg>"
							+ "</td>"
							+ "<th width='300px'>"
							+ "&nbsp; "+list[i].genreNo+" "+list[i].couponName+"("+(list[i].discount*100)+"%)"
							+ "</th>"
							+ "<td width='150px' style='font-size : 12px;'>"
							+ "&nbsp 기한 : "+list[i].expiredDate
							+ "</td>"
							+ "</tr>"
							+ "<tr height='10px'></tr>"
					}
					$("#coupon-table").html(co);
				},
				error : function(){
					console.log("error");
				}
			});
		}
	</script>
	

    <br><br><br>
	<jsp:include page="/WEB-INF/views/member/enrollFooter.jsp"/>
</body>
</html>