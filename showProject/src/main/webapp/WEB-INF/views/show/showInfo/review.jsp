<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style>
		.comment{
				width: 800px;
				height: 200px;
				background-color: lightgray;
				border-radius: 40px;
				padding-top: 50px;
				padding-left: 50px;
				text-align: left;
			}
			
			.star {
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
			
			.half {
			    background: linear-gradient(to right, gold 50%, lightgray 50%); /* 반으로 채운 별 */
			}	
	</style>
</head>
<body>
	<%@include file="/WEB-INF/views/show/showInfo/detail.jsp" %>
	<h2 align="center">관람후기</h2>
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
         	<h2>관람평점 : ${reviewRank}</h2>
             <!-- 5개의 별을 반복 -->
             <c:forEach var="i" begin="1" end="5">
                 <!-- 평점에 따라 별을 채우거나 비움 -->
                 <div class="star 
                     ${i <= reviewRank ? 'filled' : 
                     (i - 0.5 <= reviewRank ? 'half' : '')}">
                 </div>
             </c:forEach>
        </div>
	</div>
	
	  <div class="text">
        <input type="text" class="form-control" name="keyword" value="${hashMap.keyword }">
        <button type="submit" class="searchBtn btn btn-secondary">검색</button>
      </div>
	
	<div>
		<br><br><br>
		이 공연에 남긴 후기 :&nbsp; 15개 <br><br> 
	</div>
	<div class=comment>
		NO :&nbsp;&nbsp;${r.replyNo} 101 &nbsp; |&nbsp;&nbsp; 
		작성자 :&nbsp;&nbsp;${r.userNo} user01 &nbsp; |&nbsp;&nbsp; 
		작성일 :&nbsp;&nbsp;${r.date} 2024-12-18 |&nbsp;&nbsp; 
		평점 :&nbsp;&nbsp;${r.rate} 4.5 |&nbsp;&nbsp; 
		조회수 :&nbsp;&nbsp;${r.date} 50 
		
<%-- 		<c:if test="${r.userNo eq loginUser.userId}">
			<br>
			<button class="modify" data-rno="${r.replyNo }">수정하기</button>
			<button class="delete" data-rno="${r.replyNo }">삭제하기</button>
			<button id="back2">뒤로가기</button>
		</c:if> --%>
		<br><br>
		<h3 class="title" data-content="${r.replyContent}">
			너무나 와 닿았던 극
		</h3>
		<h5 class="origin" data-content="${r.replyContent}">
			세상은 돌고 도는 것처럼, 새삼 대사나 넘버가 더욱 잘 들리는 회차였다.
		</h5>
	</div>

		<button id="submit" style="display: none;">작성하기</button>
		<button id="back" style="display: none;">뒤로가기</button>
	
	
</body>
</html>