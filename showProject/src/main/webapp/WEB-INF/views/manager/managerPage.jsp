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

        .data-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        .data-table th, .data-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        .data-table th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        .action-btn {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 5px;
            margin: 0 5px;
        }

        .action-btn:hover {
            background-color: #2980b9;
        }

        .delete-btn {
            background-color: #e74c3c;
        }

        .delete-btn:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/views/common/menubar.jsp" %>
    <div class="container">
		<jsp:include page="managerPageSideBar.jsp"/>
		
        <!-- 메인 콘텐츠 -->
        <div class="main-content">
            <div class="header">
                <h1>관리 사항</h1>
                <form action="${contextPath}/managerLogout">
                    <button class="logout-btn">로그아웃</button>
                </form>
            </div>

            <!-- 데이터 표시 영역 -->
            <div id="data-container">
                <p>사이드바의 항목을 선택해주세요.</p>
            </div>
        </div>
    </div>
	
    <script>
    var contextPath = '${pageContext.request.contextPath}';
    document.addEventListener("DOMContentLoaded", function () {
        // 초기 상태에서 버튼 숨기기
        hideCreateButtons();

        // 공지사항 관리 버튼 클릭 시
        document.getElementById('noticeBtn').addEventListener('click', function(event) {
            event.preventDefault();
            hideCreateButtons(); // 모든 작성 버튼 숨기기
            document.querySelector('.create-notice-btn').style.display = 'block'; // 공지사항 작성 버튼 표시
            loadData('notice'); // 공지사항 데이터 로드
        });

        // FAQ 관리 버튼 클릭 시
        document.getElementById('faqBtn').addEventListener('click', function(event) {
            event.preventDefault();
            hideCreateButtons(); // 모든 작성 버튼 숨기기
            document.querySelector('.create-faq-btn').style.display = 'block'; // FAQ 작성 버튼 표시
            loadData('faq'); // FAQ 데이터 로드
        });

        // 공연 관리 버튼 클릭 시
        document.getElementById('showBtn').addEventListener('click', function(event) {
            event.preventDefault();
            hideCreateButtons(); // 모든 작성 버튼 숨기기
            document.querySelector('.create-show-btn').style.display = 'block'; // 공연 작성 버튼 표시
            loadData('show'); // 공연 데이터 로드
        });

        // 회원 관리 버튼 클릭 시
        document.getElementById('userBtn').addEventListener('click', function(event) {
            event.preventDefault();
            hideCreateButtons(); // 모든 작성 버튼 숨기기
            loadData('member'); // 회원 데이터 로드
        });

        // 회원 예매 관리 버튼 클릭 시
        document.getElementById('reservationBtn').addEventListener('click', function(event) {
            event.preventDefault();
            hideCreateButtons(); // 모든 작성 버튼 숨기기
            loadData('reserv'); // 예약 데이터 로드
        });

        // 작성 버튼 숨기기
        function hideCreateButtons() {
            document.querySelector('.create-notice-btn').style.display = 'none';
            document.querySelector('.create-faq-btn').style.display = 'none';
            document.querySelector('.create-show-btn').style.display = 'none';
        }
        
        // 데이터 항목에 맞는 헤더 매핑
        const headerMappings = {
            notice: {
                noticeNo: '공지사항 번호',
                noticeTitle: '공지사항 제목',
                createDate: '작성일',
                count: '조회수'
            },
            faq: {
                faqNo: 'FAQ 번호',
                faqTitle: 'FAQ 제목',
                count: '조회수'
            },
            show: {
                showNo: '공연 번호',
                showName: '공연 제목',
                showExplain: '공연 설명',
                status: '공연 상태',
                hallName: '공연장',
                genreName: '장르',
                regionName: '지역',
                showStart: '공연 시작일',
                showEnd: '공연 종료일',
                count: '조회수'
            },
            member: {
                userNo: '회원 번호',
                userId: '아이디',
                userName: '이름',
                userRrn: '주민번호',
                phone: '연락처',
                email: '이메일',
                address: '주소',
                enrollDate: '가입일',
                modifyDate: '정보수정일',
                rank: '회원 등급',
                subscribe: '구독 여부',
                status: '계정 상태'
            },
            reserv: {
                reservationId: '예약 번호',
                showName: '공연 이름',
                roundId: '회차',
                userName: '예약 회원 이름',
                hallName: '공연장 이름',
                status: '예약 상태',
                createDate: '예약일'
            }
        };

        // 데이터 로드 함수 수정
        function loadData(type) {
            const urlMap = {
                notice: '${contextPath}/noticeList',
                faq: '${contextPath}/faqList',
                show: '${contextPath}/showList',
                member: '${contextPath}/memberList',
                reserv: '${contextPath}/reservList'
            };
            const url = urlMap[type];
            fetchDataAndDisplay(url, type);
        }

        // 데이터 가져오기 및 표시 함수
        function fetchDataAndDisplay(url, type) {
            fetch(url)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('네트워크 응답에 문제가 있습니다.');
                    }
                    return response.json();
                })
                .then(data => {
                    displayData(data, type);
                })
                .catch(error => {
                    console.error('통신 실패', error);
                    document.getElementById('data-container').innerHTML =
                        '<p>데이터를 불러오는 중 문제가 발생했습니다.</p>';
                });
        }

        // 데이터를 화면에 표시하는 함수
        function displayData(data, type) {
            const container = document.getElementById('data-container');
            container.innerHTML = '';

            if (Array.isArray(data) && data.length > 0) {
                const table = document.createElement('table');
                table.classList.add('data-table');
                const thead = document.createElement('thead');
                const tbody = document.createElement('tbody');

                // 해당 타입에 맞는 헤더 매핑 가져오기
                const headers = headerMappings[type] || {};
                const keys = Object.keys(data[0]);
                const headerRow = document.createElement('tr');

                keys.forEach(key => {
                    const th = document.createElement('th');
                    th.textContent = headers[key] || key;  //
                    headerRow.appendChild(th);
                });
                headerRow.innerHTML += '<th>수정</th><th>삭제</th>'; // 수정 및 삭제 버튼 컬럼 추가
                thead.appendChild(headerRow);

                // 테이블 본문 생성
                data.forEach(row => {
                    const tableRow = document.createElement('tr');
                    keys.forEach(key => {
                        const td = document.createElement('td');
                        td.textContent = row[key];
                        tableRow.appendChild(td);
                    });

                    // 수정 및 삭제 버튼 추가
                    const editTd = document.createElement('td');
                    const deleteTd = document.createElement('td');

                    const editBtn = document.createElement('button');
                    editBtn.textContent = '수정';
                    editBtn.classList.add('action-btn');
                    editBtn.addEventListener('click', () => editItem(row)); // 수정 버튼 클릭 시

                    const deleteBtn = document.createElement('button');
                    deleteBtn.textContent = '삭제';
                    deleteBtn.classList.add('action-btn', 'delete-btn');
                    deleteBtn.addEventListener('click', () => deleteItem(row)); // 삭제 버튼 클릭 시

                    editTd.appendChild(editBtn);
                    deleteTd.appendChild(deleteBtn);

                    tableRow.appendChild(editTd);
                    tableRow.appendChild(deleteTd);
                    tbody.appendChild(tableRow);
                });

                table.appendChild(thead);
                table.appendChild(tbody);
                container.appendChild(table);
            } else {
                container.innerHTML = '<p>데이터가 없습니다.</p>';
            }
        }

        // 수정 버튼 클릭 시 동작
        function editItem(item) {
		    let url = "";
		    if (item.noticeNo) {
		        url = `${contextPath}/noticeUpdate/${item.noticeNo}`;  // 공지사항 수정
		    } else if (item.faqNo) {
		        url = `${contextPath}/faqUpdate/${item.faqNo}`;  // FAQ 수정
		    } else if (item.showNo) {
		        url = `${contextPath}/showUpdate/${item.showNo}`;  // 공연 수정
		    } else if (item.userNo) {
		        url = `${contextPath}/userUpdate/${item.userNo}`;  // 회원 수정
		    } else if (item.reservationId) {
		        url = `${contextPath}/reservUpdate/${item.reservationId}`;  // 예매 수정
		    }
		
		    // URL로 이동
		    if (url) {
		        window.location.href = url;
		    }
		}
        // 삭제 버튼 클릭 시 동작
        function deleteItem(item) {
            alert('삭제할 항목: ' + JSON.stringify(item));
        }
    });
    </script>
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>