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
			<script type="text/javascript">
	            alert('사용가능 불가능한 아이디 입니다.');
	            window.close();
	        </script>
		</c:when>
		<c:otherwise>
	        <script type="text/javascript">
	            alert('사용가능 한 아이디 입니다.');
	            window.close();
	            window.opener.fnCheck(true);
	        </script>	        
		</c:otherwise>
	</c:choose>
		
    
    
</body>
</html>