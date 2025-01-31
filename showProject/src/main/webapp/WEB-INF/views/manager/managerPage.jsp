<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>공지사항 관리</title>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap"
	rel="stylesheet">
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

.create-notice-btn, .create-faq-btn, .create-show-btn {
	display: none;
	padding: 10px 20px;
	background-color: #3498db;
	color: white;
	border: none;
	border-radius: 5px;
	font-size: 14px;
	cursor: pointer;
}

.create-notice-btn:hover, .create-faq-btn:hover, .create-show-btn:hover
	{
	background-color: #2980b9;
}

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
	<%@include file="/WEB-INF/views/common/menubar.jsp"%>
	<c:if test="${not empty alertMsg }">
		<script>
            alertify.alert("서비스 요청 성공","${alertMsg}");
        </script>
		<c:remove var="alertMsg" />
	</c:if>
	<div class="container">
		<jsp:include page="managerPageSideBar.jsp" />

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
					<button type="submit" class="create-notice-btn" id="createNotice">공지사항
						작성</button>
				</form>

				<!-- FAQ 작성 버튼 -->
				<form action="${contextPath}/managerPage/faqInsert" method="GET">
					<button type="submit" class="create-faq-btn" id="createFaq">FAQ
						작성</button>
				</form>

				<!-- 공연 작성 버튼 -->
				<form action="${contextPath}/managerPage/showInsert" method="GET">
					<button type="submit" class="create-show-btn" id="createShow">공연
						작성</button>
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
        hideCreateButtons();

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
        
        document.getElementById('questionBtn').addEventListener('click', function(event){
        	event.preventDefault();
        	hideCreateButtons();
        	loadData('question');
        });

        document.getElementById('meetingBtn').addEventListener('click', function(event){
        	event.preventDefault();
        	hideCreateButtons();
        	loadData('meeting');
        });
        
        document.getElementById('chatBtn').addEventListener('click', function(event){
        	event.preventDefault();
        	hideCreateButtons();
        	loadData('chat');
        });
        


        function hideCreateButtons() {
            document.querySelector('.create-notice-btn').style.display = 'none';
            document.querySelector('.create-faq-btn').style.display = 'none';
            document.querySelector('.create-show-btn').style.display = 'none';
        }


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
                status: '계정 상태',
                point: '잔여 포인트'
            },
            reserv: {
                reservationId: '예약 번호',
                showName: '공연 이름',
                roundId: '회차',
                userName: '예약 회원 이름',
                hallName: '공연장 이름',
                status: '예약 상태',
                createDate: '예약일'
            },
            question: {
            	questionNo: '문의 번호',
            	userNo: '문의 유저 번호',
            	userName: '문의 유저 이름',
            	reservationId: '예약 번호',
            	qcategoryName: '문의 카테고리',
            	quTitle: '문의 제목',
            	createDate: '문의 날짜',
            	answerContent: '답변 내용'
            },
            meeting: {
            	meetingNo: '소모임 번호',
            	userNo: '모임 주최 사용자 번호',
            	userId: '모임 주최 사용자 아이디',
            	meetingTitle: '소모임 제목',
            	showNo: '공연 번호',
            	showName: '공연 이름',
            	meetingPlace: '소모임 주최장소',
            	meetingCount: '소모임 인원',
            	meetingDate: '소모임 날짜',
            	startDate: '구인 시작 날짜',
            	endDate: '구인 종료 날짜'
            },
            chat: {
            	chatNo: '채팅 번호',
            	chatTitle: '채팅 제목',
            	showNo: '공연 번호',
            	showTitle: '공연 제목',
            	showName: '공연 이름',
            	userNo: '회원 번호',
            	userId: '채팅 생성 사용자 아이디',
            	chatUserCount: '참여중인 회원 수',
            	createDate: '채팅방 생성 날짜'
            }
        };


        function loadData(type) {

            const urlMap = {
                notice: `${contextPath}/managerPage/noticeList`,
                faq: `${contextPath}/managerPage/faqList`,
                show: `${contextPath}/managerPage/showList`,
                member: `${contextPath}/managerPage/memberList`,
                reserv: `${contextPath}/managerPage/reservList`,
                question: `${contextPath}/managerPage/questionList`,
                meeting: `${contextPath}/managerPage/meetingList`,
                chat: `${contextPath}/managerPage/chatList`
        };
            const url = urlMap[type];
            fetchDataAndDisplay(url, type);  // URL로 데이터 요청
        }


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


        function displayData(data, type) {
        	
            const container = document.getElementById('data-container');
            container.innerHTML = '';

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
                    th.textContent = headers[key] || key;
                    headerRow.appendChild(th);
                });
				
                
                headerRow.innerHTML += '<th>수정</th><th>삭제</th>';
                thead.appendChild(headerRow);

                data.forEach(row => {
                    const tableRow = document.createElement('tr');
                    keys.forEach((key, index) => {
                        const td = document.createElement('td');
                        td.textContent = row[key];
                        tableRow.appendChild(td);

                        if (index === 1) {
                            td.style.cursor = 'pointer';
                            td.addEventListener('click', () => {
                                toggleDetailRow(tableRow, row);
                            });
                        }
                    });

                    // 수정 및 삭제 버튼 추가
                    const editTd = document.createElement('td');
                    const deleteTd = document.createElement('td');

                    // 수정 버튼 또는 답변 버튼 결정
                    const editBtn = document.createElement('button');
                    if (type === 'question') {
                        editBtn.textContent = '답변';  // 1:1문의일 때는 수정 버튼을 '답변' 버튼으로 변경
                    } else if (type === 'reserv'){
                    	editBtn.textContent = '확인 및 수정';
                    } else{
                        editBtn.textContent = '수정';
                    } 
             
                    editBtn.classList.add('action-btn');
                    editBtn.addEventListener('click', () => editItem(row));

                    const deleteBtn = document.createElement('button');
                    
                    
                    deleteBtn.textContent = '삭제';
                    deleteBtn.classList.add('action-btn', 'delete-btn');
                    deleteBtn.addEventListener('click', () => deleteItem(row));
                    
                    if (type === 'member'){
                    	deleteBtn.textContent = '탈퇴';
                    }

                    editTd.appendChild(editBtn);
                    deleteTd.appendChild(deleteBtn);

                    tableRow.appendChild(editTd);
                    tableRow.appendChild(deleteTd);
                    tbody.appendChild(tableRow);

                    const detailRow = document.createElement('tr');
                    detailRow.classList.add('detail-row');
                    const detailTd = document.createElement('td');
                    detailTd.setAttribute('colspan', keys.length + 2);
                    detailTd.innerHTML = `
                        <div class="detail-content">
                            <p><strong>상세 내용</strong></p>
                            <p>상세 내용이 없습니다.</p>
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
        function toggleDetailRow(tableRow, row) {
        	
            var detailRow = tableRow.nextElementSibling;
            var isVisible = detailRow.style.display === 'table-row';
            if (!detailRow.hasAttribute('data-loaded')) {
            	
                var url = '';
                if (row.noticeNo) {
                    url = '${contextPath}/managerPage/notice?noticeNo=' + row.noticeNo;  // Notice 상세 요청
                } else if (row.meetingNo){
                	url = '${contextPath}/managerPage/meeting?meetingNo=' + row.meetingNo;
                } else if (row.chatNo){
                	url = '${contextPath}/managerPage/chat?chatNo=' + row.chatNo;
                } else if (row.questionNo) {
                    url = '${contextPath}/managerPage/question?questionNo=' + row.questionNo;	// Question 상세 요청
                } else if (row.userNo){
                	url = '${contextPath}/managerPage/user?userNo=' + row.userNo;	// user 상세 요청
                } else if (row.faqNo) {
                    url = '${contextPath}/managerPage/faq?faqNo=' + row.faqNo;  // FAQ 상세 요청
                } else if (row.showNo) {
                    url = '${contextPath}/managerPage/show?showNo=' + row.showNo;  // Show 상세 요청
                } else if (row.reservationId) {
                    url = '${contextPath}/managerPage/reserv?reservId=' + row.reservationId;  // Reservation 상세 요청
                }  
                
                // AJAX 요청으로 상세 내용 가져오기
                fetch(url)
                .then(response => response.json())
                .then(data => {
                	const contextPath = window.location.pathname.split('/')[1]; // 현재 contextPath 추출
                    const detailRow = tableRow.nextElementSibling;
                    const detailContent = detailRow.querySelector('.detail-content');
                    const contentNo = data.reservationId || data.noticeNo || data.faqNo || data.showNo || data.questionNo || '번호 없음';
                    const contentTitle = data.noticeTitle || data.faqTitle || data.showName || data.quTitle || '제목 없음';
                    const contentContent = data.noticeContent || data.faqContent || data.showExplain || data.quContent || data.information || '내용 없음';
                    const contentCreateDate = data.createDate || '작성일 없음';
                    const lineChangeContent = (text) => {return text.replace(/\n/g, '<br>');};	// 줄바꿈 만들어주기(sql에선 \n을 여기선 <br>로 써야 함)
                    const Content = lineChangeContent(contentContent);

                    if(detailContent){
                    	if(data.noticeNo){
                    		detailContent.innerHTML = 
                        			'<p><strong>공지사항 상세내용</strong></p>'+
                        			'<p>공지사항 번호 : '+contentNo+'</p>\n'+
                        			'<p>공지사항 제목 : '+contentTitle+'</p>\n'+
                        			'<p>공지사항 내용 <br><br>'+Content+'</p>\n'+
                        			'<p>작성일 : '+contentCreateDate+'</p>\n';
                    	} else if(data.chatNo){
                    		detailContent.innerHTML = 
                    			'<p><strong>나타낼 상세내용이 없습니다.(채팅로그는 나오지 않습니다.)</strong></p>';
                    	} else if(data.meetingNo){
                    		detailContent.innerHTML = 
                    			'<p><strong>소모임 상세정보</strong></p>'+
                    			'<p>소모임 번호 : '+data.meetingNo+'</p>'+
                    			'<p>소모임 주최 유저 번호 : '+data.userNo+'</p>'+
                    			'<p>소모임 주최 유저 아이디 : '+data.userId+'</p>'+
                    			'<p>소모임 제목 : '+data.meetingTitle+'</p>'+
                    			'<p>공연 번호 : '+data.showNo+'</p>'+
                    			'<p>공연 제목 : '+data.showName+'</p>'+
                    			'<p>소모임 주최 장소 : '+data.meetingPlace+'</p>'+
                    			'<p>소모임 참여 인원 : '+data.meetingCount+'</p>'+
                    			'<p>소모임 주최 날짜 : '+data.meetingDate+'</p>'+
                    			'<p>소모임 구인 시작 날짜 : '+data.startDate+'</p>'+
                    			'<p>소모임 구인 종료 날짜 : '+data.endDate+'</p>'+
                    			'<p>소모임 상세내용 : '+Content+'</p>';
                    	} else if(data.questionNo){
                    		detailContent.innerHTML =
                    			'<p><strong>1:1 문의 상세내용</strong></p>'+
                    			'<p>문의 번호 : '+data.questionNo+'</p>'+
                    			'<p>문의 사용자 번호 : '+data.userNo+'</p>'+
                    			'<p>문의 사용자 이름 : '+data.userName+'</p>'+
                    			'<p>예약번호 : '+data.reservationId+'</p>'+
                    			'<p>문의 카테고리 : '+data.qcategoryName+'</p>'+
                    			'<p>문의 제목 : '+data.quTitle+'</p>'+
                    			'<p>문의 내용 : <br>'+data.quContent+'</p>'+
                    			'<p>문의 날짜 : '+contentCreateDate+'</p>'+
                    			'<p>답변 내용 : <br>'+data.answerContent+'</p>'
                    	} else if(data.enrollDate){
                    		detailContent.innerHTML =
                    			'<p><strong>사용자 상세내용</strong></p>'+
                    			'<p>사용자 번호 : '+data.userNo+'</p>'+
                    			'<p>사용자 아이디 : '+data.userId+'</p>'+
                    			'<p>사용자 이름 : '+data.userName+'</p>'+
                    			'<p>사용자 주민번호 : '+data.userRrn+'</p>'+
                    			'<p>사용자 연락처 : '+data.phone+'</p>'+
                    			'<p>사용자 이메일 : '+data.email+'</p>'+
                    			'<p>사용자 주소 : '+data.address+'</p>'+
                    			'<p>가입일 : '+data.enrollDate+'</p>'+
                    			'<p>최종 정보 수정일 : '+data.modifyDate+'</p>'+
                    			'<p>등급 : '+data.rank+'</p>'+
                    			'<p>구독 여부 : '+data.subscribe+'</p>';
                    	} else if(data.faqTitle){
                    		detailContent.innerHTML = 
                    			'<p><strong>FAQ 상세내용</strong></p>'+
                    			'<p>FAQ 번호 : '+data.faqNo+'</p>'+
                    			'<p>FAQ 제목 : '+data.faqTitle+'</p>'+
                    			'<p>FAQ 내용 : '+Content+'</p>'+
                    			'<p>FAQ 카테고리 : '+data.qcategoryName+'</p>';
                    	}  else if(data.reservationId){
                    		detailContent.innerHTML = 
                			'<p><strong>예약 상세내용</strong></p>'+
                			'<p>예약 번호 : '+data.reservationId+'</p>'+
                			'<p>공연 이름 : '+data.showName+'</p>'+
                			'<p>회차 : '+data.roundId+'회차</p>'+
                			'<p>예약 회원 이름 : '+data.userName+'</p>'+
                			'<p>공연장 이름 : '+data.hallName+'</p>'+
                			'<p>예약일 : '+contentCreateDate+'</p>';
                    	} else if(data.showNo){
                    	    detailContent.innerHTML = 
                    	        '<p><strong>공연 상세내용</strong></p>'+
                    	        '<p>공연 번호 : '+contentNo+'</p>'+
                    	        '<p>공연 제목 : '+contentTitle+'</p>'+
                    	        '<p>공연 설명 : '+Content+'</p>'+
                    	        '<p>공지사항 : '+data.notice+'</p>'+
                    	        '<p>공연장 이름 : '+data.hallName+'</p>'+
                    	        '<p>공연 장르 : '+data.genreName+'</p>'+
                    	        '<p>공연 지역 : '+data.regionName+'</p>'+
                    	        '<p>공연 시작일 : '+data.showStart+'</p>'+
                    	        '<p>공연 종료일 : '+data.showEnd+'</p>'+
                    	        '<p>조회수 : '+data.count+'</p>'+
                    	        '<p>포스터 이미지</p>' +
                    	        '<img src="'+data.posterPath + '" alt="포스터 이미지">' +
                    	        '<p>상세내용 이미지</p>'+
                    	        '<img src="'+data.detailPath + '" alt="상세 이미지">';
                    	}
                        detailRow.setAttribute('data-loaded', 'true');
                        if (detailRow.style.display === 'none' || !detailRow.style.display) {
                            detailRow.style.display = 'table-row';
                        }

                        // 슬라이드 애니메이션 사용
                        setTimeout(() => {
                            $(detailRow).slideDown();
                        }, 0); // 약간의 시간 지연 후 실행
                    } else {
                        console.error("detailContent 요소를 찾을 수 없습니다.");
                    }
                })
                .catch(error => {
                    console.error('상세 내용 불러오기 실패', error);
                });
            }

            // 상세 내용 표시 토글
            if (isVisible) {
                detailRow.style.display = 'none';
            } else {
                detailRow.style.display = 'table-row';
            }
        }
        
        function editItem(row) {
            let editUrl = '';
            if (row.noticeNo) {
                editUrl = `${contextPath}/managerPage/noticeUpdate?noticeNo=`+row.noticeNo;
            } else if (row.reservationId){
            	editUrl = `${contextPath}/managerPage/reservUpdate?reservId=`+row.reservationId;
            	console.log(editUrl);
            } else if (row.faqNo) {
                editUrl = `${contextPath}/managerPage/faqUpdate?faqNo=`+row.faqNo;
            } else if (row.meetingNo){
            	editUrl = `${contextPath}/managerPage/meetingUpdate?meetingNo=`+row.meetingNo;
            } else if (row.chatNo){
            	editUrl = `${contextPath}/managerPage/chatUpdate?chatNo=`+row.chatNo;
            } else if (row.showNo) {
                editUrl = `${contextPath}/managerPage/showUpdate?showNo=`+row.showNo;
            } else if (row.questionNo) {
                editUrl = `${contextPath}/managerPage/questionAnswer?questionNo=`+row.questionNo;
            } else if (row.userNo) {
            	editUrl = `${contextPath}/managerPage/userUpdate?userNo=`+row.userNo;
            } else {
                console.error('수정 및 답변 URL을 생성할 수 없습니다.');
                return;
            }
            // 페이지 이동
            window.location.href = editUrl;
        };
        
        function deleteItem(row) {
            let deleteUrl = '';
            if (row.noticeNo) {
            	deleteUrl = `${contextPath}/managerPage/noticeDelete?noticeNo=`+row.noticeNo;
            } else if (row.reservationId){
            	deleteUrl = `${contextPath}/managerPage/reservationDelete?reservationNo=`+row.reservationId;
            } else if (row.chatNo){
            	deleteUrl = `${contextPath}/managerPage/chatDelete?chatNo=`+row.chatNo;
            } else if (row.faqNo) {	
            	deleteUrl = `${contextPath}/managerPage/faqDelete?faqNo=`+row.faqNo;
            } else if (row.meetingNo){
            	deleteUrl = `${contextPath}/managerPage/meetingDelete?meetingNo=`+row.meetingNo;
            } else if (row.showNo) {
            	deleteUrl = `${contextPath}/managerPage/showDelete?showNo=`+row.showNo;
            } else if (row.questionNo) {
            	deleteUrl = `${contextPath}/managerPage/questionDelete?questionNo=`+row.questionNo;
            } else if (row.userNo) {
            	deleteUrl = `${contextPath}/managerPage/userDelete?userNo=`+row.userNo;
            }   else {
                console.error('삭제 URL을 생성할 수 없습니다.');
                return;
            }
            
            if(confirm("정말 삭제하시겠습니까?")){
            	window.location.href=deleteUrl;
            } else {
            	window.location.href=`${contextPath}/managerPage`;
            }
        };
    });
</script>
</body>
</html>