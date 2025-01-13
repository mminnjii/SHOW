<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>

	.info{
		margin-left: 200px;
	}
	
	.info h2 {
           font-family: "Noto Sans KR", sans-serif;
           font-size: 25px;
	}

</style>
<meta charset="UTF-8">
<title>공연상세정보</title>
</head>
<body>	
		<%@include file="/WEB-INF/views/common/menubar2.jsp" %>
		<%@include file="/WEB-INF/views/show/showInfo/detail.jsp" %>
		
	
		<br><br>
		<div class="info">
	        <h2>공지사항</h2> <br>
	        <p style="width: 800px;"> ${s.notice }</p>
	        <br><br><br>  
	        <h2>공연상세 / 정보</h2> <br>
	        <img src='/show/resources/DetailUploadFiles/${s.detailChangeName}.jpg' style="width: 1000px;" />
	        <p style="margin-top: 1000px;"></p>
        </div>
        
        
        <div class="modal fade" id="Modal">
            <div class="modal-dialog" aria-hidden="false">
                <div class="modal-content">
                    <!-- 모달 헤더 -->
                    <div class="modal-header">
                        <h5 class="modal-title">예매안내</h5>
                    </div>
                    <!-- 모달 바디 -->
                    <div class="modal-body">
                       	* 예매자는 본 안내페이지의 모든 내용을 숙지 및 동의한 것으로 간주합니다. <br>
						- 관람연령 / 티켓수령 / 공연 관람 안내 미숙지로 인한 책임은 관람자 본인에게 있으며, 이로 인한 공연 당일 취소 및 변경, 환불은 불가하오니 이 점 유의하시기 바랍니다. <br>
						
						* 본 공연은 중학생 이상 관람 가능한 공연입니다.<br>
						(2012년 이전 출생자 (2012년생 포함) 및 중학생 이상 입장 가능)<br>
						
						* 본 공연은 별도의 인터미션이 없으며, 공연 시작 후에는 객석 입장이 제한됩니다.<br>
						당일 객석 상황에 따라 지연 입장이 진행되지 않을 수 있으며,<br>
						이로 인한 취소/변경/환불은 불가하오니 공연 시작 전까지 반드시 착석해 주시기 바랍니다.<br>
						
						* 증빙이 필요한 할인 받은 내역이 있으신 경우, 해당 증빙서류를 꼭 지참해주시기 바랍니다.<br>
						미지참시, 정가에 대한 차액을 지불하셔야만 티켓 수령이 가능합니다.<br>
						
						* 공연장 주변 교통이 매우 혼잡하오니 가급적 대중교통 이용을 부탁드립니다. 주차 및 교통난으로 인한 관람 지연 시에도 변경 및 취소는 불가합니다.
                    </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
	                </div>
                </div>
            </div>
        </div>
        
        <script>

	        $(function () {
	            $('#Modal').modal('show');
	        });
        
        </script>
        
        
        
       	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>