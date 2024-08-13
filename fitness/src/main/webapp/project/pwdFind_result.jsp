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
	<p class="blind">비밀번호 찾기</p>
        <div class="login-contents">
            <div class="login-wrap">
                <div class="ip-ul">
                    <div class="tit-box">
                        <p class="tit">검색결과</p>
                    </div>
                    <div class="bot-box">
	                    <c:choose>
	                    	<c:when test="${not empty idFind}">
	                    		<p class="login-desc">비밀번호는 <b>tea1</b>입니다.</p>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<p class="login-desc">입력하신 정보에 맞는 결과가 없습니다.</p>
	                    	</c:otherwise>
	                    </c:choose>   
                    </div>
                </div>
                <div class="btn-box">
                    <button type="button" class="btn-default btn-red" onclick="location.href='./login.jsp'">로그인으로 이동</button>
                </div>
            </div>
        </div>
	<jsp:include page="./include/footer.jsp"></jsp:include>

</body>
</html>