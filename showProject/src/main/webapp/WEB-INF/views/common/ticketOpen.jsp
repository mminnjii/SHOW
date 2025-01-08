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

   
       
    #open{
        font-family: "Noto Sans KR", sans-serif;
        font-size: 35px;
        font-weight: 500;
        font-style: normal;
        color: black;
        position:relative;
        left : 410px;
        
       
    }

    #s1,#s2,#s3,#s4,#s5{
        width: 200px;
        height: 250px;
        border-radius: 10px;
        align-items: center;
    }
    #oo{
        width: 20px;
    }
    #ooo{
        height: 25px;
    }
    #j1{
        font-family: "Noto Sans KR", sans-serif;
        font-size: 20px;
        font-weight: 500;
        font-style: normal;
        color: black;
    }
    #j2{
        font-family: "Noto Sans KR", sans-serif;
        font-size: 15px;
        font-weight: 400;
        font-style: normal;
        color: red;
    }
    
</style>
</head>
<body>

    <div>
        <table align="center">
            <tr ><span id="open">티켓오픈</span></tr>
            <tr id="ooo"></tr>
            <tr>
                <td>
                    <a href="/show/showInfo/detail?name=강홍석">
                    <img src="${contextPath }/resources/images/강홍석.jpg" alt="" id="s1"></a><br><br>
                    <span id="j1">[단독판매] 강홍석</span><br>
                    <span id="j2">12.23(월) 18:00</span>
                </td>
                <td id="oo"></td>
                <td>
                    <a href="/show/showInfo/detail?name=KB리브모바일">
                    <img src="${contextPath }/resources/images/sll.jpg" alt="" id="s2"></a><br><br>
                    <span id="j1">[단독판매] KB리브모바일</span><br>
                    <span id="j2">12.19(목) 17:00</span>
                </td>
                <td id="oo"></td>
                <td>
                    <a href="/show/showInfo/detail?name=꽃의비밀">
                    <img src="${contextPath }/resources/images/꽃의비밀.jpg" alt="" id="s3"></a><br><br>
                    <span id="j1">[연극] 꽃의 비밀</span><br>
                    <span id="j2">12.20(금) 11:00</span>
                </td>
                <td id="oo"></td>
                <td>
                    <a href="/show/showInfo/detail?name=시라노">
                    <img src="${contextPath }/resources/images/시라노.jpg" alt="" id="s4"></a><br><br>
                    <span id="j1">[뮤지컬] 시라노</span><br>
                    <span id="j2">12.19(목) 14:00</span>
                </td>
                <td id="oo"></td>
                <td>
                    <a href="/show/showInfo/detail?name=해적">
                    <img src="${contextPath }/resources/images/해적.jpg" alt="" id="s5"></a><br><br>
                    <span id="j1">[단독판매] 해적</span><br>
                    <span id="j2">12.20(금) 15:00</span>
                </td>
            </tr>
        </table>
    </div>
    
</body>
</html>