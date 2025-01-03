<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예매확인/취소</title>
<script src="https://kit.fontawesome.com/3a115195d8.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>


.outer2 {
	width: 100%; /* 100%로 설정하여 부모 div에 맞게 꽉 채움 */
	flex-grow: 1; /* 부모 요소의 높이에 맞게 자식 요소의 높이를 늘림 */
	text-align: left;
	padding: 10px;
	box-sizing: border-box;
	margin: 30px 20px 0px 20px;
}

.outer2 span {
	margin-left: 15px;
}

.a {
	text-align: left;
	width: 60%;
	margin: 0px auto;
	background-color: white;
	padding: 20px;
	border: 1px solid lightgray;
   	border-radius: 0px 0px  10px 10px;
	border-top : none;
}

.a h1 {
	text-align: center;
}

#pay-body{
	overflow: auto; 
}

/* display: inline-block; /* 버튼 스타일 */
</style>

</head>
<body>

	<%@include file="/WEB-INF/views/common/menubar.jsp"%>

	<div class="a">
		<h3>예약 확인/취소 페이지</h3>

		<div class="outer2 faqP">
			<br>
				<div id="pay-body">
				<br>
				<table id="payList" class="table table-hover" align="center">
					<thead>
						<tr>
							<th width="200px">포스터</th>
							<th width="300px">공연 제목</th>
							<th >가격</th>
							<th width="100px">예약일</th>
							<th>예약취소</th>
						</tr>
					</thead>
					<tbody>
					<c:choose>
							<c:when test="${empty rlist }">
								<tr>
									<td colspan="5">조회된 예약 목록이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="r" items="${rlist }">
									<tr>
										<td height="250px" width="100px">
											<img src="${contextPath}/resources/PosterUploadFiles/${r.genreName}_${r.regionName}_${r.showName}">
										</td>
										<td width="300px">${r.showName}</td>
										<td>${r.price}원</td>
										<td width="100px">${r.createDate}</td>
										<td>
											<button class="btn btn-danger">취소</button>
										</td>
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
							<li class="page-item"><a class="page-link" href="reserve?userNo=${loginUser.userNo}&currentPage=${pi.currentPage-1}">이전</a></li>
						</c:if>
								
						<c:forEach var="i" begin="${pi.startPage }" end="${pi.endPage }">
							<c:url var="reserve" value="reserve">
								<c:param name="userNo" value="${loginUser.userNo }"/>
								<c:param name="currentPage" value="${i }"/>
							</c:url>
							<li class="page-item">
								<a class="page-link" href="${reserve }">${i}</a>
							</li>
						</c:forEach>
								
						<c:if test="${pi.currentPage != pi.maxPage }">
							<c:choose>
								<c:when test="${empty rlist }">
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="reserve?userNo=${loginUser.userNo}&currentPage=${pi.currentPage+1}">다음</a></li>
								</c:otherwise>
							</c:choose>
						</c:if>
					</ul>
				</div>
				<br clear="both"><br>
			</div>

		</div>


		
		
		<br>
		<br>
	</div>


	<script>
	
	    
	</script>

<br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />


</body>
</html>