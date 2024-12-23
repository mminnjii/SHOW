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
        font-size: 10px;
        font-weight: 400;
        font-style: normal;
        color: red;
    }
    #j3{
     width:10px;
    }
    #list{
        height: 70px;
    }
    .musicalRanking{
      background-color:rgba(216, 212, 212, 0.192);
      
      height: 80%;
    }
   
  
</style>
</head>
<body>
 <br><br><br>

    <div class="musicalRanking" >
        <table style="margin: auto;" >
            <tr> <td id="rank1">랭킹</td>  </tr>
            <br><br>
            <tr>
            <td colspan="9" id="list">
                <button id="b1">전체</button>
                <button id="b2">라이선스</button>
                <button id="b3">창작뮤지컬</button>
                
            </td>
            
            </tr>
            
            
            <tr id="rankArea">
            
           
                
            </tr>
        </table>

    </div>

   <script>
  
                    $("#b1").click(function(){
                        $.ajax({
                            url: "musicalShow",
                            success: function(result){
                                
                            	
                                var str = "";
                                for(var i = 0; i < result.length; i++){
                                    // 각 뮤지컬 정보를 하나의 tr로 묶어주기
                                    
                                    //if(i === 0){
                                    	//break; //한번만 반복하고 싶어서 i===0일때 break하도록 설정해줌
                                    //}
                                    var date  = result[i].showStart+"-"+result[i].showEnd
                                    
                                    str += "<td>"
                                          + "<a href=''><img src='/show/resources/images/강홍석.jpg' alt='' id='f1'></a><br><br>"
                                          + "<span id='j1'>" + result[i].showName + "</span><br>"
                                          + "<span id='j2'>" + date + "</span>"
                                          + "</td>"
                                          + "<td id='j3'></td>"

                                }
                                  
                                $("#rankArea").append(str);
                                    
                               
                            },
                            error: function(){
                                console.log("통신 오류");
                               
                            }
                        });
                    });
                

</script>


</body>
</html>