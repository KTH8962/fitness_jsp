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
	    <div class="sub-contents">
	        <div class="tab-default">
	            <button type="button">전체보기</button>
	            <button type="button">개설예정</button>
	            <button type="button">진행중</button>
	            <button type="button">종료</button>
	        </div>
	        <div class="class-contents sub-cont">
	        	<c:forEach var="row" items="${boardList}">
	        		<a href="javascript:void('${row.boardNo}');" class="class-wrap ${row.eNameClass}">
		                <div class="class">
		                    <div class="front">이미지</div>
		                    <div class="back">
		                        <div>
		                            <h3 class="class-tit">${row.title}</h3>
		                            <div class="class-desc-wrap">
		                                <p class="class-desc"><span>시작 일시 : </span><span>${row.sDate}</span></p>
		                                <p class="class-desc"><span>종료 일시 : </span><span>${row.eDate}</span></p>
		                            </div>
		                        </div>
		                        <p class="btn-shape">신청하러가기</p>
		                    </div>
		                </div>
		            </a>
	        	</c:forEach>
	        </div>
	        <div class="class-contents sub-cont">
	            <a href="javascript:void(0);" class="class-wrap health">
	                <div class="class">
	                    <div class="front">이미지</div>
	                    <div class="back">
	                        <div>
	                            <h3 class="class-tit">헬스</h3>
	                            <div class="class-desc-wrap">
	                                <p class="class-desc"><span>시작 일시 : </span><span>2024-08-09 18:00:00</span></p>
	                                <p class="class-desc"><span>종료 일시 : </span><span>2024-09-16 19:00:00</span></p>
	                            </div>
	                        </div>
	                        <p class="btn-shape">신청하러가기</p>
	                    </div>
	                </div>
	            </a>
	            <a href="javascript:void(0);" class="class-wrap swimming">
	                <div class="class">
	                    <div class="front">이미지</div>
	                    <div class="back">
	                        <div>
	                            <h3 class="class-tit">수영</h3>
	                            <div class="class-desc-wrap">
	                                <p class="class-desc"><span>시작 일시 : </span><span>2024-08-09 18:00:00</span></p>
	                                <p class="class-desc"><span>종료 일시 : </span><span>2024-09-16 19:00:00</span></p>
	                            </div>
	                        </div>
	                        <p class="btn-shape">신청하러가기</p>
	                    </div>
	                </div>
	            </a>
	            <a href="javascript:void(0);" class="class-wrap yoga">
	                <div class="class">
	                    <div class="front">이미지</div>
	                    <div class="back">
	                        <div>
	                            <h3 class="class-tit">요가</h3>
	                            <div class="class-desc-wrap">
	                                <p class="class-desc"><span>시작 일시 : </span><span>2024-08-09 18:00:00</span></p>
	                                <p class="class-desc"><span>종료 일시 : </span><span>2024-09-16 19:00:00</span></p>
	                            </div>
	                        </div>
	                        <p class="btn-shape">신청하러가기</p>
	                    </div>
	                </div>
	            </a>
	            <a href="javascript:void(0);" class="class-wrap pilates">
	                <div class="class">
	                    <div class="front">이미지</div>
	                    <div class="back">
	                        <div>
	                            <h3 class="class-tit">필라테스</h3>
	                            <div class="class-desc-wrap">
	                                <p class="class-desc"><span>시작 일시 : </span><span>2024-08-09 18:00:00</span></p>
	                                <p class="class-desc"><span>종료 일시 : </span><span>2024-09-16 19:00:00</span></p>
	                            </div>
	                        </div>
	                        <p class="btn-shape">신청하러가기</p>
	                    </div>
	                </div>
	            </a>
	            <a href="javascript:void(0);" class="class-wrap boxing">
	                <div class="class">
	                    <div class="front">이미지</div>
	                    <div class="back">
	                        <div>
	                            <h3 class="class-tit">복싱</h3>
	                            <div class="class-desc-wrap">
	                                <p class="class-desc"><span>시작 일시 : </span><span>2024-08-09 18:00:00</span></p>
	                                <p class="class-desc"><span>종료 일시 : </span><span>2024-09-16 19:00:00</span></p>
	                            </div>
	                        </div>
	                        <p class="btn-shape">신청하러가기</p>
	                    </div>
	                </div>
	            </a>
	            <a href="javascript:void(0);" class="class-wrap golf">
	                <div class="class">
	                    <div class="front">이미지</div>
	                    <div class="back">
	                        <div>
	                            <h3 class="class-tit">골프</h3>
	                            <div class="class-desc-wrap">
	                                <p class="class-desc"><span>시작 일시 : </span><span>2024-08-09 18:00:00</span></p>
	                                <p class="class-desc"><span>종료 일시 : </span><span>2024-09-16 19:00:00</span></p>
	                            </div>
	                        </div>
	                        <p class="btn-shape">신청하러가기</p>
	                    </div>
	                </div>
	            </a>
	        </div>
	    </div>
	</div>
	<jsp:include page="./include/footer.jsp"></jsp:include>
</body>
</html>