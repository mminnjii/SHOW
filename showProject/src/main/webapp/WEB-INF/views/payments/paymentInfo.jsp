<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>결제 정보</title>
<style>
	#container{
		margin-top: 100px;
		margin-bottom: 300px;
		margin-left: 200px;
	}
	
  table {
	    width: 60%;
	    margin-bottom: 50px; 
	    table-layout: fixed;
	    margin-left: 10px;
	    border-collapse: collapse;
  }
	
	tbody {
	    border-top: 2px solid #000; /* 헤더와 본문 사이에 구분선 추가 */
	  }
	
	button {
		padding: 10px 20px; 
		font-size: 16px; 
		font-family: 'Noto Sans KR', sans-serif; 
		border: 1px solid gray; 
		border-radius: 5px;
		cursor: pointer;
	}
	
  th, td {
    text-align: left;
    padding-left: 8px; 
  }
  
	
</style>    
</head>
<body>
	<%@include file="/WEB-INF/views/common/menubar.jsp" %>
		<div id="container" align="left">
			<input type="hidden" name="receiptUrl" value="${receipt} "></input>
			<br>
	     		<table>
	     			<thead>
	     				<tr>
	     					<th id="name" colspan="3"><h3>결제내역</h3></th>
	     				</tr>
	     			</thead>
	     			<tbody>
	     				<tr>
	     					<td><h4>결제번호 :</h4></td>
	     					<td>${paymentId}</td>
	     				</tr>
	     				<tr>
	     					<td><h4>결제금액 :</h4></td>
	     					<td>${price}</td>
	     				</tr>
	     				<tr>
	     					<td><h4>결제방식 :</h4></td>
	     					<td>${methodToget }</td>
	     				</tr>
	     				<tr>
	     					<td><h4>결제상태 :</h4></td>
	     					<td>Y</td>
	     				</tr>
	     			<c:if test="${not empty bankName && not empty bankNum && not empty bankHolder && not empty dueDate }">	
	     				<tr>
	     					<td><h4>은행이름 :</h4></td>
	     					<td>${bankName}</td>
	     				</tr>
     					<tr>
     						<td><h4>은행번호 :</h4></td>
	     					<td>${bankNum}</td>
	     				</tr>
     					<tr>
     						<td><h4>예금주 :</h4></td>
	     					<td>${bankHolder}</td>
	     				</tr>
	     				<tr>
	     					<td><h4>입금예정일 : </h4></td>
	     					<td>${dueDate} 까지</td>
	     				</tr>
	     			</c:if>		
	     				<tr>
	     					<td><h4>영수증 : </h4></td>
	     					<td><button id="receipt">영수증 확인</button></td>
	     				</tr>
	     			</tbody>
	     		</table>
	        <br><br><br><br><br>
	        <table>
	     			<thead>
	     				<tr>
	     					<th id="name" colspan="3"><h3>예약내역</h3></th>
	     				</tr>
	     			</thead>
	     			<tbody>
	     				<c:if test="${not empty rInfo }" >
		     				<tr>
		     					<td><h4>예약번호 :</h4></td>
		     					<td>${rInfo.reservationId}</td>
		     				</tr>
		     				<tr>
		     					<td><h4>공연명 :</h4></td>
		     					<td>${rInfo.showName}</td>
		     				</tr>
		     				<tr>
	     						<td><h4>공연일자 :</h4></td>
		     					<td>${rInfo.showDate}</td>
		     				</tr>
		     				<tr>
		     					<td><h4>(${rInfo.roundId} 회차) 공연시간 :</h4></td>
		     					<td>${rInfo.showTime}</td>
		     				</tr>
	     					<tr>
	     						<td><h4>공연장소 :</h4></td>
		     					<td>${rInfo.hallName}</td>
		     				</tr>
     					</c:if>
	     			</tbody>
	     		
	     		</table>
	     	<br><br>
	        <br><br><br>
	         <table>
	     			<thead>
	     				<tr>
	     					<th id="name" colspan="3"><h3>티켓정보</h3></th>
	     				</tr>
	     			</thead>
	     			<tbody>
		     			<c:if test="${not empty methodToget }" >
		     				<tr>
		     					<td><h4>수령방식 :</h4></td>
		     					<td>${methodToget }</td>
		     				</tr>
		     			</c:if >	
		     			<c:if test="${not empty t }" >
		     				<tr>
		     					<td><h4>매수 :</h4></td>
		     					<td>${t.size() }</td>
		     				</tr>
			     				<tr>
			     					<td><h4>좌석번호(좌석명) :</h4></td>
			     			<c:forEach items="${t }" var="t">
			     					<input type="hidden" name="seatId" value="${t.seatId }"></input>		
			     					<td>${t.seatId }(${t.seatName }석)</td>
			     			</c:forEach>
			     				</tr>
			     				
	     				</c:if >
	     			</tbody>
	     		</table>
        </div>
		
		<script>
			
		 	var receiptUrl = $('input[name="receiptUrl"]').val();
			
			$("#receipt").on("click",function(){
				
				window.open(receiptUrl);
				
			}); 
			
			
			$(function(){
				 var seats = [];
				 
				$('input[name="seatId"]').each(function() {
					 seats.push($(this).val());
			    });
				
				var roundId = ${rInfo.roundId}
				var reservationId = ${rInfo.reservationId}
	           
				$.ajax({
	                url: '/show/payments/statusY', 
	                type: 'POST',           
	                data: {
	                	seats : seats,
	                	roundId : roundId,
	                	reservationId : reservationId
	                }, 
	                success: function(response) {
	                    console.log('서버 응답:', response);
	                },
	                error: function(xhr, status, error) {
	                    console.error('에러 발생:', error);
	                }
	            });
				
			});

		</script>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>