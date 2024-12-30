<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHOW-DETAIL</title>
    <style>
        
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
            /*background-color: #f7f7f7; */ 
            cursor: pointer;
            text-align: left;
            width: 60%;
            margin: 0px auto;
            padding: 3%;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); 
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
        
        .pClass{
        	border: 1px solid lightgray;
        	padding: 10px 15px;
        	border-radius: 10px;
        }

    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
    <br><br>
     <form action="" method="" class="meeting">
      <h1>소모임 명</h1> <!-- DB에서 가져와서 보여줘야함. -->

         <label for="groupName"></label>
         <p></p>
         
         <div class="content">
             <div>
                 <h4>공연명</h4>
                 <p class="pClass">OOOOO 뮤지컬</p>
             </div>  <!-- 사진 가져올 수 있으면 보여줘도 좋을 듯. -->
             
             <div>
                 <h4>모임 장소</h4>
                 <p class="pClass">서울특별시 OOO구 OOO동</p>
             </div>

             <div>
                 <h4>모집 인원</h4>
                 <p class="pClass">1/6 명</p>   <!-- 신청한 인원의 수 count 해서 보여줘야한다. -->
             </div>
 
             <div>
                 <h4>모집 마감일</h4>
                 <p class="pClass">2024-12-28</p>
             </div>
             
             <div>
                 <h4>소모임 안내 사항</h4>
                 <p class="pClass">OOOOO 뮤지컬</p>
             </div>
         </div>

         <br>

         <!-- 참여 신청 버튼을 누르면 confirm 사용해서 바로 데이터 DB에 넣기 -->
         <div class="btn">
             <button type="submit">참여 신청</button>
             <button onclick="location.href='${contextPath}/meeting/list'">뒤로가기</button>
         </div>
     </form>
	 <br><br>
     <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
