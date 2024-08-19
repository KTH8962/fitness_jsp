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
	<div id="container" class="error access">            
	    <p class="blind">접근권한 화면</p>
	    <div class="error-wrap">
	        <p class="error-tit">접근 권한이 없습니다<b>.</b></p>
	        <p class="error-desc">
	            해당서비스는 회원님에게 할당된 접근 권한이 없습니다.
	        </p>
	        <a href="${pageContext.request.contextPath}/project/index" class="error-btn">메인으로 돌아가기</a>
	    </div>
	</div>
</body>
</html>