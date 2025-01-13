<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>공연상세정보</title>
    <style>
		.detail {
			margin-left: 150px;
			font-family: Arial, sans-serif;
		}
		
		.fixed-section {
			margin-right: 200px;
			position: fixed;
			bottom: 30px;
			right: 0;
			width: 350px;
			height: 90%;
			background-color: #f4f4f4;
			padding: 20px;
			box-shadow: -2px 0 5px rgba(0, 0, 0, 0.2);
			 z-index: 10; /* 다른 요소보다 위에 표시 */
		}
		
		td {
			margin: 10px;
			list-style-type: none;
			display: inline-block;
			font-family: "Noto Sans KR", sans-serif;
			font-size: 17px;
			font-weight: 400;
			font-style: normal;
			padding-right: 25px; /*메뉴바 글씨 간격*/
		}
		
		select {
			    width: 300px; /* 너비 */
			    height: 40px; /* 높이 */
			    padding: 5px 10px; /* 내부 여백 */
			    font-size: 16px; /* 글꼴 크기 */
			    font-family: 'Noto Sans KR', Arial, sans-serif; /* 글꼴 */
			    border: 1px solid #ccc; /* 테두리 */
			    border-radius: 5px; /* 둥근 모서리 */
			    background-color: #f4f4f4; /* 배경색 */
			    color: #333; /* 글씨 색상 */
			    appearance: none; /* 기본 브라우저 화살표 제거 */
			    -webkit-appearance: none; /* Webkit 브라우저 (Chrome, Safari 등) */
			    -moz-appearance: none; /* Firefox */
			    cursor: pointer; /* 클릭 가능한 커서 */
			    transition: all 0.3s ease; /* 부드러운 전환 효과 */
			}
		
		/* 본문 상단 레이아웃 */
		.top-section {
			display: flex;
			align-items: flex-start; /* 이미지와 텍스트 위쪽 정렬 */
			gap: 20px; /* 이미지와 텍스트 사이 간격 */
			margin-bottom: 50px; /* 아래 콘텐츠와 간격 */
			font-family: "Noto Sans KR", sans-serif;
			font-size: 17px;
			font-weight: 400;
		}
		
		.top-section img {
			width: 320px; /* 이미지 너비 */
			height: auto; /* 비율 유지 */
			border-radius: 8px; /* 이미지 둥글게 */
			box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* 이미지 그림자 */
		}
		
		.details {
			margin-top : 100px;
			margin-left: 30px;
		}
		
		.details h2 {
			margin: 0px 0 10px 0; /* 제목 아래 여백 */
			font-size: 1.5em;
		}
		
		.details p {
			margin: 0;
			line-height: 3; /* 텍스트 가독성을 위해 줄 간격 */
			font-weight: 300;
		}
		
		.menu {
			margin-left: 50px;
		}
		
		button {
			padding: 10px 20px; 
			font-size: 16px; 
			font-family: 'Noto Sans KR', sans-serif; 
			border: 1px solid gray; 
			border-radius: 5px;
			cursor: pointer;
		}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/menubar.jsp" %>
		
		<div class="detail">
	        <div class="fixed-section">
	        <c:if test="${not empty userNo }">
	        	<input type="hidden" name="userNo" value="${userNo} "></input>
	        </c:if>
	        <h2>예약하기</h2>
	        <br><br>
	        <c:if test="${not empty date }">
	        	<p>날짜 :</p>	
	        	<select id="date" onchange="selectDate()">
	        		<option disabled="disabled" selected>선택하세요</option>	
	        		<c:forEach items="${date }" var="d">
			        	<option>${d.showDate }</option>
		        	</c:forEach>
		        </select>
	       	</c:if> 
		        <br><br>
		        <p>회차 및 공연시간 :</p>
 		        <select id="time">
		        	<option disabled="disabled" selected>선택하세요</option>
		        </select>
	        <br><br>
	        <p>공연일정 : </p>
	        <select>
	        	<option>${s.showStart }~${s.showEnd }</option>
	        </select>
	        <br><br>
	        <br><br><br>
	        <c:if test="${not empty userNo }">
		        <p>회원등급 : </p>
		        <br>
				<h4>${rank }</h4>
				<br><br>
			 	<p>보유쿠폰 : ${cno } 개 </p>
		        <br><br><br><br>
	        </c:if>
			<button onclick="reservation();">예약하기</button>
	    </div>
	    
	    
	    <div class="content">
	        <!-- 본문 상단 영역 -->
	        <div class="top-section">
	        
	            <img src='/show/resources/PosterUploadFiles/${s.posterChangeName}.jpg'  style= "margin-top : 100px;"/>

	            <div class="details">
	                <c:choose>
						<c:when test="${not empty s }">
					      	 <h2>${s.showName }</h2> <br>
			                <p>
			                	<b style="font-weight: 500;">장르</b> : &nbsp; 
			                	 <c:choose>
			                	 	<c:when test="${s.genreNo eq '2' }">
			                	 		연극
			                	 	</c:when>
			                	 	<c:when test="${s.genreNo eq '3' }">
			                	 		콘서트
			                	 	</c:when>
			                	 	<c:when test="${s.genreNo eq '4' }">
			                	 		클래식
			                	 	</c:when>
			                	 	<c:when test="${s.genreNo eq '5' }">
			                	 		전시
			                	 	</c:when>
			                	 	<c:otherwise>
			                	 		뮤지컬
			                	 	</c:otherwise>
			                	 </c:choose>
			                </p> 
			                <p style="width: 800px;" >
			                	<b style="font-weight: 500;">소개</b> : &nbsp; 
			                		<c:choose>
			                			<c:when test="${s.showExplain eq '--'}">
			                				여러분의 연말을 책임질 ${s.showName } !
			                			</c:when>
			                			<c:otherwise>
			                				${s.showExplain }
			                			</c:otherwise>
			                		</c:choose>
			                </p> 
			                <p><b style="font-weight: 500;">장소</b> : &nbsp; ${s.hallName }</p> 
			                <p><b style="font-weight: 500;">공연기간</b> :&nbsp; ${s.showStart }~${s.showEnd }</p>
			                <p><b style="font-weight: 500;">공연시간</b> : &nbsp; 120분</p>
			                <p><b style="font-weight: 500;">VIP석</b> : &nbsp; ${vipPrice } &nbsp;||&nbsp; 
				               <b style="font-weight: 500;">R석</b> : &nbsp; ${rPrice } &nbsp;||&nbsp; 
				               <b style="font-weight: 500;"> S석</b> : &nbsp; ${s.price }
			                </p>
						</c:when>                
		                <c:otherwise>
		                	<h2>상세정보를 불러올 수 없습니다.</h2>
		                </c:otherwise>
	                </c:choose>
	            </div>
	        </div>
	        <br>
	        
	        <hr>
	        
				<table class="menu">
					<tr>
						<td><a href="/show/showInfo/detail">공연정보</a></td>
						<td><a href="/show/showInfo/review">관람후기</a></td>
					</tr>
				</table>
	         <hr>
	    </div>
    </div>
    
    <script>
    	
    	function selectDate(){
    		
     		$.ajax({
    			url : "selectDate",
    			data: {
    				date : $("#date").val()
    			},
    			success : function(result){
    				// 회차에 따른 시간값 초기화 후 불러오기
    				$("#time").empty();
    				var info = "";

  				    for (var i = 0; i < result.length; i++) {
  				        info += "<option data-round-id='" + result[i].roundId + "'>" 
  				        			+result[i].showRound + " 회차,  공연시간 :" + result[i].showTime + "\n"
  				        		 "</option>";
  				    }
  				    $("#time").append(info);
    			},	
    			error : function(error){
    				console.log("통신오류");
    			}
    		}); 
    		
    	}
    	
    	function reservation(){
    		
    		// 로그인 유저 조건걸어주기
    		var userNo = $("input[name='userNo']").val();
    		
    		if(userNo){
    			// 공연번호 / 회차번호 / 회원번호 / 공연장번호 / 예약상태
	       	     var selectedOption = $("#time").find(":selected");
	       	     var roundId = selectedOption.data("round-id");
	       	    
	       	     if(selectedOption && roundId){
	       	    	location.href= '/show/reservation/seats?showNo='+${s.showNo}+"&roundId="+roundId+"&hallNo="+${s.hallNo};
	       	     }else{
	       	    	 alert("공연날짜 및 시간을 선택하세요");
	       	     }
    		}else{
    			alert("로그인 후 이용하세요")
    			location.href= '/show/member/toLogin';
    		}
    	}
    	
    </script>
    
    
</body>
</html>