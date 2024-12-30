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
</style>    
</head>
<body>
		<div align="center">
			<c:if test="${not empty rInfo }">
	     		<h4>${rInfo.showName}</h4><br>
	     			(${rInfo.showRound} 회차)<br>
	     			공연일자 : ${rInfo.showDate} <br>
	     			공연시간 : ${rInfo.showTime} <br>
	     			공연장소 : ${rInfo.hallName} <br>
	     			
	     			좌석 : ${selectedName} <br>
	     			좌석이름 : ${gradeName} <br>
	     			총 좌석 수 : ${num} 개 <br>
	     			Total ${totalPrice}원 
	        </c:if>
	        
	        <br><br><br><br>
    		<button id="card">카드 결제</button>
    		<button id="bank">무통장 입금</button>
    		<button id="back">다시 선택하기</button>
        </div>
        
<!-- 결제번호
예약번호
결제금액


결제방식(카드1/무통장2)
결제시각
결제상태
티켓수령방식(현장1/택배2) -->
	
	

    <script>
    
        // 아임포트 초기화
         IMP.init("imp17528612"); // 테스트용 고객사 식별 코드

        // 결제 요청
        $("#card").on("click", function () {
            IMP.request_pay({
                pg: "html5_inicis", // PG사
                pay_method: "card", // 결제 수단
                merchant_uid: "order_" + new Date().getTime(), // 고유 주문번호
                name: "테스트 상품", // 상품명
                amount: 10000, // 결제 금액
                buyer_email: "test@example.com", // 구매자 이메일
                buyer_name: "홍길동", // 구매자 이름
                buyer_tel: "01012345678", // 구매자 전화번호
            }, function (rsp) {
                if (rsp.success) {
                    alert("결제가 완료되었습니다. 승인번호: " + rsp.imp_uid);
                } else {
                    alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
                }
            });
        }); 
        
         
        $("#bank").on("click", function () { 
	        IMP.init("imp17528612"); // 아임포트 고객사 식별 코드
	        IMP.request_pay({
	            pg: "html5_inicis",             // PG사 (예: 이니시스)
	            pay_method: "vbank",            // 결제 수단 (vbank: 가상계좌)
	            merchant_uid: "order_" + new Date().getTime(),   // 주문번호 (고유값)
	            name: "테스트 상품",             // 상품명
	            amount: 5000,                   // 결제 금액
	            buyer_email: "test@example.com", // 구매자 이메일
	            buyer_name: "홍길동",             // 구매자 이름
	            buyer_tel: "01012345678",        // 구매자 전화번호
	            vbank_due: "20241231235959",     // 입금 기한 (YYYYMMDDHHmmss 형식)
	        }, function (rsp) {
	        	console.log(rsp)
	            if (rsp.success) {
	               
	                console.log(rsp.imp_uid);
                    console.log(rsp.merchant_uid);
	            	
	            	 $.ajax({
	                     url: "/show/payments/paymentComplete",
	                     type: "POST",
	                     data: {
	                         imp_uid: rsp.imp_uid,
	                         merchant_uid: rsp.merchant_uid
	                     },
	                     success: function () {
	                         alert("결제 정보 저장 성공");
	                     },
	                     error: function () {
	                         alert("결제 정보 저장 실패");
	                     }
	                 });
	            	
	            	// alert("가상계좌 발급 성공: " + rsp.vbank_num + " (" + rsp.vbank_name + ")");
	                // console.log(rsp); // rsp.vbank_num: 가상계좌 번호, rsp.vbank_name: 은행명
	                // 결제 후 +3일 정도?
	            } else {
	                alert("가상계좌 발급 실패: " + rsp.error_msg);
	            }
	        });
        }); 
    </script>
    
    
<!--            은행명 (rsp.vbank_name)
            계좌번호 (rsp.vbank_num)
            입금 기한 (rsp.vbank_date) --> 
</body>
</html>