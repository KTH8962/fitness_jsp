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
                    <div class="class-cnt-wrap">
                        <div class="class-info">
                            <p class="tit">수강인원</p>
                            <span <c:if test="${boardView.cNumCnt == boardView.cNum}">class="full"</c:if>>${boardView.cNumCnt}</span> / <span>${boardView.cNum}</span>
                        </div>
                        <div class="btn-box">
                        	<c:choose>
                        		<c:when test="${btnView != null}">
                        			<button type="button" onclick="fnCancel('${param.boardNo}', '${sessionScope.userId}')">취소하기</button>
                        		</c:when>
                        		<c:otherwise>
                        			<c:if test="${boardView.cNumCnt != boardView.cNum}">
	                        			<button type="button" onclick="fnEnroll('${param.boardNo}', '${sessionScope.userId}')">신청하기</button>
                        			</c:if>
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                    </div>
                </div>
                <div class="class-bottom">
                    <div class="btn-box">
                    	<button type="button" onclick="location.href='${pageContext.request.contextPath}/project/class'">목록으로</button>
                    	<c:if test="${sessionScope.userRole == 'ADMIN' }">
		                    <button type="button" onclick="fnModify('${param.boardNo}')">수정하기</button>
		                    <button type="button" onclick="fnDelete('${param.boardNo}')">삭제하기</button>
                    	</c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<jsp:include page="./include/footer.jsp"></jsp:include>
</body>
</html>

<script>
	function fnModify(boardNo) {
		location.href="/fitness/project/classWrite?boardNo=" + boardNo;
	}
	function fnEnroll(boardNo, userId) {
		if (userId == "" || userId == undefined) {
			alert("로그인 후 신청 가능합니다.");
		} else {
			if(confirm("등록 하시겠습니까?")) {
				location.href = "${pageContext.request.contextPath}/project/classView?boardNo=" + boardNo + "&action=enroll";
			}
		}
	}
	function fnCancel(boardNo, userId) {
		if(confirm("취소 하시겠습니까?")) {
			location.href = "${pageContext.request.contextPath}/project/classView?boardNo=" + boardNo + "&action=cancel";
		}
	}
	function fnDelete(boardNo) {
		if(confirm("삭제하시겠습니까?")) {
			location.href = "${pageContext.request.contextPath}/project/classView?boardNo=" + boardNo + "&action=delete";
			alert("삭제되었습니다.");
			location.href = "${pageContext.request.contextPath}/project/class";
		}
	}
	<c:if test="${not empty requestScope.message}">
	    var message = "<c:out value='${requestScope.message}' />";
	    alert(message);
	    location.href = "${pageContext.request.contextPath}/project/classView?boardNo=" + ${param.boardNo};
	</c:if>
</script>

<%-- <c:if test="${not empty requestScope.message}">
	<script>
	var message = "<c:out value='${requestScope.message}' />";
    alert(message);
	</script>
</c:if> --%>