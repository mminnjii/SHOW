<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 관리</title>
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
		width: 70%;
		height: 100%;
		background-color: rgb(246, 246, 246);
        margin: auto;
	}

    #address-body{
        width: 620px;
        height: 200px;
        margin: 30px;
        text-align: left;
    }

    #current-address{
        width: 620px;
        height: 100px;
        text-align: left;
    }

    .ad{
        height: 40px;
        width: 400px;
    }

    #address-btn{
        width: 120px;
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
				<div id="mypage-body" align="center">
                    <br>
                    <h5>배송지 관리</h5>
                    <br>
                    <div id="current-address">
                        현재 배송지 : ${loginUser.address}
                    </div>
                        <div id="address-body">
                            <input type="text" id="sample6_postcode" class="ad" style="width: 200px;" placeholder="우편번호">
                            <input type="button" id="address-btn" class="btn btn-success" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br><br>
                            <input type="text" id="sample6_address" class="ad" placeholder="주소"><br><br>
                            <input type="text" id="sample6_detailAddress" class="ad" placeholder="상세주소">
                            <input type="text" id="sample6_extraAddress" class="ad" style="width: 200px;" placeholder="참고항목">	
                        </div>
                        <button id="btn1" class="btn btn-primary" onclick="newAddress();">입력 완료</button>
				</div>
            </div>
		</div>
	</div>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample6_extraAddress").value = extraAddr;
                    
                    } else {
                        document.getElementById("sample6_extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }

        function newAddress(){
            var a1 = $("#sample6_postcode").val();
            var a2 = $("#sample6_address").val();
            var a3 = $("#sample6_detailAddress").val();
            var a4 = $("#sample6_extraAddress").val();

            var address  = "("+a1+")"+" "+a2+a3+a4;

            console.log(address);

            var form = $("<form>");
            var me = $("<input>"); 
            var ad = $("<input>"); 

            form.prop("action","${contextPath}/address.me").prop("method","post");
            me.prop("type","hidden").prop("name","userId").prop("value","${loginUser.userId}");
            ad.prop("type","hidden").prop("name","address").prop("value",address);

            form.append(me).append(ad);

            $("body").append(form);

            form.submit();
        }
    </script>

    <br><br><br>
	<jsp:include page="/WEB-INF/views/member/enrollFooter.jsp"/>
</body>
</html>