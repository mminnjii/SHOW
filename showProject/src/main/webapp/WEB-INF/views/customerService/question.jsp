<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <style>
        .a {
            text-align: left;
            width: 80%;
            margin: 0px auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.4);
            border-radius: 10px;
        }
        .a h2{
            margin-left: 10px;
        }
        .sColor{
            color: red;
        }

        ul{
            margin: 5px 0px 5px 0px;
            font-size: 15px;
            color: gray;
        }

        .input{
            margin: 10px;
            margin-top: 30px;
        }
    </style>

</head>
<body>

	<%@include file="/WEB-INF/views/common/menubar.jsp" %>
	
    <div class="a">
        <h2>1:1 문의하기</h2>
        
        <div class="outer">
            <div class="input">
                <p>이름 <span class="sColor">*</span></p>
                <input type="text" name="" class="form-control"  placeholder="이름을 입력하세요" value=""> 
            </div>

            <div class="input">
                <p>답변 받을 이메일 주소 <span class="sColor">*</span></p>
                <input type="email" name="" class="form-control"  placeholder="이름을 입력하세요" value="">
            </div>

            <div class="input">
                <p>답변 받을 휴대폰 번호 <span class="sColor">*</span></p>
                <input type="text" name="" class="form-control"  placeholder="이름을 입력하세요" value=""> 
            </div>
            
            <div class="input">
                <p>문의 유형 <span class="sColor">*</span> <span style="font-size: 12px;"> (티켓 취소/환불/변경은 전화 1234-1234로 요청해 주세요)</span></p>
                <select name="qcategoryNo"  class="form-control">
                    <option>티켓</option>
                    <option>회원/기타</option>
                </select>
            </div>
            
            <div class="input">
                <p>예약번호</p>
                <div class="input-group mb-3">
                    <select name="reservationId" class="form-control">
                        <option>QWSD41561</option> 
                        <option>QWSD41561</option>
                    </select>
                    <div class="input-group-append">
                      <button class="form-control" type="submit">예약번호 조회</button>
                    </div>
                </div>

                <ul>
                    <li>문의 유형 선택 후 예약 번호를 조회할 수 있습니다.</li>
                    <li>예약 없이도 문의할 수 있습니다.</li>
                </ul>

                

            </div>

            <div class="input">
                <p>문의 내용 <span class="sColor">*</span></p>
                <input type="text" id="qContent" name="qContent" class="form-control" placeholder="제목을 입력해 주세요"><br>
                
                <textarea type="text" name="" class="form-control" style="resize: none; height: 150px;" placeholder="문의 내용을 자세하게 입력해 주세요."></textarea>
            </div>
            
            <div class="input">
                <p>첨부파일</p>
                <input type="file" id="upfile" class="form-control-file border" name="upfile">
                <ul>
                    <li>사진 및 파일은 1개 등록 가능합니다.</li>
                    <li>10MB 이내의 모든 이미지 및 PDF, TXT, MS office 문서 및 zip파일을 업로드해주세요.</li>
                    <li>첨부 파일 형식 및 내용이 1:1 문의 내용과 맞지 않는 경우(비방, 음란, 고유식별정보 포함 등) 관리자에 의해 자동 삭제 될 수 있습니다.</li>
                </ul>
                <hr>
                <p style="color: gray;">안내사항</p>
                <ul>
                    <li>로그인 후 등록한 문의에 한해 <br>ticketPal 고객센터 "내 문의내역" 및 마이페이지에서 확인할 수 있습니다.</li>
                    <li>비회원 문의 또는 로그인 하지 않은 상태의 1:1 문의 답변은 메일로만 전달되니 회원이시라면 로그인 후 문의해주세요.</li>
                    <li>업무시간 내 순차적으로 답변드리니 조금만 기다려주세요. <br>
                        (티켓 고객센터 운영 오전 9시 ~ 오후 6시, 연중무휴)</li>
                </ul>
            </div>
            <br>

            <div class="form-check input">
                <label class="form-check-label">
                  <input type="checkbox" class="form-check-input" value=""> 전체동의
                </label>
                <div class="form-check input">
                    <label class="form-check-label">
                      <input type="checkbox" class="form-check-input" value=""> (필수) 개인정보 수집.이용 동의 >
                    </label><br>
                    <label class="form-check-label">
                        <input type="checkbox" class="form-check-input" value=""> (필수) 개인정보 제 3자 제공 동의 >
                      </label>
                </div>
            </div>
            <br>
            <button class="form-control">문의하기</button>

        </div>
    </div>
        

    

</body>
</html>