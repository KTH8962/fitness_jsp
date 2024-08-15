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
        	<form action="classWrite" method="post" name="boardWrite">
        		<c:if test="${not empty param.boardNo}">
	        		<input type="hidden" name="boardNo" value="${param.boardNo}">
        		</c:if>
           		<div class="class-write">
                    <h3 class="sub-tit">강의 등록</h3>
                    <div class="ip-ul">
                        <div class="tit-box">
                            <p class="tit">강의 제목</p>
                        </div>
                        <div class="bot-box">
                            <div class="ip-box">
                                <input type="text" name="title" value="${writeList.title}" placeholder="강의제목을 입력해주세요.">
                            </div>
                        </div>
                    </div>
                    <div class="ip-ul">
                        <div class="tit-box">
                            <p class="tit">강사 선택</p>
                        </div>
                        <div class="bot-box">
                            <div class="select-box">
                                <select name="instructorId">
                                    <option value="" hidden>강사를 선택해주세요</option>
                                    <c:forEach var="instructor" items="${instructorList}">
                                    	<option value="${instructor.temp}" <c:if test="${instructor.temp == writeList.instructorId}">selected</c:if>>${instructor.temp2}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="ip-ul">
                        <div class="tit-box">
                            <p class="tit">강의 선택</p>
                        </div>
                        <div class="bot-box">
                            <div class="select-box">
                                <select name="programNo">
                                    <option value="" hidden>강의를 선택해주세요</option>
                                    <c:forEach var="program" items="${programList}">
                                    	<option value="${program.temp}" <c:if test="${program.temp == writeList.programNo}">selected</c:if>>${program.temp2}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="ip-ul">
                        <div class="tit-box">
                            <p class="tit">강의실 선택</p>
                        </div>
                        <div class="bot-box">
                            <div class="select-box">
                                <select name="roomNo">
                                    <option value="" hidden>강의실을 선택해주세요</option>
                                    <c:forEach var="room" items="${roomList}">
                                    	<option value="${room.temp}" <c:if test="${room.temp == writeList.roomNo}">selected</c:if>>${room.temp2}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="ip-ul">
                        <div class="tit-box">
                            <p class="tit">수강 인원</p>
                        </div>
                        <div class="bot-box">
                            <div class="ip-box">
                                <input type="text" name="classNum" value="${writeList.classNum}" placeholder="수강인원을 입력해주세요.">
                            </div>
                        </div>
                    </div>
                    <div class="ip-ul">
                        <div class="tit-box">
                            <p class="tit">시작일 - 종료일</p>
                        </div>
                        <div class="bot-box">
                            <div class="flex gap20">
                                <div class="ip-box">
                                    <input type="datetime-local" name="sDate" value="${writeList.sDate}">
                                </div>
                                <div class="ip-box">
                                    <input type="datetime-local" name="eDate" value="${writeList.eDate}">
                                </div>
                            </div>
                        </div>
                    </div>                  
                    <div class="ip-ul">
                        <div class="tit-box">
                            <p class="tit">내용</p>
                        </div>
                        <div class="bot-box">
                            <div class="text-box">
                                <textarea name="contents" placeholder="내용을 입력해주세요">${writeList.contents}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="class-bottom">
                        <div class="btn-box">
                        	<c:choose>
                        		<c:when test="${not empty param.boardNo}">
                        			<button type="submit">수정하기</button>
                        		</c:when>
                        		<c:otherwise>
                        			<button type="button" onclick="fnSubmit()">등록하기</button>
                        		</c:otherwise>
                        	</c:choose>                        	
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
	<jsp:include page="./include/footer.jsp"></jsp:include>
</body>
</html>

<script>
	function fnSubmit() {
		var form = document.boardWrite;
		var title = form.title;
		var instructorId = form.instructorId;
		var programNo = form.programNo;
		var roomNo = form.roomNo;
		var classNum = form.classNum;
		var sDate = form.sDate;
		var eDate = form.eDate;
		var contents = form.contents;
		
		/* 오늘 날짜 체크용 */
		var time = new Date();
		var year = time.getFullYear();
		var month = String(time.getMonth()+1).padStart(2, "0");
		var day = String(time.getDate()).padStart(2, "0");
		var today = year + "-" + month + "-" + day + "T23:59";
		
		if(compare(title, "제목을 입력해주세요.")){
			return false;
		} else if (compare(instructorId, "강사를 선택해주세요.")) {
			return false;
		} else if (compare(programNo, "강의를 선택해주세요.")) {
			return false;
		} else if (compare(roomNo, "강의실을 선택해주세요.")) {
			return false;
		} else if (compare(classNum, "인원을 입력해주세요.")) {
			return false;
		} else if (compare(sDate, "시작일을 입력해주세요.")) {
			return false;
		} else if (compare(eDate, "종료일을 입력해주세요.")) {
			return false;
		} else if (today > sDate.value) {
			alert("시작일은 오늘 일자보다 늦은 일자 및 시간으로 선택해주세요");
			return false;
		} else if (sDate.value >= eDate.value) {
			alert("시작일은 종료일 보다 빠른 일자로 선택해주세요");
			return false;
		} else if (compare(contents, "내용을 입력해주세요.")) {
			return false;
		} else {
			form.submit();
		}
	}
	
	function compare(form, message) {
		if(form.value == "" || form.value == undefined) {
			alert(message);
			form.focus();
			return true;
		}
		return false;
	}
</script>