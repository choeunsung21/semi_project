<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>회원가입 - OnePage Bootstrap Template</title>

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <!-- 뭔가 문제 생기면 밑에 이거 추가해 주자 맨 끝에 붙히면 됨 crossorigin -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="<%= request.getContextPath() %>/resources/css/include/common.css" rel="stylesheet">
  <!-- 버튼 CSS 지울수도 있음-->
  <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@500&display=swap" rel="stylesheet">
</head>

<body class="register-page">
  <%@ include file="/views/include/header.jsp" %>

  <main class="main">
  

    <!-- 회원가입 섹션 -->
    <section id="register-section" class="register-section section">
      <div class="container" data-aos="fade-up">
        
        <div class="row justify-content-center">
          <div class="col-lg-6">
            
            <!-- 섹션 제목 -->
            <div class="section-title text-center" data-aos="fade-up">
              <h2>회원가입</h2>
              <p>계정 생성</p>
            </div>

            <!-- 회원가입 폼 -->
            <form name="check_id_form" action="/createEnd" method="post" class="submit-form" data-aos="fade-up" data-aos-delay="200">
              <div class="row gy-4">
              
              <div class="col-md-12">
      			<label>회원 분류</label>
      			<div class="d-flex justify-content-start">
        		<div class="form-check me-3">
          		<input class="form-check-input" type="radio" name="user_type" value="0" id="zero" required>
          		<label class="form-check-label" for="zero">개인</label>
        		</div>
        		<div class="form-check">
          		<input class="form-check-input" type="radio" name="user_type" value="1" id="one" required>
          		<label class="form-check-label" for="one">업체</label>
        		</div>
      			</div>
    			</div>
             
                <div class="col-md-12">
                  <input type="text" class="form-control" name="user_id" placeholder="아이디" required>
                </div>
				<div>
					<input type="button" value="중복 확인" onclick="checkId();"> 
				</div>
				
                <div class="col-md-12 d-flex align-items-center">
                  <input type="password" id="userPw" class="form-control" name="user_pw" placeholder="비밀번호" required>
                	<button type="button" id="togglePassword1" class="btn btn-outline-secondary ms-2" 
          			style="border: none; background: transparent;">
    				👁️
  					</button>
  					</div>
  					<div>
                	<p style="font-size: 14px; margin-top: 5px; color: rgb(105, 105, 105);">비밀번호는 길이 8자 이상, 영문자,숫자,특수문자가 최소 하나씩은 포함되어야 합니다.</p>
               		<p id="pwMsg2" style="font-size: 14px; margin-top: 5px; color: rgb(105, 105, 105);"></p>
               		</div>
               	              	

                <div class="col-md-12 d-flex align-items-center">
                  <input type="password" id="checkUserPw" class="form-control" name="check_user_pw" placeholder="비밀번호 확인" required>
                	<button type="button" id="togglePassword2" class="btn btn-outline-secondary ms-2" 
          			style="border: none; background: transparent;">
    				👁️
  					</button>
                </div>
                <div>
                	<p id="pwMsg" style="font-size: 12px; margin-top: 5px; color: rgb(105, 105, 105);"></p>
              	</div> 
                <div class="col-md-12">
                  <input type="email" class="form-control" name="user_email" placeholder="이메일" required>
                </div>
				
				 <div class="col-md-12">
                  <input type="text" class="form-control" name="user_name" placeholder="이름"  required>
                </div>
                
                 <div class="col-md-12">
                  <input type="tel" id="userPhon" class="form-control" name="user_phone" placeholder="전화번호" required>
                	<p id="phoneMsg" style="font-size: 14px; margin-top: 5px; color: rgb(105, 105, 105);"></p>
                </div>
    			<div class="col-md-12">
      			<label>성별</label>
      			<div class="d-flex justify-content-start">
        		<div class="form-check me-3">
          		<input class="form-check-input" type="radio" name="user_gender" value="남" id="male" required>
          		<label class="form-check-label" for="male">남성</label>
        		</div>
        		<div class="form-check">
          		<input class="form-check-input" type="radio" name="user_gender" value="여" id="female" required>
          		<label class="form-check-label" for="female">여성</label>
        		</div>
      			</div>
    			</div>
                <div class="col-md-12 text-center">
                  <button id="joinMembership"type="button">가입하기</button>
                  <p style="padding-top: 15px;">이미 계정이 있으신가요? <a href="/login">로그인</a></p>
                </div>

              </div>
          	</form>

          </div>
        </div>
      </div>
    </section>
  </main>

  <%@ include file="/views/include/footer.jsp" %>

  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center">
    <i class="bi bi-arrow-up-short"></i>
  </a>
	
  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>

  <!-- Main JS File -->
  <script src="/resources/js/common.js"></script>
  
  <!-- 아이디 중복 확인 검사 로직, 겁내 오래 걸려서 만든 것이니 절대 건들지 말것-->
  <script> 
  const checkId = function() {
    const userId = document.querySelector('input[name="user_id"]').value;
    
    if (!userId) {
        alert("아이디를 입력하세요.");
        return;
    }

    $.ajax({
        url: "/checkIdServlet",
        type: "post",
        data: { "user_id": userId },
        dataType: "json",
        success: function(data) {
            console.log("서버 응답:", data);
            alert(data.res_msg);
        },
        error: function(xhr, status, error) {
            console.error("AJAX 오류:", error);
            alert("서버 요청 중 문제가 발생했습니다.");
        }
    });
};
</script> 
	<script>
	let true_false = "";
	
 	<!--비밀번호 중복 확인 keyup으로 바꿔야함 -->
 	document.getElementById("userPw").addEventListener("keyup",checkPw);
 	document.getElementById("checkUserPw").addEventListener("keyup",checkPw);
 	function checkPw(){
		const p = document.getElementById("userPw").value.trim();
		const p_c = document.getElementById("checkUserPw").value.trim();
		const p_m = document.getElementById("pwMsg");
		
		if(p_c === ""){
			p_m.textContent = "";
			
		}
		
		if(p === p_c){
			p_m.textContent = "비밀번호가 일치합니다.";
			p_m.style.color = "green";
			true_false = true;
		}else{
			p_m.textContent = "비밀번호가 일치하지 않습니다."
			p_m.style.color = "red";
			true_false = false;
		}
	}
	
	<!-- 비밀번호 정규식 keyup으로 바꿔야 함-->
	document.getElementById("userPw").addEventListener("keyup",regular_pw);
	function regular_pw(){
		const pw_value = document.getElementById("userPw").value.trim();
		const pw_check = document.getElementById("pwMsg2");
		const en = /[A-Za-z]/; <!--영문자 최소 1개 이상-->
		const num = /\d/; <!--숫자 최소 1개 이상-->
		const at = /[@$!%*?&]/; <!--특수문자 최소 1개 이상-->
		const lang = /^[A-Za-z\d@$!%*?&]{8,16}$/; <!--총 8자 이상, 16자 이하--> 
		
		if(!en.test(pw_value)){
			pw_check.textContent = "비밀번호는 최소 1개 이상의 영문자가 포함되어야 합니다."
			pw_check.style.color = "red";
			true_false = false;
		}else if(!num.test(pw_value)){
			pw_check.textContent = "비밀번호는 최소 1개 이상의 숫자가 포함되어야 합니다."
			pw_check.style.color = "red";
			true_false = false;
		}else if(!at.test(pw_value)){
			pw_check.textContent = "비밀번호는 최소 1개 이상의 특수문자가 포함되어야 합니다."
			pw_check.style.color = "red";
			true_false = false;
		}else if(!lang.test(pw_value)){
			pw_check.textContent = "비밀번호는 최소 8자 이상, 최대 16자 이하로 작성하셔야 합니다."
			pw_check.style.color = "red";
			true_false = false;
		}else{
			pw_check.textContent = "사용 가능한 비밀번호 입니다."
			pw_check.style.color = "green";
			true_false = true;
		}
	
	}
	<!--전화번호 정규식  keyup으로 바꿔야 함-->
	document.getElementById("userPhon").addEventListener("keyup",phoneCheck);
	function phoneCheck(){
		const phone = document.getElementById("userPhon").value.trim();
		const checkP = document.getElementById("phoneMsg");
		const check_p_r =/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		
		if(!check_p_r.test(phone)){
			checkP.textContent = "올바른 전화번호 형식을 입력하세요. \n ex : 숫자와 - 만 입력해주세요."
			checkP.style.color = "red";
			true_false = false;
		}else{
			checkP.textContent = "확인 완료"
			checkP.style.color = "green";
			true_false = true;
		}	
	}	
	<!-- 비밀번호 버튼 누르면 보이기 -->
	document.getElementById("togglePassword1").addEventListener("click",function(){
		const pw_eye = document.getElementById("userPw");
		pw_eye.type = pw_eye.type === "password" ? "text" : "password";
	})
	document.getElementById("togglePassword2").addEventListener("click",function(){
		const pw_eye = document.getElementById("checkUserPw");
		pw_eye.type = pw_eye.type === "password" ? "text" : "password";
	})	
	
	<!--회원가입 정상적으로 동작하기. -->
	document.getElementById("joinMembership").addEventListener("click",function(event){
		const form = document.querySelector("form[name='check_id_form']");
		
		if(!true_false){
		alert("모든 입력란에 양식이 알맞지 않으면 회원가입이 불가능합니다.")
		return;
		}
		
		<!--checkValidity() 체크항목들 확인하는 메서드 -->
		if(!form.checkValidity()){
			alert("입력되지 않은 항목이 있습니다.");
			return;
		}
		
		alert("회원가입이 성공적으로 이루어졌습니다.");
		setTimeout(function() {
            form.submit();
            window.location.href = "index.jsp";
        }, 5); 
	})
  </script>
</body>
</html>