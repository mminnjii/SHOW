<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅방 관리</title>
<style>
        body {
            font-family: 'Montserrat', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7fa;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            text-align: center;
            color: #34495e;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 16px;
            color: #34495e;
            margin-bottom: 5px;
        }

        .form-group input, .form-group textarea, .form-group select {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #bdc3c7;
            border-radius: 5px;
            background-color: #ecf0f1;
            box-sizing: border-box;
        }

        .form-group textarea {
            height: 150px;
            resize: none;
        }
		
		.form-group {
		    max-width: 100%;  /* 부모 영역을 넘지 않도록 */
		    max-height: 100%;
		    object-fit: contain;  /* 비율을 유지하며 크기를 맞춤 */
		    border-radius: 5px;
		}

        .button-container {
            text-align: center;
        }

        .submit-btn {
            background-color: #27ae60;
            color: white;
            padding: 15px 30px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background-color: #2ecc71;
        }
    </style>
</head>
<body>

	<%@include file="/WEB-INF/views/common/menubar.jsp" %>
	    <div class="container">
		        <h1>채팅방 관리</h1>
		<form action="${contextPath}/managerPage/chatUpdate" method="POST">
		    <div class="form-group">
		        <label for="chatNo">채팅방 번호</label>
		        <input type="text" id="chatNo" name="chatNo" value="${chat.chatNo}" readonly>
		    </div>
		
		    <div class="form-group">
		        <label for="chatTitle">채팅방 제목</label>
		        <input type="text" id="chatTitle" name="chatTitle" value="${chat.chatTitle}">
		    </div>

		    <div class="form-group">
		        <label for="chatShowNo">채팅방 주제 공연 번호</label>
		        <input type="text" id="chatShowNo" name="chatShowNo" value="${chat.showNo}" readonly>
		    </div>

		    <div class="form-group">
		        <label for="chatShowTitle">채팅방 주제 공연 제목</label>
		        <input type="text" id="chatShowTitle" name="chatShowTitle" value="${chat.showTitle}" readonly>
		    </div>

		    <div class="form-group">
		        <label for="chatUserNo">채팅방 개설자 번호</label>
		        <input type="text" id="chatUserNo" name="chatUserNo" value="${chat.userNo}" readonly>
		    </div>
		    
		    <div class="form-group">
		        <label for="chatUserId">채팅방 개설자 아이디</label>
		        <input type="text" id="chatUserId" name="chatUserId" value="${chat.userId}" readonly>
		    </div>

		    <div class="form-group">
		        <label for="chatUserCount">채팅방 유저 수</label>
		        <input type="text" id="chatUserCount" name="chatUserCount" value="${chat.chatUserCount}" readonly>
		    </div>

		    <div class="form-group">
		        <label for="chatCreateDate">채팅방 개설 날짜</label>
		        <input type="text" id="chatCreateDate" name="chatCreateDate" value="${chat.createDate}" readonly>
		    </div>
			
			<div class="button-container">
		        <button type="submit" class="submit-btn">수정하기</button>
		    </div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>