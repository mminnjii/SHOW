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
         .a {
            text-align: left;
            width: 70%;
            margin: 0px auto;
            background-color: white;
            padding: 3% 5%;
            border: 1px solid lightgray;
            border-radius: 0px 0px  10px 10px;
			border-top : none;
        }

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
        

        
        
       	#chatList{
        	text-align: center;
        }
        
        .pageBtn{
        	border : 1px solid lightgray;
        	background-color : white;
        	padding: 5px 10px;
        	border-radius: 8px;
        }
        
        .joinBtn{
        	border : 1px solid gray;	
        	background-color : white;
        	padding: 3px 10px;
        	border-radius: 8px;
        }
        
        .joinBtn:hover{
        	background-color : #597c9b;
        	padding: 3px 10px;
			cusor: pointer;
			border : 1px solid #597c9b;	
			color: white;
        }
        

    </style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/menubar.jsp" %>
    <div class="a" style="padding:5% 10%;">
        <h2 align="center">채팅방</h2>
        
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
        <table id="chatList" class="table" align="center">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>입장정원수</th>
                    <th>생성일</th>
                    <th>입장</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${empty chatList}">
                    	<tr>
							<td colspan="6" style="text-align: center;" id="noting" >조회된 게시글이 없습니다.</td>	
                  		</tr>
                    </c:when>
                    <c:otherwise>
	                    <c:forEach var="cl" items="${chatList}">
	                        <tr>
	                            <td>${cl.chatNo}</td>
	                            <td>${cl.chatTitle}</td>
	                            <td>${cl.memList[0].userId}</td>
	                            <td>1/${cl.chatUserCount}</td>
	                            <td>${cl.createDate}</td>
	                            <td><button type="button" class="joinBtn">입장</button></td>
	                        </tr>
	                    </c:forEach>
                    </c:otherwise>
                </c:choose> 
            </tbody>
        </table>
        <br>
        
        <button type="button" onclick="location.href='${contextPath}/chat/chatView'" class="btn btn-secondary" style="float:right; background-color: #597c9b;">채팅방 만들기</button>

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
	        		<button class="pageBtn" onclick="location.href='${contextPath}/chat/list?currentPage=${pi.currentPage - 1}'">이전</button>
	        	</c:otherwise>
        	</c:choose>
			
			<c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
				<c:choose>
					<c:when test="${empty hashmap}"><%-- 검색이 아니면 --%>
						<c:choose>
							<c:when test="${i != pi.currentPage}">
								<button class="pageBtn" onclick="location.href='${contextPath}/chat/list?currentPage=${i}'">${i}</button>
							</c:when>
							<c:otherwise>
								<button class="pageBtn" disabled>${i}</button>
							</c:otherwise>
						</c:choose>
					</c:when>
					
					<%-- <c:otherwise> 검색이라면 
						<c:url var="searchUrl" value="/meeting/search">
							<c:param name="currentPage" value="${i}"/>
							<c:param name="condition" value="${hashmap.condition}"/>
							<c:param name="keyword" value="${hashmap.keyword}"/>
						</c:url>
						<c:choose>
							<c:when test="${i != pi.currentPage}">
								<button class="pageBtn" onclick="location.href='${searchUrl}'">${i}</button>
							</c:when>
							<c:otherwise>
								<button class="pageBtn" disabled>${i}</button>
							</c:otherwise>
						</c:choose>
					</c:otherwise>--%>
				</c:choose>
			</c:forEach>
		        	
		    <c:choose> <%-- 다음버튼 --%>
        		<c:when test="${pi.currentPage == pi.maxPage}">
	        		<button class="pageBtn" disabled>다음</button>
        		</c:when>
	        	<c:otherwise>
	        		<button class="pageBtn" onclick="location.href='${contextPath}/chat?currentPage=${pi.currentPage + 1}'">다음</button>
	        	</c:otherwise>
        	</c:choose>
        	
        </div>
        
        
        <!-- 
            searchList() 메소드명으로 작성
            키워드랑 카테고리 유지될 수 있도록 처리해보기 
            동적 sql 사용해보기 
        -->
        
        
        
        
        <script>
            $("option[value='${map.condition}']").attr("selected", true);
            
            $("#chatList tbody").on("click", "button", function(){
				// 채팅방 입장 ? 
				console.log("입장")
            });
            
        </script>
        
        
        
        <br><br>
    </div>
    <br><br>

   <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>