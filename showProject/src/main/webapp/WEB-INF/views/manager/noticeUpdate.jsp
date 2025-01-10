<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 수정</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
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

        .form-group input[type="file"] {
            padding: 0;
        }

        .form-group textarea {
            height: 250px;
            resize: none;
        }

        .form-group .image-preview {
		    width: 100%;
		    height: 200px; /* 높이를 조정할 수 있습니다 */
		    background-color: #bdc3c7;
		    border-radius: 5px;
		    margin-top: 10px;
		    overflow: hidden; /* 이미지가 공간을 넘지 않게 */
		    display: flex;
		    justify-content: center;
		    align-items: center;
		}
		
		.form-group .image-preview img {
		    max-width: 100%;  /* 부모 영역을 넘지 않도록 */
		    max-height: 100%;
		    object-fit: contain;  /* 비율을 유지하며 크기를 맞춤 */
		    border-radius: 5px;
		}
		
		.image-preview img {
		    width: 100%;
		    height: auto;
		    max-width: 500px;  /* 예시로 크기 제한 */
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
		        <h1>공지사항 수정</h1>
		<form action="${contextPath}/managerPage/noticeUpdate" method="POST">
		    <!-- 제목 -->
		    <div class="form-group">
		        <label for="showTitle">공지사항 제목</label>
		        <input type="text" id="noticeTitle" name="noticeTitle" value="${notice.noticeTitle}" required>
		        <input type="hidden" id="noticeNo" name="noticeNo" value="${notice.noticeNo}">
		    </div>

		    <!-- 상세 내용 -->
		    <div class="form-group">
		        <label for="showExplain">공지사항 내용</label>
		        <textarea id="noticeContent" name="noticeContent" required>${notice.noticeContent}</textarea>
		    </div>
		    
		    <div class="form-group">
		        <label for="noticeCreateDate">작성일</label>
		        <input type="text" id="noticeCreateDate" name="noticeCreateDate" value="${notice.createDate}" readonly>
		    </div>
			
			<div class="button-container">
		        <button type="submit" class="submit-btn">수정하기</button>
		    </div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>