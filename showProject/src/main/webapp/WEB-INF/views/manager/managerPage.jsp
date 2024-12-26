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
        	position: relative;
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

        .create-notice-btn, .create-faq-btn, .create-show-btn {
		    display: none; /* 초기 상태 숨김 */
		    position: absolute; /* 부모 요소를 기준으로 위치 */
		    bottom: -100px; /* 부모 요소의 하단에서 20px */
		    right: 20px; /* 부모 요소의 오른쪽에서 20px */
		    padding: 15px 30px;
		    background-color: #27ae60;
		    color: white;
		    border-radius: 5px;
		    text-decoration: none;
		    font-size: 16px;
		    z-index: 1000; /* 다른 요소 위로 배치 */
		}

		.create-notice-btn:hover, .create-faq-btn:hover, .create-show-btn:hover {
		    background-color: #2ecc71;
		}
		
		.create-notice-btn[style="display: block;"],
		.create-faq-btn[style="display: block;"],
		.creater-show-btn[style="display: block"] {
		    display: block !important; /* 강제로 표시 */
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
            <a href="#" id="show-management-btn">공연 관리</a>
        </div>

        <!-- 메인 콘텐츠 -->
        <div class="main-content">
            <div class="header">
                <h1>관리 사항</h1>
                <form action="${contextPath}/managerLogout">
                	<button class="logout-btn">로그아웃</button>
                </form>
            </div>

            <!-- 공지사항 목록 -->
            <div id="notice-list">
                <p>공지사항 데이터를 불러오고 있습니다...</p>
            </div>
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
    </div>

    <script>
    document.addEventListener("DOMContentLoaded", function() {
        // 공지사항 관리 버튼 클릭 시
        document.getElementById('notice-management-btn').addEventListener('click', function(event) {
            event.preventDefault(); // 기본 동작 방지
            console.log('공지사항 관리 버튼 클릭됨'); // 디버깅용 메시지
            document.querySelector('.create-notice-btn').style.display = 'block'; // 공지사항 작성 버튼 표시
            document.querySelector('.create-faq-btn').style.display = 'none'; // FAQ 작성 버튼 숨기기
            document.querySelector('.create-show-btn').style.display = 'none';
        });

        // FAQ 관리 버튼 클릭 시
        document.getElementById('faq-management-btn').addEventListener('click', function(event) {
            event.preventDefault(); // 기본 동작 방지
            console.log('FAQ 관리 버튼 클릭됨'); // 디버깅용 메시지
            document.querySelector('.create-faq-btn').style.display = 'block'; // FAQ 작성 버튼 표시
            document.querySelector('.create-show-btn').style.display = 'none';
            document.querySelector('.create-notice-btn').style.display = 'none'; // 공지사항 작성 버튼 숨기기
        });
        
	     // 공연 관리 버튼 클릭 시
	     document.getElementById('show-management-btn').addEventListener('click', function(event) {
	         event.preventDefault(); // 기본 동작 방지
	         console.log('공연 관리 버튼 클릭됨'); // 디버깅용 메시지
	         document.querySelector('.create-show-btn').style.display = 'block';
	         document.querySelector('.create-faq-btn').style.display = 'none'; // FAQ 작성 버튼 표시
	         document.querySelector('.create-notice-btn').style.display = 'none'; // 공지사항 작성 버튼 숨기기
	     });
	     
	     document.getElementById('createShow').addEventListener('click', function(event){
	    	 event.preventDefault();
	    	 console.log('공연 작성 버튼 클릭됨');
	    	 window.location.href = '${contextPath}/showInsert';
	     });

        // 버튼 숨기기 초기화 함수
        function hideCreateButtons() {
            document.querySelector('.create-notice-btn').style.display = 'none';
            document.querySelector('.create-faq-btn').style.display = 'none';
            document.querySelector('.create-show-btn').style.display = 'none';
        }

        // 공지사항 목록 로드 함수
        function loadNoticeList() {
		    $.ajax({
		        url: '/noticeList', // 수정된 URL
		        method: 'GET',
		        dataType: 'json', // JSON 형식으로 데이터 처리
		        success: function(data) {
		            const noticeList = document.getElementById('notice-list');
		            noticeList.innerHTML = ''; // 기존 내용 비우기
		            if (data.length > 0) {
		                data.forEach(notice => {
		                    const noticeItem = document.createElement('div');
		                    noticeItem.className = 'notice-item';
		                    noticeItem.innerHTML = `
		                        <h3>${notice.title}</h3>
		                        <p>${notice.content}</p>
		                        <small>작성일: ${notice.createdDate}</small>
		                    `;
		                    noticeList.appendChild(noticeItem);
		                });
		            } else {
		                noticeList.innerHTML = '<p>등록된 공지사항이 없습니다.</p>';
		            }
		        },
		        error: function(xhr, status, error) {
		            console.error("AJAX 요청 실패:", status, error);
		            document.getElementById('notice-list').innerHTML = '<p>데이터를 불러오는데 실패하였습니다.</p>';
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