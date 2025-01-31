<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
	.content{
		width: 80%;
		margin: auto;
		text-align: center;
	}
	#path{
        text-align: right;
        font-size: 12px;
    }
	.inner{
		width: 1000px;
		padding: 5% 25%; 
		border-top: 1px solid lightgray;
		border-bottom: 1px solid lightgray;
		margin: auto;
		text-align: center;
	}

	.info{
		text-align: left;
	}
	

	/*회원가입 영역*/
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

	.info-area > #idCheck{
		display: inline-block;
	}

	.bi1, .bi2{
		cursor: pointer;
	}

	input:focus{
		outline: none;
	}

	/* 정규표현식 관련련 */
	.mention{
		height: 0.8em;
	}

	/*버튼 스타일*/
	#btn1{
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
        <div id="path">
            <p>1.약관동의 - <b>2.정보입력</b> - 3.가입완료</p>
        </div>
		<div class="inner">
			<form action="insert.me" method="post">
				<div class="info">
					<h3>회원가입</h3>
					<br>
					<div class="info-area">
						<label for="userId">아이디 </label>
						<input type="text" class="form-info" id="newUserId" name="userId" style="width: 270px;" placeholder="6~12자 영문,숫자(영문으로 시작)" required>
						<div id="idCheck" style="font-size: 0.8em; display: none; width: 50px;"></div>
					</div>
					<div class="mention" id="idCorrect" style="font-size: 0.8em; color: chocolate;"></div>
					<br>
					<div class="info-area">
						<label for="userPwd">비밀번호 </label>
						<input type="password" class="form-info" id="newUserPwd" name="userPwd" placeholder="6~20자 영문,숫자,특수문자" required>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="black" class="bi1 bi-eye-fill" viewBox="0 0 16 16" id="pwd">
							<path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
							<path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
						</svg>
					</div>
					<div class="mention" id="pwdCorrect" style="font-size: 0.8em; color: chocolate;"></div>
					<br>
					<div class="info-area">
						<label for="checkPwd">비밀번호 확인 </label>
						<input type="password" class="form-info" id="checkPwd" name="userPwdCheck" style="width: 265px;" placeholder="6~20자 영문,숫자,특수문자" required>
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="16" fill="currentColor" class="bi2 bi-eye-fill" viewBox="0 0 16 16" id="chk">
							<path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
							<path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
						</svg>
					</div>
					<div class="mention" id="pwd2Correct" style="font-size: 0.8em; color: chocolate;"></div>
					<br>
					<div class="info-area">
						<label for="userName">이름 </label>
						<input type="text" class="form-info" id="userName" name="userName" placeholder="한글,영문만" required>
					</div>
					<div class="mention" id="nameCorrect" style="font-size: 0.8em; color: chocolate;"></div>
					<br>
					<div class="info-area">
						<label for="userRrn">주민등록번호 </label>
						<input type="text" class="form-info" id="userRrn" name="userRrn" placeholder="'-'포함" required>
					</div>
					<div class="mention" id="rrnCorrect" style="font-size: 0.8em; color: chocolate;"></div>
					<br>
					<div class="info-area">
						<label for="phone">휴대폰 </label>
						<input type="tel" class="form-info" id="phone" name="phone" placeholder="01012345678" required>
					</div>
					<div class="mention" id="phoneCorrect" style="font-size: 0.8em; color: chocolate;"></div>
					<br>
					<div class="info-area">
						<label for="email">이메일 </label>
						<input type="text" class="form-info" id="email" name="email">
					</div>
					<div class="mention" id="emailCorrect" style="font-size: 0.8em; color: chocolate;"></div>
					<br><br>
					<div align="center" style="width: 400px;">
						<button type="submit" id="btn1" disabled>회원가입</button>
					</div>
				</div>
			</form>
		</div>
		<script>
			//비밀번호 텍스트 표시
			$(function() {
				$('.bi1').on('click', function() {
					$('.info-area').toggleClass('active');
					if ($('.info-area').hasClass('active')) {
						console.log($(this));
						$('#newUserPwd').attr('type', "text");
						$('#pwd').css('fill','red');
					} else {
						$('#newUserPwd').attr('type', "password");
						$('#pwd').css('fill','black');
					}
				});
			});

			//비밀번호 확인 텍스트 표시
			$(function() {
				$('.bi2').on('click', function() {
					$('.info-area').toggleClass('active');
					if ($('.info-area').hasClass('active')) {
						$('#checkPwd').attr('type', "text");
						$('#chk').css('fill','red');
					} else {
						$('#checkPwd').attr('type', "password");
						$('#chk').css('fill','black');
					}
				});
			});
			
			//아이디 중복 체크+아이디 확인 
			$(function(){
				
				var checkId = $("#newUserId");

				$("#newUserId").keyup(function(){

					if(checkId.val().length>5){
						$.ajax({
							url : "idCheck",
							data : {
								checkId : checkId.val()
							},
							success : function(val){

								var idForm = /^[a-zA-Z](?=.*[a-zA-Z])(?=.*[0-9]).{5,12}$/;

								if(val=="YYY"){
									if(!idForm.test($("#newUserId").val())){
										$("#idCorrect").text("올바른 아이디 형식을 입력해주세요");
										$("#idCheck").show().css("color","red").text("사용 불가");
									}else{
										$("#idCheck").show().css("color","blue").text("사용 가능");
										$("#idCorrect").text("");
										$("button[type=submit]").attr("disabled",false);
									}
								}else{
									if(!idForm.test($("#newUserId").val())){
										$("#idCorrect").text("올바른 아이디 형식을 입력해주세요");
										$("#idCheck").show().css("color","red").text("사용 불가");
									}else{
										$("#idCheck").show().css("color","red").text("사용 불가");
										$("button[type=submit]").attr("disabled",true);
									}
								}
							},
							error : function(){
								console.log("error");
							}
						});
					}else{
						$("#idCheck").show().text("");
						$("button[type=submit]").attr("disabled",true);
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

			//이름 형식
			$("input[name='userName']").blur(function(){
				var nameForm = /^[가-힣a-zA-Z]*$/;
				var name = $("#userName").val();

				if(!nameForm.test(name)){
					$("#nameCorrect").text("올바른 이름 형식을 입력해주세요");
				}else{
					$("#nameCorrect").text("");
				}
			});

			//주민등록번호 형식
			$("input[name='userRrn']").blur(function(){
				var rrnForm = /\d{2}([0]\d|[1][0-2])([0][1-9]|[1-2]\d|[3][0-1])[-][1-4]\d{6}/;
				var rrn = $("#userRrn").val();

				if(!rrnForm.test(rrn)){
					$("#rrnCorrect").text("올바른 주민등록번호를 입력해주세요");
				}else{
					$("#rrnCorrect").text("");
				}
			});

			//휴대폰 형식
			$(function(){
				var checkPhone = $("input[name='phone']");

				$("#phone").blur(function(){
					console.log(checkPhone.val());
					if(checkPhone.val().length=11){
						$.ajax({
							url : "phoneCheck",
							data : {
								phone : checkPhone.val()
							},
							success : function(val){
								if(val=="YYY"){
									$("input[name='phone']").blur(function(){
										var phoneForm = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
										var phoneVal = $("#phone").val();

										if(!phoneForm.test(phoneVal)){
											$("#phoneCorrect").text("올바른 휴대폰 형식을 입력해주세요");
										}else{
											$("#phoneCorrect").text("");
											$("button[type=submit]").attr("disabled",false);
										}
									});
								}else{
									$("#phoneCorrect").text("중복된 번호입니다");
									$("button[type=submit]").attr("disabled",true);
								}
							},
							error : function(e){
								console.log(e);
							}
						});
					}else{
						$("button[type=submit]").attr("disabled",true);
					}
				});
			});
		

			//이메일 형식
			$("input[name='email']").blur(function(){
				var emailForm = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				var email = $("#email").val();

				if(!emailForm.test(email)){
					$("#emailCorrect").text("올바른 이메일 형식을 입력해주세요");
				}else{
					$("#emailCorrect").text("");
				}
			});
		</script>
	</div>
	
	<jsp:include page="/WEB-INF/views/member/enrollFooter.jsp"/>
</body>
</html>