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

        #noticeList tbody>tr:hover{
            background-color: lightgray; /*#597c9b*/
        }
        
        #noticeList{
        	text-align: center;
        }

        .noBtn {
            border: 1px solid lightgray;
            background-color: white;
            display: inline-block;
            padding: 5px 20px;
        }
        
        .pageBtn{
        	border : 1px solid lightgray;
        	background-color : white;
        	padding: 5px 10px;
        	border-radius: 8px;
        }

		.btnForm{
			display: flex; 
			justify-content: space-between; /* 좌우 정렬 */
			margin-bottom: 20px;
			
		}
		
		.btnGroup{width: 20%; margin:5px;}
		#searchForm{width: 40%;}			

		/* 상세보기 style */
 		.divClass{
            border-bottom: 1px solid lightgrey;
            padding: 15px 20px; 
        }
        .title{
            border-top: 2px solid lightgrey;
            font-weight: bold;
        }
        .dateCount{
            font-size: 12px;
            color: gray;
            font-weight: bold;
            padding: 5px 20px;
        }

        .noticeBtn{
            margin: 10px;
            background-color: white;
            border: 1px solid lightgrey;
            padding: 7px 12px;
            border-radius: 5px;
            float: right;
        }
        .noticeBtn:hover{
            margin: 10px;
            background-color: #597c9b;
            color: white;
            border: 1px solid #597c9b;
            padding: 7px 12px;
            border-radius: 5px;
            cursor: pointer;
            float: right;
        }
        
        #noticeTbody td:hover{
        	cursor: pointer;
        }
        

    </style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/menubar.jsp" %>
    <div class="a">
        <h2 align="center">공지사항</h2>
        
        <div class="btnForm">
	       <div class="btnGroup">
	           <button id="general" class="noBtn" value="general">일반 공지</button>
	           <button id="open" class="noBtn" value="open">오픈 공지</button>
	       </div>
	       
	       <br>
	
			<!-- 일반공지, 오픈공지별 검색 기능 구현되어야 한다. 
				 일반공지, 오픈공지 검색 url 변경 필요. => function 함수로 action값 변경?? -->
	       <form id="searchForm" action="${contextPath}/notice/search" method="get">
	       
	           <div class="select">
	               <select class="custom-select" name="condition">
	                   <option value="all">전체</option>
	                   <option value="title">제목</option>
	                   <option value="content">내용</option>
	               </select>
	           </div>
	   
	           <div class="text"><!-- 검색 후에 검색한 키워드값 보여주기 -->
	               <input type="text" class="form-control" name="keyword" value="${map.keyword}">
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
            
            <c:choose>
            	<c:when test="${empty noticeList}">
            		<tr><td id="noting" style="text-align: center;" colspan="4">공지사항 내역이 없습니다.</td></tr>
            	</c:when>
            	<c:otherwise>
            		<c:forEach var="list" items="${noticeList}">
            			<tr>
	            			<td>${list.noticeNo}</td>
	            			<td style="text-align: left;">${list.noticeTitle}</td>
	            			<td>${list.createDate}</td>
	            			<td>${list.count}</td>
            			</tr>
            		</c:forEach>
            	</c:otherwise>
            </c:choose>

            </tbody>
        </table>
        
        <br>
        
        <!-- 페이지네이션 -->
        <div id="pagingArea">
        	<!-- 이전/다음 버튼 : 현재 페이지에 따라 만든다. 시작일때는 없음. 마지막페이지일때는 다음버튼 없음 (=> 비활성화 하는 것으로 수정?) 
        		 페이지 버튼 
        		 클릭 했을 때 현재 페이지 버튼은 비활성화 한다.
        	-->
        	<c:choose> <%-- 이전버튼 --%>
        		<c:when test="${pi.currentPage == 1}">
	        		<button class="pageBtn" disabled>이전</button>
        		</c:when>
	        	<c:otherwise>
	        		<button class="pageBtn" onclick="location.href=location.href='${contextPath}/notice/list?currentPage=${pi.currentPage - 1}'">이전</button>
	        	</c:otherwise>
        	</c:choose>
			
			<c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
				<c:choose>
					<c:when test="${empty map}"><%-- 검색이 아니면 --%>
						<c:choose>
							<c:when test="${i != pi.currentPage}">
								<button class="pageBtn" onclick="location.href='${contextPath}/notice/list?currentPage=${i}'">${i}</button>
							</c:when>
							<c:otherwise>
								<button class="pageBtn" disabled>${i}</button>
							</c:otherwise>
						</c:choose>
					</c:when>
					
					<c:otherwise> <%--검색이라면 --%>
						<c:url var="searchUrl" value="/notice/search">
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
	        		<button class="pageBtn" onclick="location.href='${contextPath}/notice/list?currentPage=${pi.currentPage + 1}'">다음</button>
	        	</c:otherwise>
        	</c:choose>
        	
        </div>
       
        </div>
        
        <script>
        	
        	$("#general").css("background-color", "#597c9b").css("color", "white").css("border", "1px solid #597c9b");
	
        	var noticeType = "general";
        	
        	$(".noBtn").on("click", function() {
        	    noticeType = $(this).val();   // 클릭한 버튼의 value 값 가져오기
        	    console.log(noticeType);
        	});
        	
	        // 일반공지 클릭시 해당 글을 상세보기 할 수 있는 함수 작성 
	        $("#noticeList>tbody").on("click","tr", function(){
        		var nno = $(this).children().first().text();
                console.log(nno); 
                
				if(noticeType == "general"){
	            	// 클릭되어 있는 버튼의 value 값에 따라 이동 처리 
	                $.ajax({
	                	url: 'detail',
	                	type : "POST",
	                	data : {
	                		nno : nno
	                	}, success : function(noticeDetail){
	                		
	                		var nStr = "";
	                		
	                		nStr += '<div class="divClass title">'+ noticeDetail.noticeTitle + "</div>"
	                			 + '<div class="divClass dateCount">' + noticeDetail.createDate
	                			 + " | "
	                			 + noticeDetail.count + "</div>"
	                			 + '<div class="divClass">'+noticeDetail.noticeContent + "</div>"
	                			 + '<button class="noticeBtn" onclick="location.href=\'' + '${contextPath}' + '/notice/list\'">목록이동</button>';
	
	                		$(".btnForm").empty();
	                		$("#noticeDiv").html(nStr);
	                	}, error : function(){
	                		alert('공지사항을 불러오는 데 실패했습니다.');
	                	}
	        		});
				}else{
			        // 오픈공지 클릭시 해당 글을 상세보기 할 수 있는 함수 작성
					
				}
				

	        });
	        
	        
	        
	        
	        // 선택한 셀렉트 박스의 값 유지
	        $("option[value='${map.condition}']").attr("selected", true);
	        
			// 일반공지, 오픈공지 버튼 클릭 시 css 변경 구문	        
            $(".noBtn").on('click', function(){
                $(".noBtn").css("background-color", "white").css("color", "black").css("border", "1px solid gray");
                $(this).css("background-color", "#597c9b").css("color", "white").css("border", "1px solid #597c9b");
            });
			
			
         	// 일반공지 버튼 클릭시 해당 데이터 리스트 보여주기 
         	// "#general" 제이쿼리 구문이 아닌 요소를 작성해야 한다.
			$(".btnGroup").on("click", "#general" , function(){
				$.ajax({
					url: "list",
					type: "post",
					success : function(noticeList){
						
						var str = "";
						if(noticeList != null){
							for(var i=0; i<noticeList.length; i++){
								str += "<tr>"
									+ "<td>"+ noticeList[i].noticeNo +"</td>"
									+ "<td style='text-align: left;'>"+ noticeList[i].noticeTitle +"</td>"
									+ "<td>"+ noticeList[i].createDate +"</td>"
									+ "<td>"+ noticeList[i].count +"</td>"
									+ "</tr>";
							}	
							// 페이징 처리도 해주어야 한다? 
						}else{
							str += '<tr><td style="text-align: center;" colspan="4">공지사항 내역이 없습니다.</td></tr>';
						}
						
						$("#noticeTbody").empty();
						$("#noticeTbody").html(str);
						
					}
				});
			});
			
         	
			// 오픈공지 버튼 클릭시 해당 데이터 리스트 보여주기 
			// 테스트 || 데이터 다르게 넣고 테스트 해봐야 한다. ++ 페이징 처리도 되는게 맞는지 확인 필요.
			$(".btnGroup").on("click", "#open", function(){
				$.ajax({
					url: "openlist",
					type: "post",
					success : function(noticeList){
						
						var str = "";
						if(noticeList != null){
							for(var i=0; i<noticeList.length; i++){
								str += "<tr>"
									+ "<td>"+ noticeList[i].openNo +"</td>"
									+ "<td style='text-align: left;'>"+ noticeList[i].openExplain +"</td>"
									+ "<td>"+ noticeList[i].openName +"</td>"
									+ "<td>"+ noticeList[i].genreNo +"</td>"
									+ "</tr>";
							}
							
						}else{
							str += '<tr><td style="text-align: center;" colspan="4">공지사항 내역이 없습니다.</td></tr>';
						}
						
						$("#noticeTbody").empty();
						$("#noticeTbody").html(str);
						
					}
				});
			});
			
			
			
        </script>
        
        
        
        <br><br>
    </div>
    <br><br>

   	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
   
</body>
</html>