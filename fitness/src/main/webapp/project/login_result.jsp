<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="./db/db.jsp"%>
	
	<sql:query var="idCheck" dataSource="${dataSource}">
        SELECT * FROM TBL_USER WHERE userId = ?
        <sql:param value="${param.userId}" />
    </sql:query>
    
   	<c:choose>
		<c:when test="${not empty idCheck.rows[0]}">
			<c:choose>
				<c:when test="${idCheck.rows[0].pwd == param.pwd }">
					<sql:update var="reset" dataSource="${dataSource}">
						UPDATE TBL_USER SET LOGIN_CNT = 0 WHERE userId = ?
						<sql:param value="${param.userId}" />
					</sql:update>
					<c:set var="userId" value="${idCheck.rows[0].userId}" scope="session" />
					<c:set var="user_role" value="${idCheck.rows[0].user_role}" scope="session" />
					<%
					out.print(session.getAttribute("userId"));
					out.print(session.getAttribute("user_role"));
					%>
					<c:redirect url="join.jsp"></c:redirect>
				</c:when>
				<c:otherwise>
					<sql:update var="increase" dataSource="${dataSource}">
						UPDATE TBL_USER SET LOGIN_CNT = LOGIN_CNT + 1 WHERE userId = ?
						<sql:param value="${param.userId}" />
					</sql:update>
					<script type="text/javascript">
			            alert('비밀번호를 확인해주세요.');
			            location.href="login.jsp?userId=${param.userId}";
			        </script>	
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
	        <script type="text/javascript">
	            alert('아이디를 확인해주세요.');
	            location.href="login.jsp";
	        </script>	        
		</c:otherwise>
	</c:choose>
		
    
    
</body>
</html>