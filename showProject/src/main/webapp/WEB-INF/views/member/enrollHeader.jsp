<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    @font-face {
        font-family: 'SBAggroB';
        src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }

    #header{
        width: 100%;
        height: 70px;
        border-bottom: 1px solid gray;
        margin: auto;
        margin-top: 40px;
    }
    #logo{
        margin-left: 20px;
        font-weight: bold;
        font-size: 30px;
        font-family: 'SBAggroB';
    }
</style>
</head>
<body>
    <div id="header">
		<div id="logo">TicketPal</div>
	</div>

</body>
</html>