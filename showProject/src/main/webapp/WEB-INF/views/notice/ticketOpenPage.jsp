<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>티켓오픈페이지</title>

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

        .pp{
            margin: auto;
            width: 70%;
            
            

        }
        #cate{
        border: solid 1px #597C9B;
        background-color: #597C9B;
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
            height: 700px;

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
        #resultPoster2{
            width: 300px;
            height: 390px;
            position: relative;
            top: 3px;
            
        }
        #reName{
            display: inline-block;
            position: relative;
            
            
        }
        #rePlace{
            display: inline-block;
            position: relative;
            
            font-size: 15px;
            color: rgb(156, 154, 154);
            
            
        }
        #reNotice{
            display: inline-block;
            position: relative;
            
            font-size: 15px;
            color: rgb(156, 154, 154);
            
            
        }
        #reDate{
            display: inline-block;
            position: relative;
           
            font-size: 15px;
            color: rgb(156, 154, 154);
            
            
        }
        #td55{
            width: 300px;
            height: 400px;
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
        <table class="pp">
            

            <tr id="tr1"></tr>
            <tr>
                <td colspan="3" id="cate">티켓 오픈</td>
            </tr>
            <tr id="tr1"></tr>
           
            <tr id="tr1"></tr>
            <tr id="result1">
             <td>
               <img src="${contextPath }/resources/PosterUploadFiles/${s.posterChangeName}.jpg" alt="" id="resultPoster2">
             </td>   
                <td>
                    <span id="reName">${s.showName}</span><br> 
                    <span id="rePlace">지역 : ${s.regionName}</span><br>
                    <span id="reDate">기간 : ${s.showStart}-${s.showEnd}</span><br>
                    <span id="reNotice" style="white-space: pre-wrap;">공연 소개 : ${s.showExplain} </span><br>
                    <span id="rePlace">가격 : ${s.price} </span>


                
                </td>
                
            </tr>
        </table>

    </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>