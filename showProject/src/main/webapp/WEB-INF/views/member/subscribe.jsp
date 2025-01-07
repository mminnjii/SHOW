<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css" rel="stylesheet">
<style>
	div{
		border: 1px solid none;
		box-sizing: border-box;
	}
	.content{
		width: 80%;
		margin: auto;
	}
	.inner{
		width: 100%;
		margin: auto;
		padding-top: 5%;
		text-align: center;
	}

	#mypage{
		width: 100%;
		height: 500px;
		margin: auto;
	}

	#mypage>div{
		float: left;
	}
 
	#mypage-side{
		width: 30%;
		height: 450px;
	}

	#mypage-body{
		margin: auto;
		width: 70%;
		height: 100%;
		background-color: rgb(246, 246, 246);
	}

	/*body*/
	@font-face {
    font-family: 'SBAggroB';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}

	#title{
		font-family: 'SBAggroB';
		font-size: 25px;
	}

	span{
		text-decoration: underline;
	}

	table{
		margin: auto;
	}

	table th,td{
		text-align: left;
		height: 30px;
	}

	table th{
		width: 260px;
	}

	#btn2{
        background-color: #597C9B;
		border-radius: 8px;
		border: none;
		width: 300px;
		height: 40px;

		color: white;
		font-weight: bold;
		font-size: 16px;	
    }

	
	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/member/enrollHeader.jsp"/>
	
	<div class="content">
		<br><br>
		<div class="inner">
			<h3><a href="${contextPath}/myPage" style="text-decoration: none; color: black;">마이페이지</a></h3>
            <br><br>
            <div id="mypage">
				<div id="mypage-side">
					<%@ include file="/WEB-INF/views/member/myPageSide.jsp" %>
				</div>
				<div id="mypage-body">
					<br>
                    <h5>구독 서비스</h5>
					<br>
					<b id="title">
						<span>${loginUser.userName}</span>님을 위한 <br>
						멤버십 전용 혜택!
					</b>
					<br><br><br>
					<form action="subscribe.me" method="post">
						<table>
							<tr>
								<th>혜택 1 : 무료 배송</th>
								<td></td>
							</tr>
							<tr>
								<th>혜택 2 : 할인 쿠폰 X2(매달)</th>
								<td>
									<c:choose>
										<c:when test="${loginUser.subscribe == 'Y' }">
											<input type="checkbox" name="ck" id="all" disabled><label for="all"><b>모두 동의</b></label>
										</c:when>
										<c:otherwise>
											<input type="checkbox" name="ck" id="all"><label for="all"><b>모두 동의</b></label>
										</c:otherwise>
									</c:choose>
								 </td>
							</tr>
							<tr>
								<th>혜택 3 : 2% 추가 적립</th>
								<td>
									<c:choose>
										<c:when test="${loginUser.subscribe == 'Y' }">
											<input type="checkbox" name="ck" id="t1" disabled><label for="t1">[필수]멤버십 정기결제 동의 ></label>
										</c:when>
										<c:otherwise>
											<input type="checkbox" name="ck" id="t1"><label for="t1">[필수]멤버십 정기결제 동의 ></label>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>혜택 4 : 티켓팅 우선권</th>
								<td>
									<c:choose>
										<c:when test="${loginUser.subscribe == 'Y' }">
											<input type="checkbox" name="ck" id="t2" disabled><label for="t2">[선택] 멤버십 혜택 및 프로모션 알림 동의 ></label>
										</c:when>
										<c:otherwise>
											<input type="checkbox" name="ck" id="t2"><label for="t2">[선택] 멤버십 혜택 및 프로모션 알림 동의 ></label>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>혜택 5 : 멤버십 라운지 이용</th>
								<td></td>
							</tr>
						</table>
						<br><br>
						<div id="next" style="text-align: center;">
							<c:choose>
								<c:when test="${loginUser.subscribe == 'Y' }">
									<button id="btn2" style="background-color: #8fc4f2;" disabled>이미 구독 중이십니다</button>
								</c:when>
								<c:otherwise>
									<form action="subscribe.me" method="post">
										<input type="hidden" value="${loginUser.userId}" name="userId">
										<input type="hidden" value="${loginUser.userNo}" name="userNo">
										<button id="btn2" onclick="startSub();" disabled>월 9,900원으로 구독</button>
									</form>
								</c:otherwise>
							</c:choose>
						</div>
					</form>
				</div>
            </div>
		</div>
	</div>

	<script>
		$(function(){
            $("#all").click(function(){
                if($(this).prop("checked")==true){
                    $("input[name=ck]").prop("checked",true);
                    $('#btn2').prop('disabled', false);
                }else{
                    $("input[name=ck]").prop("checked",false);
                    $('#btn2').prop('disabled', true); 
                }
            });
        });

        $(document).ready(function() {
            // 체크박스 상태에 따라 버튼 활성화/비활성화 함수
            function state() {
                if ($('#t1').prop('checked')) {
                    $('#btn2').prop('disabled', false);  // 두 체크박스가 모두 선택되면 버튼 활성화
                } else {
                    $('#btn2').prop('disabled', true);   // 하나라도 선택되지 않으면 버튼 비활성화
                }
            }

            // 체크박스 상태가 변경될 때마다 버튼 상태를 업데이트
            $('#t1').change(function() {
                state();
            });

            // 초기 상태 확인
            state();
        });

		window.addEventListener('beforeunload', function () {
       	 localStorage.setItem('scrollPosition', window.scrollY);
    	});

    	// 스크롤 위치 복원
    	window.addEventListener('load', function () {
        const scrollPosition = localStorage.getItem('scrollPosition');
        	if (scrollPosition) {
           	 window.scrollTo(0, parseInt(scrollPosition, 10));
       	 }
    	});
	</script>

    <br><br><br>
	<jsp:include page="/WEB-INF/views/member/enrollFooter.jsp"/>
</body>
</html>