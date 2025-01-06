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
            height: 85%;
            overflow: auto;  /* 세로 스크롤바 생성 */
        }

        .info p {
            border: 1px solid gray;
            border-radius: 10px;
            max-width: 50%;
            padding: 10px;
            margin-left: 40px;
        }
        .info p.my{
            align-self: flex-end;
        }

        .chat {
            display: flex;
            align-items: center;
        }

        .chat input {
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
			height: 520px;
			border-radius: 8px;
			border: 1px solid lightgray;
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
           	<div id="joinUser"><ul></ul></div>
        </div>

        <div class="contnet">
            <div class="header">
                <i id="back" class="fa-solid fa-angles-left" onclick="history.back();"></i>
                <span>${chatInfo.chatTitle}</span>&nbsp;
                <span>${chatInfo.show.showName}</span>
                <span><button type="button" class="outBtn" onclick="disconnect();">나가기</button></span>
            </div>
            <hr>
            <div class="chatArea">
                <div class="info">
                    <!-- 내 메세지인 경우에는 오른쪽에 표시되도록 조건 처리 필요 -->
					
                </div>
                <hr>
                <div class="chat">
                    <input id="chatMsg" type="text" class="form-control" placeholder="메시지를 입력해 주세요."> 
                    <button class="btn btn-secondary" onclick="send();">전송</button>
                </div>
            </div>
        </div>
    </div>  
	
	<script>
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
				console.log(result);
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
				console.log(message);
				
				
				//전달받은 json 형태의 문자열을 json 객체로 파싱하기
				var data = JSON.parse(message.data);
				console.log(data);
			
				// 참여자 영역
				if(data.userList){
					var userList = data.userList;
					var joinSize = data.joinSize;
				
					var count = joinSize + "명 참여 중" ;
					
				    $("#joinCount").text(count);
				    
				    $(".join ul").empty(); 
				    
				    var userStr = "";
				    	
					for(var i=0; i < userList.length; i++){
						userStr +=  "<li>" + userList[i].userId + "</li>";
				    }
					
					console.log("userStr : " + userStr);
					
				    $(".join ul").html(userStr);
				    
				}
			    
			    if(data.mem){
					// 채팅 영역 
					var div = $(".info");
					
					var chatUserId = data.mem.userId;
					
					// 데이터는 HashMap으로 전달받음. key 값에 접근하여 데이터 view에 보여주기
					// 내가 전송한 것과 아닌 것 구분해서 스타일 적용. 
					var loginUserId = "${loginUser.userId}";
						
					var newMessage = "";
					if(loginUserId == chatUserId){
						newMessage += "<div align='right'>"
									+ "<p>"
									+ data.cm.chatContent
									+ "</p></div>";
					}else{
						newMessage += "<div><div>"
									+ '<img alt="" src="" id="profile">'
									+ "&nbsp;" + chatUserId
									+ "</div><p>"
									+ data.cm.chatContent
									+ "</p></div>";
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
			console.log(msg);

			// 소켓에 전달 
			socket.send(msg);
			
			// 입력 메시지 지우기 
			$("#chatMsg").val("");
		}
		
		
		
		// 접속 종료 
		function disconnect(){
			// 커뮤니티 페이지로 이동하고(이전페이지?), 데이터 삭제 
			// 뒤로가기 버튼과 나가기 버튼 구분해서 
			// 뒤로가기 : 접속 종료만 
			// 나가기 : 접속종료 및 DB 데이터 삭제 
			
			socket.close();
			
		}
		
		
		
	</script>

<br><br>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>