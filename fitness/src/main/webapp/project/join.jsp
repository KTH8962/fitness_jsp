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
	<div id="container" class="sub">
            <p class="blind">회원가입</p>
            <div class="sub-visual">
                <h2 class="sub-visual-tit">회원가입</h2>
            </div>
            <div class="member-contents">
                <div class="ip-ul">
                    <div class="tit-box">
                        <p class="tit">아이디</p>
                    </div>
                    <div class="bot-box">
                        <div class="ip-box ip-ico-box">
                            <input type="text" id="id" placeholder="아이디는 최소 5자이상 입력해주세요.">
                            <div class="btn-box type1">
                                <button type="button">중복체크</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ip-ul">
                    <div class="tit-box">
                        <p class="tit">비밀번호</p>
                    </div>
                    <div class="bot-box">
                        <div class="ip-box">
                            <input type="password" id="pwd" placeholder="비밀번호는 영문자+숫자 조합으로 8자 이상 입력해주세요.">
                        </div>
                    </div>
                </div>
                <div class="ip-ul">
                    <div class="tit-box">
                        <p class="tit">비밀번호 확인</p>
                    </div>
                    <div class="bot-box">
                        <div class="ip-box">
                            <input type="password" id="pwd_re" placeholder="비밀번호를 재입력해주세요.">
                        </div>
                    </div>
                </div>
                <div class="ip-ul">
                    <div class="tit-box">
                        <p class="tit">이름</p>
                    </div>
                    <div class="bot-box">
                        <div class="ip-box">
                            <input type="text" id="name" placeholder="이름을 입력해주세요.">
                        </div>
                    </div>
                </div>
                <div class="ip-ul">
                    <div class="tit-box">
                        <p class="tit">생년월일</p>
                    </div>
                    <div class="bot-box">
                        <div class="ip-box">
                            <input type="text" id="birth" placeholder="생일은 연월일 6자만 입력해주세요. ex) 900101">
                        </div>
                    </div>
                </div>
                <div class="ip-ul">
                    <div class="tit-box">
                        <p class="tit">전화번호</p>
                    </div>
                    <div class="bot-box">
                        <div class="ip-box">
                            <input type="text" id="phone" placeholder="전화번호는 -없이 숫자만 입력해주세요.">
                        </div>
                    </div>
                </div>
                <div class="ip-ul">
                    <div class="tit-box">
                        <p class="tit">이메일</p>
                    </div>
                    <div class="bot-box">
                        <div class="ip-box">
                            <input type="text" id="email" placeholder="이메일을 입력해주세요.">
                        </div>
                    </div>
                </div>
                <div class="ip-ul">
                    <div class="tit-box">
                        <p class="tit">회원분류</p>
                    </div>
                    <div class="bot-box">
                        <div class="flex gap20">
                            <div class="ip-ra-txt">
                                <input type="radio" name="memeber_chk" id="mem1" value="C"><label for="mem1">일반회원</label>
                            </div>
                            <div class="ip-ra-txt">
                                <input type="radio" name="memeber_chk" id="mem2" value="T"><label for="mem2">강사</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ip-ul">
                    <div class="tit-box">
                        <p class="tit">분야</p>
                    </div>
                    <div class="bot-box">
                        <div class="select-box">
                            <select name="field" id="field">
                                <option value="" hidden>분야를 선택해주세요</option>
                                <option value="health">헬스</option>
                                <option value="swimming">수영</option>
                                <option value="yoga">요가</option>
                                <option value="pilates">필라테스</option>
                                <option value="boxing">복싱</option>
                                <option value="golf">골프</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="btn-box">
                    <button type="button" class="btn-default btn-red" onclick="fnJoin();">회원가입</button>
                </div>
            </div>
        </div>
	<jsp:include page="./include/footer.jsp"></jsp:include>
</body>
</html>
<script>
	function fnJoin() {
		
	}
</script>