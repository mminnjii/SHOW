<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		margin: auto;
		width: 70%;
		height: 100%;
		background-color: rgb(246, 246, 246);
	}

    /*table*/
    #qna-detail{
        width: 85%;
        margin: auto;
    }

    table{
        text-align: left;
    }
	
	
	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/member/enrollHeader.jsp"/>
	
	<div class="content">
		<br><br>
		<div class="inner">
			<h3><a href="${contextPath}/myPage" style="text-decoration: none; color: black;">마이페이지</a></h3>
            <br><br>
            <div id="mypage">
				<div id="mypage-side">
					<%@ include file="/WEB-INF/views/member/myPageSide.jsp" %>
				</div>
				<div id="mypage-body">
					<br>
                    <h5>문의 상세 페이지</h5>
					<br>
                    <div id="qna-detail">
                        <button class="btn btn-primary" style="float: right;" id="returnTo" >목록으로</button>
                        <br><br>
                        <table id="detail" class="table">
                            <tr>
                                <th width="100">제목</th>
                                <td width="250">${q.quTitle}</td>
                                <th>예약 번호</th>
                                <td>${q.reservationId}</td>
                            </tr>
                            <tr>
                                <th>첨부파일</th>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty q.originName}">
                                            <a href="${contextPath}${q.changeName}" download="${q.originName}">${q.originName}</a>
                                        </c:when>
                                        <c:otherwise>
                                            파일 없음
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <th>생성 날짜</th>
                                <td>${q.createDate}</td>
                            </tr>
                            <tr>
                                <th>내용</th>
                                <td colspan="3"><p style="height: 60px;">${q.quContent}</p></td>
                            </tr>
                            <tr>
                                <th>답변</th>
                                <td colspan="3"><p style="height: 60px; background-color: white;">${q.answerContent}</p></td>
                            </tr>
                        </table>
                        <div align="center">
                        	<input type="hidden" name="userNo" value="${q.userNo}">
                            <input type="hidden" name="filePath" value="${q.changeName}">
                            <button class="btn btn-primary" onclick="qUpdate();">수정하기</button>
                            <button class="btn btn-danger" id="deleteBtn">삭제하기</button>
                        </div>
                    </div>
				</div>
            </div>
		</div>
	</div>

	<script>
        //문의 내용 삭제
        $("#deleteBtn").click(function(){
            if(confirm("해당 게시물을 삭제하겠습니까?")){
                var form = $("<form>");
            	var inputObj = $("<input>");
            	var filePath = $("<input>");
            	var no = $("<input>");
            			
            	form.prop("action", "${contextPath}/qnaDelete").prop("method", "post");
            	inputObj.prop("type", "hidden").prop("name","questionNo").prop("value","${q.questionNo}");
            	filePath.prop("type", "hidden").prop("name","filePath").prop("value","${q.changeName}");
            	no.prop("type", "hidden").prop("name","userNo").prop("value","${q.userNo}");
            	
            	form.append(inputObj).append(filePath).append(no);
            			
            	$("body").append(form);
            			
            	form.submit();
            }
        });
        $("#returnBtn").click(function(){
            ocation.href="${contextPath}/board/list";
        });
        
        //목록으로
		$("#returnTo").click(function(){
            location.href="${contextPath}/qna?userNo=${loginUser.userNo}"
        });

        // 스크롤 위치 저장
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

        function qUpdate(){
            location.href = "qUpdate?qno=${q.questionNo}";
        }
	</script>

    <br><br><br>
	<jsp:include page="/WEB-INF/views/member/enrollFooter.jsp"/>
</body>
</html>