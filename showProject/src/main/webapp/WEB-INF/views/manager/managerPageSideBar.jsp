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
            <button id="questionBtn">1:1 문의 관리</button>
        </div>
</body>
</html>