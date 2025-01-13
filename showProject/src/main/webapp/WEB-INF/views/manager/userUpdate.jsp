<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 수정</title>
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
		        <h1>사용자 정보 수정</h1>
		<form action="${contextPath}/managerPage/userUpdate" method="POST">
		    <!-- 제목 -->
		    <div class="form-group">
		    	<input type="hidden" id="userNo" name="userNo" value="${member.userNo}">
		        <label for="noticeTitle">아이디</label>
		        <input type="text" id="userId" name="userId" value="${member.userId}" required>
		    </div>
		
		    <!-- 공지 내용 -->
		    <div class="form-group">
		        <label for="userName">이름</label>
		        <input type="text" id="userName" name="userName" value="${member.userName}" required>
		    </div>
		    
		    <div class="form-group">
		        <label for="userRrn">주민번호(외국인 등록번호)</label>
		        <input type="text" id="userRrn" name="userRrn" value="${member.userRrn}" required>
		    </div>
		    
		    <div class="form-group">
		        <label for="phone">연락처</label>
		        <input type="text" id="phone" name="phone" value="${member.phone}" required>
		    </div>
		    
		    <div class="form-group">
		        <label for="userEmail">이메일</label>
		        <input type="text" id="userEmail" name="userEmail" value="${member.email}" required>
		    </div>

		    <div class="form-group">
		        <label for="userAddress">주소</label>
		        <input type="text" id="userAddress" name="userAddress" value="${member.address}" required>
		    </div>
		    
		    <div class="form-group">
		        <label for="userRank">등급</label>
		        <input type="text" id="userRank" name="userRank" value="${member.rank}" required>
		    </div>
		    
		    <div class="form-group">
		        <label for="userSubscribe">구독 여부</label>
		        <input type="text" id="userSubscribe" name="userSubscribe" value="${member.subscribe}" required>
		    </div>

			<div class="button-container">
		        <button type="submit" class="submit-btn">수정하기</button>
		    </div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>