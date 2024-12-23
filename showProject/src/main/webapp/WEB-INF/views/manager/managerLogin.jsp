<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<% String msg = (String)session.getAttribute("alertMsg"); %>
<head>
    <style>
    	<link href="http://fonts.googleapis.com/css?family=Montserrat:400,800" rel="stylesheet>
    	* {
		  box-sizing: border-box;
		}
		
		body {
		  background: #f6f5f7;
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  flex-direction: column;
		  font-family: 'Montserrat', sans-serif;
		  height: 100vh;
		  margin: 0; /* 기존 margin 수정 */
		}
		
		h1 {
		  font-weight: bold;
		  margin: 0;
		}
		
		h2 {
		  text-align: center;
		}
		
		.container {
		  background-color: #fff;
		  border-radius: 10px;
		  box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
		  position: relative;
		  overflow: hidden;
		  width: 768px;
		  max-width: 100%;
		  min-height: 480px;
		  display: flex;
		  justify-content: center; /* 중앙 정렬 */
		  align-items: center;     /* 중앙 정렬 */
		  margin-top: 2%;
		}
		
		.form-container {
		  position: relative;
		  width: 100%;
		  height: auto;
		  text-align: center;
		  display: flex;
		  flex-direction: column;
		  justify-content: center;
		  align-items: center;
		  padding: 20px; /* 적당한 padding 추가 */
		}
		
		form {
		  background-color: #fff;
		  display: flex;
		  flex-direction: column;
		  align-items: center;
		  justify-content: center;
		  padding: 0 50px;
		  height: 100%;
		  width: 100%;
		}
		
		input {
		  background-color: #eee;
		  border: none;
		  padding: 12px 15px;
		  margin: 8px 0;
		  width: 100%;
		}
		
		button {
		  border-radius: 20px;
		  border: 1px solid #FF4B2B;
		  background-color: #FF4B2B;
		  color: #FFFFFF;
		  font-size: 12px;
		  font-weight: bold;
		  padding: 12px 45px;
		  letter-spacing: 1px;
		  text-transform: uppercase;
		  transition: transform 80ms ease-in;
		}
		
		button:active {
		  transform: scale(0.95);
		}
		
		button:focus {
		  outline: none;
		}
		
		button.ghost {
		  background-color: transparent;
		  border-color: #FFFFFF;
		}
		
		input{
		  width: 40%; 
		}
    </style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/menubar.jsp" %>
	<script>
	    var msg = "${alertMsg}";
	    if (msg != null && msg != "") {
	        alert(msg);
	        <% session.removeAttribute("alertMsg"); %>
	    }
	    
	    const signUpButton = document.getElementById('signUp');
	    const signInButton = document.getElementById('signIn');
	    const container = document.getElementById('container');

	    signUpButton.addEventListener('click', () => {
	      container.classList.add("right-panel-active");
	    });

	    signInButton.addEventListener('click', () => {
	      container.classList.remove("right-panel-active");
	    });
	</script>
<div class="container" id="container">
  <div class="form-container sign-in-container">
    <form action="${contextPath}/managerLogin" method="post">
      <h1>관리자 로그인</h1>
      <span>아이디와 비밀번호를 입력해주세요.</span> <br>
      <input type="text" name="managerId" placeholder="ID" />
      <input type="password" name="managerPw" placeholder="Password"/> <br>
      <button>Sign In</button>
    </form>
  </div>
</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>