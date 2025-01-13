<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임 확인 및 수정</title>
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
		        <h1>소모임 확인 및 수정</h1>
		<form action="${contextPath}/managerPage/meetingUpdate" method="POST">
		    <div class="form-group">
		        <label for="meetingNo">소모임 번호</label>
		        <input type="text" id="meetingNo" name="meetingNo" value="${meeting.meetingNo}" readonly>
		    </div>
		
		    <div class="form-group">
		        <label for="meetingCreatorNo">소모임 주최 유저 번호</label>
		        <input type="text" id="meetingCreatorNo" name="meetingCreatorNo" value="${meeting.userNo}" readonly>
		    </div>
		    
		    <div class="form-group">
		        <label for="meetingCreatorId">소모임 주최 유저 아이디</label>
		        <input type="text" id="meetingCreatorId" name="meetingCreatorId" value="${meeting.userId}" readonly>
		    </div>
		    
		    <div class="form-group">
		        <label for="meetingTitle">소모임 제목</label>
		        <input type="text" id="meetingTitle" name="meetingTitle" value="${meeting.meetingTitle}">
		    </div>
		    
		    <div class="form-group">
		        <label for="showNo">소모임 주제(공연) 번호</label>
		        <input type="text" id="showNo" name="showNo" value="${meeting.showNo}" readonly>
		    </div>
		    
		    <div class="form-group">
		        <label for="showName">소모임 주제(공연) 이름</label>
		        <input type="text" id="showName" name="showName" value="${meeting.showName}" readonly>
		    </div>
		    
		    <div class="form-group">
		        <label for="meetingPlace">소모임 주최 장소</label>
		        <input type="text" id="meetingPlace" name="meetingPlace" value="${meeting.meetingPlace}" readonly>
		    </div>

		    <div class="form-group">
		        <label for="meetingCount">소모임 인원</label>
		        <input type="text" id="meetingCount" name="meetingCount" value="${meeting.meetingCount}" readonly>
		    </div>
		    
		    <div class="form-group">
		        <label for="meetingDate">소모임 주최 날짜</label>
		        <input type="text" id="meetingDate" name="meetingDate" value="${meeting.meetingDate}" readonly>
		    </div>
		    
		    <div class="form-group">
		        <label for="meetingStartDate">소모임 구인 시작 날짜</label>
		        <input type="text" id="meetingStartDate" name="meetingStartDate" value="${meeting.startDate}" readonly>
		    </div>
		    
		    <div class="form-group">
		        <label for="meetingEndDate">소모임 구인 종료 날짜</label>
		        <input type="text" id="meetingEndDate" name="meetingEndDate" value="${meeting.endDate}" readonly>
		    </div>
		    
		    <div class="form-group">
		    	<label for="Info">소모임 상세내용</label>
		    	<textarea id="infomation" name="infomation">${meeting.information}</textarea>
		    </div>
			
			<div class="button-container">
		        <button type="submit" class="submit-btn">수정하기</button>
		    </div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>