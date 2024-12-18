<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    #header{
        width: 100%;
        height: 120px;
        margin: auto;
        background-color: rgb(250, 250, 250);
    }
    #logo{
        margin-left: 20px;
    }
</style>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath}"  scope="session"/>
    <div id="header">
		<div id="logo">
            <img src="src\main\webapp\resources\images\로고.jpg">
        </div>
	</div>

</body>
</html>