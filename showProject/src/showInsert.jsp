<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공연 등록</title>
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
		    max-width: 500px;  /* 예시로 크기 제한 */
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
		        <h1>공연 등록</h1>
		<form action="${contextPath}/managerPage/showInsert" method="POST" enctype="multipart/form-data">
		    <!-- 제목 -->
		    <div class="form-group">
		        <label for="showTitle">공연 제목</label>
		        <input type="text" id="showTitle" name="showName" required>
		    </div>
		
		    <!-- 상세 내용 -->
		    <div class="form-group">
		        <label for="showExplain">공연 상세 내용</label>
		        <textarea id="showExplain" name="showExplain" required></textarea>
		    </div>
		    
		    <div class="form-group">
		        <label for="notice">공지사항</label>
		        <textarea id="notice" name="notice" required></textarea>
		    </div>
		    
		    <div class="form-group">
		        <label for="price">R석 가격 * S석은 R석 가격의 1.2배, VIP석은 R석 가격의 1.4배로 책정됩니다.</label>
		        <input type="text" id="price" name="rPrice" required>
		    </div>
		    
		    <div class="form-group">
		        <label for="genreNo">장르 선택</label>
		        <select id="genreNo" name="genreNo" required>
		            <option value="1">뮤지컬</option>
		            <option value="2">연극</option>
		            <option value="3">콘서트</option>
		            <option value="4">클래식</option>
		            <option value="5">전시</option>
		        </select>
		    </div>
		    
		    <div class="form-group">
		        <label for="hallNo">공연장 선택</label>
		        <select id="hallNo" name="hallNo" required>
		            <option value="1">링크아트센터 벅스홀 서울</option>
		        </select>
		    </div>
		    
		    <div class="form-group">
		        <label for="regionNo">지역 선택</label>
		        <select id="regionNo" name="regionNo" required>
		            <option value="1">서울</option>
		            <option value="2">경기/인천</option>
		            <option value="3">충청/강원</option>
		            <option value="4">대구/경북</option>
		            <option value="5">부산/경남</option>
		            <option value="6">광주/전라</option>
		            <option value="7">제주</option>
		        </select>
		    </div>
		
		    <!-- 공연 시작 날짜 -->
		    <div class="form-group">
		        <label for="showStartDate">공연 시작 날짜</label>
		        <input type="date" id="showStart" name="showStart" required>
		    </div>
		
		    <!-- 공연 종료 날짜 -->
		    <div class="form-group">
		        <label for="showEndDate">공연 종료 날짜</label>
		        <input type="date" id="showEnd" name="showEnd" required>
		    </div>
		
		    <!-- 포스터 사진 -->
		    <div class="form-group">
		        <label for="posterImage">포스터 사진</label>
		        <input type="file" id="posterImage" name="posterImage" accept="image/*" required>
		        <div class="image-preview" id="posterPreview">
		            포스터 미리보기가 여기에 나타납니다.
		        </div>
		    </div>
		
		    <!-- 상세 내용 사진 (여러 개 선택 가능) -->
			<div class="form-group">
			    <label for="detailImages">상세 내용 사진</label>
			    <input type="file" id="detailImages" name="detailImage" accept="image/*" multiple>
			    <div class="image-preview" id="detailPreview">
			        상세 내용 미리보기가 여기에 나타납니다.
			    </div>
			</div>
			
			<div class="button-container">
		        <button type="submit" class="submit-btn">등록하기</button>
		    </div>
		</form>
	</div>

    <script>
    document.getElementById('posterImage').addEventListener('change', function(event) {
        const file = event.target.files[0];
        const preview = document.getElementById('posterPreview');

        // 파일이 선택되었는지 확인하고, 이미지 파일인지 확인
        if (file && file.type.startsWith("image/")) {
            const reader = new FileReader();
            reader.onload = function(e) {
                // 미리보기 영역을 초기화하고 새 이미지 삽입
                preview.innerHTML = '';  // 기존 미리보기 내용 초기화
                const img = document.createElement('img');  // 이미지 요소 생성
                img.src = e.target.result;  // 이미지 URL 설정
                img.alt = '포스터 미리보기';  // alt 속성 설정
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
    document.getElementById('detailImages').addEventListener('change', function(event) {
        const files = event.target.files;
        const previewContainer = document.getElementById('detailPreview');
        previewContainer.innerHTML = '';  // 기존 미리보기 내용 초기화

        // 각 파일에 대해 미리보기 이미지 생성
        for (const file of files) {
            if (file && file.type.startsWith("image/")) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const imgElement = document.createElement('img');
                    imgElement.src = e.target.result;
                    imgElement.alt = "상세 내용 미리보기";
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