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
            width: 80%;
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

        
    </style>

</head>
<body>

	<%@include file="/WEB-INF/views/common/menubar.jsp" %>

	<br><br><br><br>
    <div class="a">
        <h1>자주 묻는 질문</h1>
        
        <input type="text" id="search" placeholder="궁금한 점을 검색해 보세요."> <br>       
        <br>

        <div class="outer2 faqP">
            <h3>자주 묻는 질문</h3>
            <span>
                <button class="faq-filter" name="all" value="all">전체</button>
                <button class="faq-filter" name="1" value="1">티켓</button>
                <button class="faq-filter" name="2" value="2">회원/기타</button>
            </span>
      		
	           	<c:if test="${not empty faqList }">
	           		<c:forEach var="list" items="${faqList}">
			      		<div class="faq">
			                <i class="fa-solid fa-q"></i> ${list.faqTitle}
			                <p>${list.faqContent}</p>
			            </div>
	           		</c:forEach>	
	           	</c:if>
           
            
        </div>
	</div>
        

        
    <script>   
    
	    $(".faq-filter").click(function(){

	    	var qcategoryNo = $(this).val();
    		
    		$.ajax({
                url : "faqFilter",
                data : {
                   qcategoryNo : qcategoryNo
                },
                success : function(data){
                   var str = "";
                  	
                   if(data != null){

                	   for(var i=0; i<data.length; i++){
                		   str += '<div class="faq">'
	                	   	   + '<i class="fa-solid fa-q"></i>'+data[i].faqTitle;
	                	   	   + '<p>'+data[i].faqContent+'</p>' 
	                	   	   + '</div>';
                	   }
                	   
                	   $(".faq").empty().append(str);
                   }
                   
                }, 
                error : function(){
                   console.log("오류발생");
                }
                
             });
             
    	});
    
	    
        $(function(){
            $(".faq").click(function(){

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

</body>
</html>