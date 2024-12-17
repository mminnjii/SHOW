<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>menuber</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jersey+25&family=Jersey+25+Charted&family=Jua&family=Libre+Barcode+128+Text&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/e7db19de60.js" crossorigin="anonymous"></script>
    <style>
        #headerImg{
            width: 100%;
           
        }

        #header{
            width: 100%;
            height: 100px;
        }
        #logo{
            
            height: 70px;
        }
        #td1,#td2,#td4,#td6,#td7{
            width: 100px;
        }
        #td3{
            
            font-family: "Noto Sans KR", sans-serif;
            font-size: 25px;
            font-weight: 700;
            font-style: normal;
            

            
            padding-top: 30px;
           
           
        }
        #td5{
            width: 300px;
            font-size: 12px;
            font-weight: 600;
            
            

        }
        #span1,#span2{
            color: red;
        }
        #img2{
            height: 50px;
            padding-bottom: 5px;
        }
        #tr1{
            height: 50px;
        }
        #tr2{
            height: 50px;
            border-top: 1px solid rgba(128, 128, 128, 0.4);
            border-bottom: 1px solid rgba(128, 128, 128, 0.4);
            
        }
        table{
            border-collapse: collapse; 
            
        }
        
        li{
            list-style-type : none;
            display: inline-block;
            font-family: "Noto Sans KR", sans-serif;
            font-size: 17px;
            font-weight: 400;
            font-style: normal;
            padding-right: 13px; /*메뉴바 글씨 간격*/
            
            
            
        }
        #li2,#li3,#li4,#li5{
            list-style-type : none;
            display: inline-block;
            font-family: "Noto Sans KR", sans-serif;
            font-size: 13px;
            font-weight: 400;
            font-style: normal;
            padding-right: 5px;
            padding-top: 40px;
            
            
            
            
        }
        #li1{
            color: gainsboro;
        }
        #menu{
            padding-left: 15px; /*왼쪽 여백을 설정하여 로고와 위치 맞춤*/
        }

        .search-box{
            height: 10px;
            width: 200px;
            background-color: white;
            border-radius: 40px;
            padding: 10px;
            border: 1px solid gray;
            display: flex;
            align-items: center;
        }
        .search-text{
            border: none;
            background: none;
            outline: none;
            float: left;
            padding: 0px;
            color: gray;
            font-size: 13px;
            line-height: 30px;
            width: 200px;
            font-family: "Noto Sans KR", sans-serif;
        }
        .search-btn{
            color: black;
            float: right;
            width: 40px;
            height: 100%;
            border-radius: 50%;
            background: white;
            border: none;
            font-size: 16px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        a{
            text-decoration: none;
            color: black;

        }
     
        
       
        
        
        
       
    </style>
</head>
<body>
    <div>
        <img src="/show/resources/images/배너.jpg" alt="헤더이미지" id="headerImg">
    </div>

    <div id="div">
        <table  id="header">
            <tr id="tr1">
                <td id="td1"></td>
                <td id="td4"><a href=""><img src="/show/resources/images/로고.jpg" alt="로고" id="logo"></a></td>
                <td id="td3"> 공연/전시</td>
                <td align="right" >
                    <ul>
                        <li id="li2"><a href="">로그인</a></li>
                        <li id="li3"><a href="">예매확인/취소</a></li>
                        <li id="li4"><a href="">회원가입</a></li>
                        <li id="li5"><a href="">고객센터</a></li>
                    </ul>
                </td>
                <td id="td5" align="center">
                    <a href="https://www.youtube.com/watch?si=0u5-or70qp9vCzd3&v=jPhBtq425d4&feature=youtu.be">
                    <img src="/show/resources/images/암표.jpg" alt="" id="img2"></a> <br>
                    행복한 공연문화를 위해 <br> 지금부터 <span id="span1">암표 거래</span>를 <span id="span2">멈춰주세요</span>
                    
                </td>
                <td  id="td2"></td>
                
            </tr>
            <tr id="tr2">
                <td id="td6"></td> <!--홈    뮤지컬    연극    콘서트    클래식    전시   고객센터   커뮤티니   이벤트 -->
                <td colspan="3" id="td8">
                    <ul id="menu">
                        <li><a href="">홈</a></li>
                        <li><a href="">뮤지컬</a></li>
                        <li><a href="">연극</a></li>
                        <li><a href="">콘서트</a></li>
                        <li><a href="">클래식</a></li>
                        <li><a href="">전시</a></li>
                        <li id="li1">|</li>
                        <li><a href="">고객센터</a></li>
                        <li><a href="">커뮤니티</a></li>
                        <li><a href="">오픈공지</a> </li>
                        
                    </ul>
                   
                </td>
                <td id="td7" align="center">
                    <form class="search-box" action="" method="get">
                        <input type="text" class="search-text" placeholder="검색어를 입력하세요.">
                        <button class="search-btn" type="submit">
                        <i class="fa-solid fa-magnifying-glass"></i>
                        </button>

                    </form>

                </td>
                

            </tr>
        </table>

    </div>
    
    
</body>
</html>