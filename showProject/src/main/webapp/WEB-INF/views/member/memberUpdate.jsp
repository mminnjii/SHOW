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

    /* 회원 정보 수정 */
    #member-info{
        margin: 2% 30%;
        text-align: left;

        width: 400px;
    }

    #btn-area{
        width: 100%;
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
	
	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/member/enrollHeader.jsp"/>
	
	<div class="content">
		<br><br>
		<div class="inner">
			<h3>마이페이지</h3>
            <br><br>
            <div id="mypage">
				<div id="mypage-side">
					<%@ include file="/WEB-INF/views/member/myPageSide.jsp" %>
				</div>
				<div id="mypage-body">
                    <br>
					<h5>회원 정보 수정</h5>
                    <form action="update.me" method="post">
                        <div class="info">
                            <br>
                            <div id="member-info">
                                <div class="info-area">
                                    <label for="userId">아이디 </label>
                                    <input type="text" class="form-info" id="userId" value="${loginUser.userId}" name="userId" readonly>
                                </div>
                                <br><br>
                                <div class="info-area">
                                    <label for="userName">이름 </label>
                                    <input type="text" class="form-info" id="userName" name="userName" value="${loginUser.userName}" required>
                                </div>
                                <div class="mention" id="nameCorrect" style="font-size: 0.8em; color: chocolate;"></div>
                                <br>
                                <div class="info-area">
                                    <label for="userRrn">주민등록번호 </label>
                                    <input type="text" class="form-info" id="userRrn" name="userRrn" value="${loginUser.userRrn}" placeholder="'-'포함" required>
                                </div>
                                <div class="mention" id="rrnCorrect" style="font-size: 0.8em; color: chocolate;"></div>
                                <br>
                                <div class="info-area">
                                    <label for="phone">휴대폰 </label>
                                    <input type="tel" class="form-info" id="phone" name="phone" value="${loginUser.phone}" placeholder="01012345678" required>
                                </div>
                                <div class="mention" id="phoneCorrect" style="font-size: 0.8em; color: chocolate;"></div>
                                <br>
                                <div class="info-area">
                                    <label for="email">이메일 </label>
                                    <input type="text" class="form-info" id="email" value="${loginUser.email}" name="email">
                                </div>
                                <div class="mention" id="emailCorrect" style="font-size: 0.8em; color: chocolate;"></div>
                            </div>
                            <br>
                            <div id="btn-area" align="center">
                                <button type="submit" class="btn btn-primary" disabled>수정 완료</button>
                                <button type="reset" class="btn btn-danger">취소</button>
                            </div>
                        </div>
                    </form>
						
				</div>
            </div>
		</div>
	</div>
    <script>
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
					$("#rrnCorrect").text("올바른 주민등록번호 형식을 입력해주세요");
				}else{
					$("#rrnCorrect").text("");
				}
			});

			//휴대폰 형식
			$("input[name='phone']").blur(function(){
				var phoneForm = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
				var phone = $("#phone").val();

				if(!phoneForm.test(phone)){
					$("#phoneCorrect").text("올바른 휴대폰 형식을 입력해주세요");
				}else{
					$("#phoneCorrect").text("");
				}
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
	

    <br><br><br>
	<jsp:include page="/WEB-INF/views/member/enrollFooter.jsp"/>
</body>
</html>