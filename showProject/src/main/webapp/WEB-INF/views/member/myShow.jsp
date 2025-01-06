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

	/*show body*/
	#show-body{
		width: 80%;
		height: 80%;
		margin: auto;
	}

	#showList{
		text-align: center;
	}
	#showList>tbody>tr:hover{
		cursor: pointer;
		background-color: white;
	}

	#pagingArea{
		width: fit-content;
		margin: auto;
	}

	#back{
		padding-left: 10%;
	}
	/*뒤로가기*/
	svg:hover{
		cursor: pointer;
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
					<h5>나의 공연</h5>
					<br>
					<div id="back" align="left">
						<a href="${contextPath}/myPage">
							<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" id="arrow" class="bi bi-arrow-left-circle-fill" viewBox="0 0 16 16" >
								<path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0m3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z"/>
							</svg>
						</a>
					</div>
					<div style="height: 5px;"></div>
					<div id="show-body">
						<table id="showList" class="table table-hover" align="center">
							<thead>
								<tr>
									<th>공연번호</th>
									<th>공연이름</th>
									<th>가격</th>
									<th>시작날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty slist }">
										<tr>
											<td colspan="4">조회된 공연이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="s" items="${slist }">
											<tr id="one">
												<td>${s.showNo}</td>
												<td>${s.showName}</td>
												<c:forEach var="w" items="${s.showList }">
													<td>${w.price}</td>
													<td>${w.showStart}</td>
												</c:forEach>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<br>
						<script>
            	
							$("#showList #one").click(function(){
								var sno = $(this).children().first().text();
								
								//location.href = "detail?sno="+sno;
							});
							
						</script>
						<div id="pagingArea" align="center">
							<ul class="pagination">
								<c:if test="${pi.currentPage != 1 }">
									<li class="page-item"><a class="page-link" href="show?userNo=${loginUser.userNo}&currentPage=${pi.currentPage-1}">이전</a></li>
								</c:if>
								
								<c:forEach var="i" begin="${pi.startPage }" end="${pi.endPage }">
									<c:url var="show" value="show">
										<c:param name="userNo" value="${loginUser.userNo }"/>
										<c:param name="currentPage" value="${i }"/>
									</c:url>
									<li class="page-item">
										<a class="page-link" href="${show }">${i}</a>
									</li>
								</c:forEach>
								
								<c:if test="${pi.currentPage != pi.maxPage }">
									<c:choose>
										<c:when test="${empty slist }">
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="show?userNo=${loginUser.userNo}&currentPage=${pi.currentPage+1}">다음</a></li>
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