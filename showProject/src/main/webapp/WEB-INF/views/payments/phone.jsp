<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>휴대폰 인증 테스트</title>
    <script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
    <button id="payButton">결제하기</button>

    <script>
        
        	IMP.init("imp17528612"); 
            
        	
        	/*
        	IMP.request_pay({
                pg: "danal", // PG사 설정 (다날)
                pay_method: "phone", // 결제 방식: 휴대폰
                merchant_uid: "order_" + new Date().getTime(), // 주문 고유 번호
                name: "테스트 상품", // 결제 상품명
                amount: 100, // 결제 금액
                buyer_name: "홍길동", // 구매자 이름
                buyer_tel: "01012345678", // 구매자 전화번호
                buyer_email: "user@example.com", // 구매자 이메일
                buyer_addr: "서울특별시 강남구 삼성동", // 구매자 주소
                buyer_postcode: "123-456" // 구매자 우편번호
            }, function (rsp) {
                if (rsp.success) {
                    // 결제 성공 시
                    alert("결제가 완료되었습니다.");
                    console.log(rsp);
                    // 서버로 결제 데이터 전송
                    processPayment(rsp);
                } else {
                    // 결제 실패 시
                    alert("결제에 실패하였습니다: " + rsp.error_msg);
                }
            });
            */
            
            
            
            
           	IMP.request_pay({
           	   pg: 'danal',  // 다날 결제 PG
               pay_method: 'phone',  // 휴대폰 결제
               merchant_uid: 'merchant_1234567890',  // 주문번호 (고유값)
               name: '정기 결제 상품',  // 상품명
               amount: 100,  // 결제 금액 (원)
               buyer_name: '홍길동',  // 구매자 이름
               buyer_tel: '01012345678',  // 구매자 전화번호
               buyer_email: 'example@test.com',  // 구매자 이메일
               m_redirect_url: 'https://your_redirect_url.com',  // 결제 후 리디렉션 URL
               customer_uid: 'user_12345',  // 정기결제 사용자 고유 ID (서버에서 관리)
               schedule_at: Math.floor(new Date().getTime() / 1000) + 3600 * 24 * 30,  // 다음 결제일 (1개월 후)
               period: 30  // 결제 주기 (단위: 일)
            }, function (rsp) {
                if (rsp.success) {
                    // 결제 성공 시
                    alert("결제가 완료되었습니다.");
                    console.log(rsp);
                    // 서버로 결제 데이터 전송
                    processPayment(rsp);
                } else {
                    // 결제 실패 시
                    alert("결제에 실패하였습니다: " + rsp.error_msg);
                }
            });
     

     
        
    </script>
</body>
</html>