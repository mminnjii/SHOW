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
            /*padding: 3% 5%;*/
            border: 1px solid lightgray;
            border-radius: 0px 0px  10px 10px;
			border-top : none;
			z-index: 2;
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

	<%@include file="/WEB-INF/views/common/menubar2.jsp" %>
	
    
    <div class="a" style="padding:5% 10%;" >
        <h2 align="center">채팅방</h2>
        
        <br>
        <form id="searchForm" action="${contextPath}/chat/chatSearch" method="get" align="center">
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
        <table id="chatList" class="table"  align="center">
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
	                            <td>${cl.joinCount}/${cl.chatUserCount}</td>
	                            <td>${cl.createDate}</td>
	                            <td><button type="button" class="joinBtn" value="${cl.chatNo}">입장</button></td>
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
        	<c:choose> 
        		<c:when test="${pi.currentPage == 1}">
	        		<button class="pageBtn" disabled>이전</button>
        		</c:when>
	        	<c:otherwise>
	        		<button class="pageBtn" onclick="location.href='${contextPath}/chat/list?currentPage=${pi.currentPage - 1}'">이전</button>
	        	</c:otherwise>
        	</c:choose>
			
			<c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
				<c:choose>
					<c:when test="${empty map}"> 
						<c:choose>
							<c:when test="${i != pi.currentPage}">
								<button class="pageBtn" onclick="location.href='${contextPath}/chat/list?currentPage=${i}'">${i}</button>
							</c:when>
							<c:otherwise>
								<button class="pageBtn" disabled>${i}</button>
							</c:otherwise>
						</c:choose>
					</c:when>
					
					<c:otherwise>
						<c:url var="searchUrl" value="/chat/list">
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
		        	
		    <c:choose> 
        		<c:when test="${pi.currentPage == pi.maxPage}">
	        		<button class="pageBtn" disabled>다음</button>
        		</c:when>
	        	<c:otherwise>
	        		<button class="pageBtn" onclick="location.href='${contextPath}/chat?currentPage=${pi.currentPage + 1}'">다음</button>
	        	</c:otherwise>
        	</c:choose>
        	
        </div>
        
  
        
        
        
        <script>
            $("option[value='${map.condition}']").attr("selected", true);
            
            
	            console.log(${chatList[0].joinCount});
	            console.log(${chatList[0].chatUserCount});
            
	  			
            $("#chatList tbody").on("click", "button", function(){
	            // 해당 chatNo에 해당하는 joinCount, chatUserCount만 가져와야 한다. chatList
            	// button.parent() 만하면 button의 td만 가져오기 때문에 tr을 찾고 td를 찾아야 tr에 있는 모든 td 값을 가져올 수 있다.
            	// eq() == 인덱스 
            	// td에서 /를 기준으로 잘라 값을 가져와야 한다. 해당 값은 index로 나눠진다.    split : 문자열을 나누어 배열로 반환 
	            var button = $(this);
				
	            var tr = button.parent().parent();
	            var td = tr.children();
	            
	            var join = td.eq(3).text().split("/");
	            
	  			var joinCount = join[0];
	            
	  			var chatUserCount = join[1];
	            
	  			// 입장 인원 수 > 참여 인원 수인 경우에만 채팅방 참여 가능 
	  			// 회원 id, 채팅방 번호  => count는 리스트에서만 확인 가능하면 된다. (오라클 sql 구문 작성해둠)
	  			var chatNo = td.eq(0).text();
	  			
	            // 백틱이 없는 경우 undifind가 뜬다. 왜? 확인 필요함. 이전에는 문제 없었음. 
	            // var meetingCount= ${meDetail.meetingCount}; 해당값은 가져와짐. int라 그런건가? 문자열이여서 안되는건가? 
	            var userId = `${loginUser.userId}`;

	  			var userNo = ${loginUser.userNo};
	  			
	  			
	  			if(chatUserCount > joinCount){ // 채팅방 정원이 차지 않아 입장이 가능할 때
		  			$.ajax({
		  				url: "chatting",
		  				data :{
		  					chatNo: chatNo,
		  					userId : userId
		  				},
		  				success : function(data){
			  				location.href="${contextPath}/chat/chatting?chatNo="+chatNo+"&userId="+userId;
		  				}
		  			});
	  				
                    alert("채팅방입장");
	                 
	              }else{ // 채팅방 정원이 가득 차 입장 불가능
	            	  // 정원이 찼지만 이미 참여되어 있는 회원인 경우에는 채팅방 입장 가능
	            	  $.ajax({
	            		 url: "joinUser",
	            		 type : "POST",
	            		 data: {
	            			chatNo: chatNo,
	            			userNo : userNo
	            		 },
	            		 success : function(joinUser){
	            			 if(joinUser){
	            				 location.href="${contextPath}/chat/chatting?chatNo="+chatNo+"&userId="+userId;
	            			 } else{
	            				 // 입장 인원수와 현재 입장한 인원수가 같은 경우 채팅방 입장 불가능
	            				 alert("채팅방 정원이 모두 차 입장이 불가능합니다.");
	            			 }
	            		 }, 
	            		 error : function(){
	            			conole.log("에러 발생");
	            		 }
	            	  });
	            	  
	              		
	              }
	  			
	            
	  			
	  			
	            
            });
            
        </script>
        
        
        
        <br><br>
    </div>
    <br><br>

   <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>