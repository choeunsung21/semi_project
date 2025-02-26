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
  <title>플랜 상세 조회</title>
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
  <link href="<%= request.getContextPath() %>/resources/css/cjs.css" rel="stylesheet" type="text/css">

  <!-- =======================================================
  * Template Name: OnePage
  * Template URL: https://bootstrapmade.com/onepage-multipurpose-bootstrap-template/
  * Updated: Aug 07 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body class="portfolio-details-page">

  <%@ include file="/views/include/header.jsp" %>

  <main class="main">

    <!-- Portfolio Details Section -->
    <section id="portfolio-details" class="portfolio-details section">

      <div class="container" data-aos="fade-up">
        <div class="row justify-content-between gy-4 mt-4">
          <div class="col-lg-8" data-aos="fade-up">
            <div class="portfolio-description" style="display:flex;flex-direction: row;">
              <div class="col-lg-3" data-aos="fade-up" data-aos-delay="100" style="inline-block;">
            	<div class="portfolio-info">
                    <h3>Basic Info.</h3>
              		<ul>
               	 		<li><strong>구장 크기</strong> #37x20m</li>
                		<li><strong>수용 인원</strong> #40명</li>
                		<li><strong>실내/실외</strong> #실내</li>
                		<li><strong>잔디 타입</strong> #인공잔디</li>
              		</ul>
            	</div>
          	  </div>
          	  	
          	 <div class="col-lg-3" data-aos="fade-up" data-aos-delay="100" style="display:inline-block;">
            	<div class="portfolio-info">
                    <h3 style="visibility:hidden">Basic Info.</h3> 
              		<ul>                		
              			<li><strong>샤워실</strong> #O</li>
                		<li><strong>주차장</strong> #X</li>
                		<li><strong>풋살화 대여</strong> #4000원</li>
              		</ul>
            	</div>
          	  </div>
            </div>
          </div>
          <div class="col-lg-3" data-aos="fade-up" data-aos-delay="300">
            <div class="portfolio-info">
              <h3>#구장명</h3>
              <ul>
                <li><strong>Location </strong> #서울특별시 금천구 가산디지털2로 95 <span><strong>지도보기</strong></span></li>
                <li><strong>Date </strong> #01 March, 2020</li>
                <li><strong>Time </strong> #10:00 ~ 12:00</li>
                <li><strong>Price </strong> #200,000원</li>
                <li><strong>URL</strong> <a href="#">www.example.com</a></li>
                <li><a href="/deleteReservation" class="btn-visit align-self-start" onclick="return confirm('예약을 취소하시겠습니까?')">예약하기</a></li>
              </ul>
            </div>
          </div>

        </div>
        
      </div>

    </section><!-- /Portfolio Details Section -->

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