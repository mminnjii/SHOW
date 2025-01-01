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
            width: 50%;
            margin: 0px auto;
            background-color: white;
            padding: 3% 5%;
            border: 1px solid lightgray;
            border-radius: 0px 0px  10px 10px;
			border-top : none;
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

    .a input, .a select {
        width: 100%;
        height:auto;
        padding: 10px;
        margin: 8px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    
    .showDiv22 select, .showDiv22 input {
	    width: 100%;
	    height: 40px;
	}
	
    .divButton {
        font-weight: bold;
        cursor: pointer;
        height: 40px;
        box-sizing: border-box;
        display: flex;
        justify-content: right;
        margin-top: 15px;
    }
    
    
    .divbtn{
        width: 30%;
        border: 1px solid #ccc;
        border-radius: 4px;
        background-color: #597c9b;
	    padding: 10px 20px;
        color: white;
        cursor: pointer;
        text-align: center; 
    }

    button:hover {
        background-color: #374f64;
    }
    
    .showDiv22{
    	display: inline-block;
    }
    
    .showDiv22 i {
    	position: absolute;  /* 아이콘 위치 고정 */
		color: gray;
		margin-left: 10px;
		margin-top: 20px;
    }
    
    .showDiv22 input{
    	width: 100%;
    	padding-left: 35px;
    }
    
</style>
</head>
<body>

<%@include file="/WEB-INF/views/common/menubar.jsp" %>
<div class="a">


    <h1>채팅방 생성</h1>
    <form action="chatInsert" method="POST">
    
        <label for="chatTitle">채팅 제목</label>
        <input type="text" id="chatTitle" name="chatTitle" placeholder="채팅방 제목을 입력하세요" required>
        
        <label for="category">공연</label>
        <!-- 공연 정보 불러와서 -->
        <!-- GENRE 테이블 정보 가져오기 -->
       	<div id="showDiv1" class="showDiv2 showDiv22" style="width: 200px;">
	        <select id="category" name="category" required>
	            <option value="" disabled selected>공연카테고리를 선택하세요</option>
	            <c:forEach var="g" items="${genreList}">
		            <option value="${g.genreNo}" id="genreNo">${g.genreName}</option>
	            </c:forEach>
	        </select>
       	</div>

       	<div id="showDiv2" class="showDiv22" style="width: 300px;">
			<i class="fa-solid fa-magnifying-glass"></i>
			<input type="text" id="keyword" name="keyword" placeholder="카테고리를 선택 후 공연명을 검색하세요.">
       	</div>

       	<div id="showDiv3" class="showDiv22" style="width: 430px;"> 
			<!-- 공연 정보 불러오기 -->        
			<select id="show" name="showNo">
				<option disabled selected>카테고리를 선택하면 공연을 선택할 수 있습니다.</option>
			</select>
       	</div>

        <label for="userNo">회원 ID</label>
        <input type="text" id="userId" name="userId" value="${loginUser.userId}" readonly>
		<input type="hidden" name="userNo" value="${loginUser.userNo}">
        
        <label for="chatUserCount">채팅방 정원</label>
        <select name="chatUserCount" id="chatUserCount" required>
        	<option value="" style="color: lightgray;" disabled selected>채팅 입장 정원을 선택해 주세요.</option>
        	<c:forEach var="mc" begin="1" end="50">
	        	<option value="${mc}">${mc} 명</option>
        	</c:forEach>
        </select>
        
        <div class="divButton" align="center">
	        <button type="submit" class="divbtn">채팅방 생성</button>
        </div>
    </form>
	
	<script>
		
		// 카테고리 클릭 시 해당 카테고리에 해당하는 show 목록 불러오기 (동적으로 생성된 카테고리 option을 선택하는 것이기 때문에 .on 메소드 사용)
		$("#showDiv1").on("change", "#category", function(){
			$.ajax({  // meeting controller에서 동일한 작업을 했기 때문에 해당 url 경로 입력.
				url: "${contextPath}/meeting/selectShow",
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
		
		// 검색 input 박스 안의 내용 변경시 검색어가 포함된 리스트 생성 
		$("#showDiv2").on("input", "#keyword", function(){
			
			console.log($("#genreNo").val());
			console.log($("#keyword").val());
			
			$.ajax({  // meeting controller에서 동일한 작업을 했기 때문에 해당 url 경로 입력.
				url: "${contextPath}/meeting/searchShow",
				data: {
					genreNo : $("#genreNo").val(),
					keyword : $("#keyword").val()
				}, 
				success : function(showList){
					console.log(showList);
					
					var str = "";
					
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
<br><br>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
