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
        .a {
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

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

        

        tbody>tr:hover{
            background-color: lightgray;
        }

    </style>
</head>
<body>

    <div class="a" style="padding:5% 10%;">
        <h2>채팅방</h2>
        
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
                    <th>작성자</th>
                    <th>입장인원수</th>
                    <th>작성일</th>
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
                            <td>oo콘서트 갔다오신분 있나요?</td>
                            <td>user01</td>
                            <td>1/10</td>
                            <td>2024-12-31</td>
                        </tr>

                        <tr>
                            <td>1</td>
                            <td>OO뮤지컬 후기</td>
                            <td>user01</td>
                            <td>1/10</td>
                            <td>2024-12-31</td>
                        </tr>

                        <tr>
                            <td>1</td>
                            <td>OO뮤지컬 후기</td>
                            <td>user01</td>
                            <td>1/10</td>
                            <td>2024-12-31</td>
                        </tr>

                        <tr>
                            <td>1</td>
                            <td>OO뮤지컬 후기</td>
                            <td>user01</td>
                            <td>1/10</td>
                            <td>2024-12-31</td>
                        </tr>

                        <tr>
                            <td>1</td>
                            <td>OO뮤지컬 후기</td>
                            <td>user01</td>
                            <td>1/10</td>
                            <td>2024-12-31</td>
                        </tr>
                    <!--</c:forEach>
                    </c:otherwise>
                    
                </c:choose> -->
            </tbody>
        </table>
        <br>
        <button class="btn btn-secondary" style="float:right; background-color: #597c9b;" href="insert">채팅방 만들기</button>
        
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
            
        </script>
        
        
        
        <br><br>
    </div>
    <br><br>

   <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>