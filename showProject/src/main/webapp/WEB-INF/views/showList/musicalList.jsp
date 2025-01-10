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
        left: 270px;

            
    }

</style>
</head>
<body>

<%@include file="/WEB-INF/views/common/menubar.jsp" %>

   <br><br>
    <span id="musi">뮤지컬</span>

    <br><br>

    <div class="musicalSlider" >

        
   
    
    <div class="swiper mySwiper">
        <div class="swiper-wrapper">
          <div class="swiper-slide"><a href="/show/showInfo/detail?showName=베르테르"><img src="/show/resources/images/musicalShowSlider/베르테르.jpg" alt=""></a></div>
          <div class="swiper-slide"><a href="/show/showInfo/detail?showName=시라노"><img src="/show/resources/images/musicalShowSlider/시라노.jpg" alt=""></a></div>
          <div class="swiper-slide"><a href="/show/showInfo/detail?showName=아나키스트"><img src="/show/resources/images/musicalShowSlider/아나키스트.jpg" alt=""></a></div>
          <div class="swiper-slide"><a href="/show/showInfo/detail?showName=오셀로"><img src="/show/resources/images/musicalShowSlider/오셀로.jpg" alt=""></a></div>
          <div class="swiper-slide"><a href="/show/showInfo/detail?showName=지킬"><img src="/show/resources/images/musicalShowSlider/지킬.jpg" alt=""></a></div>
          <div class="swiper-slide"><a href="/show/showInfo/detail?showName=클로버"><img src="/show/resources/images/musicalShowSlider/클로버.jpg" alt=""></a></div>
          <div class="swiper-slide"><a href="/show/showInfo/detail?showName=틱틱붐"><img src="/show/resources/images/musicalShowSlider/틱틱붐.jpg" alt=""></a></div>
          <div class="swiper-slide"><a href="/show/showInfo/detail?showName=퍼스트맨"><img src="/show/resources/images/musicalShowSlider/퍼스트맨.jpg" alt=""></a></div>
          <div class="swiper-slide"><a href="/show/showInfo/detail?showName=해적"><img src="/show/resources/images/musicalShowSlider/해적.jpg" alt=""></a></div>
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
      
      <%@include file="/WEB-INF/views/showList/musicalRanking.jsp" %>
      <%@include file="/WEB-INF/views/showList/musicalRegion.jsp" %>
      
      <br> <br> <br> <br> <br> <br> <br>
      
      <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>