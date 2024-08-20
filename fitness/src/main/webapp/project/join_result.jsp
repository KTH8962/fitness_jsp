<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="./include/headlink.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="./include/header.jsp"></jsp:include>
	<p class="blind">회원가입</p>
        <div class="login-contents">
            <div class="login-wrap">
                <div class="ip-ul">
                    <div class="tit-box">
                        <p class="tit">가입완료</p>
                    </div>
                    <div class="bot-box">
               			<p class="login-desc">
               				안녕하세요. ${joinInfo.name} 님<br>
               				가입하신 아이디는 <b>${joinInfo.userId}</b> 입니다
               			</p>
               			<c:if test="${joinInfo.userRole == 'TEACHER'}">
               				<p class="login-desc">강사 가입은 관리자 승인이 필요합니다.</p>
               			</c:if>
                    </div>
                </div>
                <div class="btn-box">
                    <button type="button" class="btn-default btn-red" onclick="location.href='./login'">로그인으로 이동</button>
                </div>
            </div>
        </div>
	<jsp:include page="./include/footer.jsp"></jsp:include>

</body>
</html>