<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>공지사항 관리</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7fa;
        }

        .container {
            display: flex;
        }

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

        .sidebar a {
            display: block;
            padding: 15px;
            color: #fff;
            text-decoration: none;
            font-size: 18px;
            border-bottom: 1px solid #34495e;
        }

        .sidebar a:hover {
            background-color: #34495e;
        }

        .main-content {
            flex-grow: 1;
            padding: 20px;
        }

        .header {
            background-color: #34495e;
            color: #fff;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            margin: 0;
        }

        .header .logout-btn {
            background-color: #e74c3c;
            border: none;
            color: white;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
        }

        .header .logout-btn:hover {
            background-color: #c0392b;
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

        /* 공지사항 목록 스타일 */
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

        .create-notice-btn, .create-faq-btn {
		    padding: 15px 30px;
		    background-color: #27ae60;
		    color: white;
		    border-radius: 5px;
		    text-decoration: none;
		    font-size: 16px;
		    position: fixed; /* 화면 하단에 고정 */
		    bottom: 20px; /* 하단 20px 위치 */
		    right: 20px; /* 오른쪽 20px 위치 */
		    display: none; /* 기본적으로 숨겨놓기 */
		    z-index: 1000; /* 다른 요소들 위에 표시 */
		}
		
		.create-notice-btn:hover, .create-faq-btn:hover {
		    background-color: #2ecc71;
		}
    </style>
</head>
<body>
<%@include file="/WEB-INF/views/common/menubar.jsp" %>
    <div class="container">
        <!-- 사이드바 -->
        <div class="sidebar">
            <h2>관리 사항</h2>
            <a href="#" id="notice-management-btn">공지사항 관리</a>
            <a href="#" id="faq-management-btn">FAQ 관리</a>
            <a href="#" id="user-management-btn">회원 관리</a>
            <a href="#" id="reservation-management-btn">회원 예매 관리</a>
            <a href="#">공연 관리</a>
        </div>

        <!-- 메인 콘텐츠 -->
        <div class="main-content">
            <div class="header">
                <h1>관리 사항</h1>
                <button class="logout-btn">로그아웃</button>
            </div>

            <!-- 공지사항 목록 -->
            <div id="notice-list">
                <p>공지사항 데이터를 불러오고 있습니다...</p>
            </div>
        </div>

        <!-- 공지사항 작성 버튼 -->
        <form action="${contextPath}/mNoticeInsert" method="GET">
            <button class="create-notice-btn">공지사항 작성</button>
        </form>

        <!-- FAQ 작성 버튼 -->
        <form action="${contextPath}/mFaqInsert" method="GET">
            <button class="create-faq-btn">FAQ 작성</button>
        </form>
    </div>

    <script>
    document.addEventListener("DOMContentLoaded", function() {
        // 공지사항 관리 버튼 클릭 시
        document.getElementById('notice-management-btn').addEventListener('click', function() {
        	console.log('공지사항 관리 버튼 클릭됨');
            document.querySelector('.create-notice-btn').style.display = 'block'; // 공지사항 버튼 표시
            document.querySelector('.create-faq-btn').style.display = 'none'; // FAQ 버튼 숨기기
        });

        // FAQ 관리 버튼 클릭 시
        document.getElementById('faq-management-btn').addEventListener('click', function() {
        	console.log('FAQ 관리 버튼 클릭됨');
            document.querySelector('.create-faq-btn').style.display = 'block'; // FAQ 버튼 표시
            document.querySelector('.create-notice-btn').style.display = 'none'; // 공지사항 버튼 숨기기
        });

        // 다른 관리 항목 클릭 시 작성 버튼 숨기기
        function hideCreateButtons() {
            document.querySelector('.create-notice-btn').style.display = 'none';
            document.querySelector('.create-faq-btn').style.display = 'none';
        }

        // 다른 메뉴 클릭 시 작성 버튼 숨기기
        document.getElementById('user-management-btn').addEventListener('click', hideCreateButtons);
        document.getElementById('reservation-management-btn').addEventListener('click', hideCreateButtons);
        document.querySelectorAll('.sidebar a').forEach(function(link) {
            link.addEventListener('click', hideCreateButtons);
        });

        // 공지사항 목록 로드 함수
        function loadNoticeList() {
            $.ajax({
                url: '/manager/noticeList', // 서버 요청 URL
                method: 'GET',
                success: function(data) {
                    $('#notice-list').html(data);
                },
                error: function() {
                    $('#notice-list').html('<p>공지사항 데이터를 불러오는데 문제가 발생했습니다.</p>');
                }
            });
        }
        // 페이지 로드 시 공지사항 목록 로드
        loadNoticeList();
        });
    </script>
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>