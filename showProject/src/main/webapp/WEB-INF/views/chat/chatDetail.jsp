<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            width: 65%;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            border: 1px solid lightgray;
            
            display: flex;
            justify-content: space-between;
            border-radius: 8px;
            height: 600px;
        }

        .join {
            width: 25%;
            border-right: 1px solid #ddd;
        }

        .join p {
            font-size: 16px;
            font-weight: bold;
        }

        .join ul {
            list-style: none;
            padding: 0px;
        }

        .join li {
        	display : block;
            font-size: 14px;
            color: #555;
            margin-bottom: 10px;
        }

        .contnet {
            width: 75%;
            padding: 0px 40px 0px 40px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            font-weight: bold;
        }

        .chatArea {
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 8px;
            height: 490px;
            margin-bottom: 20px;
            
        }

        .info {
            margin-bottom: 15px;
            font-size: 14px;
            height: 75%;
            padding-top: 5px;
            overflow-y: scroll;  /* 세로 스크롤바 생성 */
	        overflow-x: hidden;
            box-sizing: border-box;
        }
        
        /* 스크롤바 영역에 대한 설정 */
        .info::-webkit-scrollbar{
        	width: 12px;
        	border-radius: 5px; 
        }
        /* 스크롤바 막대 설정 */
        .info::-webkit-scrollbar-thumb {
		    height: 30%; /* 스크롤바의 길이 */
		    background: #597c9b; /* 스크롤바의 색상 */
		    
		    border-radius: 10px;
		}
        /* 스크롤바 배경 설정 */
		.info::-webkit-scrollbar-track {
		    background: #e2ecf6;  /*스크롤바 뒷 배경 색상*/
		}
		
		
        #joinUser::-webkit-scrollbar{
        	width: 12px;
        	border-radius: 5px; 
        }
        /* 스크롤바 막대 설정 */
        #joinUser::-webkit-scrollbar-thumb {
		    height: 30%; /* 스크롤바의 길이 */
		    background: #597c9b; /* 스크롤바의 색상 */
		    
		    border-radius: 10px;
		}
        /* 스크롤바 배경 설정 */
		#joinUser::-webkit-scrollbar-track {
		    background: #e2ecf6;  /*스크롤바 뒷 배경 색상*/
		}
		

        .info p {
            border: 1px solid rgb(197,196,170);
            border-radius: 10px;
            max-width: 50%;
            padding: 10px;
            margin-left: 40px;
			background-color: rgb(248,247,211);            
        }
        
        .my p{
       		background-color: rgb(208,227,236);
       		border: 1px solid rgb(170,189,197);
       		margin-right: 10px;
       		max-width: 50%;
       		word-break: break-all;  /* 띄어쓰기가 없어도 줄바꿈을 할 수 있도록 한다. => 띄어쓰기 없이 문자를 이어서 보낼 경우 width를 넘겨버린다. */
        }

        .chat {
            display: flex;
            align-items: center;
        }

        .chat textarea {
            flex: 1;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 5px;
            outline: none;
            box-sizing: border-box;
            height: 40px;
            margin-right: 10px;
            
        }

        .chat button {
            background-color: #597c9b;
            color: white;
            border: none;
            padding: 0px 20px;
            font-size: 14px;
            height: 38px;
            border-radius: 4px;
            cursor: pointer;
        }

        .chat button:hover {
            background-color: #597c9b;
        }

        .chatArea .message {
            margin-bottom: 15px;
        }

        .chatArea .message .username {
            font-weight: bold;
            color: #4CAF50;
        }

        .chatArea .message .text {
            margin-top: 5px;
            font-size: 14px;
            color: #555;
            padding: 8px;
            background-color: #e9e9e9;
            border-radius: 5px;
            max-width: 75%;
        }
        #back{
        	margin-top: 5px;
        }
		
		.outBtn{
			border : 1px solid gray;	
        	background-color : white;
        	padding: 3px 10px;
        	border-radius: 8px;
		}
		
		#profile{
			border: 1px solid gray;
			border-radius: 15px;
			width: 30px;
			height: 30px;
		}
		
		#joinCount{
			color:green; text-align: right; margin: 0px 10px 0px 85px;
		}
		
		#joinUser{
			overflow-y : scroll;
			margin: 15px 20px 0px 0px;
			padding: 5%;
			height: 500px;
			border-radius: 8px;
			border: 1px solid lightgray;
			box-sizing: border-box;
		}

    </style>
