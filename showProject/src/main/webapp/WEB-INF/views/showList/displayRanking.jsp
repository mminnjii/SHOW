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
    #b1,#b2,#b3,#b4,#b5,#b6{
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
    #rank1{
        border-style: none;
        font-family: "Noto Sans KR", sans-serif;
        font-size: 25px;
        font-weight: 500;
        font-style: normal;
        color: black;
        
        position: relative;
        left:10px;
        

        
        
    }
    #rank3{
        font-size: 20px;
        position: relative;
        top: -6px;
        color: gainsboro;


    }

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
        font-size: 12px;
        font-weight: 400;
        font-style: normal;
        color: gray;
    }
    #j3{
     width:35px;
    }
    #list{
        height: 70px;
    }
    .musicalRanking{
      background-color:rgba(216, 212, 212, 0.192);
      
      height: 500px;
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
	.rankTable{
		
        margin: auto; 
        position: relative;
        left: 40px;
	}
	
	#b1:hover,#b2:hover{
    border-color: black;
    }
   
  
</style>
</head>
<body>
 <br><br><br>

    <div class="musicalRanking" >
        <table  class="rankTable">
            <tr> <td id="rank1">랭킹</td>  </tr>
            <br><br>
            <tr>
            <td colspan="9" id="list">
                <button id="b1">전체</button>
                <button id="b2">라이선스</button>
             
                
            </td>
            
            </tr>
            
            
            	
            <tr id="rankArea">
            
				 <td>
                    <a href=""><img src="/show/resources/PosterUploadFiles/전시_충청/강원_르스페이스0P.jpg" alt="" id='f1' ><span id="one">1</span></a><br>
                    <span id="j1">Le Space</span><br>
                    <span id="j2">2024.04.18-2025.02.28</span>
                </td>
                
                <td>
                    <a href=""><img src="/show/resources/PosterUploadFiles/전시_서울_초현실주의,100년의 환상0P.jpg" alt="" id='f1'><span id="one">2</span></a><br>
                    <span id="j1">초현실주의</span><br>
                    <span id="j2">2024.12.24-2025.05.11</span>
                </td>
                
                <td>
                    <a href=""><img src="/show/resources/PosterUploadFiles/전시_경기/인천_뉴욕의 거장들0P.jpg" alt="" id='f1'><span id="one">3</span></a><br>
                    <span id="j1">뉴욕의 거장들</span><br>
                    <span id="j2">2025.01.10-2025.07.12</span>
                </td>
                
                <td>
                    <a href=""><img src="/show/resources/PosterUploadFiles/전시_대구/경북_베르메르부터0P.jpg" alt="" id='f1'><span id="one">4</span></a><br>
                    <span id="j1">베르메르부터</span><br>
                    <span id="j2">2025.01.01-2025.01.31</span>
                </td>
                
                <td>
                    <a href=""><img src="/show/resources/PosterUploadFiles/전시_부산/경남_모나리자0P.jpg" alt="" id='f1'><span id="one">5</span></a><br>
                    <span id="j1">모나리자</span><br>
                    <span id="j2">2024.10.01-2024.10.31</span>
                </td>           
                
            </tr>
        </table>

    </div>
    <br>

   <script>
   
		   $("#list > button").click(function(){
		       // 클릭된 버튼의 스타일을 바꾸기
		       $(this).css({
		           "background-color": "black",
		           "color": "white"
		       });
		
		       // 다른 버튼들의 스타일을 초기화
		       $("#list > button").not(this).css({
		           "background-color": "white",
		           "color": "black"
		       });
		   });
   
   					//기존데이터를 previousData에 담아둔다. 
   					var previousData = $("#rankArea").html();
   
  
                    $("#b2").click(function(){
                    	
                    	// 버튼을 클릭했을 때 비활성화
                        $(this).prop('disabled', true);
                    	//console.log($(this));
                    	//prop은 jQuery에서 DOM 요소의 속성(properties)값을 가져오거나 설정하는 데 
                    	//사용되는 메서드 
                    	
                    	//버튼을 누르면 기존에 있던 데이터가 없어지고 필터링된 데이터가 보이게 설정
                    	$("#rankArea").empty();
                    	//모든 내용을 비우고 새로운 데이터를 추가하려면 empty()메서드 사용
                    	//removeAttr는 HTML 요소의 속성만을 제거하는 메소드
                    	
                        $.ajax({
                            url: "displayShow",
                            success: function(result){
                            	 
                                var str = "";
                                for(var i = 0; i < result.length; i++){
                                    
                                	var imgPath = '/show/resources/PosterUploadFiles/' + result[i].posterChangeName + '.jpg';
                                    
                                    str += "<td>"
                                    	+ "<img src='" + imgPath + "' alt='Poster Image' id='f1'/><br><br>"
                                          + "<span id='j1'>" + result[i].showName + "</span><br>"
                                          + "<span id='j2'>" +result[i].showStart+"-"+result[i].showEnd+ "</span>"
                                          + "</td>"
                                          + "<td id='j3'></td>"

                                }
                                  
                                
                                $("#rankArea").append(str);
                                
                                //b2버튼이 클릭되면 b1 버튼은 다시 활성화 될 수 있게 처리
                                $("#b1").removeAttr("disabled");
                                
                                
                            
                            },
                            error: function(){
                                console.log("통신 오류");
                               
                            }
                          
                            
                        });
                    });

                    
                    
                 	// b1 버튼 클릭 시 이전 데이터로 돌아가기
                    $("#b1").click(function(){
                        $(this).prop('disabled', true);  // 버튼 비활성화
                        
                      
                       
                            $("#rankArea").empty();  // b2를 눌렀을 때에 저장된 데이터 삭제 
                            $("#rankArea").append(previousData);  //맨 처음 데이터를 저장시킨 변수를 불러옴
                       
                        
                            //b1버튼을 눌렀을때 b2버튼은 다시 활성화시키기
                            $("#b2").removeAttr("disabled");
                    });

</script>


</body>
</html>