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
  <title>Service Details - OnePage Bootstrap Template</title>
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
  <link href="<%= request.getContextPath() %>/resources/css/ces.css" rel="stylesheet" type="text/css">
  
  <script src="<%= request.getContextPath() %>/resources/js/jquery-3.7.1.js"></script>

  <!-- =======================================================
  * Template Name: OnePage
  * Template URL: https://bootstrapmade.com/onepage-multipurpose-bootstrap-template/
  * Updated: Aug 07 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body class="service-details-page">

  <%@ include file="/views/include/header.jsp" %>

  <main class="main">

    <!-- Page Title -->
    <!-- 
    <div class="page-title accent-background">
      <div class="container">
        <h1>Service Details</h1>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="index.html">Home</a></li>
            <li class="current">Service Details</li>
          </ol>
        </nav>
      </div>
    </div>
    -->
    <!-- End Page Title -->

    <!-- Service Details Section -->
    <section id="service-details" class="service-details section">

      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-8" data-aos="fade-up" data-aos-delay="200">
            <h2>일정 등록 : 정보 입력</h2>
            
            <!-- Contact Section -->
    		<section id="contact" class="contact section">

      			<!-- Section Title -->
      			<!-- 
      			<div class="container section-title" data-aos="fade-up">
        			<h2>Contact</h2>
        			<p>Necessitatibus eius consequatur ex aliquid fuga eum quidem sint consectetur velit</p>
      			</div>
      			-->
      			<!-- End Section Title -->
	
      			<div class="container" data-aos="fade-up" data-aos-delay="100">
					
					<!-- 
        			<div class="mb-4" data-aos="fade-up" data-aos-delay="200">
          				<iframe style="border:0; width: 100%; height: 270px;" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d48389.78314118045!2d-74.006138!3d40.710059!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25a22a3bda30d%3A0xb89d1fe6bc499443!2sDowntown%20Conference%20Center!5e0!3m2!1sen!2sus!4v1676961268712!5m2!1sen!2sus" frameborder="0" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        			</div>
        			-->
        			<!-- End Google Maps -->
	
        			<div class="row gy-4">
	
          				<div class="col-lg-4">
          					<h3 style="text-align:left; padding-bottom:20px;">Contact</h3>
          					
            				<div class="info-item d-flex" data-aos="fade-up" data-aos-delay="300">
            					
              					<i class="bi bi-geo-alt flex-shrink-0"></i>
              					<div>
                					<h3>Address</h3>
                					<p>#임의의 주소</p>
              					</div>
            				</div><!-- End Info Item -->
		
            				<div class="info-item d-flex" data-aos="fade-up" data-aos-delay="400">
              					<i class="bi bi-telephone flex-shrink-0"></i>
              					<div>
                					<h3>Call Us</h3>
                					<p>#임의의 전화번호</p>
              					</div>
           					</div><!-- End Info Item -->
		
            				<div class="info-item d-flex" data-aos="fade-up" data-aos-delay="500">
              					<i class="bi bi-envelope flex-shrink-0"></i>
              					<div>
                					<h3>Email Us</h3>
                					<p>#임의의 이메일@example.com</p>
              					</div>
            				</div><!-- End Info Item -->
		
          				</div>
		
          				<div class="col-lg-8">
            				<form action="/insertPlanEnd" method="post" class="submit-form" data-aos="fade-up" data-aos-delay="200">
              					<div class="row gy-4">
									
									<div class="col-md-12" style="display:none;">
                  						<input type="text" class="form-control" name="user_no" value="${user.userNo}" placeholder="담당 회원번호">
                					</div>
									
									<div class="col-md-12">
										<label for="field-no-select" id="field-no-label">구장 선택</label>
										<select id="field-no-select" name="field_no">
											<c:forEach var="field_list" items="${fieldList}" varStatus="vs">
												<option value="${field_list.fieldNo}">
													<c:out value="(${vs.index+1}) ${field_list.fieldName}"/>
												</option>
											</c:forEach>
										</select>
                					</div>
                					
                					<div class="col-md-6" id="plan-date-select">
                						<label for="plan-date-select" id="plan-date-label">날짜 선택</label>
                  						<input type="date" class="form-control" id="plan-date-select" name="plan_date" placeholder="날짜" required>
                					</div>
                					
                					<div class="col-md-6" id="plan-time-select">
                					<!-- 
                  						<input type="time" class="form-control" name="plan_time" placeholder="시간" required>
                  					 -->
	                  					<label for="plan-time-select" id="plan-time-label">시작 시간</label>
	                  					<select id="plan-time-select" name="plan_time">
										    <%
										        for (int i = 0; i < 24; i++) {
										            String hour = String.format("%02d:00", i);
										    %>
										            <option value="<%= hour %>"><%= hour %></option>
										    <%
										        }
										    %>
										</select>
                					</div>
                					
                					<div class="col-md-12">
                  						<!-- 
                  						<input type="text" class="form-control" name="rule_usetime" placeholder="이용시간 (입력하지 않으면 2시간 기본입니다.)">
                  						 -->
                  						 <label for="use-time-select" id="use-time-label">이용 시간</label>
                  						 <select id="use-time-select" name="use_time">
										     <option value="1">1시간</option>
										     <option value="2" selected="selected">2시간</option>
										     <option value="3">3시간</option>
										     <option value="4">4시간</option>
										</select>
                					</div>
                					
                					<div class="col-md-12">
                						<label for="plan-price-int" id="plan-price-label">이용료</label>
                  						<input type="number" class="form-control" name="plan_price" min="0" value="0">
                					</div>

									<p>
                						<input id="chk_terms" type="checkbox">&nbsp; 스케줄 등록 관련 약관입니다.
									</p>                					
									
									<!-- #chk_term 체크되었을 때만 버튼이 눌러지고 아닐경우 alert창을 띄울 예정 -->
                					<div class="col-md-12 text-center">
                  						<button type="submit">스케줄 등록</button>
                					</div>
                					
              					</div>
            				</form>
          				</div><!-- End Contact Form -->
	
        			</div>
	
      			</div>

    		</section><!-- /Contact Section -->
            
            <!-- 
            <ul>
              <li><i class="bi bi-check-circle"></i> <span>Aut eum totam accusantium voluptatem.</span></li>
              <li><i class="bi bi-check-circle"></i> <span>Assumenda et porro nisi nihil nesciunt voluptatibus.</span></li>
              <li><i class="bi bi-check-circle"></i> <span>Ullamco laboris nisi ut aliquip ex ea</span></li>
            </ul>
            <p>
              Est reprehenderit voluptatem necessitatibus asperiores neque sed ea illo. Deleniti quam sequi optio iste veniam repellat odit. Aut pariatur itaque nesciunt fuga.
            </p>
            <p>
              Sunt rem odit accusantium omnis perspiciatis officia. Laboriosam aut consequuntur recusandae mollitia doloremque est architecto cupiditate ullam. Quia est ut occaecati fuga. Distinctio ex repellendus eveniet velit sint quia sapiente cumque. Et ipsa perferendis ut nihil. Laboriosam vel voluptates tenetur nostrum. Eaque iusto cupiditate et totam et quia dolorum in. Sunt molestiae ipsum at consequatur vero. Architecto ut pariatur autem ad non cumque nesciunt qui maxime. Sunt eum quia impedit dolore alias explicabo ea.
            </p>
             -->
             
          </div>

          <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
		  	 
            <div class="services-list">
              <a href="" class="active">구장명 : </a>
              <a href="">주소 : </a>
              <a href="">구장크기 : </a>
              <a href="">수용인원 : </a>
              <a href="">잔디타입 : </a>
              <a href="">실내/실외 : </a>
              <a href="">주차장 : </a>
              <a href="">풋살화대여 : </a>
            </div>
           
			<!-- 
            <h4>파일 첨부 규칙</h4>
            <p>10MB 이하의 파일만 업로드 가능하며, .jpg .jpeg .png만을 허용합니다.</p>
            -->
          </div>

        </div>

      </div>

    </section><!-- /Service Details Section -->

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
  <script src="<%= request.getContextPath() %>/resources/js/common.js"></script>

</body>

</html>