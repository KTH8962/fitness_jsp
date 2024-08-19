<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<%@include file="./adminCheck.jsp"%>
<c:if test="${!adminChk}">
<footer id="footer">
    <div class="footer-wrap">
        <address>
            <ul class="fnb">
                <li><a href="javascript:alert('준비중입니다.');">개인정보처리방침</a></li>
                <li><a href="javascript:alert('준비중입니다.');">이용약관</a></li>
                <li><a href="javascript:alert('준비중입니다.');">고객센터</a></li>
            </ul>
            <p>(주)SPORTS CENTER</p>
            <p>인천시 부평구 경원대로 1366,(부평동, 스테이션타워 7F)</p>
            <a href="tel:032-123-4567">대표전화 : 032-123-4567</a>
            <p class="copy">Copyright © 2024 SPORTS CENTER. All Rights Reserved.</p>
        </address>
    </div>
</footer>
</c:if>
</div>
</body>
</html>
<script>
	var check = "<%= check %>";
	var userRole = "<%= uSession %>";
	if(userRole !== 'ADMIN' && (check.indexOf("classWrite") > 0 || check.indexOf("admin") > 0)) {
		location.href="${pageContext.request.contextPath}/project/error.jsp";
	}
</script>