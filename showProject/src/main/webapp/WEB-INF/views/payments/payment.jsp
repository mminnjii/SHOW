<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>아임포트 테스트</title>
    <script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style>
		button {
		padding: 10px 20px; 
		font-size: 16px; 
		font-family: 'Noto Sans KR', sans-serif; 
		border: 1px solid gray; 
		border-radius: 5px;
		cursor: pointer;
	}
	
	select {
		margin-left : 20px;
	    width: 300px; /* 너비 */
	    height: 40px; /* 높이 */
	    padding: 5px 10px; /* 내부 여백 */
	    font-size: 16px; /* 글꼴 크기 */
	    font-family: 'Noto Sans KR', Arial, sans-serif; /* 글꼴 */
	    border: 1px solid #ccc; /* 테두리 */
	    border-radius: 5px; /* 둥근 모서리 */
	    background-color: #f4f4f4; /* 배경색 */
	    color: #333; /* 글씨 색상 */
	    appearance: none; /* 기본 브라우저 화살표 제거 */
	    -webkit-appearance: none; /* Webkit 브라우저 (Chrome, Safari 등) */
	    -moz-appearance: none; /* Firefox */
	    cursor: pointer; /* 클릭 가능한 커서 */
	    transition: all 0.3s ease; /* 부드러운 전환 효과 */
	}
	
	td {
	    height: 40px; /* select의 높이에 맞추기 */
	    vertical-align: middle; /* 세로 가운데 정렬 */
	    padding: 0; /* 기본 padding 제거 (필요한 경우만 사용) */
	}
