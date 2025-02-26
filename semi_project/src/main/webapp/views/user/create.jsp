<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Starter Page - OnePage Bootstrap Template</title>
  <meta name="description" content="">
  <meta name="keywords" content="">
  
  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  
   <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

 <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

 <!-- Main CSS File -->
  <link href="<%= request.getContextPath() %>/resources/css/include/common.css" rel="stylesheet" type="text/css">
<link href="<%= request.getContextPath() %>/resources/css/hjh.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body class="starter-page-page">
 <%@ include file="/views/include/header.jsp" %>
 <main class="main">
 <section id="starter-section" class="starter-section section">

      <div class="container" data-aos="fade-up">
        
        <div class="row gy-4">

        	<section id="contact" class="contact section">

      	  		<!-- Section Title -->
      	  		<div class="container section-title" data-aos="fade-up">
        			<h2>회원가입</h2>
        			<p></p>
      			</div><!-- End Section Title -->

      			<div class="container" data-aos="fade-up" data-aos-delay="100">

        			<div class="row gy-4">
						<form action="/createUser" method="post" class="submit-form" data-aos="fade-up" data-aos-delay="200">
             			 	<div class="row gy-4">
								
                				<div class="col-md-12">
                  					<input type="text" class="form-control" name="user_id" placeholder="아이디" required>
                				</div>
								
                				<div class="col-md-12">
                					 <input type="text" class="form-control" name="user_pw" placeholder="비밀번호" required>
                				</div>
                				<div class="col-md-12">
                					 <input type="text" class="form-control" name="user_pw" placeholder="비밀번호 확인" required>
                				</div>
                				
                				<div class="col-md-12">
                					 <input type="text" class="form-control" name="user_name" placeholder="이름" required>
                				</div>
                				
                				<div class="col-md-12">
                					 <input type="text" class="form-control" name="user_gender" placeholder="성별" required>
                				</div>
                				<div class="col-md-12">
                					 <input type="text" class="form-control" name="user_phone" placeholder="휴대폰 번호" required>
                				</div>
                				<div class="col-md-12">
                					 <input type="text" class="form-control" name="user_email" placeholder="이메일" required>
                				</div>
                				<div class="col-md-12">
                					 <input type="text" class="form-control" name="user_email" placeholder="선호지역" required>
                				</div>
		
								<!-- 필수정보가 다 입력되었으면 submit 할 수 있게 됨 -->
                				<div class="col-md-12 text-center">
                  					<button type="submit">회원가입</button>
                				</div>
	
              				</div>
            			</form>
          				

        			</div>
	
      			</div>
	
    		</section><!-- /Contact Section -->

        </div>
      </div>

    </section><!-- /Starter Section Section -->

  </main>

  <%@ include file="/views/include/footer.jsp" %>

  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>

  <!-- Main JS File -->
  <script src="/resources/js/common.js"></script>

</body>
 
 
 
 

</html>