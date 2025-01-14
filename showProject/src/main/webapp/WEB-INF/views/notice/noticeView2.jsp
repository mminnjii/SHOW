<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
	<title>공지사항</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<style>
		#boardList {
			text-align: center;
		}
		
		#boardList>tbody>tr:hover {
			cursor: pointer;
		}
		
		#pagingArea {
			width: fit-content;
			margin: auto;
		}
		
		.select {
			width: 20%;
		}
		
		.text {
			width: 53%;
		}
		
		.searchBtn {
			width: 20%;
			background-color: #597c9b;
		}
		
		.a {
			text-align: left;
			width: 70%;
			margin: 0px auto;
			background-color: white;
			padding: 3% 5%;
			border: 1px solid lightgray;
			border-radius: 0px 0px 10px 10px;
			border-top: none;
		}
		
		#noticeList tbody>tr:hover {
			background-color: lightgray; /*#597c9b*/
		}
		
		#noticeList {
			text-align: center;
		}
		
		.noBtn {
			border: 1px solid lightgray;
			background-color: white;
			display: inline-block;
			padding: 5px 20px;
			color: black;
		}
		
		.pageBtn {
			border: 1px solid lightgray;
			background-color: white;
			padding: 5px 10px;
			border-radius: 8px;
		}
		
		.btnForm {
			display: flex;
			justify-content: space-between; /* 좌우 정렬 */
			margin-bottom: 20px;
		}
		
		.btnGroup {
			width: 20%;
			margin: 5px;
		}
		
		#searchForm {
			width: 40%;
		}
		
		#searchForm>* {
			float: left;
			margin: 5px;
		}
		
		#OpenSearchForm {
			width: 40%;
		}
		
		#OpenSearchForm>* {
			float: left;
			margin: 5px;
		}
		
		/* 상세보기 style */
		.divClass {
			border-bottom: 1px solid lightgrey;
			padding: 15px 20px;
		}
		
		.title {
			border-top: 2px solid lightgrey;
			font-weight: bold;
		}
		
		.dateCount {
			font-size: 12px;
			color: gray;
			font-weight: bold;
			padding: 5px 20px;
		}
		
		.noticeBtn {
			margin: 10px;
			background-color: white;
			border: 1px solid lightgrey;
			padding: 7px 12px;
			border-radius: 5px;
			float: right;
		}
		
		.noticeBtn:hover {
			margin: 10px;
			background-color: #597c9b;
			color: white;
			border: 1px solid #597c9b;
			padding: 7px 12px;
			border-radius: 5px;
			cursor: pointer;
			float: right;
		}
		
		#noticeTbody td:hover {
			cursor: pointer;
		}
		
		/* 테이블 ?*/
		.pp {
			margin: auto;
			width: 100%;
		}
		
		#tr1 {
			height: 20px;
		}
		
		#result {
			font-family: "Noto Sans KR", sans-serif;
			font-size: 20px;
			font-weight: 600;
			font-style: normal;
			color: black;
		}
		
		#result1 {
			background-color: white;
			font-family: "Noto Sans KR", sans-serif;
			font-size: 25px;
			font-weight: 600;
			font-style: normal;
			color: black;
			text-align: center;
		}
		
		#resultPoster2 {
			width: 300px;
			height: 390px;
			position: relative;
			top: 3px;
		}
		
		#reName {
			display: inline-block;
			position: relative;
		}
		
		#rePlace {
			display: inline-block;
			position: relative;
			font-size: 15px;
			color: rgb(156, 154, 154);
		}
		
		#reNotice {
			display: inline-block;
			position: relative;
			font-size: 15px;
			color: rgb(156, 154, 154);
		}
		
		#reDate {
			display: inline-block;
			position: relative;
			font-size: 15px;
			color: rgb(156, 154, 154);
		}
		
		#td55 {
			width: 300px;
			height: 400px;
		}
	</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/menubar2.jsp"%>
	<div class="a">
		<h2 align="center">공지사항</h2>
		<br>
		<br>
		<div class="btnForm">
			<div class="btnGroup">
				<a id="general" class="noBtn" href="${contextPath}/notice/list?noticeType=general">일반 공지</a> 
				<a id="open" class="noBtn" href="${contextPath}/notice/list?noticeType=open">오픈 공지</a>
			</div>

			<br>

			<!-- 일반공지, 오픈공지별 검색 기능 구현 -->
			<form id="searchForm" action="${contextPath}/notice/search"
				method="get">
				 <input type="hidden" name="noticeType" value="general">
				<div class="select">
					<select class="custom-select" name="condition">
						<option value="all">전체</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
				</div>
				<div class="text">
					<!-- 검색 후에 검색한 키워드값 보여주기 -->
					<input type="text" class="form-control" name="keyword"
						value="${map.keyword}">
				</div>
				<button type="submit" class="searchBtn btn btn-secondary">검색</button>
			</form>

			<!-- 오픈공지 -->
			<form id="OpenSearchForm" action="${contextPath}/notice/search"
				method="get">
 				<input type="hidden" name="noticeType" value="open">
				<div class="select">
					<select class="custom-select" name="condition">
						<option value="all">전체</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
				</div>
				<div class="text">
					<!-- 검색 후에 검색한 키워드값 보여주기 -->
					<input type="text" class="form-control" name="keyword"
						value="${map.keyword}">
				</div>
				<button type="submit" class="searchBtn btn btn-secondary">검색</button>
			</form>
		</div>


		<div id="noticeDiv">
			<table id="noticeList" class="table" align="center">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성 날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody id="noticeTbody">
					<!-- noticeList가 있으면 일반공지, openNoticeList가 있으면 오픈공지-->
					<c:choose>
						<c:when test="${not empty noticeList}">
							<c:forEach var="list" items="${noticeList}">
								<tr>
									<td>${list.noticeNo}</td>
									<td style="text-align: left;">${list.noticeTitle}</td>
									<td>${list.createDate}</td>
									<td>${list.count}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:when test="${not empty openNoticeList}">
							<c:forEach var="openlist" items="${openNoticeList}">
								<tr>
									<td>${openlist.openNo}</td>
									<td style="text-align: left;">${openlist.showName}</td>
									<td>${openlist.createDate}</td>
									<td>${openlist.count}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td id="noting" style="text-align: center;" colspan="4">공지사항
									내역이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>

			<br>

			<!-- 페이지네이션 -->
			<%-- 일반공지/오픈공지 페이징처리 --%>
			<div id="pagingArea">
				<c:choose>
					<%-- 이전버튼 --%>
					<c:when test="${pi.currentPage == 1}">
						<button class="pageBtn" disabled>이전</button>
					</c:when>
					<c:otherwise>
						<button class="pageBtn"
							onclick="location.href=location.href='${contextPath}/notice/list?currentPage=${pi.currentPage - 1}&noticeType=${noticeType}'">이전</button>
					</c:otherwise>
				</c:choose>

				<c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
					<c:choose>
						<c:when test="${empty map}">
							<%-- 검색이 아니면 --%>
							<c:choose>
								<c:when test="${i != pi.currentPage}">
									<button class="pageBtn"
										onclick="location.href='${contextPath}/notice/list?currentPage=${i}&noticeType=${noticeType}'">${i}</button>
								</c:when>
								<c:otherwise>
									<button class="pageBtn" disabled>${i}</button>
								</c:otherwise>
							</c:choose>
						</c:when>

						<c:otherwise>
							<%--검색이라면 --%>
							<c:url var="searchUrl" value="/notice/search">
								<c:param name="noticeType" value="${noticeType}" />
								<c:param name="currentPage" value="${i}" />
								<c:param name="condition" value="${map.condition}" />
								<c:param name="keyword" value="${map.keyword}" />
							</c:url>
							<c:choose>
								<c:when test="${i != pi.currentPage}">
									<button class="pageBtn" onclick="location.href='${searchUrl}'">${i}</button>
								</c:when>
								<c:otherwise>
									<button class="pageBtn" disabled>${i}</button>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<%-- 다음버튼 --%>
					<c:when test="${pi.currentPage == pi.maxPage}">
						<button class="pageBtn" disabled>다음</button>
					</c:when>
					<c:otherwise>
						<button class="pageBtn"
							onclick="location.href='${contextPath}/notice/list?currentPage=${pi.currentPage + 1}&noticeType=${noticeType}'">다음</button>
					</c:otherwise>
				</c:choose>

			</div>
		</div>

	</div>

	<script>
		// 리스트를 불러올 때 noticeType을 같이 전달하여 버튼 선택될 수 있도록 한다. 
		// 검색시 새로고침(재랜더링) 되기 때문에 어떤 form을 보여주고 가려야 되는지도 처리해야 한다.
		// noticeType에 따라 검색 form 보여주기 
		var noticeType = "general";
		noticeType2 = "${noticeType}";

		if (noticeType2 == "general") {
			$("#general").css("background-color", "#597c9b").css("color","white").css("border", "1px solid #597c9b");
			$("#OpenSearchForm").hide();
			$("#searchForm").show();
		} else if (noticeType2 == "open") {
			$("#open").css("background-color", "#597c9b").css("color", "white").css("border", "1px solid #597c9b");
			$("#searchForm").hide();
			$("#OpenSearchForm").show();
		}

		// $("#OpenSearchForm").hide();

		// value 값에 따라 
		var noticeType = "general";
		noticeType = "${noticeType}";

		$(".noBtn").on("click", function() {
			noticeType = $(this).val(); // 클릭한 버튼의 value 값 가져오기
			console.log(noticeType);
		});

		// 일반공지 클릭시 해당 글을 상세보기 할 수 있는 함수 작성 
		$("#noticeList>tbody").on("click", "tr", function() {
			var nno = $(this).children().first().text();
			console.log(noticeType);

			if (noticeType == "general") {
				// 클릭되어 있는 버튼의 value 값에 따라 이동 처리 
				$.ajax({
					url : 'detail',
					type : "POST",
					data : {
						nno : nno
					},
					success : function(noticeDetail) {
						var nStr = "";
						nStr += '<div class="divClass title">'
								+ noticeDetail.noticeTitle
								+ "</div>"
								+ '<div class="divClass dateCount">등록일 : '
								+ noticeDetail.createDate
								+ " | 조회수 :"
								+ noticeDetail.count
								+ "</div>"
								+ '<div class="divClass">'
								+ noticeDetail.noticeContent
								+ "</div>"
								+ '<button class="noticeBtn" onclick="location.href=\'' + '${contextPath}' + '/notice/list\'">목록이동</button><br>';

						$(".btnForm").empty();
						$("#noticeDiv").html(nStr);

					},
					error : function() {
						alert('공지사항을 불러오는 데 실패했습니다.');
					}
				});
			} else {
				// 오픈공지 클릭시 해당 글을 상세보기 할 수 있는 함수 작성
				var showName = $(this).children().eq(1).text();
				var openNo = $(this).children().eq(0).text();

				$.ajax({
					url : 'open',
					type : "POST",
					data : {
						openNo : openNo
					},
					success : function(s) {

						console.log(s);
						var nStr = "";

						nStr += '<div><div class="divClass title">'
								+ s.showName
								+ "</div>"
								+ '<div class="divClass dateCount">등록일 : '
								+ s.openNotice.createDate + ' | 조회수 : ' + s.count
								+ "</div>"
								+ '<br><table class="pp">'
								+ '<tr id="result1">'
								+ '<td>'
								+ '<img src="${contextPath}/resources/PosterUploadFiles/'+s.posterChangeName+ '.jpg" alt="" id="resultPoster2">'
								+ '</td>'
								+ '<td>'
								+ '<span id="reName">' + s.showName
								+ '</span><br>'
								+ '<span id="rePlace">지역 : ' + s.regionName + '</span> <br>'
								+ '<span id="reDate">기간 : ' + s.showStart + "-" + s.showEnd + '</span><br>'
								+ '<span id="reNotice" style="white-space: pre-wrap;">공연 소개 : '+ s.showExplain + '</span><br>'
								+ '<span id="rePlace">가격 : ' + s.price + '</span>'
								+ '</td></tr></table></div> <br><hr>'
								+ '<button class="noticeBtn" onclick="location.href=\'' + '${contextPath}' + '/notice/list?noticeType=open\'">목록이동</button><br>';

						$(".btnForm").empty();
						$("#noticeDiv").html(nStr);

					},
					error : function() {
						alert('공지사항을 불러오는 데 실패했습니다.');
					}
				});

			}

		});

		// 선택한 셀렉트 박스의 값 유지
		$("option[value='${map.condition}']").attr("selected", true);

		// 일반공지, 오픈공지 버튼 클릭 시 css 변경 구문	        
		$(".noBtn").on(
				'click',
				function() {
					$(".noBtn").css("background-color", "white").css("color",
							"black").css("border", "1px solid gray");
					$(this).css("background-color", "#597c9b").css("color",
							"white").css("border", "1px solid #597c9b");
				});
 

		// "#general" 제이쿼리 구문이 아닌 요소를 작성해야 한다.
		$(".btnGroup").on("click", "#general", function() {
			$("#OpenSearchForm").hide();
			$("#searchForm").show();
		});
		// 오픈공지
		$(".btnGroup").on("click", "#open", function() {
			$("#OpenSearchForm").show();
			$("#searchForm").hide();
		});
	</script>

	<br>
	<br>
	<br>
	<br>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>