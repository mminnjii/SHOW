<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <style>
        
        #boardList {text-align:center;}
        #boardList>tbody>tr:hover {cursor:pointer;}
        #pagingArea {width:fit-content; margin:auto;}
        
        #searchForm>* {
            float:left;
            margin:5px;
        }
        .select {width:20%;}
        .text {width:53%;}
        .searchBtn {
            width:20%; 
            background-color: #597c9b;
        }
        
		#searchForm{
			width: 50%;
			margin-left: 51%;
		}	
		
        .a {
            text-align: left;
            width: 70%;
            margin: 0px auto;
            margin-top: 30px;
            background-color: white;
            padding: 3% 5%;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        #meetingList tbody>tr:hover{
            background-color: lightgray; /*#597c9b*/
        }

 		.pageBtn{
        	border : 1px solid lightgray;
        	background-color : white;
        	padding: 5px 10px;
        	border-radius: 8px;
        }


    </style>
</head>
<body>

	<%@include file="/WEB-INF/views/common/menubar.jsp" %>
	<br><br>
    <div class="a" style="padding:5% 10%;">
        <h2>소모임</h2>
        
        <br>
        <form id="searchForm" action="${contextPath}/" method="get" align="center">
            <div class="select">
                <select class="custom-select" name="condition">
                    <option value="total">전체</option>
                    <option value="writer">작성자</option>
                    <option value="title">제목</option>
                </select>
            </div>
    
            <div class="text">
                <input type="text" class="form-control" name="keyword" value="${map.keyword}">
            </div>
    
            <button type="submit" class="searchBtn btn btn-secondary">검색</button>
        </form>
        
        <!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
        <br>
        <br><br>
        <table id="meetingList" class="table" align="center">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>모임명</th>
                    <th>모임장</th>
                    <th>모집인원</th>
                    <th>모집기간</th>
                </tr>
            </thead>
            <tbody>
            	<c:choose>
            		<c:when test="${empty meList}">
            			<tr >
							<td colspan="5" style="text-align: center;">소모임이 없습니다.</td>	
                  		</tr>
            		</c:when>
            		<c:otherwise>
            			<c:forEach var="m" items="${meList}">
		                   <tr>
		                      <td>${m.meetingNo}</td>
		                      <td>${m.meetingTitle}</td>
		                      <td>모임장 아이디</td>
		                      <td>현재참여인원/${m.meetingCount}</td>
		                      <td>${m.startDate} ~ ${m.endDate}</td>
		                  </tr>
            			</c:forEach>
            		</c:otherwise>
            	</c:choose>
                  
            </tbody>
        </table>
        <br>
        
        <button class="btn btn-secondary" style="float:right; background-color: #597c9b;" onclick="location.href='${contextPath}/meeting/create'" >소모임 만들기</button>
               
       	
       	<div id="pagingArea">
        	<!-- 이전/다음 버튼 : 현재 페이지에 따라 만든다. 시작/마지막 페이지일때는 비활성화 
        		 페이지 버튼 
        		 클릭 했을 때 현재 페이지 버튼은 비활성화 한다.
        	-->
        	<c:choose> <%-- 이전버튼 --%>
        		<c:when test="${pi.currentPage == 1}">
	        		<button class="pageBtn" disabled>이전</button>
        		</c:when>
	        	<c:otherwise>
	        		<button class="pageBtn" onclick="location.href=location.href='${contextPath}/meeting/list?currentPage=${pi.currentPage - 1}'">이전</button>
	        	</c:otherwise>
        	</c:choose>
			
			<c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
				<c:choose>
					<c:when test="${empty map}"><%-- 검색이 아니면 --%>
						<c:choose>
							<c:when test="${i != pi.currentPage}">
								<button class="pageBtn" onclick="location.href='${contextPath}/meeting/list?currentPage=${i}'">${i}</button>
							</c:when>
							<c:otherwise>
								<button class="pageBtn" disabled>${i}</button>
							</c:otherwise>
						</c:choose>
					</c:when>
					
					<c:otherwise> <%--검색이라면 --%>
						<c:url var="searchUrl" value="${contextPath}/meeting">
							<c:param name="currentPage" value="${i}"/>
							<c:param name="condition" value="${map.condition}"/>
							<c:param name="keyword" value="${map.keyword}"/>
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
		        	
		    <c:choose> <%-- 다음버튼 --%>
        		<c:when test="${pi.currentPage == pi.maxPage}">
	        		<button class="pageBtn" disabled>다음</button>
        		</c:when>
	        	<c:otherwise>
	        		<button class="pageBtn" onclick="location.href='${contextPath}/meeting?currentPage=${pi.currentPage + 1}'">다음</button>
	        	</c:otherwise>
        	</c:choose>
        	
        </div>
        
        
        <script>
            $("option[value='${map.condition}']").attr("selected", true);
            
        </script>
        
        
        
        <br><br>
    </div>
    <br><br>

   <jsp:include page="/WEB-INF/views/common/footer.jsp" />
   
</body>
</html>