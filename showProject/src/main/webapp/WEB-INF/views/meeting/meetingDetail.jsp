<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHOW-DETAIL</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        
        h1 {
            text-align: center;
            color: #333;
        }
        label {
            font-weight: bold;
            margin-top: 10px;
            display: block;
        }
        
        button {
            background-color: #597c9b;
            color: white;
            font-weight: bold;
            cursor: pointer;
            display: inline-block;
            width: 20%;
            padding: 10px;
            margin: 0px 50px 10px 0px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button:hover {
            background-color: #374f64;
        }

        .meeting{
            background-color: #f7f7f7;  
            cursor: pointer;
            text-align: left;
            width: 60%;
            margin: 0px auto;
            padding: 3%;
            padding-top: 30px;
            border: 1px solid lightgray;
	        border-radius: 0px 0px  10px 10px;
			border-top : none;
                
        }

        .content{
            background-color: white;
            padding: 20px 50px;
            margin: 10px 0px 10px 0px;
            border-radius: 10px;
            cursor: pointer;
        }

        .btn{
            text-align: center;
        }
        
        .pClass{
        	border: 1px solid lightgray;
        	padding: 10px 15px;
        	border-radius: 10px;
        	
        }

    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
     <div class="meeting">
      <h1>${meDetail.meetingTitle}</h1> <!-- DB에서 가져와서 보여줘야함. -->

         <label for="groupName"></label>
         <p></p>
         
         <div class="content">
             <div>
                 <h4>공연명</h4>
                 <p class="pClass">${meDetail.show.showName}</p>
             </div>  <!-- 사진 가져올 수 있으면 보여줘도 좋을 듯. -->
             <div>
                 <h4>모임 일자</h4>
                 <p class="pClass">${meDetail.meetingDate}</p>   <!-- 신청한 인원의 수 count 해서 보여줘야한다. -->
             </div>
             <div>
                 <h4>모임 장소</h4>
                 <p class="pClass">${meDetail.meetingPlace}</p>
             </div>

             <div>
                 <h4>모집 인원</h4> <!-- 신청 인원 count해서 보여줘야 한다. -->
                 <p class="pClass">${meetingCount} 명 / ${meDetail.meetingCount} 명</p>   <!-- 신청한 인원의 수 count 해서 보여줘야한다. -->
             </div>
 
             <div>
                 <h4>모집 기간</h4>
                 <p class="pClass">${meDetail.startDate} ~ ${meDetail.endDate}</p>
             </div>
             
             <div>
                 <h4>소모임 안내 사항</h4>
                 	<c:choose>
                 		<c:when test="${empty meDetail.infomation}">
			                <p class="pClass" style="color: gray;">
                 				안내사항이 없습니다.
			                </p>
                 		</c:when>
                 		<c:otherwise>
			                <p class="pClass">${meDetail.infomation}</p>
                 		</c:otherwise>
                 	</c:choose>
             </div>
         </div>

         <br>

         <!-- 참여 신청 버튼을 누르면 confirm 사용해서 바로 데이터 DB에 넣기 -->
         <div class="btn">
             <button type="button" id="joinbtn">참여하기</button>
             <button type="button" id="cancelbtn">참여취소</button>
             <button type="button" onclick="location.href='${contextPath}/meeting/list?currentPage=1'">목록으로</button>
         </div>
     </div>
	 <br><br>
     <jsp:include page="/WEB-INF/views/common/footer.jsp" />
     
     
     <script>
		var userNo = ${loginUser.userNo} ;
		var meetingNo = ${meDetail.meetingNo} ;
		var meDeUserNo = ${meDetail.userNo};

		// 참여 중인 인원
		var joinCount = ${meetingCount}; 
		// 참여 가능 인원 
		var meetingCount= ${meDetail.meetingCount};

		// 회원 본인이 생성한 소모임인 경우 참여, 참여 취소 불가능.
     	if(meDeUserNo == userNo){
			$("#joinbtn").attr("disabled", true).css("background-color", "gray");
			$("#cancelbtn").attr("disabled", true).css("background-color", "gray");
		}	
     
		if(meetingCount <= joinCount){
			$("#joinbtn").attr("disabled", true).css("background-color", "gray");
		}

		$("#joinbtn").on("click", function(){

			
			// 참여 가능 인원보다 참여중인 인원이 작은 경우에만 참여 신청 가능
			if(meetingCount > joinCount){
				if(confirm("참여하시겠습니까?")){
					$.ajax({
						url : "join",
						data : {
							userNo : userNo,
							meetingNo : meetingNo
						}, success(result){
							if(result>0){
								alert("참여 신청이 완료되었습니다.");
								location.href='${contextPath}/meeting/list';  // 마이페이지 경로로 바꿀까?
							}else{
								alert("참여 신청이 되어있습니다.");
							}
						}
					});
				}
			}
		});
		
		
		
		// 참여신청을 한 회원만 참여 취소 가능
		$("#cancelbtn").on("click", function(){
			// 회원 번호를 전달해서 DB(meetingJoin) 데이터에 없으면 참여자가 아니라는 alert 메시지 
			// 있으면 내역 삭제 후 alert 메시지 띄우기 
			
			if(confirm("참여 취소하시겠습니까?")){
				var userNo = ${loginUser.userNo} ;
				var meetingNo = ${meDetail.meetingNo} ;
				
				$.ajax({
					url : "joinCancle",
					type : "POST",
					data : {
						userNo : userNo,
						meetingNo : meetingNo
					}, success(result){
						if(result>0){
							alert("참여 취소가 완료되었습니다.");
							location.href='${contextPath}/meeting/list';
						}else{
							alert("참여 내역이 없습니다.");
						}
					}
				});
				
			}
			
			
		});
		
	 </script>
     
</body>
</html>
