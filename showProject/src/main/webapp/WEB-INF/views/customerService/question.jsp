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
            width: 60%;
            margin: 0px auto;
            background-color: white;
            padding: 30px;
           	border: 1px solid lightgray;
            border-radius: 0px 0px  10px 10px;
			border-top : none;
        }
        
        .outer {
        	padding: 30px;
		}
        
        .a h2{
            margin: 20px 0px 0px 40px;
            text-align: center;
        }
        
        .sColor{
            color: red;
        }

        .input ul{
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

	<%@include file="/WEB-INF/views/common/menubar2.jsp" %>
    <div class="a">
    	&nbsp;<i id="back" class="fa-solid fa-angles-left" onclick="history.back();"></i>
        <h2>1:1 문의하기</h2>
	
        <form class="outer" method="POST" action="${contextPath}/queInsert" enctype="multipart/form-data" >  <!-- 파일 업로드 -->
    
       		<div class="input">
                <p>이름 <span class="sColor">*</span></p>
                <input type="text" name="userName" class="form-control" value="${loginUser.userName}" readonly required> 
            	<input type="hidden" name="userNo" value="${loginUser.userNo}" >
            </div>

            <div class="input">
                <p>답변 받을 이메일 주소 <span class="sColor">*</span></p>
                <input type="email" name="email" class="form-control"  value="${loginUser.email}" readonly required>
            </div>

            <div class="input">
                <p>답변 받을 휴대폰 번호 <span class="sColor">*</span></p>
                <input type="text" id="phone" name="phone" class="form-control" value="${loginUser.phone}" readonly required> 
            </div>

            <div class="input">
                <p>문의 유형 <span class="sColor">*</span> <span style="font-size: 12px;" disabled> (티켓 취소/환불/변경은 전화 1234-1234로 요청해 주세요)</span></p>
                <select id="qcategoryNo" name="qcategoryNo"  class="form-control" required>
                    <option value="1">티켓</option>
                    <option value="2">회원/기타</option>
                </select>
            </div>
            
            <!-- 문의 유형이 티켓인 경우에만 조회 가능하도록 -->
			
            <div class="input">
                <p>예약번호</p>  
                <div class="input-group mb-3"  > <!-- ${empty loginUser ? 'disabled' : ''} -->
                    <select id="reservationId" name="reservationId" class="form-control">
                        <option selected disabled>예약번호를 선택해 주세요</option> 
                    
                    </select>
                    <div class="input-group-append">  <!-- 예약 조회 버튼을 누르면 로그인한 회원의 예약 내역을 불러와서 보여줘야 한다  -->
       	            	<button id="reSearchBtn" class="form-control" type="button" onClick="reSearch();">예약번호 조회</button>
                    </div>
                </div>
					
                <ul>
                    <li>예약관련 문의가 아니라면 예약 번호를 선택하지 않고 문의하시면 됩니다.</li>
                </ul>
            </div>

            <div class="input">
                <p>문의 내용 <span class="sColor">*</span></p>
                <input type="text" id="quTitle" name="quTitle" class="form-control" placeholder="제목을 입력해 주세요" required><br>
                

                <textarea name="quContent" class="form-control" style="resize: none; height: 150px;" placeholder="문의 내용을 자세하게 입력해 주세요." required></textarea>
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
                    <li>로그인 후 등록한 문의에 한해 ticketPal 고객센터 "내 문의내역" 및 마이페이지에서 확인할 수 있습니다.</li><br>
                    <li>업무시간 내 순차적으로 답변드리니 조금만 기다려주세요. 
                        (티켓 고객센터 운영 오전 9시 ~ 오후 6시, 연중무휴)</li>
                </ul>
            </div>
            <br>
			
			<!-- 전체동의 체크박스 기능 구현해야 함. -->
            <div class="form-check input">
                <label class="form-check-label">
                  <input id="all" type="checkbox" class="form-check-input check"  onclick="checkAll();" required> 전체동의
                </label>
                <div class="form-check input">
                    <label class="form-check-label">
                      <input name="aggrement" type="checkbox" class="form-check-input check" onclick="updateALl();"> (필수) 개인정보 수집.이용 동의 >
                    </label><br>
                    <label class="form-check-label">
                        <input name="aggrement" type="checkbox" class="form-check-input check" onclick="updateALl();"> (필수) 개인정보 제 3자 제공 동의 >
                      </label>
                </div>
            </div>
            <br>
            <button class="form-control" onclick="return checkPhone();">문의하기</button>

        </form>
    </div>
        
   	<script>
   		
   		// 핸드폰 번호 체크 정규식 
   		function checkPhone(){
   			var regExp = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
			var phone = $("#phone").val();
   			
   			if(!regExp.test(phone)){
   				alert("휴대폰 번호를 다시 입력해 주세요.");
   				$("#phone").focus();	
   				
   				return false;
   			}
   			return true;
   		}
   	
   		// 전체동의 체크박스 
		function checkAll(){
   			
   			var all = $("#all");
   			var sub = $("input[name='aggrement']");
   			
   			if(all.prop("checked")){
   				sub.prop("checked", true);
   			}else{
   				sub.prop("checked", false);   				
   			}
   			
   		}
   		
   		// 체크박스 하나라도 해제되면 전체동의 체크 해제 
   		function updateALl(){
   			var all = $("#all");
   			var sub = $("input[name='aggrement']");
   			var allChecked = true;
   			
   			for(var i=0; i<sub.length; i++){
   				if(!$(sub[i]).prop("checked")){   //sub jQuery 객체로 생성됨. dom 요소를 jquery 객체로 변환해서 사용해야 한다. 
   					allChecked = false;
   					break;
   				}
   			}
   			
   			all.prop("checked", allChecked);
   	
   			if(!sub.prop("checked")){
   				alert("서비스 동의를 해주시기 바랍니다.");
   			}
   		}
   	
   		// 예약 내역 불러오기 
   		function reSearch(){
   			console.log("버튼 클릭됨");
   			
   			var userNo = ${loginUser.userNo};
   			
   			console.log(userNo);
   			$.ajax({
   				url : '${contextPath}/reSearch',
   				method : 'POST',
   				data : {  <%-- 회원 번호를 전달할 수 있도록 수정 --%>
   					userNo : userNo
   				},
   				success : function(reList){
   					
   					console.log(reList);
   					
   					var str = "";

   					if(reList != null){
	   					for(var i=0;i<reList.length;i++){
							str += "<option>"
								+ reList[i].reservationId
								+ " / "
								+ reList[i].showList[0].showName
								+ "</option>";
						}   					
   					}else{
						str += "<option disabled selected>예약하신 공연이 없습니다.</option>";   						
   					}
					
   					$("#reservationId").html(str);
   				},
   				error : function(){
   					alert("예약 조회가 불가능합니다.");
   				}
   				
   			});
   		}
   		
   		
   	</script>
	
	<br><br>
 	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
 	   

</body>
</html>