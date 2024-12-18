<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	.content{
		width: 100%;
		margin: auto;
        text-align: center;
        position: absolute;
	}
    #path{
        text-align: right;
        font-size: 12px;
    }
	.inner{
		width: 50%;
		margin: auto;
		padding-top: 15%;
		text-align: left;
	}

    /*테이블 관련*/
    #tos{
        position: relative;
        width: 400px;
    }
    #tos td{
        height: 50px;
        width: 100%;

        border-bottom: 1px solid gray;
    }
    /*약관 모달창*/
    

    /*버튼*/
    #btn1{
        background-color: #597C9B;
		border-radius: 8px;
		border: none;
		width: 300px;
		height: 40px;

		color: white;
		font-weight: bold;
		font-size: 16px;	
    }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/member/enrollHeader.jsp"/>
	
	<div class="content">
		<br><br>
        <div id="path">
            <p><b>1.약관동의</b> - 2.정보입력 - 3.가입완료</p>
        </div>
		<div class="inner">
			<h3>약관에 동의해 주세요</h3>
            <table id="tos">
                <tr>
                     <td>
                        <input type="checkbox" name="ck" id="all"><label for="all"><b>모두 동의</b></label>
                     </td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" name="ck" id="t1">[필수]Ticketpal 이용 약관 >
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" name="ck" id="t2">[필수]개인정보 수집 및 이용 동의 >
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" name="ck" id="t3">[선택]개인정보 수집 및 이용 동의 >
                    </td>
                </tr>
            </table>
		</div>
        <br><br>
        <button id="btn1">다음 단계</button>
	</div>
	
	<jsp:include page="/WEB-INF/views/member/enrollFooter.jsp"/>
</body>
</html>