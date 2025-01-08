<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.show.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<% 
	Member loginMember = (Member)session.getAttribute("loginUser");
%>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
<script src="https://cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    .headcontent{
        width: 100%;
        height: 120px;
        margin: auto;
    }
    #logo1{
        margin-left: 30px;
        padding-top: 20px;
    }
    #logoImg{
        width: 160px;
        height: 100px;
    }

    .headcontent>#header1,#header2{
        height: 100%;
        float: left;
    }

    #header1{
        width: 50%;
    }
    #header2{
        width: 50%;
        text-align: right;
        padding-right: 20px;
        padding-top: 30px;
    }

    .to{
        color: black;
        text-decoration: none;
        font-weight: bold;
    }
</style>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath}"  scope="session"/>
    <script>
        var msg = "${sessionScope.alertMsg}";
	    if (msg != null && msg != "") {
	        alert(msg);
	        <% session.removeAttribute("alertMsg"); %>
	    }
    </script>
   
    <!-- <c:if test="${not empty alertMsg }">
		<script>
			alertify.alert("서비스요청 성공","${alertMsg}");
		</script>
		<c:remove var="alertMsg"/>
	</c:if> -->
    <div class="headcontent">
        <div id="header1">
            <a id="logo1" href="${contextPath}">
                <img src="${contextPath}\resources\images\로고.jpg" id="logoImg">
            </a>
        </div>
        <div id="header2">
            
        	<c:choose>
		    	<c:when test="${empty loginUser}">
		        	<!-- 로그인 전 -->
		        	<p><a href="${contextPath }" class="to">홈으로</a></p>
		        </c:when>
		        <c:otherwise>
		            <!-- 로그인 후 -->
                    <span><a href="${contextPath }" class="to">홈으로</a></span>/
		            <span><a href="${contextPath }/logout.me" class="to">로그아웃</a></span>
		       </c:otherwise>
		   </c:choose>
        </div>
    </div>

</body>
</html>