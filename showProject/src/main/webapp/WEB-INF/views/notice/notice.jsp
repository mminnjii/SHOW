<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <style>
        
        #boardList {text-align:center;}
        #boardList>tbody>tr:hover {cursor:pointer;}
        #pagingArea {width:fit-content; margin:auto;}
        #searchForm>* {
            float:left;
            margin:5px;
        }
        .select {width:20%;}
        .text {width:53%;}
        .searchBtn {
            width:20%; 
            background-color: #597c9b;
        }

        .a {
            text-align: left;
            width: 60%;
            margin: 0px auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        tbody>tr:hover{
            background-color: lightgray; /*#597c9b*/
        }

        .noBtn {
            border: 1px solid lightgray;
            background-color: white;
            display: inline-block;
            padding: 5px 20px;
        }

    </style>
</head>
<body>
	
	<%@include file="/WEB-INF/views/common/menubar.jsp" %>
	<br><br>
	
    <div class="a" style="padding:5% 10%;">
        <h2>공지시항</h2>
        
        <br>
        <div>
            <button class="noBtn" value="1">일반 공지</button>
            <button class="noBtn" value="2">오픈 공지</button>
        </div>
        
        <br>

        <form id="searchForm" action="${contextPath}/" method="get" align="center">
        
            <div class="select">
                <select class="custom-select" name="condition">
                    <option value="total">전체</option>
                    <option value="writer">작성자</option>
                    <option value="title">제목</option>
                </select>
            </div>
    
            <div class="text">
                <input type="text" class="form-control" name="keyword" value="${map.keyword}">
            </div>
    
            <button type="submit" class="searchBtn btn btn-secondary">검색</button>
        </form>
        
        <!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
        <br>
        <br><br>
        <table id="chatList" class="table" align="center">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성 날짜</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
                <!--
                <c:choose>
                    <c:when test="${empty list}">
                    <tr>
                        <td colspan="6">조회된 게시글이 없습니다.</td>
                    </tr>
                    </c:when>
                    <c:otherwise>
                    <c:forEach var="b" items="${list}">
                -->
                        <tr>
                            <td>1</td>
                            <td>콘서트 같이 가요.</td>
                            <td>1/10</td>
                            <td>2024-12-31</td>
                        </tr>

                        <tr>
                            <td>1</td>
                            <td>콘서트 같이 가요.</td>
                            <td>1/10</td>
                            <td>2024-12-31</td>
                        </tr>

                        <tr>
                            <td>1</td>
                            <td>콘서트 같이 가요.</td>
                            <td>1/10</td>
                            <td>2024-12-31</td>
                        </tr>

                        <tr>
                            <td>1</td>
                            <td>콘서트 같이 가요.</td>
                            <td>1/10</td>
                            <td>2024-12-31</td>
                        </tr>

                        <tr>
                            <td>1</td>
                            <td>콘서트 같이 가요.</td>
                            <td>1/10</td>
                            <td>2024-12-31</td>
                        </tr>
                    <!--</c:forEach>
                    </c:otherwise>
                    
                </c:choose> -->
            </tbody>
        </table>
        <br>
        
        <script>
            // 글을 클릭했을 때 해당 글을 상세보기 할 수 있는 함수 작성 
            $(function(){
                $("#boardList>tbody>tr").click(function(){
                    var bno = $(this).children().first().text();

                    location.href='detail?bno='+bno;
                    
                })
            });
        </script>
        
        <!-- <div id="pagingArea">
            <ul class="pagination">
                
                <li class="page-item disabled"><a class="page-link" href="${contextPath}/board/list?currentPage=${pi.currentPage-1}">Previous</a></li>
                <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
                    <c:choose>
                        <c:when test="${empty map}"><%-- 검색이 아니라면 --%>
                            <li class="page-item"><a class="page-link" href="list?currentPage=${i}">${i}</a></li>
                        </c:when>
                        <c:otherwise><%-- 검색일 경우 --%>
                            <c:url var="searchUrl" value="search">
                                <c:param name="condition" value="${map.condition}"/>
                                <c:param name="keyword" value="${map.keyword}"/>
                                <c:param name="currentPage" value="${i}"/>
                            </c:url>
                            <li class="page-item">
                                <a class="page-link" href="${searchUrl}">${i}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <li class="page-item"><a class="page-link" href="${contextPath}/board/list?currentPage=${pi.currentPage+1}">Next</a></li>
                
            </ul>
        </div>
        <br clear="both"><br> -->
        
        
        <!-- 
            searchList() 메소드명으로 작성
            키워드랑 카테고리 유지될 수 있도록 처리해보기 
            동적 sql 사용해보기 
        -->
        
        
        
        
        <script>
            $("option[value='${map.condition}']").attr("selected", true);

            $(".noBtn").on('click', function(){
                $(".noBtn").css("background-color", "white").css("color", "black").css("border", "1px solid gray");
                $(this).css("background-color", "#597c9b").css("color", "white").css("border", "1px solid #597c9b");
            });
        </script>
        
        
        
        <br><br>
    </div>
    <br><br>

   	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
   
</body>
</html>