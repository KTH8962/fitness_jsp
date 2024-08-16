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
	<div id="container" class="main">
        <p class="blind">메인</p>
        <div class="main-visual"><p>메인 비쥬얼</p></div>
        <div class="main-contents">
            <h2 class="main-tit">강의목록</h2>
            <div class="slider-wrap">
             <div class="class-contents main-cont">
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
             <div class="arrow-box">
                    <span class="arrow prev">이전 버튼</span>
                    <span class="arrow next">다음 버튼</span>
                </div>
            </div>
        </div>
    </div> 
	<jsp:include page="./include/footer.jsp"></jsp:include>
</body>
</html>

<script>
	window.onload = () => {
	    const {sliderWrap, slider, sliderCnt, prevBtn, nextBtn} = {
	        sliderWrap : document.querySelector(".main-cont"),
	        slider : document.querySelector(".class-wrap"),
	        sliderCnt : document.querySelectorAll(".class-wrap"),
	        prevBtn : document.querySelector(".arrow.prev"),
	        nextBtn : document.querySelector(".arrow.next")            
	    };
	    let styleWrap = window.getComputedStyle(sliderWrap);
	    let styleSlider = window.getComputedStyle(slider);
	    let cnt = 0;
	    let maxCnt = sliderCnt.length - 4;
	
	    let gapSize = parseInt(styleWrap.getPropertyValue("gap"));
	    let sliderSize = parseInt(styleSlider.getPropertyValue("width"));
	    let movingSize = gapSize + sliderSize;
	
	    prevBtn.onclick = () => {
	        cnt -= 1;
	        if(cnt < 0) cnt = 0;
	        movingSlider(sliderWrap, movingSize, cnt);
	    }
	
	    nextBtn.onclick = () => {
	        cnt += 1;
	        if (cnt > maxCnt) cnt = maxCnt;
	        movingSlider(sliderWrap, movingSize, cnt);
	    }
	}
	
	function movingSlider (sliderwrap, movingSize, cnt) {
	    sliderwrap.style.transform = "translateX(" + (-movingSize*cnt) +"px)";
	}
	function fnBoardView(boardNo) {
		location.href="/fitness/project/classView?boardNo=" + boardNo;
	}
</script>