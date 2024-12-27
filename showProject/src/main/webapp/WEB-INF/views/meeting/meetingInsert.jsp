<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>소모임 생성</title>
<style>
    
    .a {
        text-align: left;
        width: 80%;
        margin: 0px auto;
        background-color: white;
        padding: 20px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
    }

    h1 {
        text-align: center;
        color: #333;
    }
    label {
        font-weight: bold;
        margin-top: 10px;
        display: block;
    }

    input, textarea, select, button {
        width: 100%;
        padding: 10px;
        margin: 8px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    
    button {
        background-color: #597c9b;
        color: white;
        font-weight: bold;
        cursor: pointer;
    }

    button:hover {
        background-color: #374f64;
    }
</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/menubar.jsp" %>

<div class="a">


    <h1>소모임 생성</h1>
    <form action="" method="">
        <label for="groupName">소모임 명</label>
        <input type="text" id="groupName" name="groupName" placeholder="소모임명을 입력하세요" required>
        
        <label for="category">공연</label>
        <select id="category" name="category" required>
            <option value="" disabled selected>공연을 선택하세요</option>
            <option value="sports">뮤지컬</option>
            <option value="reading">콘서트</option>
            <option value="tech">연극</option>
        </select>
        
        
        <label for="location">모임 장소</label>
        <input type="text" id="location" name="location" placeholder="ex) 서울 영등포 타임스퀘어" required>
        
        <label for="meetingCount">모집 인원</label>
        <select>
            
            <option></option>
        </select>
        <input type="number" id="meetingCount" name="meetingCount" placeholder="숫자로 입력하세요" max="20" required>
        
        <label for="endDate">모집 마감일</label>
        <input type="date" id="endDate" name="endDate" required>  <!-- 오늘날짜 이전은 선택 불가능하게 조건처리 -->
        
        <label for="description">소모임 안내사항</label>
        <textarea id="description" name="description" rows="5" placeholder="소모임 안내사항을 작성하세요" style="resize: none;" required></textarea>
        
        <button type="submit">소모임 생성</button>
    </form>


</div>
</body>
</html>
