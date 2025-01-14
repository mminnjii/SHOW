<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1 문의 답변</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7fa;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            text-align: center;
            color: #34495e;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 16px;
            color: #34495e;
            margin-bottom: 5px;
        }

        .form-group input, .form-group textarea, .form-group select {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #bdc3c7;
            border-radius: 5px;
            background-color: #ecf0f1;
            box-sizing: border-box;
        }

        .form-group input[type="file"] {
            padding: 0;
        }

        .form-group textarea {
            height: 150px;
            resize: none;
        }

        .form-group .image-preview {
		    width: 100%;
		    height: 200px; /* 높이를 조정할 수 있습니다 */
		    background-color: #bdc3c7;
		    border-radius: 5px;
		    margin-top: 10px;
		    overflow: hidden; /* 이미지가 공간을 넘지 않게 */
		    display: flex;
		    justify-content: center;
		    align-items: center;
		}
		
		.form-group .image-preview img {
		    max-width: 100%;  /* 부모 영역을 넘지 않도록 */
		    max-height: 100%;
		    object-fit: contain;  /* 비율을 유지하며 크기를 맞춤 */
		    border-radius: 5px;
		}
		
		.image-preview img {
		    width: 100%;
		    height: auto;
		    max-width: 700px;
		    max-height: 1000px;
		}

        .button-container {
            text-align: center;
        }

        .submit-btn {
            background-color: #27ae60;
            color: white;
            padding: 15px 30px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background-color: #2ecc71;
        }
    </style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/menubar.jsp" %>
	    <div class="container">
		        <h1>1:1 문의 답변</h1>
		<form action="${contextPath}/managerPage/questionAnswer" method="POST" enctype="multipart/form-data">
		    <div class="form-group">
		        <label for="questionNo">문의 번호</label>
		        <input type="text" id="questionNo" name="questionNo" value="${answer.questionNo}" readonly>
		    </div>
		    
		    <div class="form-group">
		        <label for="userNo">문의 유저 번호</label>
		        <input type="text" id="userNo" name="userNo" value="${answer.userNo}" readonly>
		    </div>
		    
		    <div class="form-group">
		        <label for="userName">문의 유저 아이디</label>
		        <input type="text" id="userName" name="userName" value="${answer.userId}" readonly>
		    </div>
		    
		    <div class="form-group">
		        <label for="reservationId">예약 번호</label>
		        <input type="text" id="reservationId" name="reservationId" value="${answer.reservationId}" readonly>
		    </div>
		    
		    <div class="form-group">
		        <label for="categoryName">문의 카테고리 이름</label>
		        <input type="hidden" id="categoryNo" name="categoryNo" value="${answer.qcategoryNo}">
		        <input type="text" id="categoryName" name="categoryName" value="${answer.qcategoryName}" readonly>
		    </div>
		    
		    <div class="form-group">
		        <label for="quTitle">문의 제목</label>
		        <input type="text" id="quTitle" name="quTitle" value="${answer.quTitle}" readonly>
		    </div>
		
		    <!-- 상세 내용 -->
		    <div class="form-group">
		        <label for="quContent">문의 상세 내용</label>
		        <textarea id="quContent" name="quContent" readonly>${answer.quContent}</textarea>
		    </div>
		    
		    <div class="form-group">
		        <label for="createDate">문의 날짜</label>
		        <input type="text" id="createDate" name="createDate" value="${answer.createDate}" readonly>
		    </div>
		    
			<%-- 
		    <!-- 문의 사진 -->
		    <div class="form-group">
		        <label for="quImage">질문 내용 사진</label>
		        <input type="file" id="quImage" name="quImage" accept="image/*">
		        <div class="image-preview" id="quImage">
		            <img src="${pageContext.request.contextPath}${answer.changeName}">
		        </div>
		    </div>
		    --%>
		    
		    <div class="form-group">
		    	<label for="quFile">문의 첨부파일</label>
		    	<c:if test="${not empty answer.changeName}">
		    		<p><strong>첨부파일 : </strong><a href="${answer.changeName}" download></a></p>
		    	</c:if>
		    	<c:if test="${empty answer.changeName}">
		    		<p><strong>첨부파일이 없습니다.</strong></p>
		    	</c:if>
		    </div>
		    
		    <div class="form-group">
		        <label for="answerContent">문의에 대한 답변</label>
		        <textarea id="answerContent" name="answerContent" required >${answer.answerContent}</textarea>
		    </div>
		    
		    <%-- 답변 이미지 삽입. 나중에 필요하게 되면 넣기
		    <div class="form-group">
			    <label for="answerImage">상세 내용 사진</label>
			    <input type="file" id="answerImage" name="answerImage" accept="image/*" multiple>
			    <div class="image-preview" id="answerImage">
			        답변에 필요한 이미지를 삽입해주세요.
			    </div>
			</div>
			--%>
			<div class="button-container">
		        <button type="submit" class="submit-btn">답변하기</button>
		    </div>
		</form>
	</div>

    <script>
    document.getElementById('posterImage').addEventListener('change', function(event) {
        const file = event.target.files[0];
        const preview = document.getElementById('quImage');

        // 파일이 선택되었는지 확인하고, 이미지 파일인지 확인
        if (file && file.type.startsWith("image/")) {
            const reader = new FileReader();
            reader.onload = function(e) {
                // 미리보기 영역을 초기화하고 새 이미지 삽입
                preview.innerHTML = '';  // 기존 미리보기 내용 초기화
                const img = document.createElement('img');  // 이미지 요소 생성
                img.src = e.target.result;  // 이미지 URL 설정
                img.alt = '이미지 미리보기';  // alt 속성 설정
                img.style.maxWidth = '100%';  // 이미지를 부모 영역에 맞게 조정
                img.style.height = 'auto';  // 비율에 맞게 이미지 크기 조정
                preview.appendChild(img);  // 미리보기 영역에 이미지 추가
            };
            reader.readAsDataURL(file);
        } else {
            preview.innerHTML = '이미지를 선택하세요.';
        }
    });
	
    
 // 상세 내용 이미지 미리보기 (여러 이미지)
    document.getElementById('answerImage').addEventListener('change', function(event) {
        const files = event.target.files;
        const previewContainer = document.getElementById('answerImage');
        previewContainer.innerHTML = '';  // 기존 미리보기 내용 초기화

        // 각 파일에 대해 미리보기 이미지 생성
        for (const file of files) {
            if (file && file.type.startsWith("image/")) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const imgElement = document.createElement('img');
                    imgElement.src = e.target.result;
                    imgElement.alt = "답변 이미지 미리보기";
                    imgElement.style.maxWidth = '100%';  // 미리보기 영역에 맞춰 크기 조정
                    imgElement.style.height = 'auto';  // 비율에 맞게 크기 조정
                    imgElement.style.marginBottom = '10px';  // 각 이미지 간 간격 추가
                    previewContainer.appendChild(imgElement);  // 미리보기 영역에 이미지 추가
                };
                reader.readAsDataURL(file);
            }
        }
    });
    </script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>