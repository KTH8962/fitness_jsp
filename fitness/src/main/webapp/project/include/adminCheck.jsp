<%
	// header - path
    String contextPath = request.getContextPath()+"/project";
	// footer - location
	String uSession = (String) session.getAttribute("userRole");
	String check = request.getRequestURI();
	// common
	Boolean adminChk = false;
	if(check.indexOf("admin") > 0) {
		adminChk = true;
	} else {
		adminChk = false;
	}
	 request.setAttribute("adminChk", adminChk);
%>