<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
<link href="<%=request.getContextPath()%>/resources/css/include/common.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/resources/css/cjs.css" rel="stylesheet" type="text/css">

<!-- =======================================================
  * Template Name: OnePage
  * Template URL: https://bootstrapmade.com/onepage-multipurpose-bootstrap-template/
  * Updated: Aug 07 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<style>
.btn-visit.cancel {
    background-color: crimson !important; /* 취소하기 버튼 색상 */
}
</style>
<body class="portfolio-details-page">

	<%@ include file="/views/include/header.jsp"%>

	<main class="main">

		<!-- Portfolio Details Section -->
		<section id="portfolio-details" class="portfolio-details section">

			<div class="container" data-aos="fade-up">
				<!-- 
		<div class="portfolio-details-slider swiper init-swiper">
          <script type="application/json" class="swiper-config">
            {
              "loop": true,
              "speed": 600,
              "autoplay": {
                "delay": 5000
              },
              "slidesPerView": "auto",
              "navigation": {
                "nextEl": ".swiper-button-next",
                "prevEl": ".swiper-button-prev"
              },
              "pagination": {
                "el": ".swiper-pagination",
                "type": "bullets",
                "clickable": true
              }
            }
          </script>
          <div class="swiper-wrapper align-items-center">

            <div class="swiper-slide">
              <img src="/resources/img/test_1920_1080.png" alt="">
            </div>

            <div class="swiper-slide">
              <img src="assets/img/portfolio/product-1.jpg" alt="">
            </div>

            <div class="swiper-slide">
              <img src="assets/img/portfolio/branding-1.jpg" alt="">
            </div>

            <div class="swiper-slide">
              <img src="assets/img/portfolio/books-1.jpg" alt="">
            </div>

          </div>
          <div class="swiper-button-prev"></div>
          <div class="swiper-button-next"></div>
          <div class="swiper-pagination"></div>
        </div>
-->
				<div class="row justify-content-between gy-4 mt-4">

					<div class="col-lg-8" data-aos="fade-up">
						<div class="portfolio-description" style="display: flex; flex-direction: row;">
							<!-- <h2>Info.</h2> -->

							<div class="col-lg-3" data-aos="fade-up" data-aos-delay="100" style="">
								<div class="portfolio-info">
									<h3>구장 정보</h3>
									<ul>
										<li><strong>구장 크기</strong> ${plan.field.fieldSize }</li>
										<li><strong>수용 인원</strong> ${plan.field.fieldLimit }명</li>
										<li><strong>실내/실외</strong> ${plan.field.isIndoor }</li>
										<li><strong>잔디 타입</strong> ${plan.field.fieldType }</li>
									</ul>
								</div>
							</div>
							<div class="col-lg-3" data-aos="fade-up" data-aos-delay="100" style="display: inline-block;">
								<div class="portfolio-info">
									<h3 style="visibility: hidden">Basic Info.</h3>
									<ul>
										<li><strong>샤워실</strong>${plan.field.isShower ? 'O' : 'X'}</li>
										<li><strong>주차장</strong>${plan.field.isPark ? 'O' : 'X'}</li>
										<li><strong>풋살화 대여</strong>
											<c:choose>
												<c:when test="${not empty plan.field.rentPrice}">${plan.field.rentPrice}원</c:when>
												<c:otherwise>없음</c:otherwise>
											</c:choose>
										</li>
									</ul>
								</div>
							</div>

							<!--
              <p>
                Impedit ipsum quae et aliquid doloribus et voluptatem quasi. Perspiciatis occaecati earum et magnam animi. Quibusdam non qui ea vitae suscipit vitae sunt. Repudiandae incidunt cumque minus deserunt assumenda tempore. Delectus voluptas necessitatibus est.
              </p>

              <p>
                Sunt voluptatum sapiente facilis quo odio aut ipsum repellat debitis. Molestiae et autem libero. Explicabo et quod necessitatibus similique quis dolor eum. Numquam eaque praesentium rem et qui nesciunt.
              </p>
              -->

						</div>
						<!--
            <div class="portfolio-description">
            	<div>
          	  		<div class="col-lg-3" data-aos="fade-up" data-aos-delay="100">
            			<div class="portfolio-info">
            				<h3>Additional Info.</h3>
            			</div>
          	  		</div>
              		<p>Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid</p>
				</div>

           	 	<div class="testimonial-item">
            		<p>
                		<i class="bi bi-quote quote-icon-left"></i>
                 		<span>Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa.</span>
                 		<i class="bi bi-quote quote-icon-right"></i>
                	</p>
                	<div>
                  		<img src="assets/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
                  		<h3>#담당자 이름</h3>
                  		<h4>#담당자 전화번호</h4>
                	</div>
             	</div>
             </div>
             -->
					</div>

					<div class="col-lg-3" data-aos="fade-up" data-aos-delay="300">
						<div class="portfolio-info">
							<h3>${plan.field.fieldName}</h3>
							<ul>
								<li><strong>Location </strong> ${plan.field.fieldAddr } <span><strong>지도보기</strong></span></li>
								<li><strong>Date </strong> ${plan.planDate }</li>
								<li><strong>Time </strong> ${plan.planTime }</li>
								<li><strong>Price </strong> ${plan.planPrice }</li>
								<!-- 
                <li><strong>URL</strong> <a href="#">www.example.com</a></li>
                 -->
								<li>
									<c:choose>
										<c:when test="${empty reservation.reservationNo }">
											<a href="/insertReservation?planNo=${plan.planNo}" class="btn-visit align-self-start" onclick="return confirm('해당 일정을 예약하시겠습니까?')">예약하기</a>
										</c:when>
										<c:otherwise>
											<a href="/deleteReservation?planNo=${plan.planNo}" class="btn-visit cancel align-self-start" onclick="return confirm('예약을 취소하시겠습니까?')">취소하기</a>
										</c:otherwise>
									</c:choose>
								</li>
							</ul>
						</div>
					</div>

				</div>

			</div>

		</section>
		<!-- /Portfolio Details Section -->

	</main>

	<%@ include file="/views/include/footer.jsp"%>

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
	<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>

</body>

</html>