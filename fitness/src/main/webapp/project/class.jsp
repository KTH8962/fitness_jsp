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
<body>
	<jsp:include page="./include/header.jsp"></jsp:include>
	<div id="container" class="sub">
	    <p class="blind">강의목록</p>
	    <div class="sub-visual">
	        <h2 class="sub-visual-tit">강의목록</h2>
	    </div>
	    <div class="sub-contents board-type">
	        <div class="tab-default">
	            <button type="button" onclick="fnCategory('ALL')" class="<%= "ALL".equals(request.getParameter("category")) || request.getParameter("category") == null ? "active": "" %>">전체보기</button>
	            <button type="button" onclick="fnCategory('F')" class="<%= "F".equals(request.getParameter("category")) ? "active": "" %>">개설예정</button>
	            <button type="button" onclick="fnCategory('I')" class="<%= "I".equals(request.getParameter("category")) ? "active": "" %>">진행중</button>
	            <button type="button" onclick="fnCategory('E')" class="<%= "E".equals(request.getParameter("category")) ? "active": "" %>">종료</button>
	        </div>
	        <c:if test="${sessionScope.userRole == 'ADMIN' }">
	        	<div class="btn-box">
	                <button type="button" onclick="location.href='/fitness/project/classWrite'">강의올리기</button>
	            </div>
	        </c:if>
	        <div class="class-contents sub-cont">
	        	<c:forEach var="board" items="${boardList}">
	        		<a href="javascript:fnBoardView('${board.boardNo}');" class="class-wrap ${board.eNameClass}">
		                <div class="class">
		                    <div class="front">이미지</div>
		                    <div class="back">
		                        <div>
		                            <h3 class="class-tit">${board.title}</h3>
		                            <div class="class-desc-wrap">
		                                <p class="class-desc"><span>시작 일시 : </span><span>${board.sDate}</span></p>
		                                <p class="class-desc"><span>종료 일시 : </span><span>${board.eDate}</span></p>
		                            </div>
		                        </div>
		                        <p class="btn-shape">신청하러가기</p>
		                    </div>
		                </div>
		            </a>
	        	</c:forEach>
	        </div>
	    </div>
	</div>
	<jsp:include page="./include/footer.jsp"></jsp:include>
</body>
</html>

<script>
	function fnCategory(type) {
		location.href="/fitness/project/class?category=" + type;
	}
	function fnBoardView(boardNo) {
		location.href="/fitness/project/classView?boardNo=" + boardNo;
	}
</script>