<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장르별/지역별 랭킹</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jersey+25&family=Jersey+25+Charted&family=Jua&family=Libre+Barcode+128+Text&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/e7db19de60.js" crossorigin="anonymous"></script>


<style>

   
       

#tt{
        
        position:relative;
        left : 200px;
        
       
    }
    #b1,#b2,#b3,#b4,#b5,#b6{
        background-color: white;
        border-radius: 30px;
        border-color:gainsboro;
        border-style: solid; /*board-color는 border-style과 함께 사용되어야 한다.*/
        border-width: thin;
        width: 100px;
        height: 40px;
        
        font-family: "Noto Sans KR", sans-serif;
        font-size: 15px;
        font-weight: 500;
        font-style: normal;
        color: black;
    }
    #rank1,#rank2{
        border-style: none;
        background-color: white;

        font-family: "Noto Sans KR", sans-serif;
        font-size: 30px;
        font-weight: 500;
        font-style: normal;
        color: black
        position:relative;
        left : 200px;
        
    }
    #rank3{
        font-size: 20px;
        position: relative;
        top: -6px;
        color: gainsboro;
        position:relative;
        


    }
    #rrr{
    position:relative;
        left : 200px;}

    #f1,#f2,#f3,#f4,#f5{
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
    #list{
        height: 70px;
    }
  
</style>
</head>
<body>

    <div>
        <table id="tt" >
         <br><br>
            <tr> 
            <td colspan="9">
            <button id="rank1">장르별랭킹</button>  <span id="rank3">&nbsp;|&nbsp;</span>   <button id="rank2">지역별랭킹</button>
            </td>
            </tr>
            <br><br>
            <tr>
            <td colspan="9" id="list">
                <button id="b1">뮤지컬</button>
                <button id="b2">콘서트</button>
                <button id="b3">클래식/무용</button>
                <button id="b4">아동/가족</button>
                <button id="b5">연극</button>
                <button id="b6">전시</button>
            </td>
            
            </tr>
            
            
            <tr>
                
                <td>
                    <a href=""><img src="/show/resources/images/강홍석.jpg" alt="" id="f1"></a><br>
                    <span id="j1">[단독판매] 강홍석</span><br>
                    <span id="j2">12.23(월) 18:00</span>
                </td>
                <td id="oo"></td>
                <td>
                    <a href=""><img src="/show/resources/images/강홍석.jpg" alt="" id="f2"></a><br>
                    <span id="j1">[단독판매] 강홍석</span><br>
                    <span id="j2">12.23(월) 18:00</span>
                </td>
                <td id="oo"></td>
                <td>
                    <a href=""><img src="/show/resources/images/강홍석.jpg" alt="" id="f3"></a><br>
                    <span id="j1">[단독판매] 강홍석</span><br>
                    <span id="j2">12.23(월) 18:00</span>
                </td>
                <td id="oo"></td>
                <td>
                    <a href=""><img src="/show/resources/images/강홍석.jpg" alt="" id="f4"></a><br>
                    <span id="j1">[단독판매] 강홍석</span><br>
                    <span id="j2">12.23(월) 18:00</span>
                </td>
                <td id="oo"></td>
                <td>
                    <a href=""><img src="/show/resources/images/강홍석.jpg" alt="" id="f5"></a><br>
                    <span id="j1">[단독판매] 강홍석</span><br>
                    <span id="j2">12.23(월) 18:00</span>
                </td>
            </tr>
        </table>

    </div>

    <script>

        $("#b1").click(function(){

            $.ajax({
                url : "musicalList",
                success : function(result){
                    
                    var resultStr = "";

                },
                error : function(){
                    console.log("통신 오류");
                }
            });

        });
    </script>
    
</body>
</html>