</head>
<body>
    <%@include file="/WEB-INF/views/common/menubar.jsp" %>
    
    <div class="a">
        <div class="join">
	        <div style="padding: 0px 5px 0px 5px">
	           	<span>채팅방 참여자</span>
	           	<span id="joinCount">채팅방 참여자</span>
	        </div>
        	<p style="color: gray; font-size: 12px;">&nbsp;&nbsp;(현재 접속한 참여자)</p>
           	<div id="joinUser">
           		<ul></ul>
           	</div>
        </div>

        <div class="contnet">
            <div class="header">
            	<!-- 채팅방 생성 후 바로 페이지 이동이 될 경우 채팅방 생성 페이지로 이동됨. => list 페이지로 이동될 수 있도록 경로로 설정 -->
                <i id="back" class="fa-solid fa-angles-left" onclick="location.href='${contextPath}/chat/list'"></i>
                <span>${chatInfo.chatTitle}</span>&nbsp;
                <span>${chatInfo.show.showName}</span>
                <c:choose>
                	<c:when test="${chatInfo.userNo == loginUser.userNo}">
                		<span><button type="button" class="outBtn" onclick="disconnect();" value="deleteChat"> 채팅방 삭제</button></span>
                	</c:when>
                	<c:otherwise>
		                <span><button type="button" class="outBtn" onclick="disconnect();" value="deleteJoin">나가기</button></span>
                	</c:otherwise>
                </c:choose>
            </div>
            <hr>
            <div class="chatArea">
            	<p style="color: red; font-size: 10px; text-align: right;">* 나가기 버튼을 누르면 채팅방에서 즉시 탈퇴됩니다. 채팅방을 유지하려면 뒤로가기 버튼을 눌러주세요. <br>채팅방 목록은 [마이페이지 > My서비스 > 내 채팅방]에서 확인할 수 있습니다.</p>
                <div class="info">
                    <!-- 내 메세지인 경우에는 오른쪽에 표시되도록 조건 처리 필요 -->
					<!-- 기존 채팅 내역 출력 -->
					<c:if test="${not empty chatMeList}">
						<c:forEach var="cml" items="${chatMeList}">
							<c:choose>
								<c:when test="${loginUser.userNo == cml.userNo}">
									<div align='right' class='my'>
										<p>${cml.chatContent}</p>
									</div>
								</c:when>
								<c:otherwise>
								<c:choose>
									<c:when test="${empty cml.member.changeName}">
										<div>
											<div>
												<img src="${contextPath}/resources/profile/white.png" id="profile">
		                        				&nbsp;&nbsp;  ${cml.member.userId}
		                        			</div>
		                        			<p>${cml.chatContent}</p>
		                        		</div>
									</c:when>
									<c:otherwise>
										<div>
											<div>
		                        				<img src="${contextPath}/resources/profile/${cml.member.changeName}" id="profile">
		                        				&nbsp;&nbsp;  ${cml.member.userId}
		                        			</div>
		                        			<p>${cml.chatContent}</p>
				                        </div>
									</c:otherwise>
								</c:choose>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:if>
                </div>
                <hr>
                <div class="chat">
                	<textarea id="chatMsg" class="form-control" placeholder="메시지를 입력해 주세요." style="resize: none; "></textarea>
                    <button class="btn btn-secondary" onclick="send();">전송</button>
                </div>
            </div>
        </div>
    </div>  
	
	<script>
		console.log(${chatInfo.userNo});
		console.log(${loginUser.userNo});
	
		// 스크롤 제일 하단 보기 => 어떤 원리인지 공부하기 
		var $info = $(".info"); 
		$info.scrollTop($info[0].scrollHeight);
	
		// 페이지가 로드되면 바로 소켓 연결 
		$(document).ready(function(){
			connect();
		})
		
		// 웹 소켓 접속 
		var socket;
		
		// 소켓 연결 
		function connect(){
			// 소켓 생성
			var url = "ws://localhost:8888/show/chat/chattings";
			
			if(!socket){//소켓이 없을때만 
				socket = new WebSocket(url);
			}
			
			// 연결되었을 때 
			socket.onopen = function(result){
				console.log("연결 성공");
			}
			
			// 연결 종료 
			socket.onclose = function(){
				console.log("연결 종료");
			}
			
			// 에러 발생 시 
			socket.onerror = function(e){
				console.log("에러");
				console.log(e);
			}
			
			
			socket.onmessage = function(message){
				console.log("메시지 수신");
				
				//전달받은 json 형태의 문자열을 json 객체로 파싱하기
				var data = JSON.parse(message.data);
			
				// 참여 했을 때와 대화를 할 때 전달받는 메시지의 Object 객체 명이 다르기 때문에 해당 객체의 key 값으로 조건처리해서 데이터를 뿌려준다.
				// 참여자 영역
				if(data.userList){
					var userList = data.userList;
					var joinSize = data.joinSize;
				
					var count = joinSize + "명 참여 중" ;
					
				    $("#joinCount").text(count);
				    
				    $(".join ul").empty(); 
				    
				    var userStr = "";
				    	
					for(var i=0; i < userList.length; i++){
						if(userList[i].changeName == null){
							userStr += "<li>"
		                         + '<img src="${contextPath}/resources/profile/white.png" id="profile">'
		                         + "&nbsp;&nbsp;" + userList[i].userId 
		                         + "</li>";
						}else{
							userStr += "<li>"
			                         + '<img alt="" src="${contextPath}/resources/profile/' + userList[i].changeName + '" id="profile">' 
			                         + "&nbsp;&nbsp;" + userList[i].userId 
			                         + "</li>";
						}
						
				    }
					
				    $(".join ul").html(userStr);
				}
				
				
			    if(data.mem){
					// 채팅 영역 
					var div = $(".info");
					
					var chatUserId = data.mem.userId;
					// 데이터는 HashMap으로 전달받음. key 값에 접근하여 데이터 view에 보여주기
					// 내가 전송한 것과 아닌 것 구분해서 스타일 적용. 
					var loginUserId = "${loginUser.userId}";
					var changeName = data.mem.changeName;
					console.log(changeName);
										
					var newMessage = "";
					
					//내가 보낸 채팅 (채팅을 보낸 사람과 로그인한 사람의 아이디가 일치하는 경우) 
					if(loginUserId == chatUserId){
						newMessage += "<div align='right' class='my'>"
									+ "<p>"
									+ data.cm.chatContent
									+ "</p></div>";
					}else{
						// 상대방이 채팅을 보냈을 때. 
						// changeName 프로필이 없는 경우 
						if((changeName == null) || (changeName == "")){
							newMessage += "<div><div>"
		                        + '<img src="${contextPath}/resources/profile/white.png" id="profile">'
		                        + "&nbsp;&nbsp;&nbsp;" + chatUserId
		                        + "</div><p>"
		                        + data.cm.chatContent
		                        + "</p></div>";
						}else{
							// changeName 프로필이 있는 경우
							newMessage += "<div><div>"
		                        + '<img src="${contextPath}/resources/profile/'+changeName+'" id="profile">'
		                        + "&nbsp;&nbsp;&nbsp;" + chatUserId
		                        + "</div><p>"
		                        + data.cm.chatContent
		                        + "</p></div>";
						}

					}
					
					
					div.append(newMessage);
					
					$info.scrollTop($info[0].scrollHeight);
			    }
			}
			
		}
		
		// 채팅 전송 
		function send(){
			
			// 입력 메시지 
			var msg = $("#chatMsg").val();

			// 소켓에 전달 
			socket.send(msg);
			
			// 입력 메시지 지우기 
			$("#chatMsg").val("");
		}
		
		
		
		// 접속 종료 
		function disconnect(){
			// 커뮤니티 페이지로 이동하고(이전페이지?), 데이터 삭제 
			// 뒤로가기 : 접속 종료만 history.back() 사용해서 조건 처리 필요 없음
			// 나가기 : 접속종료 및 DB 데이터 삭제 
			
			var deleteVal = $(".outBtn").val()
			
			// 나가기 / 채팅방 삭제  버튼 value 값을 가져와 각 버튼 기능 처리 
			if(deleteVal == 'deleteChat'){ // 채팅방 삭제 
				$.ajax({
					url: "deleteChat",
					type : "POST",
					data : {
						chatNo : ${chatInfo.chatNo}
					},
					success : function(){
						alert("채팅방이 삭제되었습니다.");
						location.href='${contextPath}/chat/list';
					},
					error : function(){
						console.log("오류발생")	
					}
				});
			}else if(deleteVal == 'deleteJoin'){ // 참여자에서 삭제 
				$.ajax({
					url: "joinDelete",
					type : "POST",
					data : {
						chatNo : ${chatInfo.chatNo},
						userNo : ${loginUser.userNo}
					},
					success : function(){
						alert("채팅방 목록에서 삭제됩니다.");
						location.href='${contextPath}/chat/list';
					},
					error : function(){
						console.log("오류발생")	
					}
				});
				
			}
			
			socket.close();
			
		}
		
		
		
	</script>

<br><br>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>



