<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>결제 정보</title>
<style>
	button {
		padding: 10px 20px; 
		font-size: 16px; 
		font-family: 'Noto Sans KR', sans-serif; 
		border: 1px solid gray; 
		border-radius: 5px;
		cursor: pointer;
	}
</style>    
</head>
<body>
	
		<div align="center">
			<br>
	     		<table align="center">
	     			<thead>
	     				<tr>
	     					<th id="name" colspan="3">결제내역</th>
	     				</tr>
	     			</thead>
	     			<tbody>
	     				<tr>
	     					<td>결제번호 :</td>
	     					<td>${payId}</td>
	     				</tr>
	     			<c:if test="${not empty bankName && not empty bankNum && not empty bankHolder && not empty dueDate }">	
	     				<tr>
	     					<td>은행이름 :</td>
	     					<td>${bankName}</td>
	     				</tr>
     					<tr>
     						<td>은행번호 :</td>
	     					<td>${bankNum}</td>
	     				</tr>
     					<tr>
     						<td>공연장소 :</td>
	     					<td>${bankHolder}</td>
	     				</tr>
	     				<tr>
	     					<td>입금예정일 :</td>
	     					<td>${dueDate} 까지</td>
	     				</tr>
	     			</c:if>		
	     				<tr>
	     					<td>영수증 :</td>
	     					<td><a href="#">${receipt}</a></td>
	     				</tr>
	     			</tbody>
	     		</table>
	        
	        <br><br>
	        <hr>
	        <br><br><br><br><br>
    		<button id="main">메인으로</button>
        </div>
		
		<script>
			$("#main").on("click", function () {
				window.location.href = "/show";
			});
		</script>
		
</body>
</html>