<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>지역별</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jersey+25&family=Jersey+25+Charted&family=Jua&family=Libre+Barcode+128+Text&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/e7db19de60.js" crossorigin="anonymous"></script>


<style>


    #c1,#c2,#c3,#c4,#c5,#c6,#c7{
        background-color: white;
        border-radius: 30px;
        border-color:gainsboro;
        border-style: solid; /*board-color는 border-style과 함께 사용되어야 한다.*/
        border-width: thin;
        width: 100px;
        height: 40px;

        
        
        
        font-family: "Noto Sans KR", sans-serif;
        font-size: 15px;
        font-weight: 500;
        font-style: normal;
        color: black;
    }
    #rank1,#rank2{
        border-style: none;
      

        font-family: "Noto Sans KR", sans-serif;
        font-size: 35px;
        font-weight: 500;
        font-style: normal;
        color: black;
        
    }
    #rank3{
        font-size: 20px;
        position: relative;
        top: -6px;
        


    }

    #r1,#r2,#r3,#r4{
        width: 270px;
        height: 350px;
        border-radius: 10px;
        align-items: center;
    }
    #oo{
        width: 20px;
    }
    #ooo{
        height: 25px;
    }
    #j1{
        font-family: "Noto Sans KR", sans-serif;
        font-size: 20px;
        font-weight: 500;
        font-style: normal;
        color: black;
    }
   #j2{
        font-family: "Noto Sans KR", sans-serif;
        font-size: 12px;
        font-weight: 400;
        font-style: normal;
        color: gray;
    }
    #list{
        height: 70px;
    }
    .mureTable{
        
        margin: auto;
    }
  
