<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장르별/지역별 랭킹</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jersey+25&family=Jersey+25+Charted&family=Jua&family=Libre+Barcode+128+Text&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/e7db19de60.js" crossorigin="anonymous"></script>


<style>

   
       

#tt{
        
        
        margin:auto;
        
       
    }
    .b1,.b2,.b3,.b4,.b5,.b6,.b7,.b8,.b9,.b10,.b11,.b12{
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
    .b1:hover, .b2:hover, .b3:hover, .b4:hover, .b5:hover, .b6:hover, .b7:hover, .b8:hover, .b9:hover, .b10:hover, .b11:hover, .b12:hover {
    border-color: black;
}

    #rank1,#rank2{
        border-style: none;
        background-color: white;

        font-family: "Noto Sans KR", sans-serif;
        font-size: 35px;
        font-weight: 500;
        font-style: normal;
        color: black
        position:relative;
        left : 200px;
        
    }
    #rank3{
        font-size: 20px;
        position: relative;
        top: -6px;
        color: gainsboro;
        position:relative;
        


    }
    #rrr{
    position:relative;
        left : 200px;}

    #f1,#f2,#f3,#f4,#f5{
        width: 200px;
        height: 250px;
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
        font-size: 15px;
        font-weight: 400;
        font-style: normal;
        color: red;
    }
    .list,.list2{
        height: 70px;
    }
    
     #one{
	  font-family: "Noto Sans KR", sans-serif;
        font-size: 70px;
        font-weight: 700;
        font-style: normal;
        color: white; 
        z-index: 20;
        position: relative;
        right:190px;
        display: inline-block;
        margin:0;
        padding:0;
      }
      
      #j3{
      	width:35px;
      }
        
  
