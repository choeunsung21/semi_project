<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
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
            <form action="/createEnd" method="post" class="submit-form" data-aos="fade-up" data-aos-delay="200">
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

                <div class="col-md-12">
                  <input type="password" class="form-control" name="user_pw" placeholder="비밀번호" required>
                </div>

                <div class="col-md-12">
                  <input type="password" class="form-control" name="check_user_pw" placeholder="비밀번호 확인" required>
                </div>

                <div class="col-md-12">
                  <input type="email" class="form-control" name="user_email" placeholder="이메일" required>
                </div>
				
				 <div class="col-md-12">
                  <input type="text" class="form-control" name="user_name" placeholder="이름"  required>
                </div>
                
                 <div class="col-md-12">
                  <input type="tel" class="form-control" name="user_phone" placeholder="전화번호" required>
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
                  <button type="submit">가입하기</button>
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
</body>
</html>