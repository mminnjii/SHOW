<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    <title>Calendar and Seats</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 20px;
 
        .stage {
            padding: 10px 20px;
            background-color: gray;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-bottom: 50px; /* 무대와 테이블 간의 간격 */
        }

        .seat {
            width: 40px;
            height: 40px;
            border-radius: 5px;
            text-align: center;
            line-height: 40px;
            cursor: pointer;
            margin: 1px; /* 좌석 간의 간격 */
        }
        .seat.selected {
            background-color: #ffeeba !important;
            border: 1px solid #ffeeba !important;
        }
        
        .info {
		  float: left;
		  width: 40%; /* 필요에 따라 조정 */
		  text-align: left;
		}
		

		
    </style>
</head>
<body>
	
    <div class="stage">무대(STAGE)</div>
    
	<%
	    // 임시 데이터 생성 (JSP 내부에서 리스트 제공)
	    String[] rows = {"A", "B", "C", "D", "E", "F", "G", "H"};
		String[] grades = {"VIP", "VIP", "R", "R", "R", "E", "E", "E"};
	    request.setAttribute("rows", rows);
	    request.setAttribute("grades", grades);
	    
	%>
	<table>
	    <c:forEach var="row" items="${rows}">
	        <tr>
	        	<td colspan="3"> <b> ${row } </b></td>
	        	<td></td>
	        	<td></td>
	        	<td></td>
	            <c:forEach var="col" begin="1" end="30">
	                <c:choose>
	                	<c:when test="${row == 'A' or row == 'B' }">
	               		 	<td>
		               		 	<div class="seat" style="background: #f8d7da; border: 1px solid #f5c6cb;" data-seat="${row}${col}">
			                        ${row}${col}
			                    </div>
		                    </td>
	                	</c:when> 
	                	<c:when test="${row == 'C' or row == 'D' or row == 'E' or row == 'F'}">
	               		 	<td>
		               		 	<div class="seat" style="background-color: #d4edda; border: 1px solid #c3e6cb" data-seat="${row}${col}">
			                        ${row}${col}
			                    </div>
		                    </td>
	                	</c:when>
	                	<c:otherwise>
	               		 	<td>
		               		 	<div class="seat" style="background-color:#d1ecf1; border: 1px solid #bee5eb" data-seat="${row}${col}">
			                        ${row}${col}
			                    </div>
		                    </td>
	                	</c:otherwise>
	                </c:choose>
	            </c:forEach>
	        </tr>
	    </c:forEach>
	</table>
	
	<br><br><br><br>
		<table class="info">
			<thead>
				<tr>
					<th><h3> 좌석등급 / 잔여석 </h3></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td> A-B : VIP석</td>
					<td>0개</td>
				</tr>
				<tr>
					<td> C-F :R석</td>
					<td>0개</td>
				</tr>
				<tr>
					<td>F-H :E석</td>
					<td>0개</td>
				</tr>
			</tbody>
		</table>
		
		<table class="info" id="select">
			<thead>
				<tr>
					<td><h3>선택좌석</h3></td>
					<td class="num">총 0석이 선택되었습니다</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th><h3>좌석등급</h3></th>
					<th><h3>좌석번호</h3></th>
				</tr>
				
			</tbody>
		</table>
		<br><br>
		<button class="reset">다시선택하기</button> <br><br>
		<button class="submit">선택완료</button>
    <script>
	     $('.seat').on('click', function() {
	    	 
	    	   	// 선택 좌석
	    	 	var selected = $(this).toggleClass('selected');
	    	   	// 좌석 번호
	    	  	var seatNumber = $(this).attr('data-seat');
	    	 	// 선택 좌석 수
            	var selectedCount = $(".seat.selected").length; 
            	
            	$("#select>thead>tr .num").text("총 "+selectedCount +"석이 선택되었습니다");
            	
        			if($(this).hasClass('selected')){
        				if(seatNumber.includes("A") || seatNumber.includes("B")){
        						var vip = $("<td>").text("VIP석");
		              			var num = $("<td>").text(seatNumber).attr("name", "selectedCount");
		              			var tr = $("<tr>").append(vip).append(num);
              					$("#select>tbody").append(tr);
              			
        		       	}else if(seatNumber.includes("C") || seatNumber.includes("D") || seatNumber.includes("E")
                    			|| seatNumber.includes("F")){
        		       			var r = $("<td>").text("R석");
                    			var num = $("<td>").text(seatNumber).attr("name", "selectedCount");
                    			var tr = $("<tr>").append(r).append(num);
                    			$("#select>tbody").append(tr);
                   		}else{
        	           			var e = $("<td>").text("E석");
        	        			var num = $("<td>").text(seatNumber).attr("name", "selectedCount");
        	        			var tr = $("<tr>").append(e).append(num);
        	        			$("#select>tbody").append(tr);
                   		}
        			}else{
        					console.log($("#select>tbody").find("tr").last());
        					$("#select>tbody").find("tr").last().remove();
        					// $("#select>tbody").find("td").last().prev().remove();
        					// $("#select>tbody").find("td").last().remove();
        			}
        			
	    	});
	     
	       
	     	$(".reset").on('click',function(){
	        	
	     		$("#select>thead>tr .num").text("총 0석이 선택되었습니다");
	     		$("#select>tbody>tr").remove();
	     		$('.seat').removeClass('selected');
	     		
	     		
	          }); 
	     	
	     	

  	     	$(".submit").on('click',function(){
  	     		
  	     		var selectedlength = $("#select>tbody tr").find("td:nth-child(even)").text().length;
  	     		var num = selectedlength/3;
  	     		console.log(num);
  	     		// 짝수요소만 찾아서 ,로 이어서 문자열 만들기
  	     		var selectedName = $("#select>tbody tr").find("td:nth-child(even)").map(function() {
  	     		  return $(this).text();
  	     		}).get().join(", ");

  	     		console.log(selectedName);
  	     		
      			$.ajax({
      				url : "/show/showInfo/selectedSeats",
      				type : "POST",
      				data : {
      					num : num,
      					selectedName : selectedName
      				}, 
      				success : function(num){
      					if(confirm("총"+num+"석을 예매하셨습니다. 맞습니까?")){
      						 window.location.href = "/show/payments/pay";
      					}else{
      						alert("요청에 실패하였습니다.");
      					}
      					
      				},
      				error : function(error){
      					
      				}
      			}); 
  	     	});
	     	
	     	
    </script>
</body>
</html>