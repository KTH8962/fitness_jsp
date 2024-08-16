<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
    	String contextPath = request.getContextPath()+"/project/index";
	
        // 세션을 무효화합니다.
        session.invalidate();
        
        // 세션 무효화 후 리디렉션할 페이지 URL
        String redirectURL = contextPath;
        
        // 리디렉션 처리
        response.sendRedirect(redirectURL);
    %>
</body>
</html>