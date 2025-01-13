<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
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
		display: inline-block;
	}


    /* 회원 정보 수정 */
	.update{
		float: left;
		margin-left: 5%;
	}

	#member-profile{
		width: 300px;
		height: 300px;
	}

	.info{
		margin: auto;
	}

	#upfile{
		width: 200px;
	}

	#profile{
		width: 220px;
		height: 220px;
		margin: auto;

		overflow: hidden;

		border-radius: 150px;
		border: 2px solid black;
	}

	#profile-img{
		width: 100%;
		height: 100%;
		object-fit: cover;
	}

    #member-info{
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
	
	input:focus{
		outline: none;
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
                    <br>
					<h5>회원 정보 수정</h5>
                    <form action="update.me" method="post" enctype="multipart/form-data">
                        <div class="info">
                            <br>
							<div class="update" id="member-profile">
								<div id="profile">
									<img id="profile-img" src="${contextPath }/resources/profile/${loginUser.changeName}">
								</div>
								<br>
								<input type="file" name="upfile" id="upfile" onchange="loadFile(this);" value="프로필 사진">
								<input type="hidden" name="originName" value="${loginUser.originName}">
								<input type="hidden" name="changeName" value="${loginUser.changeName}">
							</div>
                            <div class="update" id="member-info">
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
                            <br clear="both">
							<br>
                            <div id="btn-area" align="center">
                                <button type="submit" class="btn btn-primary" onclick="return update();">수정 완료</button>
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
        function update(){
            var nameForm = /^[가-힣a-zA-Z]*$/;
			var name = $("#userName").val();
            var rrnForm = /\d{2}([0]\d|[1][0-2])([0][1-9]|[1-2]\d|[3][0-1])[-][1-4]\d{6}/;
			var rrn = $("#userRrn").val();
            var phoneForm = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
			var phone = $("#phone").val();
            var emailForm = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			var email = $("#email").val();

            if(nameForm.test(name) && rrnForm.test(rrn) && phoneForm.test(phone) && emailForm.test(email)){
                alert("수정 성공!");
                return true;
            }else{
                alert("수정 실패!");
                return false;
            }
        }

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

		//파일 이미지 띄우기
		function loadFile(inputFile){
			if(inputFile.files.length == 1){
				//파일 읽기 전용 객체 생성
				var reader = new FileReader();
				//FileReader의 readAsDataURL(파일) 메소드로 파일을 읽어 고유 url을 반환
				//등록한 파일 정보는 inputFile.files 속성의 0번 인덱스에 등록
				reader.readAsDataURL(inputFile.files[0]);

				//reader객체가 해당 파일 정보를 읽어오는 시점 : onload
				//파일 정보에서 result속성에 담긴 url을 읽어옴
				reader.onload = function(e){
					$("#profile-img").attr("src",e.target.result);
				};
			}else{
				$("#profile-img").removeAttr("src");
			}
		}

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