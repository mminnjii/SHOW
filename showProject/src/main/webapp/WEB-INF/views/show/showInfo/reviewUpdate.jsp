<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<% 
	Member loginMember = (Member)session.getAttribute("loginUser");
%>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .content {
            background-color:rgb(247, 245, 245);
            width:100%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }

        #enrollForm {width:100%;}
        #enrollForm * {margin:5px;}
        
    button {
			padding: 10px 20px; 
			font-size: 16px; 
			font-family: 'Noto Sans KR', sans-serif; 
			border: 1px solid gray; 
			border-radius: 5px;
			cursor: pointer;
		}
        
        .star {
		    width: 30px;
		    height: 30px;
		    background-color: gray;  /* 기본 색상: 회색 */
		    display: inline-block;
		    margin-right: 5px;
		    cursor: pointer;  /* 클릭 가능하게 설정 */
		    clip-path: polygon(50% 0%, 61% 35%, 98% 35%, 68% 57%, 79% 91%, 50% 70%, 21% 91%, 32% 57%, 2% 35%, 39% 35%);  /* 별 모양을 만들기 위한 clip-path */

		} 
		
		.star.filled {
		    background: gold; /* 채워진 별 */
		}
		
 		.star.half {
		    background: linear-gradient(to right, gold 50%, gray 50%); /* 부분적으로 채워진 별 */
		} 
        
    </style>
</head>
<body>
        
   <%@include file="/WEB-INF/views/common/menubar.jsp" %>

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>후기 작성하기</h2>
            <br>
            	<input type="hidden" id="writer" class="form-control" value="${loginUser.userNo }"  readonly>
            	<input type="hidden" id="replyNo" class="form-control" value="${r.reviewId}" readonly>
                <c:if test="${not empty r }">
	                <table align="center" id="enrollForm">
	                	<tr>
	                        <th><label for="rank">평점</label></th>
	                        <td>
		                      	<c:forEach var="i" begin="1" end="5">
								        <!-- 평점에 따라 별을 채우거나 비움 (초기값은 비어있는 상태) -->
								        <div class="star" 
								             data-value="${i}" 
								             class="empty" 
								             style="--percent: ${rank}%;"> <!-- 초기값은 0% -->
								        </div>
								</c:forEach> 
	                        </td>
	                    </tr>
	                    <tr>
	                        <th><label for="title">제목</label></th>
	                        <td><input type="text" id="title" class="form-control" value="${r.reviewTitle }" required></td>
	                    </tr>
	                    <tr>
	                        <th><label for="writer">작성자</label></th>
	                        <td><input type="text" class="form-control" value="${loginUser.userId }" readonly></td>
	                    </tr>
	                    <tr>
	                        <th><label for="content">내용</label></th>
	                        <td><textarea id="content" class="form-control" rows="10" style="resize:none;" required>${r.reviewContent }</textarea></td>
	                    </tr>
	                </table>
                </c:if>
                <br>

                <div align="center">
                    <button id="submit">수정하기</button>
                    <button id="reset">취소하기</button>
                </div>
        </div>
        <br><br>

    </div>
    
    <script>
    
	    $('.star').on('mouseover', function() {
	        const rating = $(this).data('value');  // 현재 hover된 별의 data-value 값
	        const allStars = $('.star');  // 모든 별을 선택
	
	        allStars.removeClass('filled').addClass('empty');  // 모든 별을 비운 상태로 초기화
	
	        // 마우스오버한 별까지 전체를 채움
	        for (let i = 0; i < rating; i++) {
	            $(allStars[i]).addClass('filled').removeClass('empty');
	        }
	    });
	
	    // 마우스 아웃 시 원래 상태로 돌아감
	    $('.star').on('mouseout', function() {
	        const rating = $(this).data('value');  // hover된 별의 data-value 값
	        const allStars = $('.star');  // 모든 별을 선택
	        allStars.removeClass('filled').addClass('empty');  // 모든 별을 비운 상태로 초기화
	
	        // 클릭된 별이 있다면 해당 값까지 전체 별을 채움
	        const currentRating = parseInt($('.star.filled').last().data('value')) || 0;
	        for (let i = 0; i < currentRating; i++) {
	            $(allStars[i]).addClass('filled').removeClass('empty');
	        }
	    });
	    
	    
	    var rating = "";
	    
	    // 클릭 시 선택된 값을 저장
	    $('.star').on('click', function() {
	        rating = $(this).data('value');  // 현재 hover된 별의 data-value 값
	        const allStars = $('.star');  // 모든 별을 선택
	
	        // 마우스오버한 별까지 전체를 채움
	        for (let i = 0; i < rating; i++) {
	            $(allStars[i]).addClass('filled');
	        }
	        
	        $('.star').off('mouseover').off('mouseout').off('click');  // 이벤트 비활성화
  
	    });
   		
	    
	    
	    
	    $('#submit').on('click',function(){     
	        var title = $("#title").val();
	        var content = $("#content").val();
	        var replyNo = $("#replyNo").val();
	        
	        console.log(replyNo);
	        
	        if(rating != ""){
	        	if(title != ""){
	        		if(content != ""){
	          			$.ajax({
			 	        	
			 	        	url : "/show/showInfo/updateReview",
			 	        	data : {
			 	        		
			 	        		reviewScore : rating,
			 	        		reviewTitle : title,
			 	        		reviewContent : content,
			 	        		reviewId : replyNo
			 	        	},
			 	        	
			 	        	type: 'POST',  
			 	        	success : function(result){
			 	        		if(result=="NNNNY"){
				 	        		alert("리뷰수정에 성공했습니다");
				 	        		window.location.href = '/show/showInfo/review';
			 	        		}else{
			 	        			alert("리뷰수정에 실패했습니다");
			 	        		}
			 	        	},
			 	        	error : function(fail){

			                     console.log("통신오류");
			 	        	}
			 	        });   

	        		}else{
	        			alert("내용을 입력해 주세요");
	        		}
	        	}else{
	        		alert("제목을 입력해 주세요");
	        	}
	        }else{
	        	alert("평점을 선택해 주세요");
	        }
	    	
	    });
	    
	    
	    
	    
	    
	    
	    $('#reset').on('click',function(){
	    	history.back();
	    });
	    
	    
	    
	    
    </script>
    
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
</body>
</html>