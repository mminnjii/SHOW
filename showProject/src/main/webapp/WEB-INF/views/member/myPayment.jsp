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

	/*qna body*/
	#pay-body{
		width: 90%;
		height: 80%;
		margin: auto;
	}

	#payList{
		text-align: center;
	}
	/* #payList>tbody>tr:hover{
		cursor: pointer;
		background-color: white;
	} */

	#pagingArea{
		width: fit-content;
		margin: auto;
	}
	
	#sub>td{
		background-color: light-blue;
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
					<h5>결제 목록</h5>
					<br>
					<div id="pay-body">
						<br>
						<table id="payList" class="table table-hover" align="center">
							<thead>
								<tr>
									<th width="100px">결제번호</th>
									<th>결제내용</th>
									<th width="100px">결제방식</th>
									<th width="100px">결제금액</th>
									<th>결제일</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty plist }">
										<c:choose>
											<c:when test="${loginUser.subscribe == 'Y' }">
												<tr id="sub">
													<td>0</td>
													<td>멤버십 구독</td>
													<td>/</td>
													<td>9,900 원</td>
													<td>매월 10일</td>
												</tr>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="5">조회된 결제 목록이 없습니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:if test="${loginUser.subscribe == 'Y' }">
											<tr id="sub">
												<td>0</td>
												<td>멤버십 구독</td>
												<td>/</td>
												<td>9,900 원</td>
												<td>매월 10일</td>
											</tr>
										</c:if>
										<c:forEach var="p" items="${plist }">
											<tr>
												<td>${p.paymentId}</td>
												<c:forEach var="s" items="${p.r}">
													<td>${s.showName}</td>
												</c:forEach>
												<c:if test="${p.paymentMethod == 1}">
													<td>카드</td>
												</c:if>
												<c:if test="${p.paymentMethod == 2}">
													<td>무통장 입금</td>
												</c:if>
												<td>${p.price} 원</td>
												<td>${p.paymentDate}</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<br>

						<div id="pagingArea" align="center">
							<ul class="pagination">
								<c:if test="${pi.currentPage != 1 }">
									<li class="page-item"><a class="page-link" href="pay?userNo=${loginUser.userNo}&currentPage=${pi.currentPage-1}">이전</a></li>
								</c:if>
								
								<c:forEach var="i" begin="${pi.startPage }" end="${pi.endPage }">
									<c:url var="payment" value="payment">
										<c:param name="userNo" value="${loginUser.userNo }"/>
										<c:param name="currentPage" value="${i }"/>
									</c:url>
									<li class="page-item">
										<a class="page-link" href="${payment }">${i}</a>
									</li>
								</c:forEach>
								
								<c:if test="${pi.currentPage != pi.maxPage }">
									<c:choose>
										<c:when test="${empty plist }">
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="pay?userNo=${loginUser.userNo}&currentPage=${pi.currentPage+1}">다음</a></li>
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