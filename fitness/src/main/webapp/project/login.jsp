<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="./include/headlink.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="./include/header.jsp"></jsp:include>
	<p class="blind">로그인</p>
        <div class="login-contents">
            <div class="login-wrap">
            	<form action="login" method="post" name="login">
	                <div class="ip-ul">
	                    <div class="tit-box">
	                        <p class="tit">아이디</p>
	                    </div>
	                    <div class="bot-box">
	                        <div class="ip-box">
	                            <input type="text" name="userId" value="${param.userId}" placeholder="아이디를 입력해주세요">
	                        </div>
	                    </div>
	                </div>
	                <div class="ip-ul">
	                    <div class="tit-box">
	                        <p class="tit">비밀번호</p>
	                    </div>
	                    <div class="bot-box">
	                        <div class="ip-box">
	                            <input type="password" name="pwd" placeholder="비밀번호를 입력해주세요.">
	                        </div>
	                    </div>
	                </div>
	                <div class="btn-box">
	                    <button type="submit" class="btn-default btn-red">로그인</button>
	                </div>
            	</form>
                <div class="find-box">
                    <ul>
                        <li><a href="./idFind.jsp">아이디 찾기</a></li>
                        <li><a href="./pwdFind.jsp">비밀번호 찾기</a></li>
                        <li><a href="./join.jsp">회원가입</a></li>
                    </ul>
                </div>
            </div>
        </div>
	<jsp:include page="./include/footer.jsp"></jsp:include>
</body>
</html>

<c:if test="${not empty requestScope.loginAlert}">
    <script>
        var loginAlert = "<c:out value='${requestScope.loginAlert}' />";
        alert(loginAlert);
    </script>
</c:if>