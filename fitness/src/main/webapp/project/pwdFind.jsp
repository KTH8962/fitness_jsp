<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="./include/headlink.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="./include/header.jsp"></jsp:include>
	<p class="blind">비밀번호 찾기</p>
        <div class="login-contents">
            <div class="login-wrap">
            	<form action="find" name="pwdFind">
	                <div class="ip-ul">
	                    <div class="tit-box">
	                        <p class="tit">아이디</p>
	                    </div>
	                    <div class="bot-box">
	                        <div class="ip-box">
	                            <input type="text" value="tea1" name="userId" placeholder="아이디를 입력해주세요">
	                        </div>
	                    </div>
	                </div>
	                <div class="ip-ul">
	                    <div class="tit-box">
	                        <p class="tit">이름</p>
	                    </div>
	                    <div class="bot-box">
	                        <div class="ip-box">
	                            <input type="text" value="김헬스" name="name" placeholder="이름을 입력해주세요">
	                        </div>
	                    </div>
	                </div>
	                <div class="ip-ul">
	                    <div class="tit-box">
	                        <p class="tit">이메일</p>
	                    </div>
	                    <div class="bot-box">
	                        <div class="ip-box">
	                            <input type="text" value="teacher1@example.com" name="email" placeholder="이메일주소를 입력해주세요.">
	                        </div>
	                    </div>
	                </div>
	                <div class="btn-box">
	                    <button type="submit" class="btn-default btn-red">찾기</button>
	                </div>
                </form>
            </div>
        </div>
	<jsp:include page="./include/footer.jsp"></jsp:include>

</body>
</html>