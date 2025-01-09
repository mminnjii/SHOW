<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.show.member.model.vo.Member" import="com.kh.show.manager.model.vo.Manager" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>menubar</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jersey+25&family=Jersey+25+Charted&family=Jua&family=Libre+Barcode+128+Text&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/e7db19de60.js" crossorigin="anonymous"></script>
    <style>
        #headerImg22{
            width: 100%;

        }
        #header22{
            width: 100%;
            height: 100px;
        }
        #logo{
            height: 70px;
        }
        #td1,#td2,#td4,#td66,#td7{
            width: 100px;
            z-index: 99;
        }
        #td3{
            font-family: "Noto Sans KR", sans-serif;
            font-size: 25px;
            font-weight: 700;
            font-style: normal;
            padding-top: 30px;
        }
        #td5{
            width: 300px;
            font-size: 12px;
            font-weight: 600;
        }
        #span1,#span2{
            color: red;
        }
        #img2{
            height: 50px;
            padding-bottom: 5px;
        }
        .tr123{
            height: 30px;
            z-index: 99;
            
        }
        .trrr{
            height: 30px;
            border-top: 1px solid rgba(128, 128, 128, 0.4);
            border-bottom: 1px solid rgba(128, 128, 128, 0.4);
            z-index: 99;
           
        }
        #header22{
            border-collapse: collapse; 
            z-index: 99;
        }
        
        .ulul .li234, #menu22 .pp1{
            list-style-type : none;
            display: inline-block;
            font-family: "Noto Sans KR", sans-serif;
            font-size: 17px;
            font-weight: 400;
            font-style: normal;
            padding-right: 13px; /*메뉴바 글씨 간격*/
            
        	z-index: 99;
            
            
        }
        #li11{
            list-style-type : none;
            display: inline-block;
            font-family: "Noto Sans KR", sans-serif;
            font-size: 13px;
            font-weight: 400;
            font-style: normal;
            padding-right: 5px;
            padding-top: 20px;
            text-decoration: none;
            color: black;
            z-index: 99;
            
        }
        
        .li234 a{
       		list-style-type : none;
            display: inline-block;
            font-family: "Noto Sans KR", sans-serif;
            font-size: 13px;
            font-weight: 400;
            font-style: normal;
            
            padding-top: 50px;
            text-decoration: none;
            color: black;
            z-index: 99;
        }
        #li11{
            color: gainsboro;
        }
        #menu22{
            padding-left: 15px; /*왼쪽 여백을 설정하여 로고와 위치 맞춤*/
        }
        .search-box2{
            height: 30px;
            width: 200px;
            background-color: white;
            border-radius: 40px;
            padding: 10px;
            border: 1px solid gray;
            display: flex;
            align-items: center;
        }
        .search-text2{
            border: none;
            background: none;
            outline: none;
            float: left;
            padding: 0px;
            color: gray;
            font-size: 13px;
            line-height: 30px;
            width: 200px;
            font-family: "Noto Sans KR", sans-serif;
        }
        .search-btn2{
            color: black;
            float: right;
            width: 40px;
            height: 100%;
            border-radius: 50%;
            background: white;
            border: none;
            font-size: 16px;
            display: flex;
            justify-content: center;
            align-items: center;
            position : relative;
            right : 20px;
            
        }
        .pp1 a{
            text-decoration: none;
            color: black;
        }

        #re{
            border: none;
            outline: none;
            background-color: white;
            color: black;
            font-size: 13px;
            font-weight: 500;
        }
        #re:hover{
            cursor: pointer;
        }
        
        
        
     
        
    </style>
