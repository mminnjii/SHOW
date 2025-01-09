<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style>
	.content{
		width: 100%;
		margin: auto;
	}
	.inner{
		width: 100%;
		margin: auto;
		text-align: center;
	}
	#save{
		width: 26%;
		text-align: left;
		margin: auto;
	}
	.info-area1{
		width: 410px;
		height: 40px;
		border: 1px solid black;
		border-top-left-radius: 8px;
		border-top-right-radius: 8px;
		font-weight: bold;
		font-size: 14px;
		position: relative;
		display: inline-block;
		text-align: left;
		
		margin: auto;
	}

	.info-area2{
		width: 410px;
		height: 40px;
		border: 1px solid black;
		border-top: none;
		border-bottom-left-radius: 8px;
		border-bottom-right-radius: 8px;
		font-weight: bold;
		font-size: 14px;
		position: relative;
		display: inline-block;
		text-align: left;
		
		margin: auto;
	}

	label{
		padding-left: 10px;
	}

	.form-info{
		border: none;
		width: 340px;
		height: 38px;
		
	}

	input:focus{
		outline: none;
	}

	/* 버튼 */
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
	.eye{
		cursor: pointer;
	}

	/* 링크 */
	#link>a{
		text-decoration: none;
		color: black;
		font-weight: lighter;
	}
	#link>a:hover{
		font-weight: bolder;
		cursor: pointer;
	}

	/*naver*/
	@font-face {
    font-family: 'GangwonEduPowerExtraBoldA';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEduPowerExtraBoldA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	#naverLogin{
		border: none;
		border-radius: 30px;
		height: 50px;
		width: 50px;

		background-color:  #2DB400;
		color: white;
		font-weight: bold;
		font-size: 25px;
		font-family: 'GangwonEduPowerExtraBoldA';

		padding-top: 10px;
	}

	#headLogo{
		width: 160px;
		height: 100px;
	}
</style>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath}"  scope="session"/>
	<jsp:include page="/WEB-INF/views/member/enrollHeader.jsp"/>
	<div class="content">
		<br><br>
		<div class="inner">
			<a id="title" href="${contextPath}">
				<img src="${contextPath}\resources\images\로고.jpg" id="headLogo">
			</a>
			<br><br><br>
			<form action="${contextPath}/member/login.me" method="post">
				<div class="login">
					<div class="info-area1">
						<label for="userId">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="person" viewBox="0 0 16 16">
								<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
							</svg>
						</label>
						<input type="text" class="form-info" id="newUserId" name="userId" placeholder="아이디" required>
						<div id="idCheck" style="font-size: 0.8em; display: none;"></div>
					</div>
					<br>
					<div class="info-area2">
						<label for="userPwd">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="lock" viewBox="0 0 16 16">
								<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2"/>
							</svg>
						</label>
						<input type="password" class="form-info" id="newUserPwd" name="userPwd" placeholder="비밀번호" required>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="black" class="eye" viewBox="0 0 16 16" id="pwd">
							<path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
							<path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
						</svg>
					</div>
					<br><br>
					<div id="save">
						<input type="checkbox" name="saveId" id="saveId"><label for="saveId" style="font-size: 13px;">아이디 저장</label>
					</div>
					<br>
				</div>
				<button type="submit" id="btn1">로그인</button>
			</form>
			<br>
			<div id="link">
				<a data-toggle="modal" data-target="#findId">아이디 찾기</a> |
				<a data-toggle="modal" data-target="#findPwd">비밀번호 찾기</a> |
				<a href="${contextPath}/member/toEnroll">회원가입</a> 
			</div>
			<br>
			<div id="naver">
				<button id="naverLogin">N</button>
			</div>
		</div>
	</div>
	<div class="modal fade" id="findId">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">아이디 찾기</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <form action="${contextPath }/member/findId" method="post">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <label for="userName" class="mr-sm-2">이름 : </label>
                        <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter Name" id="userName" name="userName">
                        <label for="userPwd" class="mr-sm-2">Email : </label>
                        <input type="email" class="form-control mb-2 mr-sm-2" placeholder="Enter email" id="email" name="email">
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">확인</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

	<div class="modal fade" id="findPwd">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">비밀번호 찾기</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <form action="${contextPath }/member/findPwd" method="post">
                    <!-- Modal body -->
                    <div class="modal-body">
						<p>*비밀번호의 경우 암호화 저장되어 분실 시 찾아드릴 수 없는 정보입니다.</p>
						<p>*본인 확인을 통해 비밀번호를 재설정 하실 수 있습니다.</p>
                        <label for="userName" class="mr-sm-2">아이디 : </label>
                        <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter id" id="id" name="id">
						<label for="userName" class="mr-sm-2">이름 : </label>
                        <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter name" id="name" name="name">
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">확인</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
	
	
	<script>
		//비밀번호 텍스트 표시
		$(function() {
			$('.info-area2').find("#pwd").on('click', function() {
				$('.info-area2').toggleClass('active');
				if ($('.info-area2').hasClass('active')) {
					console.log($(this));
					$('#newUserPwd').attr('type', "text");
					$('.eye').css('fill','red');
				} else {
					$('#newUserPwd').attr('type', "password");
					$('.eye').css('fill','black');
				}
			});
		});
		$(function(){
			var saveId = "${cookie.userId.value}";
			
			if(saveId != ""){
				$("#newUserId").val(saveId);
				$("#saveId").attr("checked",true);
			}
		});
	</script>
	<br><br><br>
	<jsp:include page="/WEB-INF/views/member/enrollFooter.jsp"/>
</body>
</html>