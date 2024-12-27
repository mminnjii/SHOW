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
        font-size: 27px;
        font-weight: 700;
        font-style: normal;
        color: red;
        
        }
        #ss1{
        font-family: "Noto Sans KR", sans-serif;
        font-size: 20px;
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
        font-size: 30px;
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
        font-size: 25px;
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
            
        }
        #reName{
            display: inline-block;
            position: relative;
            left: -430px;
        }
        
      
        #td1{
            width: 150px;
        }
        #result2{
            width: 150px;
        }
        
        #www{
            font-family: "Noto Sans KR", sans-serif;
        font-size: 13px;
        font-weight: 600;
        font-style: normal;
        color:gray
        }

        
    </style>


</head>

<body>
    
    <%@include file="/WEB-INF/views/common/menubar.jsp" %>
    <div id="searchPage">
        <br><br><br>
        <table>
            <tr>
                <td colspan="3" ><span id="searchName">${hashMap.keyword}</span><span id="ss1">에 대한 검색결과가 없습니다. </span></td>
                
            </tr>
            <tr id="www">
                <td>* 단어의 철자가 정확한지 확인해보세요.</td>
            </tr>
            <tr id="www">
                <td>* 한글을 영어로,영어를 한글로 입력했는지 확인해보세요.</td>
            </tr>
            

            
        </table>

    </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>