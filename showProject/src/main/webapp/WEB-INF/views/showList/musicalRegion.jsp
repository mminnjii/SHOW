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

    .image-wrapper {
    width: 270px;
    height: 350px; /* 부모 컨테이너 크기 설정 */
    border-radius: 10px; /* 부모 컨테이너의 border-radius 설정 */
    overflow: hidden; /* 이미지가 확대될 때 부모 컨테이너 밖으로 넘지 않도록 숨김 */
    text-decoration: none;
    display: flex;
    justify-content: center;
    align-items: center; /* 이미지를 부모 요소 안에서 중앙에 배치 */
	}

	.r1{
    width: 100%; /* 이미지 크기가 부모 컨테이너 크기에 맞게 조정 */
    height: 100%;
    transition: transform 0.3s ease-in-out; /* 이미지 확대 시 부드러운 전환 효과 */
    object-fit: cover; /* 이미지가 부모 요소의 크기에 맞게 잘리거나 비율을 유지하여 채워짐 */
	}

	.r1:hover {
    transform: scale(1.1); /* hover 시 이미지 확대 */
	}
    #oo{
        width: 30px;
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
    #list11{
        height: 70px;
        left:390px;
        position: relative;
  
        
    }
    #rank11{
      
      left:390px;
		position: relative;
        font-family: "Noto Sans KR", sans-serif;
        font-size: 35px;
        font-weight: 500;
        font-style: normal;
        color: black;
        
    }
    .mureTable{
      
       
        position: relative;
        left:390px;
        
    }
  