</style>
</head>
<body>

    <div>
        <table id="tt">
         <br><br>
            <tr> 
            <td colspan="9">
            <button id="rank1">장르별랭킹</button>  <span id="rank3">&nbsp;|&nbsp;</span>   <button id="rank2">지역별랭킹</button>
            </td>
            </tr>
            <br><br>
            <tr id="btnList">
            <td colspan="9" class="list">
                <button class="b1">뮤지컬</button>
                <button class="b2">콘서트</button>
                <button class="b3">클래식/무용</button>
                <button class="b4">연극</button>
                <button class="b5">전시</button>
            </td>
            
             <td colspan="9" class="list2">
                <button class="b6">서울</button>
                <button class="b7">경기/인천</button>
                <button class="b8">충청/강원</button>
                <button class="b9">대구/경북</button>
                <button class="b10">부산/경남</button>
                <button class="b11">광주/전라</button>
                <button class="b12">제주</button>
            </td>
             
            </tr>
            
            
            <tr id="mainRank">
               
                

            </tr>
            
            <tr id="mainRank2"> 
            
            
            </tr>
            
            
         
            
           
        </table>

    </div>
    

    <script>
    
    $(".list > button , .list2 > button").click(function(){
        // 클릭된 버튼의 스타일을 바꾸기
        $(this).css({
            "background-color": "black",
            "color": "white"
        });

        // 다른 버튼들의 스타일을 초기화
        $(".list > button , .list2 > button").not(this).css({
            "background-color": "white",
            "color": "black"
        });
    });
    
    

    
    
	
	 $(document).ready(function(){
		    
		    //메인페이지 로딩되었을때 보여지는 화면구성
		    $(".list").show();        
    		$(".list2").hide();      
    		$("#mainRank").show();       
    		$("#mainRank2").hide(); 
		    
    		//장르별랭킹버튼을 클릭했을때
		   $("#rank1").click(function(){
		        
			   $(this).css({
			        "color" : "black"
			    });

			    // rank2 스타일을 회색으로 변경
			    $("#rank2").css({
			        "color" : "gray"
			    });
			   
		        $(".list").show();
		        $(".list2").hide(); 
		        $("#mainRank").show();
		        $("#mainRank2").hide();
		    });

		    //지역별랭킹버튼을 클릭했을때
		    $("#rank2").click(function(){
		       
		    	$(this).css({
			        "color" : "black"
			    });

			    // rank2 스타일을 회색으로 변경
			    $("#rank1").css({
			        "color" : "gray"
			    });
		    	
		    	
		        $(".list").hide(); 
		        $(".list2").show();
		        $("#mainRank2").show();
		        $("#mainRank").hide();
		    });
		   

		});

   
    
    var seoulRegion = $("#mainRank").html();

    $(document).ready(function(){
        // 페이지 로드 시 바로 데이터를 불러와서 표시
  		
       
        mainRankData();
        
        $("#rank1").click(function(){
        	$("#mainRank").empty();
        	$("#rank2").removeAttr("disabled");
        	mainRankData();
        });
        
        $("#rank2").click(function(){
        	$("#mainRank2").empty();
        	
        });
        	
        	
        

        
        //장르별랭킹 > 뮤지컬버튼
        $(".b1").click(function(){
        	
        	
            $(this).prop('disabled', true);  
            $("#mainRank").empty();
            loadRankData();  // 데이터를 불러오는 함수 호출
        });
    });

    
    // 데이터를 불러오는 함수
    function loadRankData() {
        $.ajax({
            url: "musicalShow",  // 서버에서 데이터를 가져오는 URL
            success: function(result){
                var str = ""; 
                var str = "";
                for(var i = 0; i < result.length; i++){
                    
                	var imgPath = '/show/resources/PosterUploadFiles/' + result[i].posterChangeName + '.jpg';
                    
                    str += "<td>"
                    	+ "<img src='" + imgPath + "' alt='Poster Image' id='f1'/><span id='one'>"+(i+1)+"</span><br><br>"
                          + "<span id='j1'>" + result[i].showName + "</span><br>"
                          + "<span id='j2'>" +result[i].showStart+"-"+result[i].showEnd+ "</span>"
                          + "</td>";
                          

                }

              

                // regionArea에 데이터를 추가
                $("#mainRank").append(str);

                // 버튼을 다시 활성화
                $(".list > button").removeAttr("disabled");

            },
            error:function(){
                console.log("통신 오류");
            }
        });
    }

    // 페이지 로드 시 데이터를 불러오기
    function mainRankData() {
    	loadRankData();  // 페이지 로드 시 데이터를 불러오는 함수 호출
    }

    
    
    //장르별랭킹 > 콘서트
    $(".b2").click(function(){
    	
    	// 버튼을 클릭했을 때 비활성화
        $(this).prop('disabled', true);
    	//console.log($(this));
    
    	
    	//버튼을 누르면 기존에 있던 데이터가 없어지고 필터링된 데이터가 보이게 설정
    	$("#mainRank").empty();
    	
    	
        $.ajax({
            url: "concertShow",
            success: function(result){
            	 
                var str = "";
                for(var i = 0; i < result.length; i++){
                    
                	var imgPath = '/show/resources/PosterUploadFiles/' + result[i].posterChangeName + '.jpg';
                    
                    str += "<td>"
                    	+ "<img src='" + imgPath + "' alt='Poster Image' id='f1'/><span id='one'>"+(i+1)+"</span><br><br>"
                          + "<span id='j1'>" + result[i].showName + "</span><br>"
                          + "<span id='j2'>" +result[i].showStart+"-"+result[i].showEnd+ "</span>"
                          + "</td>";
                          

                }
                  
                
                $("#mainRank").append(str);
                
                //b2버튼이 클릭되면 b1 버튼은 다시 활성화 될 수 있게 처리
                $(".list > button").removeAttr("disabled");
                
                
            
            },
            error: function(){
                console.log("통신 오류");
               
            }
          
            
        });
    });

    
    
    
 	

	//장르별랭킹 > 클래식/무용
    $(".b3").click(function(){
    	
    	
    	
        $(this).prop('disabled', true);

    	$("#mainRank").empty();
    	
    	
        $.ajax({
            url: "classicShow",
            success: function(result){
            	 
                var str = "";
                for(var i = 0; i < result.length; i++){
                    
                    
                	var imgPath = '/show/resources/PosterUploadFiles/' + result[i].posterChangeName + '.jpg';
                    str += "<td>"
                    	  + "<img src='" + imgPath + "' alt='Poster Image' id='f1'/><span id='one'>"+(i+1)+"</span><br><br>"
                          + "<span id='j1'>" + result[i].showName + "</span><br>"
                          + "<span id='j2'>" +result[i].showStart+"-"+result[i].showEnd+ "</span>"
                          + "</td>";
                          

                }
                  
                
                $("#mainRank").append(str);
                
                
                
                $(".list > button").removeAttr("disabled");
                
                
            
            },
            error: function(){
                console.log("통신 오류");
               
            }
          
            
        });
    });

    
    

    
    //장르별랭킹 > 연극
    $(".b4").click(function(){
    	
    	
    	
        $(this).prop('disabled', true);
    	
    	$("#mainRank").empty();
    	
    	
    	
        $.ajax({
            url: "playShow",
            success: function(result){
            	 
                var str = "";
                for(var i = 0; i < result.length; i++){
                    
                	var imgPath = '/show/resources/PosterUploadFiles/' + result[i].posterChangeName + '.jpg';
                    
                    str += "<td>"
                    	+ "<img src='" + imgPath + "' alt='Poster Image' id='f1'/><span id='one'>"+(i+1)+"</span><br><br>"
                          + "<span id='j1'>" + result[i].showName + "</span><br>"
                          + "<span id='j2'>" +result[i].showStart+"-"+result[i].showEnd+ "</span>"
                          + "</td>";
                         

                }
                  
                
                $("#mainRank").append(str);
                
                $(".list > button").removeAttr("disabled");
                
                
                
                
                
            
            },
            error: function(){
                console.log("통신 오류");
               
            }
          
            
        });
    });
    
    
  
    
    //장르별 랭킹 > 전시
    $(".b5").click(function(){
    	
    	
    	
        $(this).prop('disabled', true);
    	
    	$("#mainRank").empty();
    	
    	
        $.ajax({
            url: "displayShow",
            success: function(result){
            	 
                var str = "";
                for(var i = 0; i < result.length; i++){
                    
                	var imgPath = '/show/resources/PosterUploadFiles/' + result[i].posterChangeName + '.jpg';
                    
                    str += "<td>"
                    	+ "<img src='" + imgPath + "' alt='Poster Image' id='f1'/><span id='one'>"+(i+1)+"</span><br><br>"
                          + "<span id='j1'>" + result[i].showName + "</span><br>"
                          + "<span id='j2'>" +result[i].showStart+"-"+result[i].showEnd+ "</span>"
                          + "</td>";
                         
                }
                  
                
                $("#mainRank").append(str);
                
                $(".list > button").removeAttr("disabled");
                
                
            
            },
            error: function(){
                console.log("통신 오류");
               
            }
          
            
        });
    });

    	
    
   
 	//지역별랭킹 > 서울
    $("#rank2").click(function(){
    	
    	
    	
    	$(this).prop('disabled', true);
    	$("#mainRank2").empty();
    	
    	
    
     
    	 $.ajax({
             url: "mainRegionRank0",
             success: function(result){
             	 console.log(result);
                 var str = "";
                 for(var i = 0; i < result.length; i++){
                     
                     
                	 var imgPath = '/show/resources/PosterUploadFiles/' + result[i].posterChangeName + '.jpg';
                     
                     str += "<td>"
                     	+ "<img src='" + imgPath + "' alt='Poster Image' id='f1'/><span id='one'>"+(i+1)+"</span><br><br>"
                           + "<span id='j1'>" + result[i].showName + "</span><br>"
                           + "<span id='j2'>" +result[i].showStart+"-"+result[i].showEnd+ "</span>"
                           + "</td>";

                 }
                   
                 
                 $("#mainRank2").append(str);
                 
                 //b2버튼이 클릭되면 b1 버튼은 다시 활성화 될 수 있게 처리
                 $(".list2 > button").removeAttr("disabled");
                 $("#rank1").removeAttr("disabled");
                 
                 
             
             },
             error: function(){
                 console.log("통신 오류");
                
             
    	 } 
    	    
    	 
             
         });
     });
    	
 	
 	
  	//지역별랭킹 > 서울
    $(".b6").click(function(){
    	
    	
    	$(this).prop('disabled', true);
    	$("#mainRank2").empty();
    	
    	
    
     
    	 $.ajax({
             url: "mainRegionRank0",
             success: function(result){
             	 console.log(result);
                 var str = "";
                 for(var i = 0; i < result.length; i++){
                     
                     
                	 var imgPath = '/show/resources/PosterUploadFiles/' + result[i].posterChangeName + '.jpg';
                     
                     str += "<td>"
                     	+ "<img src='" + imgPath + "' alt='Poster Image' id='f1'/><span id='one'>"+(i+1)+"</span><br><br>"
                           + "<span id='j1'>" + result[i].showName + "</span><br>"
                           + "<span id='j2'>" +result[i].showStart+"-"+result[i].showEnd+ "</span>"
                           + "</td>";

                 }
                   
                 
                 $("#mainRank2").append(str);
                 
                 //b2버튼이 클릭되면 b1 버튼은 다시 활성화 될 수 있게 처리
                 $(".list2 > button").removeAttr("disabled");
                 $("#rank1").removeAttr("disabled");
                 
                 
             
             },
             error: function(){
                 console.log("통신 오류");
                
             
    	 } 
    	    
    	 
             
         });
     });
   
    	
     //지역별랭킹 > 경기/인천
	 $(".b7").click(function(){
		 
		 
		 
	    	
	    	$(this).prop('disabled', true);
	    	$("#mainRank2").empty();
	    
	           
	       
	    	
	    	 $.ajax({
	             url: "mainRegionRank1",
	             success: function(result){
	             	 console.log(result);
	                 var str = "";
	                 for(var i = 0; i < result.length; i++){
	                     
	                     
	                	 var imgPath = '/show/resources/PosterUploadFiles/' + result[i].posterChangeName + '.jpg';
	                     
	                     str += "<td>"
	                     	+ "<img src='" + imgPath + "' alt='Poster Image' id='f1'/><span id='one'>"+(i+1)+"</span><br><br>"
	                           + "<span id='j1'>" + result[i].showName + "</span><br>"
	                           + "<span id='j2'>" +result[i].showStart+"-"+result[i].showEnd+ "</span>"
	                           + "</td>";
	
	                 }
	                   
	                 
	                 $("#mainRank2").append(str);
	                 
	                 //b2버튼이 클릭되면 b1 버튼은 다시 활성화 될 수 있게 처리
	                 $(".list2 > button").removeAttr("disabled");
	                 $("#rank1").removeAttr("disabled");
	                 
	                 
	             
	             },
	             error: function(){
	                 console.log("통신 오류");
	                
	             }
	           
	             
	         });
	     });
     
     
	//지역별랭킹 > 충청/강원
	 $(".b8").click(function(){
		 
		 
	    	
	    	$(this).prop('disabled', true);
	    	$("#mainRank2").empty();
	    
	           
	       
	    	
	    	 $.ajax({
	             url: "mainRegionRank2",
	             success: function(result){
	             	 console.log(result);
	                 var str = "";
	                 for(var i = 0; i < result.length; i++){
	                     
	                     
	                	 var imgPath = '/show/resources/PosterUploadFiles/' + result[i].posterChangeName + '.jpg';
	                     
	                     str += "<td>"
	                     	+ "<img src='" + imgPath + "' alt='Poster Image' id='f1'/><span id='one'>"+(i+1)+"</span><br><br>"
	                           + "<span id='j1'>" + result[i].showName + "</span><br>"
	                           + "<span id='j2'>" +result[i].showStart+"-"+result[i].showEnd+ "</span>"
	                           + "</td>";
	
	                 }
	                   
	                 
	                 $("#mainRank2").append(str);
	                 
	                 //b2버튼이 클릭되면 b1 버튼은 다시 활성화 될 수 있게 처리
	                 $(".list2 > button").removeAttr("disabled");
	                 $("#rank1").removeAttr("disabled");
	                 
	                 
	             
	             },
	             error: function(){
	                 console.log("통신 오류");
	                
	             }
	           
	             
	         });
	     });
	
	
	//지역별랭킹 > 대구/경북
	 $(".b9").click(function(){
	    	
		 
		 
	    	$(this).prop('disabled', true);
	    	$("#mainRank2").empty();
	    
	           
	       
	    	
	    	 $.ajax({
	             url: "mainRegionRank3",
	             success: function(result){
	             	 console.log(result);
	                 var str = "";
	                 for(var i = 0; i < result.length; i++){
	                     
	                     
	                	 var imgPath = '/show/resources/PosterUploadFiles/' + result[i].posterChangeName + '.jpg';
	                     
	                     str += "<td>"
	                     	+ "<img src='" + imgPath + "' alt='Poster Image' id='f1'/><span id='one'>"+(i+1)+"</span><br><br>"
	                           + "<span id='j1'>" + result[i].showName + "</span><br>"
	                           + "<span id='j2'>" +result[i].showStart+"-"+result[i].showEnd+ "</span>"
	                           + "</td>";
	
	                 }
	                   
	                 
	                 $("#mainRank2").append(str);
	                 
	                 //b2버튼이 클릭되면 b1 버튼은 다시 활성화 될 수 있게 처리
	                 $(".list2 > button").removeAttr("disabled");
	                 $("#rank1").removeAttr("disabled");
	                 
	                 
	             
	             },
	             error: function(){
	                 console.log("통신 오류");
	                
	             }
	           
	             
	         });
	     });
	
	
	//지역별랭킹 > 부산/경남
	 $(".b10").click(function(){
		 
		 
		 
	    	
	    	$(this).prop('disabled', true);
	    	$("#mainRank2").empty();
	    
	           
	       
	    	
	    	 $.ajax({
	             url: "mainRegionRank4",
	             success: function(result){
	             	 console.log(result);
	                 var str = "";
	                 for(var i = 0; i < result.length; i++){
	                     
	                     
	                	 var imgPath = '/show/resources/PosterUploadFiles/' + result[i].posterChangeName + '.jpg';
	                     
	                     str += "<td>"
	                     	+ "<img src='" + imgPath + "' alt='Poster Image' id='f1'/><span id='one'>"+(i+1)+"</span><br><br>"
	                           + "<span id='j1'>" + result[i].showName + "</span><br>"
	                           + "<span id='j2'>" +result[i].showStart+"-"+result[i].showEnd+ "</span>"
	                           + "</td>";
	
	                 }
	                   
	                 
	                 $("#mainRank2").append(str);
	                 
	                 //b2버튼이 클릭되면 b1 버튼은 다시 활성화 될 수 있게 처리
	                 $(".list2 > button").removeAttr("disabled");
	                 $("#rank1").removeAttr("disabled");
	                 
	                 
	             
	             },
	             error: function(){
	                 console.log("통신 오류");
	                
	             }
	           
	             
	         });
	     });
	 	
	
	//지역별랭킹 > 광주/전라
	 $(".b11").click(function(){
		 
		 
	    	$(this).prop('disabled', true);
	    	$("#mainRank2").empty();
	    
	           
	       
	    	
	    	 $.ajax({
	             url: "mainRegionRank5",
	             success: function(result){
	             	 console.log(result);
	                 var str = "";
	                 for(var i = 0; i < result.length; i++){
	                     
	                     
	                	 var imgPath = '/show/resources/PosterUploadFiles/' + result[i].posterChangeName + '.jpg';
	                     
	                     str += "<td>"
	                     	+ "<img src='" + imgPath + "' alt='Poster Image' id='f1'/><span id='one'>"+(i+1)+"</span><br><br>"
	                           + "<span id='j1'>" + result[i].showName + "</span><br>"
	                           + "<span id='j2'>" +result[i].showStart+"-"+result[i].showEnd+ "</span>"
	                           + "</td>";
	
	                 }
	                   
	                 
	                 $("#mainRank2").append(str);
	                 
	                 //b2버튼이 클릭되면 b1 버튼은 다시 활성화 될 수 있게 처리
	                 $(".list2 > button").removeAttr("disabled");
	                 $("#rank1").removeAttr("disabled");
	                 
	                 
	             
	             },
	             error: function(){
	                 console.log("통신 오류");
	                
	             }
	           
	             
	         });
	     });
	 	
	
	//지역별랭킹 > 제주
	 $(".b12").click(function(){
		 
		
	    	
	    	$(this).prop('disabled', true);
	    	$("#mainRank2").empty();
	    
	           
	       
	    	
	    	 $.ajax({
	             url: "mainRegionRank6",
	             success: function(result){
	             	 console.log(result);
	                 var str = "";
	                 for(var i = 0; i < result.length; i++){
	                     
	                     
	                	 var imgPath = '/show/resources/PosterUploadFiles/' + result[i].posterChangeName + '.jpg';
	                     
	                     str += "<td>"
	                     	+ "<img src='" + imgPath + "' alt='Poster Image' id='f1'/><span id='one'>"+(i+1)+"</span><br><br>"
	                           + "<span id='j1'>" + result[i].showName + "</span><br>"
	                           + "<span id='j2'>" +result[i].showStart+"-"+result[i].showEnd+ "</span>"
	                           + "</td>";
	
	                 }
	                   
	                 
	                 $("#mainRank2").append(str);
	                 
	                 //b2버튼이 클릭되면 b1 버튼은 다시 활성화 될 수 있게 처리
	                 $(".list2 > button").removeAttr("disabled");
	                 $("#rank1").removeAttr("disabled");
	                 
	                 
	             
	             },
	             error: function(){
	                 console.log("통신 오류");
	                
	             }
	           
	             
	         });
	     });
	 	
	 	
	 	
     
    </script>
    
</body>
</html>