</style>    
</head>
<body>
		<div align="center">
			<br>
			<c:if test="${not empty rInfo }">
			<input type="hidden" name="reservationId" value="${rInfo.reservationId} "></input>
			<input type="hidden" name="roundId" value="${rInfo.roundId} "></input>
	     		<table align="center">
	     			<thead>
	     				<tr>
	     					<th id="name" colspan="3">${rInfo.showName}</th>
	     				</tr>
	     				<tr align="center">
	     					<td colspan="2">< ${rInfo.showRound} > 회차</td>
	     				</tr>
	     			</thead>
	     			<tbody>
	     				<tr>
	     					<td>공연일자 :</td>
	     					<td>${rInfo.showDate}</td>
	     				</tr>
     					<tr>
     						<td>공연시간 :</td>
	     					<td>${rInfo.showTime}</td>
	     				</tr>
     					<tr>
     						<td>공연장소 :</td>
	     					<td>${rInfo.hallName}</td>
	     				</tr>
	     				
	     				<tr>
	     					<td>좌석 :</td>
	     					<td>${selectedName}</td>
	     				</tr>
	     				<tr>
	     					<td>좌석이름 :</td>
	     					<td>${gradeName}</td>
	     				</tr>
	     				<tr>
	     					<td>총 좌석 수 :</td>
	     					<td>${num}</td>
	     					<td>개</td>
	     				</tr>
     					<tr>
     						<td>Total : </td>
	     					<td id="amount"> ${totalPrice}</td>
	     					<td>원</td>
	     				</tr>
	     				<tr>
	     					<td style="padding-top: 70px;">티켓수령방식 :</td>
	     					<td style="padding-top: 70px;">
	     						<select id="method" >
	     							<option disabled="disabled" selected>선택하세요</option>
	     							<option value="1">현장</option>
	     							<option value="2">택배</option>
	     						</select>
	     					</td>
	     				</tr>
	     			</tbody>
	     		</table>
	        </c:if>
	        
	        <br><br>
	        <hr>
	        <br><br><br><br><br>
    		<button id="card">카드 결제</button>
    		<button id="bank">무통장 입금</button>
    		<button id="back">다시 선택하기</button>
        </div>
	

    <script>
    	
   		 var reservation_uid = $('input[name="reservationId"]').val();
   		 var roundId = $('input[name="roundId"]').val();
   		 var name = $("#name").text();
   		 var amount = $("#amount").text();
       	
   		 let methodToget = "";
   		$("#method").change(function () {
   			methodToget = $(this).val(); // 이벤트 발생 후 최신 값으로 갱신
   		    console.log("Change 이벤트 후 선택된 값:", methodToget);
   		});
   		 
   		 // 아임포트 초기화
         IMP.init("imp17528612"); 

        // 결제 요청
        $("#card").on("click", function () {
        	
        	if(methodToget != ""){
        		
        		IMP.request_pay({
                    pg: "html5_inicis", // PG사
                    pay_method: "card", // 결제 수단
                    merchant_uid: "order_" + reservation_uid, // 예약번호
                    name: name, // 상품명
                    amount: "100", // 결제 금액
                    buyer_email: "test@example.com", // 구매자 이메일
                    buyer_name: "홍길동", // 구매자 이름
                    buyer_tel: "01012345678", // 구매자 전화번호
                }, function (rsp) {
                    
                	if (rsp.success) {
                		
    	           	    let paymentData = {
    		    		imp_uid: rsp.imp_uid,
    	                reservationId : reservation_uid,
    	                amount : amount,
    	                roundId : roundId,
    	                receipt : rsp.receipt_url,
    	                methodToget : methodToget
    	    			};	
    	                    
    	               	 $.ajax({
    	                     url: "/show/payments/card",
    	                     type: "POST",
    	                     data: JSON.stringify(paymentData),
    	                     contentType: 'application/json',
    	                     success: function (success) {
    	                    	 
    	                    	 if(success =="success"){
    	                    		 alert("결제 성공하였습니다"); 
    	                    		const form = document.createElement("form");
     	      				        form.method = "POST";
     	      				        form.action = "/show/payments/paymentInfo";

     	      				        const hiddenField = document.createElement("input");
     	      				        hiddenField.type = "hidden";
     	      				        hiddenField.name = "paymentId";
     	      				        hiddenField.value = rsp.imp_uid;
     	      				        
     	      				    	const hiddenField2 = document.createElement("input");
     	      				        hiddenField2.type = "hidden";
     	      				        hiddenField2.name = "type";
     	      				        hiddenField2.value = "card";
     	      				        
     	      				        form.appendChild(hiddenField);
     	      				        form.appendChild(hiddenField2);
     	      				        document.body.appendChild(form);
     	      				        form.submit(); 
    	                    		 
    	                    	 }else{
    	                    		 alert("요청에 실패하였습니다. : "+success);
 		      						window.location.href = '/show/common/errorPage';
    	                    	 }
    	                    	 
    	                     },
    	                     error: function () {
    	                         alert("결제 정보 저장 실패");
    	                         console.log("통신오류");
    	                     }
                     });
                        
                        
                    } else {
                        alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
                        
                        $.ajax({
    	                     url: "/show/payments/fail",
    	                     type: "POST",
    	                     data: {
    	                    	 reservationId : reservation_uid,
    	                    	 roundId : roundId
    	                    	 },
    	                     success: function (success) {
    	                    	 if(success =="success"){
    	                    		 alert(success); 
        	                    	 window.location.href = "/show";
    	                    	 }else{
    	                    		alert("요청에 실패하였습니다. : "+success);
  		      						window.location.href = '/show/common/errorPage'; 
    	                    	 }
    	                    	 
    	                         
    	                     }, 
    	                     error: function () {
    	                         alert("rollback 실패");
    	                         console.log("통신오류");
    	                     }
    	                 }); 
                        
                    }
                });
        		
        	}else{
        		alert("수령방식을 선택해주세요");
        	}
        	
        }); 
        
         
        $("#bank").on("click", function () { 
        	
        	if(methodToget != ""){
        		
        		IMP.init("imp17528612"); // 아임포트 고객사 식별 코드
    	        IMP.request_pay({
    	            pg: "html5_inicis",             // PG사 (예: 이니시스)
    	            pay_method: "vbank",            // 결제 수단 (vbank: 가상계좌)
    	            merchant_uid: "order_" + reservation_uid,   // 주문번호 (고유값)
    	            name: name,             // 상품명
    	            amount: amount,                   // 결제 금액
    	            buyer_email: "test@example.com", // 구매자 이메일
    	            buyer_name: "홍길동",             // 구매자 이름
    	            buyer_tel: "01012345678",        // 구매자 전화번호
    	            vbank_due: "20250116235959",     // 입금 기한 (YYYYMMDDHHmmss 형식)
    	        }, function (rsp) {
    	        	
    	        	if (rsp.success) {
    		        	
    	       		    let paymentData = {
    		       		    		imp_uid: rsp.imp_uid,
    		                        reservationId : reservation_uid,
    		                        amount : amount,
    		                        roundId : roundId,
    		                        receipt : rsp.receipt_url,
    		                        vbank_name : rsp.vbank_name,
    		                        vbank_num : rsp.vbank_num,
    		                        vbank_holder : rsp.vbank_holder,
    		                        vbank_date : rsp.vbank_date,
    		                        methodToget : methodToget
    	       		    		};	    		
    		        		
    	 	            	 $.ajax({
    		                     url: "/show/payments/bank",
    		                     type: "POST",
    		                     data: JSON.stringify(paymentData),
    		                     contentType: 'application/json',
    		                     success: function (success) {
    		                    	 	
    		                    	if(success =="success"){
    		                    		alert("결제 성공하였습니다");
    		                    		const form = document.createElement("form");
    		      				        form.method = "POST";
    		      				        form.action = "/show/payments/paymentInfo";

    		      				        const hiddenField = document.createElement("input");
    		      				        hiddenField.type = "hidden";
    		      				        hiddenField.name = "paymentId";
    		      				        hiddenField.value = rsp.imp_uid;
    		      				        
    		      				      	const hiddenField2 = document.createElement("input");
    		      				        hiddenField2.type = "hidden";
    		      				        hiddenField2.name = "type";
    		      				        hiddenField2.value = "bank";

    		      				        form.appendChild(hiddenField);
    		      				        form.appendChild(hiddenField2);
    		      				        document.body.appendChild(form);
    		      				        form.submit();
    		      				        
    		                    	}else{
    		                    		alert("요청에 실패하였습니다. : "+success);
    		      						window.location.href = '/show/common/errorPage';
    		                    	}
    		                    	 	
    		                    	 
    		                     }, 
    		                     error: function () {
    		                         alert("결제 정보 저장 실패");
    		                         console.log("통신오류");
    		                     }
    		                 }); 
    	            	 
    	            } else {
    	                
    	            	alert("가상계좌 발급 실패: " + rsp.error_msg);
    	            	
    	                $.ajax({
    	                     url: "/show/payments/fail",
    	                     type: "POST",
    	                     data: {
    	                    	 reservationId : reservation_uid,
    	                    	 roundId : roundId
    	                    	 },
    	                     success: function (success) {
    	                    	 if(success =="success"){
    	                    		 alert("다시 결제해주세요"); 
        	                    	 window.location.href = "/show";
    	                    	 }else{
    	                    		 alert("요청에 실패하였습니다. : "+success);
 		      						 window.location.href = '/show/common/errorPage';
    	                    	 }
    	                     }, 
    	                     error: function () {
    	                         alert("rollback 실패");
    	                         console.log("통신오류");
    	                     }
    	                 }); 
    	            }
    	        });
        		
        	}else{
        		
        		alert("수령방식을 선택해주세요");
        	}
        	
        }); 
        
        
        $("#back").on("click", function () { 
        	history.back();
        });
        
    </script>
    
</body>
</html>