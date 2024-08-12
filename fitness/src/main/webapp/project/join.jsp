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
            	<form action="" method="post" name="join">
	                <div class="ip-ul">
	                    <div class="tit-box">
	                        <p class="tit">아이디</p>
	                    </div>
	                    <div class="bot-box">
	                        <div class="ip-box ip-ico-box">
	                            <input type="text" id="id" value="tea3" name="userId" placeholder="아이디는 최소 5자이상 입력해주세요.">
	                            <div class="btn-box type1">
	                                <button type="button" onclick="idCheck()">중복체크</button>
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
	                            <input type="password" id="pwd" value="test1234" placeholder="비밀번호는 영문자+숫자 조합으로 8자 이상 입력해주세요.">
	                        </div>
	                    </div>
	                </div>
	                <div class="ip-ul">
	                    <div class="tit-box">
	                        <p class="tit">비밀번호 확인</p>
	                    </div>
	                    <div class="bot-box">
	                        <div class="ip-box">
	                            <input type="password" id="pwd_re" value="test1234" placeholder="비밀번호를 재입력해주세요.">
	                        </div>
	                    </div>
	                </div>
	                <div class="ip-ul">
	                    <div class="tit-box">
	                        <p class="tit">이름</p>
	                    </div>
	                    <div class="bot-box">
	                        <div class="ip-box">
	                            <input type="text" id="name" value="김이름" placeholder="이름을 입력해주세요.">
	                        </div>
	                    </div>
	                </div>
	                <div class="ip-ul">
	                    <div class="tit-box">
	                        <p class="tit">생년월일</p>
	                    </div>
	                    <div class="bot-box">
	                        <div class="ip-box">
	                            <input type="date" id="birth" placeholder="생일은 연월일 6자만 입력해주세요. ex) 900101">
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
	                                <input type="radio" name="memeber_chk" id="mem1" value="MEMBER" checked onchange="fnChange('MEMBER')"><label for="mem1">일반회원</label>
	                            </div>
	                            <div class="ip-ra-txt">
	                                <input type="radio" name="memeber_chk" id="mem2" value="TEACHER" onchange="fnChange('TEACHER')"><label for="mem2">강사</label>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="ip-ul fieldCheck" style="display:none;">
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
            	</form>
            </div>
        </div>
	<jsp:include page="./include/footer.jsp"></jsp:include>
</body>
</html>
<script>
	function fnChange(type) {
		var memeber = document.getElementsByName("memeber_chk");
		var fieldCheck = document.querySelector(".fieldCheck");
	    for(const radio of memeber) {
	        if(radio.checked) {
	            if(radio.value == "MEMBER") {
	            	fieldCheck.style.display = "none";
	            } else {
	            	fieldCheck.style.display = "block";
	            }
	        }
	    }
	}

	function idCheck() {
		var join = document.join;
		window.open("join_idCheck.jsp?userId=" + join.userId.value, "reset", "width=500, height=500");
	}

	function fnJoin(){
	    
	    var check1 = /^[a-zA-Z0-9]{4,12}$/; // 아이디 정규식
	    var check2 = /^[a-zA-Z0-9]{6,10}$/; // 패스워드 정규식
	    var check3 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	    // 이메일이 적합한지 검사할 정규식
	    var check4 = /[0-9]/;
	    var check5 = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/
	
	    var id = document.getElementById('id');
	    var pwd = document.getElementById('pwd');
	    var pwd_re = document.getElementById('pwd_re');
	    var name = document.getElementById('name');
	    var birth = document.getElementById('birth');
	    var email = document.getElementById('email');
	    var tel = document.getElementById('tel');
	    var field = document.getElementById('field');
	    var memeber = document.getElementsByName('memeber_chk');
	    
	    /* 아이디 */
	    if(id.value == "") {
	        window.alert('아이디를 입력해주세요');
	        id.focus();
	        return false;
	    } else if(!compare(check1,id,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력해주세요.")){
	        return false;
	    }
	    
	    /* 비밀번호 */
	    if(!compare(check2,pwd,"비밀번호는 영문, 숫자조합 6~10자 내외로 해주세요.")){
	        return false;
	    }else if(!compare(check2,pwd_re,"비밀번호는 영문, 숫자조합 6~10자 내외로 해주세요.")){
	        return false;
	    }else if(pwd.value != pwd_re.value){
	        window.alert('비밀번호가 일치하지 않습니다.');
	        //pwd.value = "";
	        document.pwd.focus();
	        return false;
	    }
	    
	    /* 이름 */
	    if(name.value == ""){
	        window.alert('이름을 입력해주세요.');
	        name.focus();
	        return false;
	    }
	    
	    /* 생년월일 */
	    if(birth.value.length == ""){
	        window.alert('생년월일 입력해주세요.');
	        //year.value = "";
	        birth.focus();
	        return false;
	    }			
	    
	    /* 전화번호 */
	    if(!compare(check4, tel,"전화번호는 숫자만 작성해주세요.")){
	        return false;
	    }
	    
	    /* 이메일 */
	    if(!compare(check3, email,"적합하지 않은 이메일 형식입니다")){
	        return false;
	    }	
	    
	    /* 권한 */	    
	    for(const radio of memeber) {
	        if(radio.checked) {
	            if(radio.value == "TEACHER") {
	            	if(!compare(check5, field, "강사가입은 분야를 선택해주세요.")){
	        	        return false;
	        	    }
	            }
	        }
	    }
	    
	}

	function compare(check, form, message) {
	    if(check.test(form.value)) {
	        return true;
	    }
	    alert(message);
	    //form.value = "";
	    form.focus();
	    return false;
	}
  
</script>