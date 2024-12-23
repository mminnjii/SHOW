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

	.form-info{
		border: none;
		width: 300px;
		height: 22px;
	}

	.info-area{
		width: 400px;
		border-bottom: 1px solid black;
		font-weight: bold;
		font-size: 14px;
		position: relative;
		display: inline-block;
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
                    <h5>비밀번호 변경</h5>
                    <br>
					<div id="pass-body">
						<div class="info-area">
							<label for="userPwd">기존 비밀번호 </label>
							<input type="password" class="form-info" id="originUserPwd" name="originUserPwd" style="width: 270px;" placeholder="6~20자 영문,숫자,특수문자" required>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="black" class="bi1 bi-eye-fill" viewBox="0 0 16 16" id="e1">
								<path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
								<path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
							</svg>
						</div>
						<div class="mention" id="originPwd" style="font-size: 0.8em; color: chocolate;"></div>
						<br>
						<div class="info-area">
							<label for="userPwd">신규 비밀번호 </label>
							<input type="password" class="form-info" id="newUserPwd" name="userPwd" style="width: 270px;" placeholder="6~20자 영문,숫자,특수문자" required>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="black" class="bi2 bi-eye-fill" viewBox="0 0 16 16" id="e2">
								<path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
								<path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
							</svg>
						</div>
						<div class="mention" id="pwdCorrect" style="font-size: 0.8em; color: chocolate;"></div>
						<br>
						<div class="info-area">
							<label for="checkPwd">신규 비밀번호 확인 </label>
							<input type="password" class="form-info" id="checkPwd" name="userPwdCheck" style="width: 250px;" placeholder="6~20자 영문,숫자,특수문자" required>
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="16" fill="currentColor" class="bi3 bi-eye-fill" viewBox="0 0 16 16" id="e3">
								<path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
								<path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
							</svg>
						</div>
						<div class="mention" id="pwd2Correct" style="font-size: 0.8em; color: chocolate;"></div>
					</div>
				</div>
            </div>
		</div>
	</div>
	<script>
		//비밀번호 텍스트 표시
		$(function() {
				$('.bi1').on('click', function() {
					$('.info-area').toggleClass('active');
					if ($('.info-area').hasClass('active')) {
						console.log($(this));
						$('#originUserPwd').attr('type', "text");
						$('#e1').css('fill','red');
					} else {
						$('#originUserPwd').attr('type', "password");
						$('#e1').css('fill','black');
					}
				});
			});

			//비밀번호 확인 텍스트 표시
			$(function() {
				$('.bi2').on('click', function() {
					$('.info-area').toggleClass('active');
					if ($('.info-area').hasClass('active')) {
						$('#newUserPwd').attr('type', "text");
						$('#e2').css('fill','red');
					} else {
						$('#newUserPwd').attr('type', "password");
						$('#e2').css('fill','black');
					}
				});
			});

			$(function() {
				$('.bi3').on('click', function() {
					$('.info-area').toggleClass('active');
					if ($('.info-area').hasClass('active')) {
						$('#checkPwd').attr('type', "text");
						$('#e3').css('fill','red');
					} else {
						$('#checkPwd').attr('type', "password");
						$('#e3').css('fill','black');
					}
				});
			});

			//비밀번호 형식
			$("input[name='userPwd']").blur(function(){
				var pwdForm = /.*(?=.{6,20})(?=.*[~!@#$%^&*])(?=.*[0-9])(?=.*[a-zA-Z]).*/;
				var pwd = $("#newUserPwd").val();
				
				if(!pwdForm.test(pwd)){
					$("#pwdCorrect").text("올바른 비밀번호 형식을 입력해주세요");
				}else{
					$("#pwdCorrect").text("");
				}
			});
			
			//비밀번호 확인 형식+일치 확인
			$("input[name='userPwdCheck']").blur(function(){
				var pwdckForm = /.*(?=.{6,20})(?=.*[~!@#$%^&*])(?=.*[0-9])(?=.*[a-zA-Z]).*/;
				var pwdck = $("#checkPwd").val();
				var pwd = $("#newUserPwd").val();

				if(!pwdckForm.test(pwdck)){
					$("#pwd2Correct").text("올바른 비밀번호 형식을 입력해주세요");
					$("button[type=submit]").attr("disabled",true);
				}else if(pwdckForm.test(pwdck) && pwdck == pwd  && $("#idCheck").text("사용 가능")){
					$("#pwd2Correct").text("");
					$("button[type=submit]").attr("disabled",false);
				}else{
					$("#pwd2Correct").text("비밀번호가 일치하지 않습니다");
					$("button[type=submit]").attr("disabled",true);
				}
			});
	</script>
	

    <br><br><br>
	<jsp:include page="/WEB-INF/views/member/enrollFooter.jsp"/>
</body>
</html>