<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jersey+25&family=Jersey+25+Charted&family=Jua&family=Libre+Barcode+128+Text&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/e7db19de60.js" crossorigin="anonymous"></script>

    <style>
        #searchName,#searchCount{
        font-family: "Noto Sans KR", sans-serif;
        font-size: 20px;
        font-weight: 700;
        font-style: normal;
        color: red;
        
        }
        #ss1{
        font-family: "Noto Sans KR", sans-serif;
        font-size: 15px;
        font-weight: 600;
        font-style: normal;
        color: black;
        }

        table{
            margin: auto;
            width: 70%;
            
            

        }
        #cate{
        border: solid 1px black;
        background-color: black;
        font-family: "Noto Sans KR", sans-serif;
        font-size: 25px;
        font-weight: 600;
        font-style: normal;
        color: white;
        text-align: center;
        padding-top: 10px;
        padding-bottom: 10px;
        }
        #tr1{
            height: 20px;
        }
        #searchPage{
            background-color:rgba(216, 212, 212, 0.192);
            height: 100%;

        }
        #result{
        font-family: "Noto Sans KR", sans-serif;
        font-size: 20px;
        font-weight: 600;
        font-style: normal;
        color: black;
        }
        #result1{
        
        border: solid 1px gainsboro;
        background-color: white;
        font-family: "Noto Sans KR", sans-serif;
        font-size: 25px;
        font-weight: 600;
        font-style: normal;
        color: black;
        text-align: center;
        }
        #resultPoster{
            width: 100px;
            height: 150px;
            position: relative;
            top: 3px;
            left : 10px;
            
        }
        #reName{
            display: inline-block;
            position:absolute;
            left: 430px;
        }
        #rePlace{
            display: inline-block;
            position:absolute;
            left: 430px;
            font-size: 15px;
            color: rgb(156, 154, 154);
            
            
        }
        #reDate{
            display: inline-block;
            position:absolute;
            left: 430px;
            font-size: 15px;
            color: rgb(156, 154, 154);
            
            
        }
        #td1{
            width: 150px;
        }
        #result2{
            width: 150px;
        }
        #reBtn{
        background-color: red;
        font-family: "Noto Sans KR", sans-serif;
        font-size: 15px;
        font-weight: 600;
        font-style: normal;
        color: white;
        border-color:red;
        border-style: none;
        border-radius: 5px;
        padding: 10px;
        padding-left: 20px;
        padding-right: 20px;
        }

        
    </style>


</head>

<body>

<%@include file="/WEB-INF/views/common/menubar.jsp" %>
    
    <div id="searchPage">
        <br><br><br>
        <table>
            <tr>
                <td colspan="3" ><span id="searchName">${hashMap.keyword}</span><span id="ss1">에 대한 검색결과는 총 </span><span id="searchCount">${hashMap.count}</span><span id="ss1">입니다.</span></td>
            </tr>

            <tr id="tr1"></tr>
            <tr>
                <td colspan="3" id="cate">공연</td>
            </tr>
            <tr id="tr1"></tr>
            <tr>
                <td colspan="3" id="result">티켓 검색 결과</td>
            </tr>
            <tr id="tr1"></tr>
            
            <c:choose>
            	<c:when test="${empty list }">
            		<tr>
            			<td>조회된 공연이 없습니다.</td>
            		</tr>
            	</c:when>
            	<c:otherwise>
            		<c:forEach items="${list}" var="s">
            			<tr id="result1">
                		<td id="td1"><img src="${contextPath }/resources/images/꽃의비밀.jpg" alt="" id="resultPoster"></td>
                		<td><span id="reName">${s.showName} </span><br> <span id="rePlace">${s.hall.hallName}</span><br><span id="reDate">${s.showStart}-${s.showEnd}</span></td>
                		<td id="result2"><button id="reBtn">예매하기</button></td>
            			</tr>
            		
            		</c:forEach>
            	
            	</c:otherwise>
            </c:choose>
            
            
        </table>

    </div>

<br><br><br>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>