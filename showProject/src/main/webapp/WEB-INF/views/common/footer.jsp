<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.show.manager.model.vo.Manager"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  
	Manager loginManager = (Manager)session.getAttribute("loginManager");
	boolean isLoginManager = (loginManager != null);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    
    
    <style>
        /* div{border:1px solid red;} */
        /*#footer {
            width:100%;
            height:200px;
            margin:auto;
            margin-top:50px;
           
            
           
        }*/
        #footer-1 {
            width:100%;
            height:20%;
            border-top:1px solid lightgray;
            border-bottom:1px solid lightgray;
        }
        #footer-2 {width:100%; height:80%;}
        #footer-1, #footer-2 {padding-left:50px;}
        #footer-1>a {
            text-decoration:none;
            font-weight:600;
            margin:10px;
            line-height:40px;
            color:rgb(103, 99, 99);
            font-family: "Noto Sans KR", sans-serif;
        }
        #footer-2>p {
            margin:0;
            padding:10px;
            font-size:13px;
            font-family: "Noto Sans KR", sans-serif;
            color:rgb(103, 99, 99);
        }
        #p2 {text-align:left;}
        #name{
            font-weight: 600;
            color: black;
        }
        #img{
            width: 100px;
        }
        #detail{
            font-size: 10px;
        }
        #managerLogin{
        	color: #e9ecef;
        	float: right;
        	font-size: 10px;
        	display: ${sessionScope.loginManager == null ? 'inline-block' : 'none'}
        }
        
       #managerLogout{
        	color: #e9ecef;
        	float: right;
        	font-size: 10px;
        	display: ${sessionScope.loginManager != null ? 'inline-block' : 'none'}
        }

        
       #managerPage{
        <%if(loginManager != null){%>
        	display : inline-block;
        <%} else{%>
         	display : none;
        <%} %>

        
        
        

    </style>
</head>
<body>
    <div id="footer">
        <div id="footer-1">
            <a href="#">회사소개</a> | 
            <a href="#">개인정보취급방침</a> | 
            <a href="#">청소년 보호정책</a> | 
            <a href="#">이용약관</a> | 
            <a href="#">고객센터</a> | 
            <a href="#">티켓판매안내</a> | 
            <a href="#">광고안내</a>
            <a href="${contextPath}/managerPage" id="managerPage"> |  관리자 페이지</a>
             
        </div>

        <div id="footer-2">
            <table>
                <tr>
            <p id="p1">
                        <br>
                        <img src="/show/resources/images/로고.jpg" id="img"><br><br>
                        </tr>
                        <tr>
		                <p>주소 : 서울특별시 영등포구 선유동2로 57 이레빌딩 (구관) 19F, 20F | 대표이사:김민지 | 사업자등록번호:144-21-25090 <br>
                            1588-2690 | TPmembership@kh.or.kr | 통신판매업 신고번호: 제2024-서울당산-04125호 | 사업자정보확인 | 개인정보보호 책임자:김민지</p>
                        </tr>
            </p>
                 </tr>
            <p id="p2">Copyright © 1998-2024 TicketPal Institute All Right Reserved</p>
            </table>
            <a href="${contextPath}/mLogin" ><p id="managerLogin">관리자 로그인</p></a>
            <a href="${contextPath}/managerLogout"><p id="managerLogout">관리자 로그아웃</p></a>
        </div>
    </div>
</body>
</html>