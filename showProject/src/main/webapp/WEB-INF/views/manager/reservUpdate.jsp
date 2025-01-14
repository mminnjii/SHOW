<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 관리</title>
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
		        <h1>예약 관리</h1>
		<form action="${contextPath}/managerPage/reservUpdate" method="POST">
		    <div class="form-group">
		        <label for="reservId">예약번호</label>
		        <input type="text" id="reservId" name="reservId" value="${reserv.reservationId}" readonly>
		    </div>

			<div class="form-group">
		        <label for="reservShowNo">예약 공연 번호</label>
		        <input type="text" id="reservShowNo" name="reservShowNo" value="${reserv.showNo}">
		    </div>
		
		    <div class="form-group">
		        <label for="reservShowName">예약 공연 이름</label>
		        <input type="text" id="reservShowName" name="reservShowName" value="${reserv.showName}">
		    </div>

		    <div class="form-group">
		        <label for="reservShowRound">공연 회차</label>
		        <input type="text" id="reservShowRound" name="reservShowRound" value="${reserv.roundId}">
		    </div>

		    <div class="form-group">
		        <label for="reservUserId">예약자 아이디</label>
		        <input type="text" id="reservUserId" name="reservUserId" value="${reserv.userId}" readonly>
		    </div>

		    <div class="form-group">
		        <label for="reservUserName">예약자 이름</label>
		        <input type="text" id="reservUserName" name="reservUserName" value="${reserv.userName}" readonly>
		    </div>
		    
		    <div class="form-group">
		        <label for="reservHallName">공연장</label>
		        <input type="text" id="reservHallName" name="reservHallName" value="${reserv.hallName}">
		    </div>

		    <div class="form-group">
		        <label for="reservCreateDate">예약일자</label>
		        <input type="text" id="reservCreateDate" name="reservCreateDate" value="${reserv.createDate}" readonly>
		    </div>

		    <div class="form-group">
		        <label for="reservPrecaution">유의사항</label>
		        <input type="text" id="reservPrecaution" name="reservPrecaution" value="${reserv.precaution}" readonly>
		    </div>
			
			<div class="button-container">
		        <button type="submit" class="submit-btn">수정하기</button>
		    </div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>