</style>
</head>
<body>

    <div>
    <span id="rank11">지역</span> 
            <br><br>
            <div id="list11">
           
                <button id="c1">서울</button>
                <button id="c2">경기/인천</button>
                <button id="c3">충청/강원</button>
                <button id="c4">대구/경북</button>
                <button id="c5">부산/경남</button>
                <button id="c6">광주/전라</button>
                <button id="c7">제주</button>
                
            </div>
            
         
    
    
    
    
        <table class="mureTable" >
            
            
            
            <tr id="regionArea">
                
              
                 </tr>
                
                
           
            
            
            
            
        </table>

    </div>
    
    <script>
   
		$(document).on('click','#regionArea td',function(){
			
			//var showName = $('#regionArea td').eq(1).text();
			var showName = $(this).find('span#j1').text();
			console.log(showName); 
			location.href = "/show/showInfo/detail?showName="+ showName;
			
		});
    
		
     
     </script>

    <script>
    
    var seoulRegion = $("#regionArea").html();

    $(document).ready(function(){
        // 페이지 로드 시 바로 데이터를 불러와서 표시
        seoulRegionData();

        
        // #c1 버튼 클릭 시 데이터 로드
        $("#c1").click(function(){
        	
            $(this).prop('disabled', true);  
            $("#regionArea").empty();
            loadRegionData();  // 데이터를 불러오는 함수 호출
        });
    });

    
    // 데이터를 불러오는 함수
    function loadRegionData() {
        $.ajax({
            url: "musicalRegion0",  // 서버에서 데이터를 가져오는 URL
            success: function(result){
                var str = ""; 

                // 데이터를 4개씩 묶어서 출력하는 부분
                for (var i = 0; i < result.length; i++) {
                    if (i % 4 == 0) {  // i가 4의 배수일 때 새로운 행 시작
                        if (i > 0) {
                            str += "</tr>"; // 이전 행을 닫음
                        }
                        str += "<tr>"; // 새로운 행 시작
                    }

                    var imgPath = '/show/resources/PosterUploadFiles/' + result[i].posterChangeName + '.jpg';
                    //console.log("Image path: " + imgPath);

                    // td 추가
                    str += "<td>"
                    	+ "<div class='image-wrapper'>"
                        + "<img src='" + imgPath + "' alt='Poster Image' class='r1'/></div><br><br>"
                        + "<span id='j1'>" + result[i].showName + "</span><br>"
                        + "<span id='j2'>" + result[i].showStart + "-" + result[i].showEnd + "</span><br><br><br><br>"
                        + "</td>"
                        + "<td id='oo'></td>";
                }

                // 마지막 tr을 닫음
                str += "</tr>";

                // regionArea에 데이터를 추가
                $("#regionArea").append(str);

                // 버튼을 다시 활성화
                $("#list11 > button").removeAttr("disabled");

            },
            error:function(){
                console.log("통신 오류");
            }
        });
    }

    // 페이지 로드 시 데이터를 불러오기
    function seoulRegionData() {
        loadRegionData();  // 페이지 로드 시 데이터를 불러오는 함수 호출
    }


        
        
        $("#c2").click(function(){
        	
        	
        	$(this).prop('disabled',true);
        	
        	$("#regionArea").empty();
        	
        	
        	$.ajax({
        		
        		url: "musicalRegion1",
        		success: function(result){
        			
        			var str = ""; 
        			
        			

        			for (var i = 0; i < result.length; i++) {
        			   
        			    if (i % 4 == 0) { //i가 4의 배수이면서 또 i>0면 >> 4개의 항목마다 이전 tr를 닫음
        			    	if (i > 0) {
          			          
        			            str += "</tr>";
        			        }//i가 0보다 작다면 새로운 tr 시작
        			      
        			        str += "<tr>";
        			    }
        			    
        			    var imgPath = '/show/resources/PosterUploadFiles/' + result[i].posterChangeName + '.jpg';
        			   
        			    console.log("Image path: " + imgPath);
        			    
        			    // td 추가
        			    str += "<td>"
        			    	+ "<div class='image-wrapper'>"
        			    	+ "<img src='" + imgPath + "' alt='Poster Image' class='r1'/></div><br><br>"
        			        + "<span id='j1'>" + result[i].showName + "</span><br>"
        			        + "<span id='j2'>" + result[i].showStart + "-" + result[i].showEnd + "</span><br><br><br><br>"
        			        + "</td>"
        			        + "<td id='oo'></td>";
        			}

        			// 마지막 tr을 닫음
        			str += "</tr>";

        			$("#regionArea").append(str);
        			
        			
        			$("#list11 > button").removeAttr("disabled");
        			
        		},
        		error:function(){
        			console.log("통신 오류");
        		}
        		
        	});
        });
        
        
       
        
        

        
	        $("#c3").click(function(){
	        	
	        	
	        	$(this).prop('disabled',true);
	        	
	        	$("#regionArea").empty();
	        	
	        	$.ajax({
	        		
	        		url: "musicalRegion2",
	        		success: function(result){
	        			
	        			var str = "";  // str을 반복문 밖에서 선언
	
	        			for (var i = 0; i < result.length; i++) {
	        			   
	        			    if (i % 4 == 0) { //i가 4의 배수이면서 또 i>0면 >> 4개의 항목마다 이전 tr를 닫음
	        			        if (i > 0) {
	        			          
	        			            str += "</tr>";
	        			        }//i가 0보다 작다면 새로운 tr 시작
	        			      
	        			        str += "<tr>";
	        			    }
	        			    
	        			    var imgPath = '/show/resources/PosterUploadFiles/' + result[i].posterChangeName + '.jpg';
	
	        			    // td 추가
	        			    str += "<td >"
	        			    	+ "<div class='image-wrapper'>"
	        			    	+ "<img src='" + imgPath + "' alt='Poster Image' class='r1'/></div><br><br>"
	        			        + "<span id='j1'>" + result[i].showName + "</span><br>"
	        			        + "<span id='j2'>" + result[i].showStart + "-" + result[i].showEnd + "</span><br><br><br><br>"
	        			        + "</td>"
	        			        + "<td id='oo'></td>";
	        			}
	
	        			// 마지막 tr을 닫음
	        			str += "</tr>";
	
	        			
	        			$("#regionArea").append(str);
	
	        			
	        			
	        			$("#list11 > button").removeAttr("disabled");
	        			
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
			        		
			        		url: "musicalRegion3",
			        		success: function(result){
			        			
			        			var str = "";  // str을 반복문 밖에서 선언
			
			        			for (var i = 0; i < result.length; i++) {
			        			   
			        			    if (i % 4 == 0) { //i가 4의 배수이면서 또 i>0면 >> 4개의 항목마다 이전 tr를 닫음
			        			        if (i > 0) {
			        			          
			        			            str += "</tr>";
			        			        }//i가 0보다 작다면 새로운 tr 시작
			        			      
			        			        str += "<tr>";
			        			    }
			
			        			    var imgPath = '/show/resources/PosterUploadFiles/' + result[i].posterChangeName + '.jpg';
			        			    // td 추가
			        			    str += "<td>"
			        			    	+ "<div class='image-wrapper'>"
			        			    	+ "<img src='" + imgPath + "' alt='Poster Image' class='r1'/></div><br><br>"
			        			        + "<span id='j1'>" + result[i].showName + "</span><br>"
			        			        + "<span id='j2'>" + result[i].showStart + "-" + result[i].showEnd + "</span><br><br><br><br>"
			        			        + "</td>"
			        			        + "<td id='oo'></td>";
			        			}
			
			        			// 마지막 tr을 닫음
			        			str += "</tr>";
			
			        			
			        			$("#regionArea").append(str);
			
			        			
			        			
			        			
			        			$("#list11 > button").removeAttr("disabled");
			        			
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
        		
        		url: "musicalRegion4",
        		success: function(result){
        			
        			var str = "";  // str을 반복문 밖에서 선언

        			for (var i = 0; i < result.length; i++) {
        			   
        			    if (i % 4 == 0) { //i가 4의 배수이면서 또 i>0면 >> 4개의 항목마다 이전 tr를 닫음
        			        if (i > 0) {
        			          
        			            str += "</tr>";
        			        }//i가 0보다 작다면 새로운 tr 시작
        			      
        			        str += "<tr>";
        			    }

        			    var imgPath = '/show/resources/PosterUploadFiles/' + result[i].posterChangeName + '.jpg';
        			    // td 추가
        			    str += "<td>"
        			    	+ "<div class='image-wrapper'>"
        			    	+ "<img src='" + imgPath + "' alt='Poster Image' class='r1'/></div><br><br>"
        			        + "<span id='j1'>" + result[i].showName + "</span><br>"
        			        + "<span id='j2'>" + result[i].showStart + "-" + result[i].showEnd + "</span><br><br><br><br>"
        			        + "</td>"
        			        + "<td id='oo'></td>";
        			}

        			// 마지막 tr을 닫음
        			str += "</tr>";

        			
        			$("#regionArea").append(str);

        			
        			
        			
        			$("#list11 > button").removeAttr("disabled");
        			
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
	        		
	        		url: "musicalRegion5",
	        		success: function(result){
	        			
	        			var str = "";  // str을 반복문 밖에서 선언
	
	        			for (var i = 0; i < result.length; i++) {
	        			   
	        			    if (i % 4 == 0) { //i가 4의 배수이면서 또 i>0면 >> 4개의 항목마다 이전 tr를 닫음
	        			        if (i > 0) {
	        			          
	        			            str += "</tr>";
	        			        }//i가 0보다 작다면 새로운 tr 시작
	        			      
	        			        str += "<tr>";
	        			    }
	
	        			    var imgPath = '/show/resources/PosterUploadFiles/' + result[i].posterChangeName + '.jpg';
	        			    // td 추가
	        			    str += "<td>"
	        			    	+ "<div class='image-wrapper'>"
	        			    	+ "<img src='" + imgPath + "' alt='Poster Image' class='r1'/></div><br><br>"
	        			        + "<span id='j1'>" + result[i].showName + "</span><br>"
	        			        + "<span id='j2'>" + result[i].showStart + "-" + result[i].showEnd + "</span><br><br><br><br>"
	        			        + "</td>"
	        			        + "<td id='oo'></td>";
	        			}
	
	        			// 마지막 tr을 닫음
	        			str += "</tr>";
	
	        			
	        			$("#regionArea").append(str);
	
	        			
	        			
	        			
	        			$("#list11 > button").removeAttr("disabled");
	        			
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
    		
    		url: "musicalRegion6",
    		success: function(result){
    			
    			var str = "";  // str을 반복문 밖에서 선언

    			for (var i = 0; i < result.length; i++) {
    			   
    			    if (i % 4 == 0) { //i가 4의 배수이면서 또 i>0면 >> 4개의 항목마다 이전 tr를 닫음
    			        if (i > 0) {
    			          
    			            str += "</tr>";
    			        }//i가 0보다 작다면 새로운 tr 시작
    			      
    			        str += "<tr>";
    			    }

    			    var imgPath = '/show/resources/PosterUploadFiles/' + result[i].posterChangeName + '.jpg';
    			    // td 추가
    			    str += "<td>"
    			    	+ "<div class='image-wrapper'>"
    			    	+ "<img src='" + imgPath + "' alt='Poster Image' class='r1'/></div><br><br>"
    			        + "<span id='j1'>" + result[i].showName + "</span><br>"
    			        + "<span id='j2'>" + result[i].showStart + "-" + result[i].showEnd + "</span><br><br><br><br>"
    			        + "</td>"
    			        + "<td id='oo'></td>";
    			}

    			// 마지막 tr을 닫음
    			str += "</tr>";

    			
    			$("#regionArea").append(str);

    			
    			
    			
    			$("#list11 > button").removeAttr("disabled");
    		},
    		error:function(){
    			console.log("통신 오류");
    		}
    		
    	});
    });
			    </script>
		    
</body>
</html>