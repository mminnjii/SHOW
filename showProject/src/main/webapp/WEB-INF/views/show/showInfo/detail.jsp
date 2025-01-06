<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>본문 영역 수정</title>
    <style>
		.detail {
			margin-left: 150px;
			margin-top: 50px;
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
			margin-left: 30px;
		}
		
		.details h2 {
			margin: 0px 0 10px 0; /* 제목 아래 여백 */
			font-size: 1.5em;
		}
		
		.details p {
			margin: 0;
			line-height: 3; /* 텍스트 가독성을 위해 줄 간격 */
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
	        <h2>예약하기</h2>
	        <br><br>
	        <c:if test="${not empty date }">
	        	<p>날짜 :</p>	
	        	<select id="date" onchange="selectDate()">
	        		<c:forEach items="${date }" var="d">
			        	<option>${d.showDate }</option>
		        	</c:forEach>
		        </select>
	       </c:if> 
		        <br><br>
		        <p>회차 및 공연시간 :</p>
 		        <select id="time">
		        	<option>선택하세요</option>
		        </select>
	        <br><br>
	        <p>공연일정 : </p>
	        <select>
	        	<option>${s.showStart }~${s.showEnd }</option>
	        </select>
	        <br><br>
	        <br><br><br>
	        <p>회원등급</p>

	        <br>
			<button onclick="reservation();">예약하기</button>
			<!--  <button onclick="location.href='/show/reservation/seats'">예약하기</button> -->
	    </div>
	    
	    
	    <div class="content">
	        <!-- 본문 상단 영역 -->
	        <div class="top-section">
	        
	            <img src='/show/resources/PosterUploadFiles/${s.posterChangeName}.jpg' />

	            <div class="details">
	                <c:choose>
						<c:when test="${not empty s }">
					      	 <h2>${s.showName }</h2> <br>
			                <p>장르 : ${s.genreNo }</p> 
			                <p>소개 : ${s.showExplain }</p> 
			                <p>장소 : ${s.hallNo }</p> 
			                <p>공연기간 : ${s.showStart }~${s.showEnd }</p>
			                <p>공연시간 : 120분</p>
			                <p>가격 : ${s.price }</p>
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
    		
    			// console.log($("#date").val());
    		
     		$.ajax({
    			url : "selectDate",
    			data: {
    				date : $("#date").val()
    			},
    			success : function(result){
    				console.log(result);
    				$("#time").empty();
    				var info = "";

  				    for (var i = 0; i < result.length; i++) {
  				        info += "<option data-round-id='" + result[i].roundId + "'>" 
  				        			+result[i].showRound + " 회차,  공연시간 :" + result[i].showTime + "\n"
  				        		 "</option>";
  				        		 // console.log(result[i].roundId);
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
    		
    		// console.log($("#time").html()); // #time의 전체 HTML을 출력
    		
    		// 공연번호 / 회차번호 / 회원번호 / 공연장번호 / 예약상태 
    	     var selectedOption = $("#time").find(":selected");
    	     var roundId = selectedOption.data("round-id");
    	     console.log("Selected Round ID:", roundId);
    		 
    	     
    	     location.href= '/show/reservation/seats?showNo='+${s.showNo}+"&roundId="+roundId+"&hallNo="+${s.hallNo};
    		

    	}
    	
    	
    
    </script>
    
    
</body>
</html>