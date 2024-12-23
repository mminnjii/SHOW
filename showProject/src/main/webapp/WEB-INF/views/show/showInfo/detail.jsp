<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>본문 영역 수정</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .fixed-section {
            position: fixed;
            top: 0;
            right: 0;
            width: 200px;
            height: 100%;
            background-color: #f4f4f4;
            padding: 20px;
            box-shadow: -2px 0 5px rgba(0, 0, 0, 0.2);
        }

        .content {
            margin-right: 220px;
            padding: 20px;
        }

        /* 본문 상단 레이아웃 */
        .top-section {
            display: flex;
            align-items: flex-start; /* 이미지와 텍스트 위쪽 정렬 */
            gap: 20px; /* 이미지와 텍스트 사이 간격 */
            margin-bottom: 20px; /* 아래 콘텐츠와 간격 */
        }

        .top-section img {
            width: 150px; /* 이미지 너비 */
            height: auto; /* 비율 유지 */
            border-radius: 8px; /* 이미지 둥글게 */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* 이미지 그림자 */
        }

        .details {
            flex: 1; /* 텍스트 영역이 남은 공간 차지 */
        }

        .details h2 {
            margin: 0px 0 10px 0; /* 제목 아래 여백 */
            font-size: 1.5em;
        }

        .details p {
            margin: 0;
            line-height: 1.6; /* 텍스트 가독성을 위해 줄 간격 */
        }
    </style>
</head>
<body>
    <div class="fixed-section">
        <h2>예약하기</h2>
        <br>
        <p>날짜 :</p>	
        <select>
        	<option>2025.01.01</option>
        </select>
        <p>회차 :</p>
        <select>
        	<option>N회차</option>
        </select>
        <p>공연시간 :</p>
        <select>
        	<option>17:00</option>
        </select>
        <p>공연일정 : </p>
        <select>
        	<option>2024-10-11 ~ 2024-11-11</option>
        </select>
        <p>좌석 : </p>
        <select>
        	<option> <P>VIP석 | 157R석 | 140S석 | 40A석 62</P></option>
        </select>
        <br><br><br>
        <p>회원등급</p>
        
        <br><br>
		<button onclick="location.href='/show/showInfo/seats'">예약하기</button>
    </div>
    <div class="content">
        <!-- 본문 상단 영역 -->
        <div class="top-section">
       		<%-- 		<img class="photo" class="bookC"
					src="/library/resources/img/${bno}.gif" width="280px"
					height="380px"> --%>
            <img src="https://ticketimage.interpark.com/Play/image/large/24/24014511_p.gif" alt="예제 이미지">
            <div class="details">
                <h2>공연 이름</h2>
                <p>장소 : 잠실실내체육관</p>
                <p>공연기간 : 2024.12.21~2024.12.22</p>
                <p>공연시간 : 100분</p>
                <p>가격 : 100분</p>
                <p>유의사항 : 2024년 12월 10일 00시 00분~2024년 12월 22일 23시 59분까지 <br>
                    무통장입금 결제가 불가능합니다.</p>
            </div>
        </div>
        <br><br><br>
        
        <hr>
        
			<table>
				<tr>
					<td><a href="/show/showInfo/detail">공연정보</a></td>
					<td class="separator">||</td>
					<td><a href="/show/showInfo/review">관람후기</a></td>
					<td class="separator">||</td>
					<td><a href="/show/showInfo/expectation">기대평</a></td>
				</tr>
			</table>
		
        
		
<!--         아래 일반 본문
        <h1>공연상세 / 정보</h1>
        <p>여기에 긴 내용을 작성하면 스크롤을 할 수 있습니다.</p>
        <img src="https://ticketimage.interpark.com/240145112024/10/08/dcf9f4a0.jpg" alt="예제 이미지">
        <p style="margin-top: 1000px;">끝부분에 도달했습니다.</p> -->
    </div>
</body>
</html>