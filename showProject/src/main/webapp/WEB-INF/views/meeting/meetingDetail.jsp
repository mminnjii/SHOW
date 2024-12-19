<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHOW-DETAIL</title>
    <style>
        
        .a {
                text-align: left;
                width: 70%;
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
        
        button {
            background-color: #597c9b;
            color: white;
            font-weight: bold;
            cursor: pointer;
            display: inline-block;
            width: 20%;
            padding: 10px;
            margin: 0px 50px 10px 0px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button:hover {
            background-color: #374f64;
        }

        .meeting{
            background-color: #f7f7f7;
            padding: 10px;
            margin: 15px 0px 15px 0px;
            cursor: pointer;
            border-radius: 10px;
        }

        .content{
            background-color: white;
            padding: 20px;
            margin: 10px 0px 10px 0px;
            border-radius: 10px;
            cursor: pointer;
        }

        .btn{
            text-align: center;
        }

    </style>
</head>
<body>
<%@include file="/WEB-INF/views/common/menubar.jsp" %>
    <br><br>
    <div class="a">
        <h1>소모임 명 : OOOXXXX </h1> <!-- DB에서 가져와서 보여줘야함. -->
        <form action="" method="" class="meeting">
            <label for="groupName"></label>
            <p></p>
            
            <div class="content">
                <div>
                    <label for="category">공연명</label>
                    <p>OOOOO 뮤지컬</p>
                </div>  <!-- 사진 가져올 수 있으면 보여줘도 좋을 듯. -->
                
                <div>
                    <h4>모임 장소</h4>
                    <p>서울특별시 OOO구 OOO동</p>
                </div>

                <div>
                    <h4>모집 인원</h4>
                    <p>1/6 명</p>   <!-- 신청한 인원의 수 count 해서 보여줘야한다. -->
                </div>
    
                <div>
                    <h4>모집 마감일</h4>
                    <p>2024-12-28</p>
                </div>
                
                <div>
                    <h4>소모임 안내 사항</h4>
                    <p>OOOOO 뮤지컬</p>
                </div>
            </div>

            <br>

            <!-- 참여 신청 버튼을 누르면 confirm 사용해서 바로 데이터 DB에 넣기 -->
            <div class="btn">
                <button type="submit">참여 신청</button>
                <button onclick="history.back();">뒤로가기</button>
            </div>
        </form>
    </div>
</body>
</html>
