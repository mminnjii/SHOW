<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	 #m1{
	            width: 90%;
	            height: 550px;
	            padding:0;
	            margin:0;
	            
	        }
	#m2{
	          width: 30%;
	          background-color: #E1C7A1;
	          height: 550px;
	            
	        }
    
  


	/*  #slider-container {
	   width: 100%; /* 슬라이더 전체 너비 100%로 설정 */
	   /* overflow: hidden; /* 넘치는 부분을 잘라냄 
	}*/
	
	.slider__inner {
	    display: flex;
	    width: 1920px; /* 전체 너비에 맞게 슬라이드 너비 설정 */
	    transition: transform 0.7s ease-in-out;
	    height: 650px; /* 슬라이드 높이 고정 */
	}
	
	 .slider__inner img {
	    width: 100%; /* 이미지를 슬라이드 영역에 맞게 확대/축소 */
	    height: 550px; /* 이미지의 높이를 100%로 맞춤 */
	    object-fit: cover; /* 이미지 비율 유지하면서 영역에 맞춤 */
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
        width: 150px;
    }
    #and{
        font-size: 60px;
        font-weight:100px;
        color: gainsboro;
    }
    #dd{
        width: 50px;
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
        bottom : 10px;
        filter: drop-shadow(2px 6px 6px #c3c3c3);
        left : 330px;
        z-index: 2;
       
        
        
        
    }
    #ll{
    height:10px;
    	
    }
    #kk{
    width:20px;
    }
    
    #timeOne{
        font-family: "Noto Sans KR", sans-serif;
        font-size: 30px;
        font-weight: 500;
        font-style: normal;
        position: relative;
        left : 80px;
       
        }
        #timeTable{
            margin: auto;
        }
        #uu{
            height: 2px;
        }
        #uuu{
            height: 10px;
        }
        .u1{
        width: 30px;
        height: 30px;
        position: relative;
        left:30px;
        }
        #u2{
            width: 50px;
            height: 50px;
            position: relative;
            top: 10px;
            
        }
        .u3{
        font-family: "Noto Sans KR", sans-serif;
        font-size: 20px;
        font-weight: 400;
        font-style: normal;
        position: relative;
        left : 50px;
        top : -8px;
        }
        
        #mainDiv{
        display: flex; /*div의 table을 2개 사용하면서 나란히 놓고 싶을 때 사용하는 css*/
        }
        
        #ccc{
       	height : 10px;
        }
    
 
   





        
</style>
</head>
<body>

<div id="mainDiv">
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
             </tr>
             
            </table>    
                 <!-- 
                <table id="m2">
				
				 <tr id="uu"></tr>
            <tr>
                <td>
                     <span id="timeOne">실시간 공연 순위<img src="/show/resources/images/images2/ranking.png" alt="" id="u2"></span>
                </td>
            </tr> 
            <tr id="uuu"></tr>
            <tr id="uuu"></tr>
            <tr class="rankShow">
            
            </tr>
            

        </table>
        -->
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


	 
    
    
    <div class="content" >
        <table id="box" >
         <tr id="ll"></tr>
            <tr>
            	<td id="rr"></td>
            	
                <td>
                    <p><span id="c1">누구나 즐길 수 있는 행복한 공연문화를 위해</span> <br> <span id="c2">지금부터 </span>
                    <span id="c3">암표 거래</span><span id="c4">를</span> <span id="c5">멈춰주세요</span> 
                    </p>

                </td>
                <td id="kk" ></td>
                <td>
                <a href="https://www.youtube.com/watch?si=0u5-or70qp9vCzd3&v=jPhBtq425d4&feature=youtu.be" target="_blank">
                <img src="/show/resources/images/암표거래.jpg" alt="" id="ticket2"> </a>
                </td>
                <td id="dd"></td>
                <td id="and">
                    |
                </td>
                <td id="kk" ></td>
                <td id="dd"></td>
                <td>
                <a href="${contextPath}/meeting/list">
                    <span id="a1">함께 공연을 즐기는</span> <span id="a2">소모임</span><br><span id="a3">"같이 공연 보러 갈래?"</span>
                </a>
                </td>
                

               

                
				<td>
                <a  href="${contextPath}/meeting/list"><img src="/show/resources/images/소모임.jpg" alt="" id="ticket"></a>
                </td>
                <td id="rr"></td>
                <td id="kk" ></td>
                <td id="kk" ></td>
                
            </tr>
            <tr id="ll"></tr>

        </table>
        </div>

</body>
</html>