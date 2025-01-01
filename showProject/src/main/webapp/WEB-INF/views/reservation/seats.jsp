<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    	<!-- Bootstrap CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Bootstrap JS -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <title>Calendar and Seats</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 80px;
 		}
 		
 		.modal-body {
		    text-align: left;
		}
		 		
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
		  width: 20%; /* 필요에 따라 조정 */
		  text-align: left;
		  margin-right: 100px; /* 오른쪽 간격 추가 */
		}

		#current tbody td:first-child {
		    width: 30px; /* 첫 번째 셀의 너비를 줄임 */
		}
		
	   .info #selected {
		  float: left;
		  width: 40%; /* 필요에 따라 조정 */
		  text-align: left;
		}
		
		.vip,.r,.e{
		    width: 20px;
            height: 20px;
		}
		
		button {
		    padding: 12px 24px; /* 버튼 크기 조정 */
		    font-size: 16px; /* 글꼴 크기 */
		    font-family: 'Noto Sans KR', sans-serif; /* 글꼴 */
		    border: none; /* 테두리 제거 */
		    border-radius: 5px; 
		    cursor: pointer; 
		}
		
    </style>
</head>
<body>
	
       <div class="modal fade" id="Modal">
          <div class="modal-dialog">
              <div class="modal-content">
                  <!-- 모달 헤더 -->
                  <div class="modal-header">
                      <h5 class="modal-title">예매안내</h5>
                  </div>
                  <!-- 모달 바디 -->
                  <div class="modal-body">
               		<c:if test="${not empty rInfo }">
               		<input type="hidden" name="roundId" value="${rInfo.roundId} "></input>
               		<h4>${rInfo.showName}</h4><br>
               			(${rInfo.showRound} 회차)<br>
               			공연일자 : ${rInfo.showDate} <br>
               			공연시간 : ${rInfo.showTime} 를 선택하셨습니다. <br>
               		</c:if>
                  </div>
               <div class="modal-footer">
                   <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
                   <button type="button" class="btn btn-secondary" id="back" data-bs-dismiss="back">취소</button>
               </div>
              </div>
          </div>
      </div>
	
	
	
    <div class="stage">무대(STAGE)</div>
    
	<%
	    // 기본 데이터 생성 
	    String[] rows = {"A", "B", "C", "D", "E", "F", "G", "H"};
	    request.setAttribute("rows", rows);
	    
	%>
	<table id=seats>
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
		<table class="info" id="current">
			<thead>
				<tr>
					<th style="width: 200px;" colspan="2"><h3> 좌석등급 / 잔여석 </h3></th>
				</tr>
			</thead>
			<c:if test="${not empty num }">
					<tbody>
						<tr>
							<td><div class="vip" style="background: #f8d7da;"></div></td>
							<c:forEach var="num" items="${num}">
								<c:if test="${num.gradeName eq 'VIP' }">
									<td>VIP석&nbsp;(A-B)</td>
									<td>${vipPrice }원</td>
									<td>${num.count }개</td>
								</c:if>
							</c:forEach>
						</tr>
						<tr>
							<td><div class="r" style="background-color: #d4edda;"></div></td>
							<c:forEach var="num" items="${num}">
								<c:if test="${num.gradeName eq 'R' }">
									<td>R석&nbsp;(C-F)</td>
									<td>${rPrice }원</td>
									<td>${num.count }개</td>
								</c:if>
							</c:forEach>
						</tr>
						<tr>
							<td><div class="e" style="background-color:#d1ecf1;"></div></td>
							<c:forEach var="num" items="${num}">
								<c:if test="${num.gradeName eq 'S' }">
									<td>S석 &nbsp;(F-H)</td>
									<td>${sPrice }원</td>
									<td>${num.count }개</td>
								</c:if>
							</c:forEach>
						</tr>
					</tbody>
					
					
					
				
			</c:if>
		</table>
		<table class="info" id="select">
			<thead>
				<tr>
					<td><h3>선택좌석</h3></td>
					<td class="num">총 0석이 선택되었습니다.</td>
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
		
		<p style="margin-top: 800px;"></p>
		
    <script>
    	
    	
    
    	$('#back').on('click',function(){
    		history.back();
    	});
    
    

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
		              			var num = $("<td>").text(seatNumber).attr("name","selectedCount");
		              			var tr = $("<tr>").append(vip).append(num);
              					$("#select>tbody").append(tr);
              			
        		       	}else if(seatNumber.includes("C") || seatNumber.includes("D") || seatNumber.includes("E")
                    			|| seatNumber.includes("F")){
        		       			var r = $("<td>").text("R석");
                    			var num = $("<td>").text(seatNumber).attr("name","selectedCount");
                    			var tr = $("<tr>").append(r).append(num);
                    			$("#select>tbody").append(tr);
                   		}else{
        	           			var e = $("<td>").text("S석");
        	        			var num = $("<td>").text(seatNumber).attr("name","selectedCount");
        	        			var tr = $("<tr>").append(e).append(num);
        	        			$("#select>tbody").append(tr);
                   		}
        			}else{
        					console.log($("#select>tbody").find("tr").last());
        					$("#select>tbody").find("tr").last().remove();
        			}
        			
	    	});
	     
	       
	     	$(".reset").on('click',function(){
	        	
	     		$("#select>thead>tr .num").text("총 0석이 선택되었습니다");
	     		$("#select>tbody>tr").remove();
	     		$('.seat').removeClass('selected');
	     		
	     		
	          }); 
	     	
	     	

  	     	$(".submit").on('click',function(){
  	     		
  	     		var num = $("#select>tbody tr").find("td:nth-child(even)").length;
  	     		// 짝수요소만 찾아서 ,로 이어서 문자열 만들기
  	     		var selectedName = $("#select>tbody tr").find("td:nth-child(even)").map(function() {
  	     		  return $(this).text();
  	     		}).get().join(",");

  	     		// 예약번호 없을 시 빈문자열로 전송 (int는 null x > 스트링으로 보내기 )
  	     	 	 var reservationId = ${rInfo.reservationId };
  	     		
  	     	 	var roundId = $('input[name="roundId"]').val();
  	     	 	
      			$.ajax({
      				url : "/show/reservation/selectedSeats",
      				type : "POST",
      				data : {
      					num : num,
      					selectedName : selectedName,
      					reservationNo : reservationId,
      					roundId : roundId
      				}, 
      				success : function(num){
      					if(confirm("총"+num+"석을 예매하셨습니다. 맞습니까?")){
      						 
      					    const form = document.createElement("form");
      				        form.method = "POST";
      				        form.action = "/show/payments/pay";

      				        const hiddenField = document.createElement("input");
      				        hiddenField.type = "hidden";
      				        hiddenField.name = "reservationId";
      				        hiddenField.value = reservationId;

      				        form.appendChild(hiddenField);
      				        document.body.appendChild(form);
      				        form.submit();
      						
      					}else{
      						alert("요청에 실패하였습니다.");
      					}
      					
      				},
      				error : function(error){
      					
      				}
      			}); 
  	     	});
	     	
  	     	
  	     	$(function(){
  	     		
  	     	 	$('#Modal').modal('show');
  	     		
  	     		var taken = ${taken}; // JSTL 데이터를 JSON으로 전달
  	     	 
  	     	    console.log(${taken});
  	     		
  	     		taken.forEach(function (seatId) {
  	     	        // 테이블 내에서 data-seat 속성을 가진 요소를 선택
  	     	        $("#seats").find("[data-seat='" + seatId + "']")
  	     	            .addClass("blackout") // blackout 클래스 추가
  	     	            .css("pointer-events", "none") // 클릭 방지
  	     	            .css("cursor", "not-allowed") // 비활성화 커서
  	     	            .css("background-color", "#6c757d") // 비활성화 배경색
  	     	            .css("border", "1px solid #6c757d"); // 테두리 변경
  	     	    });
  	     	});
  	     
	     	
    </script>
</body>
</html>