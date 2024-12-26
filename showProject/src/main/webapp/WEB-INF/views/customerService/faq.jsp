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
        
        .a {
            text-align: left;
            width: 60%;
            margin: 0px auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.4);
            border-radius: 10px;

        }
        
        .a h1{
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
            margin: 10px 40px 10px 0px;
            border-radius: 10px;
            cursor: pointer;
        }

        .faq:hover {
            background-color: #597c9b;
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
        }

        .faq-button:hover{
            background-color: #597c9b;
            color: white;
        }

        .faq-filter{
            border: 1px solid #f9f9f9;
            border-radius: 20px;
            padding: 5px 10px 5px 10px;
        }

        .down{
            margin-left: 800px;
        }

        .plusBtn {
			border: 1px solid gray;
			background-color: white;
			width: 95%;
			margin: 15px 0px 0px 9px;
			height: 40px;
			text-align: center;
			border-radius: 5px;
			cursor: pointer;
			padding: 5px;
			text-align: center;
		}
		        
		        
    </style>

</head>
<body>

	<%@include file="/WEB-INF/views/common/menubar.jsp" %>

	<br><br><br><br>
    <div class="a">
        <br>
        &nbsp;<i id="back" class="fa-solid fa-angles-left" onclick="history.back();"></i>
        <h1>자주 묻는 질문</h1>
        <input type="text" id="search" placeholder="궁금한 점을 검색해 보세요.">   
        <br>

        <div class="outer2 faqP">
            <span>
                <button class="faq-filter" name="all" value="all">전체</button>
                <button class="faq-filter" name="top" value="top">TOP Q&A</button>
                <button class="faq-filter" name="1" value="1">티켓</button>
                <button class="faq-filter" name="2" value="2">회원/기타</button>
            </span>
      		<br><br>
      		<div class="divFilter">
	           	<c:if test="${not empty faqList }">
	           		<c:forEach var="list" items="${faqList}">
			      		<div class="faq">
							<input type="hidden" value="${list.faqNo}" id="faqNo">
			                <i class="fa-solid fa-q"></i> ${list.faqTitle}
			                <p>${list.faqContent}</p>
			            </div>
	           		</c:forEach>	
	           		
	           	</c:if>
	           	
           		
           </div>

        </div>
	</div>
    <br><br>
        
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    
    <script>     
    	// 검색 faq 리스트 
    	$("#search").on("input", function(){
    		
    		var keyword = $("#search").val();	
   		
    		$.ajax({
    			url : "search",
    			data : {
    				keyword : keyword
    			}, success : function(searchList){
    				
    				console.log(searchList);
    				
   					if(searchList != null){
   						
    					$(".divFilter").html("");
                  		var str = "";
    					for(var i = 0; i<searchList.length; i++){
                  			str += '<div class="faq">'
                  				+ '<input type="hidden" value="'+loadData[i].faqNo+'" id="faqNo">'
   	                	   	    + '<i class="fa-solid fa-q"></i>'+searchList[i].faqTitle
   	                	   	    + '<p>' + searchList[i].faqContent + '</p>' 
   	                	   	    + '</div>';
                   	   	}

    					
                   	  	$(".divFilter").append(str);
                   	  	
                	} else{
                		$(".divFilter").html("");
    					var str2 = "";
    					str2 += "<h4>검색 결과가 없습니다.</h4>"
    						 + "<p>다른 검색어를 입력해 주세요.</p>"
    					$(".divFilter").html(str2);
    				}
    				
    				
    			}, error : function(){
    				console.log("검색 불가능");	
    			}
    		})
    	});	
    	
    	
    	// 카테고리별 faq
	    $(".faq-filter").click(function(){

	    	var qcategoryNo = $(this).val();
    		
    		$.ajax({
                url : "faqFilter",
                data : {
                   qcategoryNo : qcategoryNo
                },      
                success : function(data){
                	
                	// 1. 리스트를 가져와서 10개만 먼저 보여준다. 
                	// 2. 다음 페이지 버튼을 누르면 기존 10개 + 새롭게 나온 10개를 같이 보여준다. 
                	// 3. 다음 페이지 버튼 - (현재 보여진 qa 개수 / 전체 개수) 
                	console.log(data);
                	
                	// 몇 개씩 보여줄 것인지 
                	var item = 10;
                	
                	// 현재 페이지에서 보여주는 개수
                	var page = 0;

                	function faqList(){                		
	                	
	                	var str = "";
	                	
	                	// (0, 10)  (10, 20) (20, 30) 10개 항목씩 가져온다. 
	                	var loadData = data.slice(page, page+item);
	                	
	                	// loadData가 데이터가 있고, 리스트가 비어있지 않으면 반복문을 사용하여 리스트 생성 
	                	if(loadData != null && loadData.length > 0){
	                		for(var i = 0; i < loadData.length; i++){
	                   			str += '<div class="faq">'
	                   				+ '<input type="hidden" value="'+loadData[i].faqNo+'" id="faqNo">'
		                	   	    + '<i class="fa-solid fa-q"></i>'+loadData[i].faqTitle
		                	   	    + '<p>' + loadData[i].faqContent + '</p>' 
		                	   	    + '</div>';
	                	   	}
	                		// 반복문 종료 후 페이지 증가
	                		page += loadData.length;
	                	}
	                	
	                	
	                	// 기존 데이터 유지하면서 추가 데이터 출력. 
	               	  	$(".divFilter").empty().append(str);  
	               		
	                	// 다음 페이지 버튼 추가 page가 data.length보다 작은 경우에만 다음 페이지 버튼을 생성한다. 
	                	if(page < data.length){
	                		// 기존 버튼이 있는 경우 삭제 
	                		$(".plusBtn").remove();
	                		$(".divFilter").append('<button class="plusBtn">다음 페이지 ( '+ page + ' / ' + data.length + ' ) ▽ </button>');
	                	}else{ // page와 데이터의 길이가 같거나 큰 경우에는 버튼을 삭제한다. 
	                		$(".plusBtn").remove();
	                	}
		                
	                	
                	}
                	
                	// 초기 데이터 
                	faqList();
                	
                	// 다음 페이지 버튼 클릭시 이벤트 => 동적생성 .on() 사용 
                	$(document).on('click', ".plusBtn", function(){
                		faqList();	
                	});
                   
                }, 
                
                error : function(){
                   console.log("오류발생");
                }
                
             });
             
    	});
    
	    // qa 슬라이드 
        $(function(){
        	// 동적 요소(카테고리별 QA)는 .on()을 활용하여야 이벤트 적용이 가능하다. 
        	$(document).on("click",".faq", function(){
                var $faqEl = $(this).find("p");
                
                if($faqEl.css("display") == "none"){
                    $(".faq p").slideUp();
                    $faqEl.slideDown();
                    
                    var faqNo =  $(this).find("input[type=hidden]").val(); 
    				console.log(faqNo);
    				
    				// 클릭 시 count 증가 (슬라이드가 내려왔을 때만 동작해야 한다.)
                    $.ajax({
                    	url : "faqCount",
                    	type : "POST",
                    	data : {
                    		faqNo : faqNo
                    	}, success(){
                    		console.log("count up");	
                    	}                	
                    });
                    
                }else{
                    $faqEl.slideUp();
                }
                
        	});
        });


    </script>

</body>
</html>