<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        
        .create-buttons {
            display: flex;
            justify-content: flex-end;
            margin-top: 10px;
            margin-bottom: 20px;
        }

        .create-buttons form {
            margin-left: 10px;
        }

        .create-notice-btn,
        .create-faq-btn,
        .create-show-btn {
            display: none; /* 초기 상태에서 숨김 */
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
        }

        .create-notice-btn:hover,
        .create-faq-btn:hover,
        .create-show-btn:hover {
            background-color: #2980b9;
        }

        /* 슬라이드다운 스타일 */
        .detail-row {
            background-color: #f9f9f9;
            display: none;
            transition: all 0.3s ease;
        }

        .detail-row td {
            padding: 10px;
        }

        .detail-row div {
            padding: 10px;
            text-align: left;
        }

    </style>
</head>
<body>
<%@include file="/WEB-INF/views/common/menubar.jsp" %>
    <c:if test="${not empty alertMsg }">
        <script>
            alertify.alert("서비스 요청 성공","${alertMsg}");
        </script>
        <c:remove var="alertMsg"/>
    </c:if>
    <div class="container">
        <jsp:include page="managerPageSideBar.jsp"/>
        
        <!-- 메인 콘텐츠 -->
        <div class="main-content">
            <div class="header">
                <h1>관리 사항</h1>
                <form action="${contextPath}/managerPage/managerLogout">
                    <button class="logout-btn">로그아웃</button>
                </form>
            </div>

            <!-- 작성 버튼 -->
            <div class="create-buttons">
                <!-- 공지사항 작성 버튼 -->
                <form action="${contextPath}/managerPage/noticeInsert" method="GET">
                    <button type="submit" class="create-notice-btn" id="createNotice">공지사항 작성</button>
                </form>

                <!-- FAQ 작성 버튼 -->
                <form action="${contextPath}/managerPage/faqInsert" method="GET">
                    <button type="submit" class="create-faq-btn" id="createFaq">FAQ 작성</button>
                </form>

                <!-- 공연 작성 버튼 -->
                <form action="${contextPath}/managerPage/showInsert" method="GET">
                    <button type="submit" class="create-show-btn" id="createShow">공연 작성</button>
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

        // 관리 버튼 클릭 이벤트 설정
        document.getElementById('noticeBtn').addEventListener('click', function(event) {
            event.preventDefault();
            hideCreateButtons();
            document.querySelector('.create-notice-btn').style.display = 'block';
            loadData('notice');
        });

        document.getElementById('faqBtn').addEventListener('click', function(event) {
            event.preventDefault();
            hideCreateButtons();
            document.querySelector('.create-faq-btn').style.display = 'block';
            loadData('faq');
        });

        document.getElementById('showBtn').addEventListener('click', function(event) {
            event.preventDefault();
            hideCreateButtons();
            document.querySelector('.create-show-btn').style.display = 'block';
            loadData('show');
        });

        document.getElementById('userBtn').addEventListener('click', function(event) {
            event.preventDefault();
            hideCreateButtons();
            loadData('member');
        });

        document.getElementById('reservationBtn').addEventListener('click', function(event) {
            event.preventDefault();
            hideCreateButtons();
            loadData('reserv');
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
            // URL 설정
            const urlMap = {
                notice: `${contextPath}/managerPage/noticeList`,
                faq: `${contextPath}/managerPage/faqList`,
                show: `${contextPath}/managerPage/showList`,
                member: `${contextPath}/managerPage/memberList`,
                reserv: `${contextPath}/managerPage/reservList`
            };
            const url = urlMap[type];
            
            fetchDataAndDisplay(url, type);  // URL로 데이터 요청
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
            container.innerHTML = '';  // 기존 내용 지우기

            if (Array.isArray(data) && data.length > 0) {
                const table = document.createElement('table');
                table.classList.add('data-table');
                const thead = document.createElement('thead');
                const tbody = document.createElement('tbody');

                // 헤더 생성
                const headers = headerMappings[type] || {};
                const keys = Object.keys(data[0]);
                const headerRow = document.createElement('tr');

                keys.forEach(key => {
                    const th = document.createElement('th');
                    th.textContent = headers[key] || key;  // headerMappings에서 가져오기
                    headerRow.appendChild(th);
                });

                // 수정 및 삭제 버튼 컬럼 추가
                headerRow.innerHTML += '<th>수정</th><th>삭제</th>';
                thead.appendChild(headerRow);

                // 테이블 본문 생성
                data.forEach(row => {
                    const tableRow = document.createElement('tr');
                    keys.forEach((key, index) => {
                        const td = document.createElement('td');
                        td.textContent = row[key];
                        tableRow.appendChild(td);

                        // 두 번째 td 클릭 시 상세 내용 슬라이드
                        if (index === 1) {  // 두 번째 td
                            td.style.cursor = 'pointer';  // 클릭 가능하게 스타일 지정
                            td.addEventListener('click', () => {
                                toggleDetailRow(tableRow, row);  // 해당 행의 상세 내용 토글
                            });
                        }
                    });

                    // 수정 및 삭제 버튼 추가
                    const editTd = document.createElement('td');
                    const deleteTd = document.createElement('td');

                    const editBtn = document.createElement('button');
                    editBtn.textContent = '수정';
                    editBtn.classList.add('action-btn');
                    editBtn.addEventListener('click', () => editItem(row));  // 수정 버튼 클릭 시

                    const deleteBtn = document.createElement('button');
                    deleteBtn.textContent = '삭제';
                    deleteBtn.classList.add('action-btn', 'delete-btn');
                    deleteBtn.addEventListener('click', () => deleteItem(row));  // 삭제 버튼 클릭 시

                    editTd.appendChild(editBtn);
                    deleteTd.appendChild(deleteBtn);

                    tableRow.appendChild(editTd);
                    tableRow.appendChild(deleteTd);
                    tbody.appendChild(tableRow);

                    // 상세 내용 (슬라이드 다운 영역) 추가
                    const detailRow = document.createElement('tr');
                    detailRow.classList.add('detail-row');
                    const detailTd = document.createElement('td');
                    detailTd.setAttribute('colspan', keys.length + 2);  // 전체 열 너비를 차지하도록 colspan 설정
                    detailTd.innerHTML = `
                        <div>
                            <p><strong>상세 내용:</strong></p>
                            <p>${row.detail || '상세 내용이 없습니다.'}</p>
                        </div>
                    `;
                    detailRow.appendChild(detailTd);
                    tbody.appendChild(detailRow);
                });

                table.appendChild(thead);
                table.appendChild(tbody);
                container.appendChild(table);
            } else {
                container.innerHTML = '<p>데이터가 없습니다.</p>';
            }
        }

     // 상세 내용 토글 함수 수정
        function toggleDetailRow(tableRow, row) {
            const detailRow = tableRow.nextElementSibling;  // 해당 행의 다음 행이 상세 내용 행
            const isVisible = detailRow.style.display === 'table-row';
            
            // 상세 정보를 가져올 ID (예: faqNo, noticeNo, showNo)
            const itemId = row.noticeNo || row.faqNo || row.showNo;
            // 상세 내용이 아직 로드되지 않았을 경우에만 fetch 요청
            if (!detailRow.hasAttribute('data-loaded')) {
                // 서버에서 상세 내용 요청 (fetch 예시)
                var url = '';
				if (row.noticeNo) {
					url = `${contextPath}/managerPage/notice?noticeNo=${itemId}`;
				} else if (row.faqNo) {
					url = `${contextPath}/managerPage/faq?faqNo=${itemId}`;
				} else if (row.showNo) {
					url = `${contextPath}/managerPage/show?showNo=${itemId}`;
				}
				console.log("내가 요청하는 url : "+url);
                // AJAX 요청 (fetch 사용)
                fetch(url)
                    .then(response => response.json())  // 서버에서 JSON 응답을 받음
                    .then(data => {
                        // 상세 내용을 detailRow에 삽입
                        const detailContent = detailRow.querySelector('.detail-content');
                        if (detailContent) {
                            detailContent.innerHTML = `
                                <p><strong>상세 내용:</strong></p>
                                <p>${data.detail || '상세 내용이 없습니다.'}</p>
                            `;
                        }
                        // 데이터 로드 완료 후 'data-loaded' 속성 추가
                        detailRow.setAttribute('data-loaded', true);
                    })
                    .catch(error => {
                        console.error('상세 내용 불러오기 실패', error);
                    });
            }

            // 상세 내용 표시/숨김
            if (isVisible) {
                $(detailRow).slideUp();  // 슬라이드 업 (닫기)
            } else {
                $(detailRow).slideDown();  // 슬라이드 다운 (열기)
            }
        }
    }); // DOMContentLoaded 이벤트 종료
</script>
</body>
</html>