
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.show.member.model.vo.Member" import="com.kh.show.manager.model.vo.Manager" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        .Toptable{
            border: 1px solid white;
            margin: auto;
            border-radius: 10px;
            width: 138px;
            box-shadow: 3px 2px 5px 5px gainsboro;
            float:right;
            position: relative;
            right : 80px;
            z-index: 9999;
            
           
            
        }
        .Topimage img{
            width: 120px;
            height: 150px;
            border-radius: 10px;
            padding: 5px 5px 5px 5px;
            
        }
        .Topimage{
            width: 120px;
            height: 160px;
           
        }
        #rankText{
            font-family: "Noto Sans KR", sans-serif;
            font-size: 15px;
            font-weight: 600;
            font-style: normal;
            color:black;
            text-align: center;
            padding: 10px 5px 10px 5px;

        }
       
       
    </style>
</head>
<body>

    <table class="Toptable">
    <tr><td id="rankText">실시간 공연 순위</td></tr>
    <tr class="rankShow">
        <!-- 여기에 데이터를 삽입 -->
        
        
    </tr>
</table>

	<script>
	
	$(document).on('click','.Top td',function(){
		
		//input이라 요소 찾기를 제대로 해야함
		var showName = $(this).closest('tr').find('.input2').val();
	
		console.log(showName); 
		location.href = "/show/showInfo/detail?showName="+ showName;
		
	});


    $(document).ready(function() {
        loadShowData(); 

        // 2분마다 데이터를 자동으로 갱신
        setInterval(loadShowData, 120000);
    });

    function loadShowData() {
        $.ajax({
            url: "rankShowList", 
            success: function(result) {
                console.log(result);

                var str = "";
               
                
                
                for (var i = 0; i < result.length; i++) {
                	
                	 var imgPath = '/show/resources/PosterUploadFiles/' + result[i].posterChangeName + '.jpg';
                	 var input = "<input type='hidden' name='showName' value='" + result[i].showName + "' class='input2'/>";
                	
                    str += "<tr class='Top'>"
                    	+  input
                        +  "<td><div class='Topimage'><img src='" + imgPath + "' alt='' ></div></td>"
                        +  "</tr>";
                }
                
                
                $(".rankShow").html(str);
            },
            error: function() {
                console.log("통신 오류");
            }
        });
    }
</script>

</body>

</html>