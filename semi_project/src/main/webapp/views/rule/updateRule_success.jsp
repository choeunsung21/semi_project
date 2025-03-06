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
  <title>규칙 수정 성공</title>
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

  <script src="<%= request.getContextPath() %>/resources/js/jquery-3.7.1.js"></script>

  <!-- =======================================================
  * Template Name: OnePage
  * Template URL: https://bootstrapmade.com/onepage-multipurpose-bootstrap-template/
  * Updated: Aug 07 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body class="starter-page-page">

  <%@ include file="/views/include/header.jsp" %>

  <main class="main">

	<section id="about-alt" class="about-alt section">

      <div class="container" style="text-align:center">

        <div class="row gy-4" style="text-align:center">
        <div class="col-lg-4 content">
        </div>
          <div class="col-lg-4 content" data-aos="fade-up" data-aos-delay="200">
            <h3 style="color:blue;">규칙 수정 성공!</h3>
            <p class="fst-italic">
              이제 수정된 규칙에 의해 일정이 등록됩니다.
            </p>
            <ul id="field-success-ul">
              <li><i class="bi bi-check2-all"></i> <a href="/">메인화면으로 이동하기</a></li>
              <li></li>
              <li></li>
              <li><i class="bi bi-check2-all"></i> <a href="/selectRegisteredFieldList">등록한 구장 목록으로 이동하기</a></li>
              <li></li>
              <li></li>
              <li><i class="bi bi-check2-all"></i> <a href="/selectRegisteredPlanList">등록한 일정 목록으로 이동하기</a></li>
              <li><i class="bi bi-check2-all"></i> <a href="/selectRegisteredRuleList">등록한 규칙 목록으로 이동하기</a></li>
              <li>
              	<p>
       				* 주의사항<br>
       				1. 입력하신 규칙에 따라 2주 후의 일정이 등록됩니다.<br>
           			2. 등록 기준 시각은 매일 오전 5시입니다.<br>
           			3. 휴무요일 기준일은 영업시작시간입니다.<br><br>
           			
           			예시.<br>
           			2025-03-01 (토)<br>
           			영업시간 : 22시 ~ 4시
           			간격 : 2시간<br>
           			휴무요일 : 토요일<br><br>
           			
           			2025-03-02 (일) 0시, 2시 일정은 비록 일요일이지만,<br>
           			영업시작일이 토요일이기 때문에 등록되지 않습니다.<br>	
       	    	</p>
       	      </li>
            </ul>

          </div>
          <div class="col-lg-4 content">
          </div>  
        </div>
      </div>

    </section><!-- /About Alt Section -->

  </main>

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