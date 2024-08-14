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
        <div class="sub-contents board-view-type">
            <div class="class-view">
                <div class="class-view-top">
                    <h3 class="tit">${boardView.title}</h3>
                    <div class="top-info">
                        <p class="name">${boardView.name}</p>
                        <p class="date">${boardView.cDate}</p>
                    </div>
                </div>
                <div class="class-view-middle">
                    <div class="middle-info">
                        <p class="hit">조회수 : ${boardView.hit}</p>
                    </div>
                    <div class="contents">
                        ${boardView.contents}
                    </div>
                </div>
                <div class="class-bottom">
                    <button type="button" onclick="history.back(-1)">목록으로</button>
                </div>
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