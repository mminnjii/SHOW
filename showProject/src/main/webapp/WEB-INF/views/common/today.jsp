<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

<!-- slick carousel css 파일 -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

<!-- jQuery 파일 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- slick carousel js 파일 -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jersey+25&family=Jersey+25+Charted&family=Jua&family=Libre+Barcode+128+Text&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/e7db19de60.js" crossorigin="anonymous"></script>

<style>


    #back1{
        width: 100%;
        height: 500px;
        background-color: #597C9B;
    }
    #back2{
        width: 100%;
        height: 500px;
        background-color: rgb(255, 208, 0);
    }
    #back3{
        width: 100%;
        height: 500px;
        background-color: rgb(203, 4, 4);
    }
    #back4{
        width: 100%;
        height: 500px;
        background-color: rgba(116, 1, 1, 0.818);
    }
    #back5{
        width: 100%;
        height: 500px;
        background-color: rgb(132, 79, 11);
    }

    #today{
        font-family: "Noto Sans KR", sans-serif;
        font-size: 30px;
        font-weight: 500;
        font-style: normal;
        color: black;

    }

    .todayInfo{
        width: 100%;
        height: 100px;
    }

  
    #t1,#t2,#t3,#t4,#t5{
        width: 350px;
        height: 450px;
        position: relative;
        left: 200px;
        top: 80px;
        border-radius: 30px;
        
    }
    #oho1{
        position: relative;
        left: 900px;
        bottom : 700px;
        font-family: "Noto Sans KR", sans-serif;
        font-size: 30px;
        font-weight: 500;
        font-style: normal;
        color: white;

       
    }
    #oho2{
        position: relative;
        left: 900px;
        bottom: 700px;
        font-family: "Noto Sans KR", sans-serif;
        font-size: 50px;
        font-weight: 500;
        font-style: normal;
        color: white;
    }
    #oho3{
        position: relative;
        left: 900px;
        bottom: 700px;
        font-family: "Noto Sans KR", sans-serif;
        font-size: 20px;
        font-weight: 500;
        font-style: normal;
        color: white;
    }
    #oho4{
        position: relative;
        left: 600px;
        bottom: 270px;
      
        width: 400px;
        height: 335px;
    }
    #oho5{
        position: relative;
        left: 570px;
        bottom: 296px;
        
        width: 450px;
        height: 380px;
    }

    #oho6{
        position: relative;
        left: 900px;
        bottom : 740px;
        font-family: "Noto Sans KR", sans-serif;
        font-size: 30px;
        font-weight: 500;
        font-style: normal;
        color: white;

       
    }
    #oho7{
        position: relative;
        left: 900px;
        bottom: 740px;
        font-family: "Noto Sans KR", sans-serif;
        font-size: 50px;
        font-weight: 500;
        font-style: normal;
        color: white;
    }
    #oho8{
        position: relative;
        left: 900px;
        bottom: 740px;
        font-family: "Noto Sans KR", sans-serif;
        font-size: 20px;
        font-weight: 500;
        font-style: normal;
        color: white;
    }

    #oho9{
        position: relative;
        left: 620px;
        bottom: 250px;
        
        width: 250px;
        height: 300px;
    }

    #oho10{
        position: relative;
        left: 900px;
        bottom : 650px;
        font-family: "Noto Sans KR", sans-serif;
        font-size: 25px;
        font-weight: 500;
        font-style: normal;
        color: white;

       
    }
    #oho11{
        position: relative;
        left: 900px;
        bottom: 650px;
        font-family: "Noto Sans KR", sans-serif;
        font-size: 40px;
        font-weight: 500;
        font-style: normal;
        color: white;
    }
    #oho12{
        position: relative;
        left: 900px;
        bottom: 650px;
        font-family: "Noto Sans KR", sans-serif;
        font-size: 20px;
        font-weight: 500;
        font-style: normal;
        color: white;
    }
    #oho13{
        position: relative;
        left: 620px;
        bottom: 280px;
        
        width: 250px;
        height: 330px;
    }

    #oho14{
        position: relative;
        left: 900px;
        bottom : 700px;
        font-family: "Noto Sans KR", sans-serif;
        font-size: 25px;
        font-weight: 500;
        font-style: normal;
        color: white;

       
    }
    #oho15{
        position: relative;
        left: 900px;
        bottom: 700px;
        font-family: "Noto Sans KR", sans-serif;
        font-size: 45px;
        font-weight: 500;
        font-style: normal;
        color: white;
    }
    #oho16{
        position: relative;
        left: 900px;
        bottom: 700px;
        font-family: "Noto Sans KR", sans-serif;
        font-size: 20px;
        font-weight: 500;
        font-style: normal;
        color: white;
    }
    
</style>
</head>
<body>

    <div class="ad">
        <table>
            <tr>
                <div id="today">오늘의 추천</div>
            </tr>
            <tr>
            <div class="todayInfo">
                
                <div id="back1">
                    <div >
                        <img src="/show/resources/images/오현우.jpg" alt="" id="t1">
                        <img src="/show/resources/images/인물오현우최종.png" alt="" id="oho4">
                        
                    </div>
                    <div>
                    <span id="oho1" >오현우 첫번째 콘서트</span> <br>
                    <span id="oho2">오늘, 현재 우리의 시간</span><br><br>
                    <span id="oho3">2025.01.18</span>
                    </div>
                </div>
                <div id="back2">
                    <div >
                        <img src="/show/resources/images/베르테르.jpg" alt="" id="t2">
                        <img src="/show/resources/images/베르테르인물최종.png" alt="" id="oho5">
                    </div>
                    <div>
                        <span id="oho6" >25주년 </span> <br>
                        <span id="oho7"> 뮤지컬 베르테르</span><br><br>
                        <span id="oho8">2025.01.17 - 2025.03.16</span>
                    </div>
                </div>
                <div id="back3">
                    <div >
                        <img src="/show/resources/images/뉴욕의거장들.jpg" alt="" id="t3">
                        <img src="/show/resources/images/뉴욕의거장들그림.jpg" alt="" id="oho9">
                    </div>
                    <div>
                        <span id="oho10" >뉴욕의 거장들 </span> <br>
                        <span id="oho11"> 잭슨 폴록과 마크 로스코의 친구들</span><br><br>
                        <span id="oho12">2025.01.10 - 2025.07.12</span>
                    </div>
                </div>
                <div id="back4">
                    <div>
                        
                        <img src="/show/resources/images/오페라.jpg" alt="" id="t4">
                        <img src="/show/resources/images/투란도트인물.jpg" alt="" id="oho13">
                    </div>
                    <div>
                        <span id="oho14" >뮤지컬 오페라 어게인</span> </span> <br>
                        <span id="oho15"> 2024 투란도트트</span><br><br>
                        <span id="oho16">2024.12.22 - 2024.12.31</span>
                    </div>
                </div>
               
            </div>

            </tr>
        </table>
    </div>

    
      
                
         
                    
          

    <script>
        $(document).ready(function(){
            $('.todayInfo').slick({
            	arrows : false,   
                autoplay: true,   // 자동 슬라이드
                autoplaySpeed: 3000  // 3초마다 자동으로 슬라이드
    
            });
        });
    </script>
    
    <script type="text/javascript">
      $.noConflict(); //계속 충돌이 일어나서 충돌 방지 코드를 넣어줌
	</script>
    
</body>
</html>