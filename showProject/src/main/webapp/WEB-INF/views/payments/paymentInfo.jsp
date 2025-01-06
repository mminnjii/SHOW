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
	}
	
  table {
	    width: 70%;
	    margin-bottom: 50px;  /* 테이블 간의 간격을 20px로 설정 */
	    table-layout: fixed;
	    margin-left: 100px;
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
  }
  
  tbody>tr>td:first-child  {
  	 padding-right: 20px;
  }
	
</style>    
</head>
<body>
	<%@include file="/WEB-INF/views/common/menubar.jsp" %>
		<div id="container" align="center">
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
	     					<td>${payId}</td>
	     				</tr>
	     				<tr>
	     					<td><h4>결제방식 :</h4></td>
	     					<td>무통장 입금</td>
	     				</tr>
	     				<tr>
	     					<td><h4>결제상태 :</h4></td>
	     					<td>확정</td>
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
	     				<tr>
	     					<td><h4>예약번호 :</h4></td>
	     					<td>${payId}</td>
	     				</tr>
	     				<tr>
	     					<td><h4>공연명 :</h4></td>
	     					<td>${payId}</td>
	     				</tr>
	     				<tr>
	     					<td><h4>(N회차) 공연시간 :</h4></td>
	     					<td>${bankName}</td>
	     				</tr>
     					<tr>
     						<td><h4>공연일자 :</h4></td>
	     					<td>${bankNum}</td>
	     				</tr>
     					<tr>
     						<td><h4>공연장소 :</h4></td>
	     					<td>${bankHolder}</td>
	     				</tr>
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
	     				<tr>
	     					<td><h4>수령방식 :</h4></td>
	     					<td>현장수령</td>
	     				</tr>
	     				<tr>
	     					<td><h4>매수 :</h4></td>
	     					<td>5매</td>
	     				</tr>
	     				<tr>
	     					<td><h4>좌석명 :</h4></td>
	     					<td>VIP석</td>
	     				</tr>
	     				<tr>
	     					<td><h4>좌석번호 :</h4></td>
	     					<td>A1,A2</td>
	     				</tr>
	     			</tbody>
	     		</table>
        </div>
		
		<script>
			
		 	var receiptUrl = $('input[name="receiptUrl"]').val();
			
			$("#receipt").on("click",function(){
				
				window.open(receiptUrl);
				
			}); 
			
		</script>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>