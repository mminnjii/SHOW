<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>아임포트 테스트</title>
    <script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
    <button id="card">카드 결제</button>
    <button id="bank">무통장 입금</button>

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
	            merchant_uid: "order_123456",   // 주문번호 (고유값)
	            name: "테스트 상품",             // 상품명
	            amount: 5000,                   // 결제 금액
	            buyer_email: "test@example.com", // 구매자 이메일
	            buyer_name: "홍길동",             // 구매자 이름
	            buyer_tel: "01012345678",        // 구매자 전화번호
	            vbank_due: "20241231235959",     // 입금 기한 (YYYYMMDDHHmmss 형식)
	        }, function (rsp) {
	            if (rsp.success) {
	                alert("가상계좌 발급 성공: " + rsp.vbank_num + " (" + rsp.vbank_name + ")");
	                console.log(rsp); // rsp.vbank_num: 가상계좌 번호, rsp.vbank_name: 은행명
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