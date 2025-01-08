<%@page import="com.kh.show.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	Member loginMember = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>

    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }
    /*사이드 바 영역*/
    #side-menu ul{
        list-style: none;
    }

    #side-menu a{
        text-decoration: none;
        font-size: 14px;
        font-weight: bold;
    }

    .side-title{
        color: black;
    }

    .side-title:hover{
        cursor: pointer;
    }

    #side-list{
        border-bottom: 1px solid rgb(227, 227, 227);
    }

    #side-list>li{
        border-bottom: 1px solid rgb(227, 227, 227);
        padding-top:15px;
    }

    .side-sub-menu {
        margin-top: 15px;
    }

    .side-detail{
        background-color: rgb(255, 255, 255);
        padding: 5px 0;
        display: none;
    }

    .side-detail:hover{
        background-color: rgb(220, 220, 220);
        padding: 5px 0;
    }

    .side-sub-menu a{
        color: black;
    }

    .side-detail a:hover{
        color: rgb(0, 0, 0);
        cursor: pointer;
    }

    .menu-click {
        background-color: rgb(250, 250, 255);
    }
    
    .side-btn{
    	border:none;
    	background-color: white;
        font-weight: bold;
        font-size: 14px;
    }
    .side-btn:focus{
        border: none;
        outline: none;
    }
    .side-btn:hover{
        color:rgb(47, 47, 174);
    }
</style>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath}"  scope="session"></c:set>
    <div id="side-body">
        <input type="hidden" name="userNo" value="${loginUser.userNo}">
        <div id="side-menu" align="center">
            <ul id="side-list">
                <li>
                    <a class="side-title">내 정보</a>
                    <ul class="side-sub-menu">
                        <li class="side-detail"><a href="${contextPath}/memberUpdate">회원정보 수정</a></li>
                        <li class="side-detail"><a href="${contextPath}/address">배송지 관리</a></li>
                        <li class="side-detail"><a href="${contextPath}/password">비밀번호 변경</a></li>
                        <li class="side-detail"><a href="${contextPath}/delete">회원 탈퇴</a></li>
                    </ul>
                </li>
                <li>
                    <a class="side-title">My 서비스</a>
                    <ul class="side-sub-menu">
                        <li class="side-detail"><a href="${contextPath}/group?userNo=${loginUser.userNo}">내 소모임</a></li>
                        <li class="side-detail"><a href="${contextPath}/chat?userNo=${loginUser.userNo}">내 채팅방</a></li>
                        <li class="side-detail"><a href="${contextPath}/subscribe">구독 서비스</a></li>
                    </ul>
                </li>
                <li>
                    <a class="side-title" href="${contextPath}/rank">회원 등급</a>
                    <ul class="side-sub-menu"></ul>
                </li>
                <li>
                    <a class="side-title" href="${contextPath}/qna?userNo=${loginUser.userNo}">문의 내역</a>
                    <ul class="side-sub-menu"></ul>
                </li>
                <li>
                    <a class="side-title" href="${contextPath}/payment?userNo=${loginUser.userNo}">결제 목록</a>
                    <ul class="side-sub-menu"></ul>
                </li>
            </ul>
        </div>
    </div>

    <script>
        $(function(){
            $(".side-sub-menu a").click(function(){
                $(".side-detail li").removeClass("menu-click");
                $(this).parent().addClass("menu-click");
            });

            $(".side-title").click(function(){
                $($(this).parent()).siblings().find(".side-detail").slideUp();
                $(this).siblings("ul").children().slideToggle();
            });
        });
    </script>
	
</body>
</html>