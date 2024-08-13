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
	<p class="blind">지점찾기</p>
    <div class="sub-visual">
        <h2 class="sub-visual-tit">지점찾기</h2>
    </div>
    <div class="location-contents">
        <h3 class="sub-tit">지점 안내</h3>
        <!-- * 카카오맵 - 지도퍼가기 -->
        <!-- 1. 지도 노드 -->
        <div class="location-wrap">
            <div id="daumRoughmapContainer1723338915566" class="root_daum_roughmap root_daum_roughmap_landing"></div>                    
        </div>

        <!--
            2. 설치 스크립트
            * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
        -->
        <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

        <!-- 3. 실행 스크립트 -->
        <script charset="UTF-8">
            new daum.roughmap.Lander({
                "timestamp" : "1723338915566",
                "key" : "2kbcf",
                "mapWidth" : "100%",
                "mapHeight" : "360"
            }).render();
        </script>
    </div>
	<jsp:include page="./include/footer.jsp"></jsp:include>
</body>
</html>