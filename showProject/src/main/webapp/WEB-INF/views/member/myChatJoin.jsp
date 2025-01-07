<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.show.customer.model.vo.Question" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	/*chat body*/
	#chat-body{
		width: 80%;
		height: 80%;
		margin: auto;
	}

	#chatList{
		text-align: center;
	}
	#chatList>tbody>tr:hover{
		cursor: pointer;
		background-color: white;
	}

	#pagingArea{
		width: fit-content;
		margin: auto;
	}

	#btn-area{
		width: 80%;
		text-align: left;
	}

	#switch{
		width: 120px;
		height: 40px;
		background-color: #597c9b;
		border: none;
		border-radius: 10px;
		color: white;

	}


	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/member/enrollHeader.jsp"/>
	
	<div class="content">
		<br><br>
		<div class="inner">
			<input type="hidden" name="userNo" value="${loginUser.userNo}">
			<h3><a href="${contextPath}/myPage" style="text-decoration: none; color: black;">마이페이지</a></h3>
            <br><br>
            <div id="mypage">
				<div id="mypage-side">
					<%@ include file="/WEB-INF/views/member/myPageSide.jsp" %>
				</div>
				<div id="mypage-body">
					<br>
					<h5>가입한 채팅방</h5>
					<br>
					<div id="chat-body">
						<div id="btn-area">
							<button id="switch">내 채팅방</button>
						</div>
						<br>
						<table id="chatList" class="table table-hover" align="center">
							<thead>
								<tr>
									<th>번호</th>
									<th>호스트 ID</th>
									<th>채팅방 이름</th>
									<th>인원 수</th>
									<th>생성일</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty clist }">
										<tr>
											<td colspan="5">조회된 채팅방이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="c" items="${clist }">
											<tr id="c-main">
												<td>${c.chatNo}</td>
												<td>${c.userId}</td>
												<td>${c.chatTitle}</td>
												<td>${c.chatUserCount}</td>
												<td>${c.createDate}</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<br>
						<script>
            	
							$("#chatList #c-main").click(function(){
								var chatNo = $(this).children().first().text();
								var userId = $(this).children().first().next().text();

								location.href = "${contextPath}/chat/chatting?chatNo="+chatNo+"&userId="+userId;
							});
							
						</script>
						<div id="pagingArea" align="center">
							<ul class="pagination">
								<c:if test="${pi.currentPage != 1 }">
									<li class="page-item"><a class="page-link" href="chat?userNo=${loginUser.userNo}&currentPage=${pi.currentPage-1}">이전</a></li>
								</c:if>
								
								<c:forEach var="i" begin="${pi.startPage }" end="${pi.endPage }">
									<c:url var="chat" value="chat">
										<c:param name="userNo" value="${loginUser.userNo }"/>
										<c:param name="currentPage" value="${i }"/>
									</c:url>
									<li class="page-item">
										<a class="page-link" href="${chat }">${i}</a>
									</li>
								</c:forEach>
								
								<c:if test="${pi.currentPage != pi.maxPage }">
									<c:choose>
										<c:when test="${empty clist }">
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="chat?userNo=${loginUser.userNo}&currentPage=${pi.currentPage+1}">다음</a></li>
										</c:otherwise>
									</c:choose>
								</c:if>
							</ul>
						</div>
						<br clear="both"><br>
					</div>
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