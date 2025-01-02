<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.sidebar {
        width: 250px;
        background-color: #2c3e50;
        height: 100vh;
        color: #fff;
        padding-top: 20px;
    }
        
    .sidebar h2 {
        text-align: center;
        color: #fff;
    }
        
    .sidebar > button {
        display: block;
        width: 100%;
        padding: 40px;
        background-color: #2c3e50;
        color: #fff;
        text-decoration: none;
        font-size: 18px;
        border-bottom: 1px solid #34495e;
    }

    .sidebar > button:hover {
        background-color: #34495e;
        cursor: pointer;
    }
    
    .content-buttons {
        display: flex;
        justify-content: space-around;
        margin-top: 20px;
    }

    .content-buttons a {
        padding: 15px 30px;
        background-color: #2980b9;
        color: white;
        border-radius: 5px;
        text-decoration: none;
        font-size: 16px;
        text-align: center;
    }

    .content-buttons a:hover {
        background-color: #3498db;
    }

    .notice-list {
        margin-top: 20px;
    }

    .notice-item {
        padding: 15px;
        background-color: #ecf0f1;
        margin-bottom: 10px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .notice-item:hover {
        background-color: #bdc3c7;
    }

    .notice-detail {
        display: none;
        margin-top: 10px;
        padding: 10px;
        background-color: #fff;
        border: 1px solid #bdc3c7;
        border-radius: 5px;
    }

    /* 작성 버튼을 #data-container 바로 아래에 배치 */
    .create-notice-btn,
    .create-faq-btn,
    .create-show-btn {
        display: none; /* 초기 상태 숨김 */
        position: absolute; /* 부모 요소를 기준으로 위치 */
        bottom: -230px; /* #data-container의 아래로 20px */
        left: 96.5%; /* 화면 가운데로 위치 */
        transform: translateX(-50%); /* 가운데 정렬 */
        padding: 15px 30px;
        color: white;
        border-radius: 5px;
        text-decoration: none;
        font-size: 15px;
        z-index: 1000; /* 다른 요소 위로 배치 */
        color: black;
    }

    .create-notice-btn:hover, .create-faq-btn:hover, .create-show-btn:hover {
        cursor: pointer;
    }
</style>
</head>
<body>
		<!-- 사이드바 -->
        <div class="sidebar">
            <h2>관리 사항</h2>
            <button id="noticeBtn">공지사항 관리</button>
            <button id="faqBtn">FAQ 관리</button>
            <button id="userBtn">회원 관리</button>
            <button id="reservationBtn">회원 예매 관리</button>
            <button id="showBtn">공연 관리</button>
        </div>
        
        <!-- 공지사항 작성 버튼 -->
        <form action="${contextPath}/noticeInsert" method="GET">
            <button type="submit" class="create-notice-btn" id="createNotice">공지사항 작성</button>
        </form>

        <!-- FAQ 작성 버튼 -->
        <form action="${contextPath}/faqInsert" method="GET">
            <button type="submit" class="create-faq-btn" id="createFaq">FAQ 작성</button>
        </form>

        <!-- 공연 작성 버튼 -->
        <form action="${contextPath}/showInsert" method="GET">
            <button type="submit" class="create-show-btn" id="createShow">공연 작성</button>
        </form>
</body>
</html>