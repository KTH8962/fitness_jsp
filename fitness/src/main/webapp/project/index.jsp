<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="./include/headlink.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="./include/header.jsp"></jsp:include>
	<div id="container" class="main">
            <p class="blind">메인</p>
            <div class="main-contents">
                <h2 class="main-tit">강의목록</h2>
                <div class="class-contents main-cont">
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
                </div>
            </div>
            <div class="main-visual"><p>메인 비쥬얼</p></div>
        </div> 
	<jsp:include page="./include/footer.jsp"></jsp:include>
</body>
</html>