</head>
<body>
	<div class="happy">
	<!-- alertMsg 비어있지 않을 때만 띄워주기 -황영식 -->
	<c:if test="${not empty alertMsg }">
	<script>
		//alert("${alertMsg}");
		alertify.alert("서비스 요청 성공","${alertMsg}");
	</script>
	<c:remove var="alertMsg"/>
	</c:if>
	<%-- 
	<script>
		var msg = "${sessionScope.alertMsg}";
	    if (msg != null && msg != "") {
	        alert(msg);
	        <% session.removeAttribute("alertMsg"); %>
	    }
	</script>
	--%>
	
	<!-- contextPath 추가 -전수민 -->
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath}"  scope="session"></c:set>
	
    <div>
        <img src="${contextPath }/resources/images/배너.jpg" alt="헤더이미지" id="headerImg22">
    </div>

    <div id="div">
        <table  id="header22">
            <tr class="tr123">

                <td id="td1"></td>
                <td id="td4"><a href="${contextPath}"><img src="${contextPath }/resources/images/로고2.png" alt="로고" id="logo"></a></td>
                <td id="td3"> 공연/전시</td>
                <td align="right" >
                    <ul class="ulul">
		                <c:choose>
		                   <c:when test="${empty loginUser}">
                               <!-- 로그인 전 -->
                               <li class="li234"><a href="${contextPath }/member/toLogin">로그인</a></li>
                               <li class="li234"><a href="${contextPath}/member/toEnroll">회원가입</a></li>
                            </c:when>
                            <c:otherwise>
                                <!-- 로그인 후 -->
                                <label>${loginUser.userName }님</label> &nbsp;&nbsp;
                                <li class="li234"><a href="${contextPath }/member/logout.me">로그아웃</a></li>
		                        <li class="li234"><a href="${contextPath}/member/myPage">마이페이지</a></li>
		                   </c:otherwise>
		                </c:choose>
                        <li class="li234">
                            <a href="${contextPath}/member/reserve?userNo=${loginUser.userNo}">예매확인/취소</a>
                        </li>
                        <li class="li234"><a href="${contextPath}/cmain">고객센터</a></li>
                    </ul>
                </td>

                <td id="td5" align="center">
                    <a href="https://www.youtube.com/watch?si=0u5-or70qp9vCzd3&v=jPhBtq425d4&feature=youtu.be" target="_blank">
                    <img src="${contextPath }/resources/images/암표.jpg" alt="" id="img2"></a> <br>

                    행복한 공연문화를 위해 <br> 지금부터 <span id="span1">암표 거래</span>를 <span id="span2">멈춰주세요</span>
                    
                </td>
                <td  id="td2"></td>
                
            </tr>
            <tr class="trrr">
                <td id="td66"></td> <!--홈    뮤지컬    연극    콘서트    클래식    전시   고객센터   커뮤티니   이벤트 -->
                <td colspan="3" id="td88">
                    <ul id="menu22">
                        <li  class="pp1"><a href="${contextPath}" >홈</a></li>
                        <li  class="pp1"><a href="${contextPath}/musicalList">뮤지컬</a></li>
                        <li  class="pp1"><a href="${contextPath}/playList" >연극</a></li>
                        <li  class="pp1"><a href="${contextPath}/concertList" >콘서트</a></li>
                        <li  class="pp1"><a href="${contextPath}/classicList" >클래식</a></li>
                        <li  class="pp1"><a href="${contextPath}/displayList">전시</a></li>


                        <li id="li11">|</li>

                        <li  class="pp1"><a href="${contextPath}/chat/list">커뮤니티</a></li>
                        <li  class="pp1"><a href="${contextPath}/notice/list" >공지사항</a></li>
                       
                    </ul>
                </td>
                
             
                <td id="td7" align="center">
                    <form class="search-box2" action="${contextPath}/showInfo/search" method="get">
                        <input type="text" class="search-text2" name="keyword" value="${hashMap.keyword}" placeholder="공연이름을 검색해보세요.">
                        <button class="search-btn2" type="submit">
                        <i class="fa-solid fa-magnifying-glass"></i>
                        </button>

                    </form>

                </td>
                

            </tr>
        </table>

    </div>
    
    </div>
    
   
    
</body>
</html>