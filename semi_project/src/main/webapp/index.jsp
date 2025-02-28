<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>index.jsp</title>
  <meta name="description" content="">
  <meta name="keywords" content="">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link	href="https://fonts.googleapis.com" rel="preconnect">
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

</head>

<body class="index-page">
	<%@ include file="/views/include/header.jsp" %>

  	<main class="main">

    <!-- Hero Section -->
    <section id="hero" class="hero section">

      <img src="assets/img/hero-bg-abstract.jpg" alt="" data-aos="fade-in" class="">

      <div class="container">
        <div class="row gy-4 mt-5">
          <div class="col-md-6 col-lg-3" data-aos="zoom-out" data-aos-delay="100">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-easel"></i></div>
              <h4 class="title"><a href="/starter-page.jsp">예약 가능한 구장</a></h4>
              <p class="description">Fields available for reservation</p>
            </div>
          </div><!--End Icon Box -->

          <div class="col-md-6 col-lg-3" data-aos="zoom-out" data-aos-delay="200">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-gem"></i></div>
              <h4 class="title"><a href="/service-details.jsp">가입 가능한 팀</a></h4>
              <p class="description">Teams you can join</p>
            </div>
          </div><!--End Icon Box -->

          <div class="col-md-6 col-lg-3" data-aos="zoom-out" data-aos-delay="300">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-geo-alt"></i></div>
              <h4 class="title"><a href="/portfolio-details.jsp">자유게시판</a></h4>
              <p class="description">Bulletin board</p>
            </div>
          </div><!--End Icon Box -->
 
          <div class="col-md-6 col-lg-3" data-aos="zoom-out" data-aos-delay="400">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-command"></i></div>
              <h4 class="title"><a href="/index-backup.jsp"><img src="/resources/img/dung.png"/></a></h4>
              <!--
              <p class="description">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis</p>
              -->
            </div>
          </div><!--End Icon Box -->
          
        </div>
        
        <!-- `예약 가능한 구장` 탭을 누르면 보이는 화면 : Ajax로 해당 화면에 바로 구성 -->
        <div class="row justify-content-center" data-aos="zoom-out" style="margin-top:50px;">
        	<div class="col-xl-7 col-lg-9 text-center">
         		<h1>예약 가능한 구장 목록</h1>
            	<p>We are team of talented designers making websites with Bootstrap</p>
        	</div>
        </div>
        
        <div class="text-center" data-aos="zoom-out" data-aos-delay="100">
        	<a href="#about" class="btn-get-started">Get Started</a>
        </div>
        
        <!-- `가입 가능한 팀` 탭을 누르면 보이는 화면 : Ajax로 해당 화면에 바로 구성 -->
        <div class="row justify-content-center" data-aos="zoom-out" style="margin-top:50px;">
        	<div class="col-xl-7 col-lg-9 text-center">
         		<h1>가입 가능한 팀</h1>
            	<p>We are team of talented designers making websites with Bootstrap</p>
        	</div>
        </div>
        
        <div class="text-center" data-aos="zoom-out" data-aos-delay="100">
        	<a href="#about" class="btn-get-started">Get Started</a>
        </div>
        
        <!-- `자유게시판` 탭을 누르면 보이는 화면 : Ajax로 해당 화면에 바로 구성 -->
        <div class="row justify-content-center" data-aos="zoom-out" style="margin-top:50px;">
        	<div class="col-xl-7 col-lg-9 text-center">
         		<h1>자유게시판</h1>
            	<p>We are team of talented designers making websites with Bootstrap</p>
        	</div>
        </div>
        
        <div class="text-center" data-aos="zoom-out" data-aos-delay="100">
        	<a href="/views/api/jusoSample.jsp" class="btn-get-started">Get Started</a>
        </div>
        
      </div>
    </section><!-- /Hero Section -->

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