<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>소모임 생성</title>
<style>
    
    .a {
        text-align: left;
        width: 60%;
        margin: 0px auto;
        margin-top: 30px;
        background-color: white;
        padding: 3% 8%;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
    }

    h1 {
        text-align: center;
        color: #333;
    }
    
    label {
        font-weight: bold;
        margin-top: 10px;
        display: block;
    }

    input, textarea, select, button {
        width: 100%;
        padding: 10px;
        margin: 8px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    
    button {
        background-color: #597c9b;
        color: white;
        font-weight: bold;
        cursor: pointer;
    }

    button:hover {
        background-color: #374f64;
    }
    
    #showDiv2{
    	display: inline-block;
    }
    
    #showDiv2 i {
    	position: absolute;  /* 아이콘 위치 고정 */
		color: gray;
		margin-left: 10px;
		margin-top: 18px;
    }
    
    #showDiv2 input{
    	width: 100%;
    	padding-left: 35px;
    }
    
</style>
</head>
<body>

<%@include file="/WEB-INF/views/common/menubar.jsp" %>
<br><br>
<div class="a">


    <h1>소모임 생성</h1>
    <form action="meetingInsert" method="POST">
    
    	<input type="hidden" name="userNo" value="${loginUser.userNo}">
        <label for="groupName">소모임 명</label>
        <input type="text" id="meetingTitle" name="meetingTitle" placeholder="소모임명을 입력하세요" required>
        
        <label for="category">공연</label>
        <!-- 공연 정보 불러와서 -->
        <!-- GENRE 테이블 정보 가져오기 -->
       	<div id="showDiv2" class="showDiv2" style="width: 25%;">
	        <select id="category" name="category" required>
	            <option value="" disabled selected>공연카테고리를 선택하세요</option>
	            <c:forEach var="g" items="${genreList}">
		            <option value="${g.genreNo}">${g.genreName}</option>
	            </c:forEach>
	        </select>
       	</div>
       	<div id="showDiv2" style="width: 30%;">
			<i class="fa-solid fa-magnifying-glass"></i>
			<input type="text" id="keyword" name="keyword" placeholder="카테고리를 선택 후 공연명을 검색하세요.">
       	</div>
       	<div id="showDiv2" style="width: 495px;"> 
			<!-- 공연 정보 불러오기 -->        
			<select id="show" name="showNo">
				<option disabled selected>카테고리를 선택하면 공연을 선택할 수 있습니다.</option>
			</select>
       	</div>
        
        <!-- 모임 장소 입력 시 어떻게 입력받을지 생각하기 : 지도 API에서 필요한 지역 정보가 있어야 상세보기 페이지에서 지도 API 기능 구현 가능 -->
        <label for="location">모임 장소</label>
        <input type="text" id="meetingPlace" name="meetingPlace" placeholder="ex) 서울 영등포 타임스퀘어" required>
        
        <label for="meetingCount">모집 인원</label>
        <select name="meetingCount" id="meetingCount" required>
        	<option value="" style="color: lightgray;" disabled selected>모집 인원을 선택해 주세요</option>
        	<c:forEach var="mc" begin="1" end="15">
	        	<option value="${mc}">${mc} 명</option>
        	</c:forEach>
        </select>
        
        <label for="meetingDate">모임 날짜</label>
        <input type="date" id="meetingDate" name="meetingDate" required>
        
        <label for="endDate">모집 마감일</label>
        <input type="date" id="endDate" name="endDate" required>  <!-- 오늘날짜 이전은 선택 불가능하게 조건처리 -->
        
        <!-- wrap="hard" 데이터가 서버로 제출될 때, 입력된 텍스트를 줄바꿈한다. hard 속성값을 사용할 경우에는 cols 속성이 명시되어 있어야 한다. -->
        <label for="infomation">소모임 안내사항</label>
        <textarea id="infomation" wrap="hard" name="infomation" rows="10" placeholder="소모임 안내사항을 작성하세요" style="resize: none;"></textarea>
        
        <button type="submit">소모임 생성</button>
    </form>
	
	<script>
		
	// 오늘 이전 날짜 선택불가능  
		var endDate = $("#endDate")
		var d = new Date();  
		
		var meetingDate = $("#meetingDate")
		var stDate = (d.getFullYear()+"-"+(d.getMonth()+1).toString().padStart(2, '0')+"-"+d.getDate().toString().padStart(2, '0'));

		meetingDate.attr("min", stDate);
		endDate.attr("min", stDate);
		
		// 카테고리 클릭 시 해당 카테고리에 해당하는 show 목록 불러오기 (동적으로 생성된 카테고리 option을 선택하는 것이기 때문에 .on 메소드 사용)
		$(".showDiv2").on("change", "#category", function(){
			$.ajax({
				url: "selectShow",
				data: {
					genreNo : $("#category").val()
				}, 
				success : function(showList){
					console.log(showList);
					
					var str = "";
					if(showList != null){
						for(var i=0; i<showList.length; i++){
							str += '<option value="'+showList[i].showNo+'">'+showList[i].showName+'</option>';							
						}
					}
					
					// 기존에 있던 리스트 지우고 생성
					$("#show").empty();
					$("#show").html(str);
					
				}
			});
		});
		
		
		
		
	</script>

</div>
</body>
</html>
