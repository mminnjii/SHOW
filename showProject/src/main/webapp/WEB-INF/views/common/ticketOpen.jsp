<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jersey+25&family=Jersey+25+Charted&family=Jua&family=Libre+Barcode+128+Text&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/e7db19de60.js" crossorigin="anonymous"></script>

<style>

   
       
    #jjj{
        font-family: "Noto Sans KR", sans-serif;
        font-size: 35px;
        font-weight: 500;
        font-style: normal;
        color: black;
        position:relative;
        left : 350px;
        
       
    }

    #g1,#g2,#g3,#g4,#g5{
        width: 200px;
        height: 250px;
        border-radius: 10px;
        align-items: center;
    }
    .oo{
        width: 38px;
    }
    #ooo{
        height: 25px;
    }
    .j1{
        font-family: "Noto Sans KR", sans-serif;
        font-size: 20px;
        font-weight: 500;
        font-style: normal;
        color: black;
    }
    .j2{
        font-family: "Noto Sans KR", sans-serif;
        font-size: 15px;
        font-weight: 400;
        font-style: normal;
        color: red;
    }
    .op{
    position:relative;
    left : 305px;
    
    }
    
    
    
</style>
</head>
<body>




    <div>
   
        <table  class="op">
            <tr><span id="jjj">티켓오픈</span></tr>
            <tr id="ooo"></tr>
            <tr class="openTicketList">
            
            </tr>
        </table>
       
    </div>
    
    
    <script>
    $(document).on('click', '.openTicketList .openList', function() {

    	var showName = $(this).find('span.j1').text();
    	
        location.href = "/show/open?showName=" + showName;
    });
	
    
	var openTicketList = $(".openTicketList").html();  

	$(document).ready(function() {
	    // 페이지 로드 시 바로 데이터를 불러와서 표시
	    openTicketListData();
	    
	    // 데이터를 불러오는 함수
	    function loadOpenData() {
	        $.ajax({
	            url: "openTicketList",  
	            success: function(result) {
	                var str = ""; 

	                
	                for (var i = 0; i < result.length; i++) {
	                    
	                	var imgPath = '/show/resources/PosterUploadFiles/' + result[i].posterChangeName + '.jpg';
	                   
	                    str += "<td class='oo'></td>"  
	                         + "<td class='openList'>"  
	                         + "<img src='" + imgPath + "' alt='' id='g1'><br><br>"
	                         + "<span class='j1'>" + result[i].showName + "</span><br>"
	                         + "<span class='j2'>" + result[i].showStart + " - " + result[i].showEnd + "</span><br>"
	                         + "</td>";
	                }

	                
	                $(".openTicketList").append(str);
	            },
	            error: function() {
	                console.log("통신 오류"); 
	            }
	        });
	    }

	    // 페이지 로드 시 데이터를 불러오기
	    function openTicketListData() {
	        loadOpenData();  // 페이지 로드 시 데이터를 불러오는 함수 호출
	    }
	});

		


    
</script>



   

</body>
</html>