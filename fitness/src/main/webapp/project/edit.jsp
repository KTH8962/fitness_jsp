<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="./include/headlink.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<%
	String se = (String) session.getAttribute("userRole");
	if(se == null) {
		System.out.println(se);
		response.sendRedirect("error.jsp");
	}
%>
<body>
	<jsp:include page="./include/header.jsp"></jsp:include>
	<div id="container" class="sub">
        <p class="blind">정보수정</p>
        <div class="sub-visual">
            <h2 class="sub-visual-tit">정보수정</h2>
        </div>
        <form action="edit" method="post" name="edit">
	        <div class="member-contents">
	            <div class="ip-ul">
	                <div class="tit-box">
	                    <p class="tit">아이디</p>
	                </div>
	                <div class="bot-box">
	                    <div class="ip-box">
	                        <input type="text" id="id" value="${loginInfo.userId}" disabled>
	                    </div>
	                </div>
	            </div>
	            <div class="ip-ul">
	                <div class="tit-box">
	                    <p class="tit">비밀번호</p>
	                </div>
	                <div class="bot-box">
	                    <div class="ip-box">
	                        <input type="password" id="pwd" name="pwd" placeholder="비밀번호는 영문자+숫자 조합으로 8자 이상 입력해주세요.">
	                    </div>
	                </div>
	            </div>
	            <div class="ip-ul">
	                <div class="tit-box">
	                    <p class="tit">이름</p>
	                </div>
	                <div class="bot-box">
	                    <div class="ip-box">
	                        <input type="text" id="name" value="${loginInfo.name}" disabled>
	                    </div>
	                </div>
	            </div>
	            <div class="ip-ul">
	                <div class="tit-box">
	                    <p class="tit">생년월일</p>
	                </div>
	                <div class="bot-box">
	                    <div class="ip-box">
	                        <input type="date" id="birth" value="${loginInfo.birth}" disabled>
	                    </div>
	                </div>
	            </div>
	            <div class="ip-ul">
	                <div class="tit-box">
	                    <p class="tit">전화번호</p>
	                </div>
	                <div class="bot-box">
	                    <div class="ip-box">
	                        <input type="text" id="phone" name="phone" value="${loginInfo.phone}" placeholder="전화번호는 -없이 숫자만 입력해주세요.">
	                    </div>
	                </div>
	            </div>
	            <div class="ip-ul">
	                <div class="tit-box">
	                    <p class="tit">이메일</p>
	                </div>
	                <div class="bot-box">
	                    <div class="ip-box">
	                        <input type="text" id="email" name="email" value="${loginInfo.email}" placeholder="이메일을 입력해주세요.">
	                    </div>
	                </div>
	            </div>
	            <c:if test="${sessionScope.userRole == 'TEACHER'}">
	            <div class="ip-ul">
	                <div class="tit-box">
	                    <p class="tit">분야</p>
	                </div>
	                <div class="bot-box">
	                    <div class="select-box">
	                        <select name="field" id="field">
	                            <option value="" hidden>분야를 선택해주세요</option>
	                            <c:forEach var="field" items="${fieldList}">
	                            	<option value="${field.programEname}" <c:if test="${loginInfo.field == field.programEname}">selected</c:if>>${field.programName}</option>
	                            </c:forEach>
	                        </select>
	                    </div>
	                </div>
	            </div>
	            </c:if>
	            <div class="btn-box">
	                <button type="button" class="btn-default btn-red" onclick="fnEdit();">정보수정</button>
	            </div>
	        </div>
        </form>
    </div>
	<jsp:include page="./include/footer.jsp"></jsp:include>
</body>
</html>

<script>
	function fnEdit() {
	    var check1 = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{8,50}$/; // 패스워드 정규식
	    var check2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일이 적합한지 검사할 정규식
	    var check3 = /^\d+$/;
	    
		var form = document.edit;
		var pwd = form.pwd;
		var phone = form.phone;
		var email = form.email;
		var field = form.field;
		if(pwd.value != "" && !(compare(check1, pwd, "비밀번호는 영문자+숫자 조합으로 8자 이상 입력해주세요."))){
			return false;
		} else if(!(compare(check3, phone, "핸드폰 번호는 숫자만 입력해주세요."))){
			return false;
		} else if(!(compare(check2, email, "이메일은 형식에 맞게 입력해주세요."))){
			return false;
		} else {
			if(confirm("수정하시겠습니까?")) {
				form.submit();
			}
		}
	}
	
	function compare(check, form, message) {
		if(check.test(form.value)) {
			return true;
		}
		form.focus();
		alert(message);
		return false;
	}
	
	<c:if test="${not empty requestScope.message}">
	    var message = "<c:out value='${requestScope.message}' />";
	    alert(message);
	</c:if>
</script>
