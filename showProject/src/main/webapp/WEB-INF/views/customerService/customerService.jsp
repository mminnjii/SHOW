<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://kit.fontawesome.com/3a115195d8.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <style>
        .outer {
            border: 4px solid rgb(238, 236, 122);
            width: 100%; 
            display: flex;
            flex-direction: column;
            align-items: stretch;  /* 내용이 꽉 차게 설정 */
            margin: 0 auto;  /* 수평 중앙 정렬 */
            box-sizing: border-box;
        }

        .outer2 {
            width: 100%;  /* 100%로 설정하여 부모 div에 맞게 꽉 채움 */
            flex-grow: 1;  /* 부모 요소의 높이에 맞게 자식 요소의 높이를 늘림 */
            text-align: left;
            padding: 10px;
            box-sizing: border-box;
            margin-top: 40px;
            margin-left: 20px;
        }

        .outer2 span{
            margin-left: 15px;
        }
        
        .oneQ {
            margin-top: 10px;
            padding: 20px 0px 15px 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 5px rgba(0, 0, 0, 0.1);
            cursor: pointer;
        }

        .oneQ:hover{
            background-color: lightgray;
        }
        
        .a {
            text-align: left;
            width: 80%;
            margin: 0px auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;

        }
        
        .a h1{
            text-align: center;
        }

        #search {
            width: 90%;
            padding: 15px;
            margin: 15px;
            border-radius: 30px;
            border: 1px solid #ddd;
            font-size: 16px;
        }

        #search:focus {
            outline: none;
            border: 1px solid #597c9b;
        }

        #ques{
            position: absolute;  /* 부모요소를 기준으로 배치 */
            top: 135px;
            bottom: 5px;
            left: 210px;
        }

        .faqP p{
            display: none;
            margin-top: 20px;
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 8px;
            border: 1px solid #ddd;
        }

        .faq {
            background-color: #f7f7f7;
            padding: 10px;
            margin: 10px 0px 10px 0px;
            border-radius: 10px;
            cursor: pointer;
        }

        .faq:hover {
            background-color: #597c9b;
            color: white;
        }
        
        .faq i {
            color: #597c9b;
            margin : 0px 10px 0px 5px;
        }

        .faq-button{
            border: 1px solid #597c9b;
            background-color: white;
            width: 50%;
            border-radius: 10px;
            padding: 10px;
            margin-top: 10px;
            cursor: pointer;
        }

        .faq-filter{
            border: 1px solid lightgrey;
            border-radius: 20px;
            padding: 5px 10px 5px 10px;
        }

        .aStyle {
            border: 1px solid gray;
            width: 60%; 
            border-radius: 10px;
            margin: 10px auto;
            cursor: pointer;
            text-decoration: none;
            color: black;
            font-size: 13px;
            text-align: center;
        }

        .aStyle:hover,  .aStyle>a:hover{
            background-color: #597c9b;
            color: white;
        }

        a {
            display: block; 
            width: 100%; 
            text-decoration: none; /* 밑줄 제거 */
            color: black; 
            padding: 10px; 
            border-radius: 10px;
            cursor: pointer; 
        }
        
       
        
        /* display: inline-block; /* 버튼 스타일 */ 
    </style>

</head>
<body>

	<%@include file="/WEB-INF/views/common/menubar.jsp" %>
	
    <br><br>
    <div class="a">
        <h1>고객님, 무엇을 도와드릴까요? </h1>
        
        <input type="text" id="search" placeholder="검색어를 입력하세요."> <br>       
        <br>

        <div class="outer2 faqP">
            <h3>자주 묻는 질문</h3>
            <span>
                <button class="faq-filter">전체</button>
                <button class="faq-filter">티켓</button>
                <button class="faq-filter">회원/기타</button>
            </span>
            <div class="faq">
                <i class="fa-solid fa-q"></i> 티켓배송
                <p>3일 이후 처리 됩니다.</p>
            </div>
            <div class="faq">
                <i class="fa-solid fa-q"></i> 티켓 취소
                <p>3일 이후 처리 됩니다.</p>
            </div>
            <div class="faq">
                <i class="fa-solid fa-q"></i> 환불
                <p>3일 이후 처리 됩니다.</p>
            </div>
            <div class="faq">
                <i class="fa-solid fa-q"></i> 사용자 제한
                <p>3일 이후 처리 됩니다.</p>
            </div>
            <div class="faq">
                <i class="fa-solid fa-q"></i> 티켓예매번호
                <p>3일 이후 처리 됩니다.</p>
            </div>

            <div align="center" class="aStyle">
                <a href="${contextPath}/faq">자주 묻는 질문 전체보기</a>
            </div>
        </div>
        

        <div class="outer2">
            <h3>다른 도움이 필요하신가요?</h3>
            <div class="oneQ">
                <i class="fa-solid fa-magnifying-glass"></i>
                1:1 문의하기
                <p>자세한 상담이 가능해요</p>
            </div>

            <div class="oneQ">
                <i class="fa-solid fa-magnifying-glass"></i>
                내 문의 내역 보기
                <p>문의한 내용을 확인해보세요</p>
            </div>
        </div>
        <br><br>
        <div class="outer2">
            <h3>고객센터 안내</h3>
            <div>
                <i class="fa-solid fa-magnifying-glass"> 티켓 1234-1234</i>
                <p>○ 09:00 ~ 18:00 (연중무휴)</p>
                <p>○ 입점 판매 문의는 점심시간 (12:00 ~ 13:00) 및 주말/공휴일 상담 제외</p>
            </div>
        </div>
        <br><br>
    </div>


    <script>   
        $(function(){
            $(".faq").click(function(){

                var $faqEl = $(this).find("p");

                console.log($faqEl);

                if($faqEl.css("display") == "none"){
                    $(".faq p").slideUp();
                    $faqEl.slideDown();
                }else{
                    $faqEl.slideUp();
                }

            });
        });


    </script>
    
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    

</body>
</html>