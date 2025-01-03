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
            width: 70%;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            border: 1px solid lightgray;
            
            display: flex;
            justify-content: space-between;
            border-radius: 8px;
            height: 550px;
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
            height: 440px;
            margin-bottom: 20px;
            
        }

        .info {
            margin-bottom: 15px;
            font-size: 14px;
            height: 80%;
            overflow: auto;  /* 세로 스크롤바 생성 */
        }

        .info p {
            border: 1px solid gray;
            border-radius: 10px;
            width: 30%;
            padding: 10px;
        }
        .info p.my{
            align-self: flex-end;
        }

        .chat {
            display: flex;
            align-items: center;
            gap: 10px;
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


    </style>
</head>
<body>
    <%@include file="/WEB-INF/views/common/menubar.jsp" %>
    
    <div class="a">
        <div class="join">
            <p>채팅방 참여자</p>
            <ul>
                <li>z</li>
                <li>z</li>
            </ul> 
        </div>

        <div class="contnet">
            <div class="header">
                <span>채팅방 제목</span>
                <span>공연명</span>
                <span>X</span>
            </div>
            <hr>
            <div class="chatArea">
                <div class="info">
                    <!-- 내 메세지인 경우에는 오른쪽에 표시되도록 조건 처리 필요 -->
                    <p>메세지</p>
                    <p>메세지</p>
                    <p class="my">메세지</p>
                    <p>메세지</p>
                    <p>메세지</p>
                    <p>메세지</p>
                    <p class="my">메세지</p>
                    <p>메세지</p>
                    <p>메세지</p>
                    <p>메세지</p>
                    <p>메세지</p>
                </div>
                <hr>
                <div class="chat">
                    <input type="text" class="form-control" placeholder="메시지를 입력해 주세요."> 
                    <button class="btn btn-secondary">전송</button>
                </div>
            </div>
        </div>
    </div>
	
	<script>
		// 스크롤 제일 하단 보기 => 어떤 원리인지 공부하기 
		var $info = $(".info");
		$info.scrollTop($info[0].scrollHeight);
	
	</script>

<br><br>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>