</style>
</head>
<body>

    <div>
        <table class="mureTable" >
            <tr><td id="rank1">지역</td>  </tr>
            <br><br>
            <tr>
            <td colspan="9" id="list">
                <button id="c1">서울</button>
                <button id="c2">경기/인천</button>
                <button id="c3">충청/강원</button>
                <button id="c4">대구/경북</button>
                <button id="c5">부산/경남</button>
                <button id="c6">광주/전라</button>
                <button id="c7">제주</button>
                
            </td>
            
            </tr>
            
            
            <tr id="regionArea">
                
                <td>
                    <a href=""><img src="/show/resources/images/뉴욕의거장들.jpg" alt="" id="r1"></a><br><br>
                    <span id="j1">[단독판매] 강홍석</span><br>
                    <span id="j2">12.23(월) 18:00</span>
                </td>
                <td id="oo"></td>
                <td>
                    <a href=""><img src="/show/resources/images/베르테르.jpg" alt="" id="r2"></a><br><br>
                    <span id="j1">[단독판매] 강홍석</span><br>
                    <span id="j2">12.23(월) 18:00</span>
                </td>
                <td id="oo"></td>
                <td>
                    <a href=""><img src="/show/resources/images/시라노.jpg" alt="" id="r3"></a><br><br>
                    <span id="j1">[단독판매] 강홍석</span><br>
                    <span id="j2">12.23(월) 18:00</span>
                </td>
                <td id="oo"></td>
                <td>
                    <a href=""><img src="/show/resources/images/오페라.jpg" alt="" id="r4"></a><br><br>
                    <span id="j1">[단독판매] 강홍석</span><br>
                    <span id="j2">12.23(월) 18:00</span>
                </td>
                <td id="oo"></td>
                
           
            </tr>
            
            
            
        </table>

    </div>

    <script>

        var seoulRegion = $("#regionArea").html();
        
        $("#c2").click(function(){
        	
        	
        	$(this).prop('disabled',true);
        	
        	$("#regionArea").empty();
        	
        	$.ajax({
        		
        		url: "playRegion1",
        		success: function(result){
        			
        			var str = ""; 

        			for (var i = 0; i < result.length; i++) {
        			   
        			    if (i % 4 == 0) { //i가 4의 배수이면서 또 i>0면 >> 4개의 항목마다 이전 tr를 닫음
        			    	if (i > 0) {
          			          
        			            str += "</tr>";
        			        }//i가 0보다 작다면 새로운 tr 시작
        			      
        			        str += "<tr>";
        			    }

        			    // td 추가
        			    str += "<td>"
        			        + "<a href=''><img src='/show/resources/images/오페라.jpg' alt='' id='r4'></a><br><br>"
        			        + "<span id='j1'>" + result[i].showName + "</span><br>"
        			        + "<span id='j2'>" + result[i].showStart + "-" + result[i].showEnd + "</span>"
        			        + "</td>"
        			        + "<td id='oo'></td>";
        			}

        			// 마지막 tr을 닫음
        			str += "</tr>";

        			$("#regionArea").append(str);
        			
        			
        			
        			$("#c1").removeAttr("disabled");
                	$("#c3").removeAttr("disabled");
                	$("#c4").removeAttr("disabled");
                	$("#c5").removeAttr("disabled");
                	$("#c6").removeAttr("disabled");
                	$("#c7").removeAttr("disabled");
        			
        		},
        		error:function(){
        			console.log("통신 오류");
        		}
        		
        	});
        });
        
        $("#c1").click(function(){
        	
        	$(this).prop('disabled',true);
        	
        	$("#regionArea").empty();
        	
        	$("#regionArea").append(seoulRegion);
        	
        	$("#c2").removeAttr("disabled");
        	$("#c3").removeAttr("disabled");
        	$("#c4").removeAttr("disabled");
        	$("#c5").removeAttr("disabled");
        	$("#c6").removeAttr("disabled");
        	$("#c7").removeAttr("disabled");
			
        	
        });
        
        

        
	        $("#c3").click(function(){
	        	
	        	
	        	$(this).prop('disabled',true);
	        	
	        	$("#regionArea").empty();
	        	
	        	$.ajax({
	        		
	        		url: "playRegion2",
	        		success: function(result){
	        			
	        			var str = "";  // str을 반복문 밖에서 선언
	
	        			for (var i = 0; i < result.length; i++) {
	        			   
	        			    if (i % 4 == 0) { //i가 4의 배수이면서 또 i>0면 >> 4개의 항목마다 이전 tr를 닫음
	        			        if (i > 0) {
	        			          
	        			            str += "</tr>";
	        			        }//i가 0보다 작다면 새로운 tr 시작
	        			      
	        			        str += "<tr>";
	        			    }
	
	        			    // td 추가
	        			    str += "<td>"
	        			        + "<a href=''><img src='/show/resources/images/오페라.jpg' alt='' id='r4'></a><br><br>"
	        			        + "<span id='j1'>" + result[i].showName + "</span><br>"
	        			        + "<span id='j2'>" + result[i].showStart + "-" + result[i].showEnd + "</span>"
	        			        + "</td>"
	        			        + "<td id='oo'></td>";
	        			}
	
	        			// 마지막 tr을 닫음
	        			str += "</tr>";
	
	        			
	        			$("#regionArea").append(str);
	
	        			
	        			
	        			
	        			$("#c1").removeAttr("disabled");
	                	$("#c2").removeAttr("disabled");
	                	$("#c4").removeAttr("disabled");
	                	$("#c5").removeAttr("disabled");
	                	$("#c6").removeAttr("disabled");
	                	$("#c7").removeAttr("disabled");
	        			
	        		},
	        		error:function(){
	        			console.log("통신 오류");
	        		}
	        		
	        	});
	        });
	        
	        
		$("#c4").click(function(){
			        	
			        	
			        	$(this).prop('disabled',true);
			        	
			        	$("#regionArea").empty();
			        	
			        	$.ajax({
			        		
			        		url: "playRegion3",
			        		success: function(result){
			        			
			        			var str = "";  // str을 반복문 밖에서 선언
			
			        			for (var i = 0; i < result.length; i++) {
			        			   
			        			    if (i % 4 == 0) { //i가 4의 배수이면서 또 i>0면 >> 4개의 항목마다 이전 tr를 닫음
			        			        if (i > 0) {
			        			          
			        			            str += "</tr>";
			        			        }//i가 0보다 작다면 새로운 tr 시작
			        			      
			        			        str += "<tr>";
			        			    }
			
			        			    // td 추가
			        			    str += "<td>"
			        			        + "<a href=''><img src='/show/resources/images/오페라.jpg' alt='' id='r4'></a><br><br>"
			        			        + "<span id='j1'>" + result[i].showName + "</span><br>"
			        			        + "<span id='j2'>" + result[i].showStart + "-" + result[i].showEnd + "</span>"
			        			        + "</td>"
			        			        + "<td id='oo'></td>";
			        			}
			
			        			// 마지막 tr을 닫음
			        			str += "</tr>";
			
			        			
			        			$("#regionArea").append(str);
			
			        			
			        			
			        			
			        			$("#c1").removeAttr("disabled");
			                	$("#c2").removeAttr("disabled");
			                	$("#c3").removeAttr("disabled");
			                	$("#c5").removeAttr("disabled");
			                	$("#c6").removeAttr("disabled");
			                	$("#c7").removeAttr("disabled");
			        			
			        		},
			        		error:function(){
			        			console.log("통신 오류");
			        		}
			        		
			        	});
			        });
		
		
		
		$("#c5").click(function(){
        	
        	
        	$(this).prop('disabled',true);
        	
        	$("#regionArea").empty();
        	
        	$.ajax({
        		
        		url: "playRegion4",
        		success: function(result){
        			
        			var str = "";  // str을 반복문 밖에서 선언

        			for (var i = 0; i < result.length; i++) {
        			   
        			    if (i % 4 == 0) { //i가 4의 배수이면서 또 i>0면 >> 4개의 항목마다 이전 tr를 닫음
        			        if (i > 0) {
        			          
        			            str += "</tr>";
        			        }//i가 0보다 작다면 새로운 tr 시작
        			      
        			        str += "<tr>";
        			    }

        			    // td 추가
        			    str += "<td>"
        			        + "<a href=''><img src='/show/resources/images/오페라.jpg' alt='' id='r4'></a><br><br>"
        			        + "<span id='j1'>" + result[i].showName + "</span><br>"
        			        + "<span id='j2'>" + result[i].showStart + "-" + result[i].showEnd + "</span>"
        			        + "</td>"
        			        + "<td id='oo'></td>";
        			}

        			// 마지막 tr을 닫음
        			str += "</tr>";

        			
        			$("#regionArea").append(str);

        			
        			
        			
        			$("#c1").removeAttr("disabled");
                	$("#c2").removeAttr("disabled");
                	$("#c3").removeAttr("disabled");
                	$("#c4").removeAttr("disabled");
                	$("#c6").removeAttr("disabled");
                	$("#c7").removeAttr("disabled");
        			
        		},
        		error:function(){
        			console.log("통신 오류");
        		}
        		
        	});
        });
		
		
		
	$("#c6").click(function(){
	        	
	        	
	        	$(this).prop('disabled',true);
	        	
	        	$("#regionArea").empty();
	        	
	        	$.ajax({
	        		
	        		url: "playRegion5",
	        		success: function(result){
	        			
	        			var str = "";  // str을 반복문 밖에서 선언
	
	        			for (var i = 0; i < result.length; i++) {
	        			   
	        			    if (i % 4 == 0) { //i가 4의 배수이면서 또 i>0면 >> 4개의 항목마다 이전 tr를 닫음
	        			        if (i > 0) {
	        			          
	        			            str += "</tr>";
	        			        }//i가 0보다 작다면 새로운 tr 시작
	        			      
	        			        str += "<tr>";
	        			    }
	
	        			    // td 추가
	        			    str += "<td>"
	        			        + "<a href=''><img src='/show/resources/images/오페라.jpg' alt='' id='r4'></a><br><br>"
	        			        + "<span id='j1'>" + result[i].showName + "</span><br>"
	        			        + "<span id='j2'>" + result[i].showStart + "-" + result[i].showEnd + "</span>"
	        			        + "</td>"
	        			        + "<td id='oo'></td>";
	        			}
	
	        			// 마지막 tr을 닫음
	        			str += "</tr>";
	
	        			
	        			$("#regionArea").append(str);
	
	        			
	        			
	        			
	        			$("#c1").removeAttr("disabled");
	                	$("#c2").removeAttr("disabled");
	                	$("#c3").removeAttr("disabled");
	                	$("#c4").removeAttr("disabled");
	                	$("#c5").removeAttr("disabled");
	                	$("#c7").removeAttr("disabled");
	        			
	        		},
	        		error:function(){
	        			console.log("통신 오류");
	        		}
	        		
	        	});
	        });
	
	$("#c7").click(function(){
    	
    	
    	$(this).prop('disabled',true);
    	
    	$("#regionArea").empty();
    	
    	$.ajax({
    		
    		url: "playRegion6",
    		success: function(result){
    			
    			var str = "";  // str을 반복문 밖에서 선언

    			for (var i = 0; i < result.length; i++) {
    			   
    			    if (i % 4 == 0) { //i가 4의 배수이면서 또 i>0면 >> 4개의 항목마다 이전 tr를 닫음
    			        if (i > 0) {
    			          
    			            str += "</tr>";
    			        }//i가 0보다 작다면 새로운 tr 시작
    			      
    			        str += "<tr>";
    			    }

    			    // td 추가
    			    str += "<td>"
    			        + "<a href=''><img src='/show/resources/images/오페라.jpg' alt='' id='r4'></a><br><br>"
    			        + "<span id='j1'>" + result[i].showName + "</span><br>"
    			        + "<span id='j2'>" + result[i].showStart + "-" + result[i].showEnd + "</span>"
    			        + "</td>"
    			        + "<td id='oo'></td>";
    			}

    			// 마지막 tr을 닫음
    			str += "</tr>";

    			
    			$("#regionArea").append(str);

    			
    			
    			
    			$("#c1").removeAttr("disabled");
            	$("#c2").removeAttr("disabled");
            	$("#c3").removeAttr("disabled");
            	$("#c4").removeAttr("disabled");
            	$("#c5").removeAttr("disabled");
            	$("#c6").removeAttr("disabled");
    			
    		},
    		error:function(){
    			console.log("통신 오류");
    		}
    		
    	});
    });
			    </script>
		    
</body>
</html>