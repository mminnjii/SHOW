<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		width: 70%;
		height: 100%;
		background-color: rgb(246, 246, 246);
	}

	b{
		font-size: 28px;
	}

	.info-area{
		width: 400px;
		border-bottom: 1px solid black;
		font-weight: bold;
		font-size: 14px;
		position: relative;
		display: inline-block;
		text-align: left;
	}

    .mention{
		height: 0.8em;
	}

    input{
        background-color: rgb(246, 246, 246) ;
    }

	input:focus{
		outline: none;
	}

	.bi1, .bi2{
		cursor: pointer;
	}

	.form-info{
		border: none;
		width: 300px;
		height: 22px;
	}

	#pwd{
		padding-right: 200px;
	}

	
	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/member/enrollHeader.jsp"/>
	
	<div class="content">
		<br><br>
		<div class="inner">
			<h3><a href="${contextPath}/member/myPage" style="text-decoration: none; color: black;">마이페이지</a></h3>
            <br><br>
            <div id="mypage">
				<div id="mypage-side">
					<%@ include file="/WEB-INF/views/member/myPageSide.jsp" %>
				</div>
				<div id="mypage-body">
					<br><br>
                    <div>
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
							<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5M8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5m3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0"/>
					 	</svg>
					</div>
					<br><br>
					<b>정말 탈퇴하시겠어요?</b>
					<br><br>
					<p>탈퇴 버튼 클릭 시, 계정은 삭제되고 복구되지 않습니다</p>
					<p>서비스를 계속 이용하실 경우 취소를 눌러주세요</p>
					<br>
						<input type="hidden" id="userId" name="userId" value="${loginUser.userId}">
						<div id="pass-body">
							<div class="info-area">
								<label for="userPwd">비밀번호 </label>
								<input type="password" class="form-info" id="userPwd" name="userPwd" placeholder="기존 비밀번호 입력" required>
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="black" class="bi1 bi-eye-fill" viewBox="0 0 16 16" id="e1">
									<path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
									<path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
								</svg>
							</div>
							<div class="mention" id="pwd" style="font-size: 0.8em; color: chocolate;"></div>
							<br>
						</div>
						<br>
						<div id="btn-area">
							<button id="delbtn" class="btn btn-danger" disabled>탈퇴하기</button>
							<button type="reset" class="btn btn-primary">취소하기</button>
						</div>
				</div>
            </div>
		</div>
	</div>

	<script>
		//비밀번호 확인 
		$(function() {
			$('.bi1').on('click', function() {
				$('.info-area').toggleClass('active');
				if ($('.info-area').hasClass('active')) {
					console.log($(this));
					$('#userPwd').attr('type', "text");
					$('#e1').css('fill','red');
				} else {
					$('#userPwd').attr('type', "password");
					$('#e1').css('fill','black');
				}
			});
		});

		//비밀번호 일치 여부 
		$(function(){
				var userPwd = $("#userPwd");
				var userId = $("#userId")

				$("#userPwd").keyup(function(){

					$.ajax({
						url : "pwdCheck",
						data: {
							checkPwd : userPwd.val(),
							userId : userId.val()
						},
						success : function(val){
							if(val == "YYY"){
								$("#pwd").text("");
								$("button[id=delbtn]").attr("disabled",false);
							}else{
								$("#pwd").text("기존 비밀번호와 일치하지 않습니다");
								$("button[id=delbtn]").attr("disabled",true);
							}
						},
						error : function(){
							console.log("error");
						}
					})
				});
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

		$(function(){
			$("button[id=delbtn]").click(function(){
				if(confirm("정말로 회원 탈퇴 하시겠습니까?")){
					var form = $("<form>");
					var user = $("<input>");
					var userPwd = $("input[type=password]").val();
		
					form.prop("action", "delete.me").prop("method","POST");
					user.prop("type","hidden").prop("name","userPwd").prop("value",userPwd);
					console.log(userPwd);
					form.append(user);
					
					$("#mypage-body").append(form);
					form.submit();
				}
			});
		});

	</script>
	

    <br><br><br>
	<jsp:include page="/WEB-INF/views/member/enrollFooter.jsp"/>
</body>
</html>