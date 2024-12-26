<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>뮤지컬리스트</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jersey+25&family=Jersey+25+Charted&family=Jua&family=Libre+Barcode+128+Text&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/e7db19de60.js" crossorigin="anonymous"></script>
<style>
    .musicalSlider{
        
        width: 72%;
        height: 70%;
        display:block;
        margin: auto; /*display:block일때 margin:auto로 하면 가운데 정렬*/
        border-radius: 10px;
       
    }



   

    body {
      
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color: #000;
      margin: 0;
      padding: 0;
    }

    .swiper {
      position: relative;
      width: 100%;
      height: 100%;
    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      
      display: flex;
      justify-content: center;
      align-items: center;
      border-radius: 10px;
    }

    .swiper-slide img {
      display: block;
      width: 100%;
      height: 100%;
      object-fit: cover;
      border-radius: 10px;
    }

    .autoplay-progress {
      position: absolute;
      right: 16px;
      bottom: 16px;
      z-index: 10;
      width: 48px;
      height: 48px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: bold;
      color: var(--swiper-theme-color);
    }

    .autoplay-progress svg {
      --progress: 0;
      position: absolute;
      left: 0;
      top: 0px;
      z-index: 10;
      width: 100%;
      height: 100%;
      stroke-width: 4px;
      stroke: var(--swiper-theme-color);
      fill: none;
      stroke-dashoffset: calc(125.6px * (1 - var(--progress)));
      stroke-dasharray: 125.6;
      transform: rotate(-90deg);
    }

    #musi{
        font-family: "Noto Sans KR", sans-serif;
        font-size: 35px;
        font-weight: 600;
        font-style: normal;
        position: relative;
        left: 220px;

            
    }

</style>
</head>
<body>

<%@include file="/WEB-INF/views/common/menubar.jsp" %>

   <br><br>
    <span id="musi">콘서트</span>

    <br><br>

    <div class="musicalSlider" >

        
   
    
    <div class="swiper mySwiper">
        <div class="swiper-wrapper">
          <div class="swiper-slide"><img src="/show/resources/showConcertList/러브.jpg" alt=""></div>
          <div class="swiper-slide"><img src="/show/resources/showConcertList/레전드.jpg" alt=""></div>
          <div class="swiper-slide"><img src="/show/resources/showConcertList/린.jpg" alt=""></div>
          <div class="swiper-slide"><img src="/show/resources/showConcertList/변진섭.jpg" alt=""></div>
          <div class="swiper-slide"><img src="/show/resources/showConcertList/오현우.jpg" alt=""></div>
          <div class="swiper-slide"><img src="/show/resources/showConcertList/유리.jpg" alt=""></div>
          <div class="swiper-slide"><img src="/show/resources/showConcertList/이무진.jpg" alt=""></div>
          <div class="swiper-slide"><img src="/show/resources/showConcertList/일본.jpg" alt=""></div>
          <div class="swiper-slide"><img src="/show/resources/showConcertList/조용필.jpg" alt=""></div>
        </div>
        
        <div class="autoplay-progress">
          <svg viewBox="0 0 48 48">
            <circle cx="24" cy="24" r="20"></circle>
          </svg>
          <span></span>
        </div>
      </div>

    </div>
    
      <!-- Swiper JS -->
      <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    
      <!-- Initialize Swiper -->
      <script>
        const progressCircle = document.querySelector(".autoplay-progress svg");
        const progressContent = document.querySelector(".autoplay-progress span");
        var swiper = new Swiper(".mySwiper", {
          spaceBetween: 30,
          centeredSlides: true,
          autoplay: {
            delay: 5000,
            disableOnInteraction: false
          },
          on: {
            autoplayTimeLeft(s, time, progress) {
              progressCircle.style.setProperty("--progress", 0 - progress);
              progressContent.textContent = `${Math.ceil(time / 5000)}s`;
            }
          }
        });
      </script>
      
      <%@include file="/WEB-INF/views/showList/concertRanking.jsp" %>
      <%@include file="/WEB-INF/views/showList/concertRegion.jsp" %>
      
      <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>