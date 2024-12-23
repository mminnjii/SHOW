<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	 #m1{
	            width: 80%;
	            
	        }
	#m2{
	          width: 20%;
	            
	        }
    
  


	/*  #slider-container {
	   width: 100%; /* 슬라이더 전체 너비 100%로 설정 */
	   /* overflow: hidden; /* 넘치는 부분을 잘라냄 
	}*/
	
	.slider__inner {
	    display: flex;
	    width: 1140px; /* 전체 너비에 맞게 슬라이드 너비 설정 */
	    transition: transform 0.7s ease-in-out;
	    height: 600px; /* 슬라이드 높이 고정 */
	}
	
	.slider__inner img {
	    width: 100%; /* 이미지를 슬라이드 영역에 맞게 확대/축소 */
	    height: 450px; /* 이미지의 높이를 100%로 맞춤 */
	    /*object-fit: contain; /* 이미지 비율 유지하면서 영역에 맞춤 */
	    z-index: 2;
	}


#c1{
        font-family: "Noto Sans KR", sans-serif;
        font-size: 16px;
        font-weight: 500;
        font-style: normal;
        color: rgb(110, 108, 108);
    }
    #c2{
        font-family: "Noto Sans KR", sans-serif;
        font-size: 20px;
        font-weight: 650;
        font-style: normal;
        color: black;
    }
    #c3{
        font-family: "Noto Sans KR", sans-serif;
        font-size: 20px;
        font-weight: 650;
        font-style: normal;
        color: red;
    }
    #c4{
        font-family: "Noto Sans KR", sans-serif;
        font-size: 20px;
        font-weight: 650;
        font-style: normal;
        color:black;
    }
    #c5{
        font-family: "Noto Sans KR", sans-serif;
        font-size: 20px;
        font-weight: 650;
        font-style: normal;
        color:red;
    }

    #ticket{
        width: 100px;
        height: 100px;
    }
    #ticket2{
        width: 80px;
        height: 80px;
    }
    #rr{
        width: 10px;
    }
    #and{
        font-size: 60px;
        font-weight:100px;
        color: gainsboro;
    }
    #dd{
        width: 30px;
    }
    #a1{
        font-family: "Noto Sans KR", sans-serif;
        font-size: 16px;
        font-weight: 500;
        font-style: normal;
        color: rgb(110, 108, 108);
    }
    #a2{
        font-family: "Noto Sans KR", sans-serif;
        font-size: 20px;
        font-weight: 650;
        font-style: normal;
        color:red;
    }

    #a3{
        font-family: "Noto Sans KR", sans-serif;
        font-size: 20px;
        font-weight: 650;
        font-style: normal;
        color:black;
    }
    #box{
        
        border-radius:20px;
        background-color: white;
        position :absolute;
        bottom: -60px;
        filter: drop-shadow(2px 6px 6px #c3c3c3);
        left : 170px;
        z-index: 2;
        
        
    }
    #ll{
    height:10px;
    	
    }
    
    





        
</style>
</head>

<body>
	
	<%@include file="/WEB-INF/views/common/menubar.jsp" %>
	
	
		<div>
        <table id="poster">
            <tr>
            	<td id="m1">
            	
               
                            <div class="slider__inner">
                               <div class="slider"><img src="${contextPath }/resources/images/BigBanner_PC_르스페이스(1).jpg" alt=""></div>
                                <div class="slider"><img src="${contextPath }/resources/images/PC_BigBanner_GFRIEND10thAnniversary.jpg" alt=""></div>
                                <div class="slider"><img src="${contextPath }/resources/images/PC_BigBanner_글루미선데이(1).jpg" alt=""></div>
                                <div class="slider"><img src="${contextPath }/resources/images/PC_BigBanner_김연우(1).jpg" alt=""></div>
                                <div class="slider"><img src="${contextPath }/resources/images/PC_BigBanner_링크어택이벤트.jpg" alt=""></div>
                                <div class="slider"><img src="${contextPath }/resources/images/PC_BigBanner_베르테르.jpg" alt=""></div>
                                <div class="slider"><img src="${contextPath }/resources/images/PC_BigBanner_비엔나1900.jpg" alt=""></div>
                                <div class="slider"><img src="${contextPath }/resources/images/PC_BigBanner_틱틱붐로고만.jpg" alt=""></div>
                                <div class="slider"><img src="${contextPath }/resources/images/PC_BigBanner_퍼스트맨.jpg" alt=""></div>
                                <div class="slider"><img src="${contextPath }/resources/images/PC_빅배너_클로버_수정01.jpg" alt=""></div>
                            </div>
                      
                
                   
                </td>

				<td id="m2"> 공연 실시간 순위 </td>
            
            </tr>

        </table>
    </div>
    
   
	    
    
     <script>
    $(document).ready(function(){
        $('.slider__inner').slick({
            arrows : false,
            autoplay: true,   // 자동 슬라이드
            autoplaySpeed: 3000  // 3초마다 자동으로 슬라이드
        });
    });
  </script>
	
	
	
	<script type="text/javascript">
      $.noConflict(); //계속 충돌이 일어나서 충돌 방지 코드를 넣어줌
	</script>


	 <script>
	     //마우스 오버/아웃 슬라이드 멈춤 및 재생 코드
        $('.slider__inner').on('mouseover',function(){
            slick.autoplay.false;
        });
        $('slide__inner').on('mouseout',function(){
            slick.autoplay.true;
        });

    </script>
    
    
    <div>
        <table id="box" >
         <tr id="ll"></tr>
            <tr>
                <td id="rr"></td>
                <td id="rr"></td>
                <td id="rr"></td>
                <td >
                    <p><span id="c1">누구나 즐길 수 있는 행복한 공연문화를 위해</span> <br> <span id="c2">지금부터 </span>
                    <span id="c3">암표 거래</span><span id="c4">를</span> <span id="c5">멈춰주세요</span> 
                    </p>

                </td>
                <td id="rr" ></td>
                <td>
                <a href="https://www.youtube.com/watch?si=0u5-or70qp9vCzd3&v=jPhBtq425d4&feature=youtu.be">
                <img src="${contextPath }/resources/images/암표거래.jpg" alt="" id="ticket2"> </a>
                <a href="https://www.youtube.com/watch?si=0u5-or70qp9vCzd3&v=jPhBtq425d4&feature=youtu.be" target="_blank">
                <img src="/show/resources/images/암표거래.jpg" alt="" id="ticket2"> </a>
                </td>
                <td id="dd"></td>
                <td id="and">
                    |
                </td>
                <td id="dd"></td>
                <td>
                    <p><span id="a1">함께 공연을 즐기는</span> <span id="a2">소모임</span><br><span id="a3">"같이 공연 보러 갈래?"</span></p>
                </td>
                <td id="rr"></td>
                <td><a href="">
                <img src="${contextPath }/resources/images/소모임.jpg" alt="" id="ticket"> </a>
                </td>
                <td id="rr"></td>
                <td id="rr"></td>
                <td id="rr"></td>
            </tr>
            <tr id="ll"></tr>

        </table>

    </div>
           
           
     <%@include file="/WEB-INF/views/common/ticketOpen.jsp" %>      
     <%@include file="/WEB-INF/views/common/ranking.jsp" %>   
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	

</body>
</html>

    
    
    
    

