<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://kit.fontawesome.com/3a115195d8.js"crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
	.outer2 {
		width: 100%; /* 100%로 설정하여 부모 div에 맞게 꽉 채움 */
		flex-grow: 1; /* 부모 요소의 높이에 맞게 자식 요소의 높이를 늘림 */
		text-align: left;
		padding: 10px;
		box-sizing: border-box;
		margin: 30px 20px 0px 20px;
	}
	
	.outer2 span {
		margin-left: 15px;
	}
	
	.oneQ {
		border: 1px solid lightgray;
		margin: 10px 10px 0px 0px;
		padding: 15px 0px 10px 15px;
		width: 95%;
		border-radius: 10px;
		box-shadow: 0px 4px 5px rgba(0, 0, 0, 0.1);
		cursor: pointer;
	}
	
	.oneQ:hover {
		background-color: lightgray;
	}
	
	.a {
		text-align: left;
		width: 60%;
		margin: 0px auto;
		background-color: white;
		padding: 20px;
		border: 1px solid lightgray;
	   	border-radius: 0px 0px  10px 10px;
		border-top : none;
	}
	
	.a h1 {
		text-align: center;
	}
	
	#search {
		width: 90%;
		padding: 15px;
		margin: 20px 0px 0px 40px;
		border-radius: 30px;
		border: 1px solid #ddd;
		font-size: 16px;
	}
	
	#search:focus {
		outline: none;
		border: 1px solid #597c9b;
	}
	
	#ques {
		position: absolute; /* 부모요소를 기준으로 배치 */
		top: 135px;
		bottom: 5px;
		left: 210px;
	}
	
	.faqP p {
		display: none;
		margin-top: 20px;
		padding: 10px;
		background-color: #f9f9f9;
		border-radius: 8px;
		border: 1px solid #ddd;
	}
	
	.faqP p {
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
		margin: 10px 40px 10px 0px;
		border-radius: 10px;
		cursor: pointer;
	}
	
	.faq:hover {
		background-color: #597c9b;
	}
	
	.faq i {
		color: #597c9b;
		margin: 0px 10px 0px 5px;
	}
	
	.faq-button {
		border: 1px solid #597c9b;
		background-color: white;
		width: 50%;
		border-radius: 10px;
		padding: 10px;
		margin-top: 10px;
		cursor: pointer;
	}
	
	.faq-filter {
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
	
	.aStyle:hover {
		background-color: #597c9b;
		color: white;
	}
	
	.link{
		display: block;
	    width: inherit;
	    height: inherit;
	    text-decoration: none;
	    padding: inherit; 
	}
	
	.allFaq{
	   display: block;
	   width: 100%;
	   text-decoration: none; /* 밑줄 제거 */
	   color: black;
	   padding: 10px;
	   border-radius: 10px;
	   cursor: pointer;
	}
	.info{
		margin: 10px 10px 0px 0px;
		padding: 30px 0px 15px 30px;
		width: 95%;
		border-radius: 10px;
		box-shadow: 0px 4px 5px rgba(0, 0, 0, 0.1);
		border: 1px solid lightgray;
	}
	.info div {
		border-bottom: 1px solid lightgray;
		width: 98%;
		padding-bottom: 20px;
	}
	
</style>

</head>
<body>

	<%@include file="/WEB-INF/views/common/menubar.jsp"%>

	<div class="a">
		<h1>고객님, 무엇을 도와드릴까요?</h1>

		<div class="outer2 faqP">
			<h3>자주 묻는 질문</h3>
			<span>
				<button class="faq-filter" name="all" value="all">TOP5</button>
                <button class="faq-filter" name="1" value="1">티켓</button>
                <button class="faq-filter" name="2" value="2">회원/기타</button>
			</span>
			
			<div class="divFilter">
	           	<c:if test="${not empty faqList }">
	           		<c:forEach var="list" items="${faqList}" end="4">
			      		<div class="faq">
			                <i class="fa-solid fa-q"></i> ${list.faqTitle}
			                <p>${list.faqContent}</p>
			            </div>
	           		</c:forEach>	
	           	</c:if>
           </div>

			<div align="center" class="aStyle">
				<a href="${contextPath}/faq" class="allFaq">자주 묻는 질문 전체보기</a>
			</div>
		</div>


		<div class="outer2">
			<h3>다른 도움이 필요하신가요?</h3>
			
			<div class="oneQ">
				<a href="${contextPath}/question" class="link">
					<i class="fa-solid fa-comment"></i> &nbsp; 1:1 문의하기
					<p>자세한 상담이 가능해요</p>
				</a>
			</div>

			<div class="oneQ">
				<a href="${contextPath}/member/qna?userNo=${loginUser.userNo}" class="link">
					<i class="fa-regular fa-clipboard"></i> &nbsp; 내 문의 내역 보기
					<p>문의한 내용을 확인해보세요</p>
				</a>
			</div>
			
		</div>
		<br>
		<br>
		<div class="outer2">
			<h3>고객센터 안내</h3>
			<div class="info">
				<div>
					<i class="fa-solid fa-phone">&nbsp; 티켓 1588-2690</i>
				</div>
				<p>○&nbsp; 09:00 ~ 18:00 (연중무휴)</p>
				<p>○&nbsp; 입점 판매 문의는 점심시간 (12:00 ~ 13:00) 및 주말/공휴일 상담 제외</p>
			</div>
		</div>
		<br>
		<br>
	</div>


	<script>
	
		// 카테고리별 faq
	    $(".faq-filter").click(function(){
			
	    	var qcategoryNo = $(this).val();
			console.log(qcategoryNo);
			
			$.ajax({
	            url : "faqFilter",
	            data : {
	               qcategoryNo : qcategoryNo
	            },
	            success : function(data){
	            	
	            	console.log(data);
	              	var str = "";
	              	
	               	if(data != null){
	               		for(var i = 0; i<5; i++){
	               			str += '<div class="faq">'
	                	   	    + '<i class="fa-solid fa-q"></i>'+data[i].faqTitle
	                	   	    + '<p>' + data[i].faqContent + '</p>' 
	                	   	    + '</div>';
	            	   	}
	               	}
	           	  	$(".divFilter").empty(); 
	           	  	$(".divFilter").append(str);  
	               
	            }, 
	            error : function(){
	               console.log("오류발생");
	            }
	         });
	         
		});
	
		
	    // qa 슬라이드 
	    $(function(){
	    	// 동적 요소(카테고리별 QA)는 .on()을 활용하여야 이벤트 적용이 가능하다. 
	    	$(document).on("click",".faq",function(){
	            var $faqEl = $(this).find("p");
	
	            if($faqEl.css("display") == "none"){
	                $(".faq p").slideUp();
	                $faqEl.slideDown();
	            }else{
	                $faqEl.slideUp();
	            }
	    	});
	    });
	    
	</script>

<br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />


</body>
</html>