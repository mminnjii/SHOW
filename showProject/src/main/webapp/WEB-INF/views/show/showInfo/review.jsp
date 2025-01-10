<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<% 
	Member loginMember = (Member)session.getAttribute("loginUser");
%>
<head>
<meta charset="UTF-8">
	<style>
		.review{
			margin-left: 200px;
		}
		.box{
			display: inline-block; 
			margin-right: 50px;
		}
		
		pre {
            font-family: "Noto Sans KR", sans-serif;
            font-size: 15px;
            font-style: normal;
            margin-left: -100px; /* 요소를 왼쪽으로 이동 */
            margin-top: -50px;
		}
		.comment{
				width: 800px;
				height: 300px;
				padding-top: 50px;
				padding-left: 50px;
				text-align: left;
				font-family: "Noto Sans KR", sans-serif;
			}
			
			.star {
				float: left; /* 같은 줄에 배치 */
			    width: 50px;
			    height: 50px;
			    margin: 0 2px;
			    background-color: lightgray; /* 기본 빈 별 색상 */
			    display: inline-block;
			    clip-path: polygon(50% 0%, 61% 35%, 98% 35%, 68% 57%, 79% 91%, 50% 70%, 21% 91%, 32% 57%, 2% 35%, 39% 35%);
			}
			
			.filled {
			    background-color: gold; /* 금색으로 채운 별 */
			}
			
			.partially-filled {
			     background: linear-gradient(to right, gold var(--percent), lightgray var(--percent));
			}	
			
		.search-box{
			margin-left: 700px;
		}		
		  .search-text{
            border: none;
            background: none;
            outline: none;
            float: left;
            padding-left: 500px;
            color: gray;
            font-size: 13px;
            line-height: 30px;
            width: 200px;
            font-family: "Noto Sans KR", sans-serif;
        }
	</style>
</head>
<body>
	<%@include file="/WEB-INF/views/show/showInfo/detail.jsp" %>
	<br><br>
	<div class="review">
		<h2 align="left">관람후기</h2>
		<br><br><br>
		
			<pre>
				* 작성전 유의사항 *
				
				게시판 운영 규정에 어긋난다고 판단되는 게시글은 사전 통보없이 블라인드 처리될 수 있습니다.
				특히 티켓 매매 및 양도의 글은 발견 즉시 임의 삭제되며 전화번호, 이메일 등의 개인정보는 악용될 우려가 있으므로 게시를 삼가 주시기 바랍니다.
				사전 경고에도 불구하고 불량 게시물을 계속적으로 게재한 게시자의 경우 게시판 작성 권한이 제한됩니다.
			</pre>
	
		<br><br><br>
		
		
		<div class="container">
	        <div class="star-rating">
	         	<h2>관람평점 : ${reviewAvg}</h2>
	             <!-- 5개의 별을 반복 -->
	             <c:forEach var="i" begin="1" end="5">
	                 <!-- 평점에 따라 별을 채우거나 비움 -->
			     <div class="star 
		        ${i <= Math.floor(reviewAvg) ? 'filled' :
		        (i == Math.floor(reviewAvg) + 1 ? 'partially-filled' : '')}" 
		        style="--percent: ${(reviewAvg - avgFloor) * 100}%;"></div>
	             </c:forEach>
	        </div>
		</div>
		
          <form class="search-box" action="/show/showInfo/reviewSearch" method="get">
              <input type="text" class="search-text" name="keyword" placeholder="검색어를 입력하세요.">
              <button class="search-btn" type="submit">
              <i class="fa-solid fa-magnifying-glass"></i>
              </button>
          </form>
		
		<div>
			<br><br><br>
			이 공연에 남긴 후기 :&nbsp; ${count } <br><br><br>  
			
			<c:if test="${not empty userNo }">
				<button class="enroll">작성하기</button>
			</c:if>
		
		</div>
		<div class=comment>
			<c:choose>
				<c:when test="${not empty r }" >
					<c:forEach items="${r }" var="r">
						<div class="box" id="con">
						<input type="hidden" id="writer" value="${r.userNo }">
						<input type="hidden" id="reviewId" value="${r.reviewId }">
						<hr> <br><br>
							NO :&nbsp;&nbsp;${r.reviewId}&nbsp; |&nbsp;&nbsp; 
							작성자 :&nbsp;&nbsp;${r.userId} &nbsp; |&nbsp;&nbsp; 
							작성일 :&nbsp;&nbsp;${r.createDate}&nbsp;| &nbsp; 
							평점 :&nbsp;&nbsp;${r.reviewScore}&nbsp; 
						</div>
						<c:if test="${not empty loginUser and r.userNo eq loginUser.userNo}">
							<div class="box">
								<button class="modify" data-rno="${r.reviewId }">수정하기</button>
								<button class="delete" data-rno="${r.reviewId }">삭제하기</button>
							</div>
						</c:if> 
						
						<br>
						<h3 class="title" data-content="${r.reviewTitle}">
							${r.reviewTitle}
						</h3>
						<h5 class="origin" data-content="${r.reviewContent}">
							${r.reviewContent}
						</h5> <br><br><br><br><br><br>
					
					</c:forEach>
				</c:when>
				<c:otherwise>
					<h2>작성된 리뷰가 없습니다.</h2>
				</c:otherwise>
			</c:choose>
		</div>

			<p style="margin-top: 10000px;"></p>
	</div>
	
	<script>	
		
		$(".enroll").on("click",function(){
			location.href = '/show/showInfo/enroll'; 
		});
		
	
	
		$(".modify").on("click",(function(){
			
 	 			var replyNo = $(this).attr("data-rno");
 	 			
				const form = document.createElement("form");
		        form.action = "/show/showInfo/update";
		
		        const hiddenField = document.createElement("input");
		        hiddenField.type = "hidden";
		        hiddenField.name = "replyNo";
		        hiddenField.value = replyNo;
		        
		        form.appendChild(hiddenField);
		        document.body.appendChild(form);
		        form.submit(); 

		})); 
		
		
			$(".delete").on("click",(function(){

 	 			var replyNo = $(this).attr("data-rno");
 	 			
 	 			$.ajax({
 	 			 	url : "/show/showInfo/deleteReview",
	 	        	data : {
	 	        		
	 	        		replyNo : replyNo
	 	        	},
	 	        	
	 	        	type : "POST",
	 	        	
		 	       	success : function(result){
		 	       		if(result=="NNNNY"){
		 	        		alert("리뷰삭제에 성공했습니다");
		 	        		window.location.href = '/show/showInfo/review';
	 	        		}else{
	 	        			alert("리뷰삭제에 실패했습니다");
	 	        		}
	 	        	},
	 	        	error : function(fail){
	                     console.log("통신오류");
	 	        	}
 	 				
 	 			});
		})); 
	
	
	</script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>