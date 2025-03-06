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
  <title>구장 등록</title>
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
            <h2>구장 등록 : 정보 입력</h2>
            <p id="h-p">(*) 표시가 있는 항목은 반드시 입력해야합니다.</p>
            
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

          				<div class="col-lg-12">
            				<form action="/insertFieldEnd" method="post" class="submit-form" name="insert_field_end_form" data-aos="fade-up" data-aos-delay="200" enctype="multipart/form-data">
              					<div class="row gy-4">
									
									<div class="col-md-12" style="display:none;">
                  						<input type="text" class="form-control" name="user_no" value="${user.userNo}" placeholder="담당 회원번호">
                					</div>
									
                					<div class="col-md-12" id="dayoff-select">
                						<fieldset>
                							<legend>휴무요일</legend>
                							<p>(체크하지 않을 시 모든 요일에 개장함을 의미합니다)</p>
                							<input type="checkbox" name="dayoff_list" value="1">일요일 &nbsp;
                							<input type="checkbox" name="dayoff_list" value="2">월요일 &nbsp;
                							<input type="checkbox" name="dayoff_list" value="3">화요일 &nbsp;
                							<input type="checkbox" name="dayoff_list" value="4">수요일 &nbsp;
                							<input type="checkbox" name="dayoff_list" value="5">목요일 &nbsp;
                							<input type="checkbox" name="dayoff_list" value="6">금요일 &nbsp;
                							<input type="checkbox" name="dayoff_list" value="7">토요일 &nbsp;
                						</fieldset>
                					</div>
                					
									<div class="col-md-12">
										<label for="field-name-input" id="field-name-label">구장명*</label>
                  						<input type="text" class="form-control" name="field_name" id="field-name-input" placeholder="최대 100자까지 입력 가능합니다." required>
                					</div>
                					
                					<div class="col-md-12">
                						<label for="field-addr-input" id="field-addr-label">구장주소*</label>
                  						<input type="text" class="form-control" name="field_addr" id="field-addr-input" placeholder="최대 100자까지 입력 가능합니다." required>
                					</div>
                					
                					<div class="col-md-12">
                						<label for="field-limit-input" id="field-limit-label">수용인원*</label>
                  						<input type="number" class="form-control" name="field_limit" id="field-limit-input" min="0" required>
                					</div>
                					
                					<div class="col-md-6">
                						<label for="field-size-width-input" id="field-size-width-label">가로(m)*</label>
                  						<input type="number" class="form-control" name="field_size_width" id="field-size-width-input" min="0" required>
                					</div>
	
                					<div class="col-md-6">
                						<label for="field-size-height-input" id="field-size-height-label">세로(m)*</label>
                  						<input type="number" class="form-control" name="field_size_height" id="field-size-height-input" min="0" required>
                					</div>
          
                					<div class="col-md-6">
                						<label for="is-indoor-select" id="is-indoor-label">실내/실외</label>
                  						<select name="is_indoor" id="is-indoor-select">
                  							<option value="0">실내</option>
                  							<option value="1">실외</option>
                  						</select>
                					</div>
                					
                					<div class="col-md-6">
                						<label for="field-type-select" id="field-type-label">잔디타입</label>
                  						<select name="field_type" id="field-type-select">
                  							<option value="0">인조잔디</option>
                  							<option value="1">천연잔디</option>
                  						</select>
                					</div>
                					
                					<div class="col-md-6">
                						<label for="is-park-select" id="is-park-label">주차장여부</label>
                						<select name="is_park" id="is-park-select">
                							<option value="0">없음</option>
                							<option value="1">있음</option>
                						</select>
                					</div>
                					
                					<div class="col-md-6">
                						<label for="is-shower-select" id="is-shower-label">샤워실여부</label>
                						<select name="is_shower" id="is-shower-select">
                							<option value="0">없음</option>
                							<option value="1">있음</option>
                						</select>
                					</div>
                					
                					<div class="col-md-12">
                						<label for="rent-price-input" id="rent-price-label">풋살화 대여가격 <span>(대여서비스를 제공하지 않을 경우 비워두시면 됩니다.)</span></label>
                  						<input type="number" class="form-control" name="rent_price" id="rent-price-input" min="0">
                					</div>
                					
                					<div class="col-md-12" id="file-img-p">
                						<label for="field-img-input" id="field-img-label">구장 대표 이미지*</label>
                						<p>10MB 이하의 파일만 업로드 가능하며, .jpg .jpeg .png만을 허용합니다.</p>
                  						<input type="file" class="form-control" name="field_img" id="field-img-input" accept=".png, .jpg, .jpeg">
                						<p>한 번 등록시 변경할 수 없으므로 주의깊게 선택해주세요.</p>
                					</div>

                					<div class="col-md-12">
                						<label for="message-textarea" id="message-label">특이사항</label>
                 						<textarea class="form-control" name="message" id="message-textarea" rows="6"></textarea>
                					</div>
									
									<p id="chk_terms_p">
                						<input id="chk_terms" type="checkbox">&nbsp; 구장 등록 관련 약관입니다.
									</p>                					
									
									<!-- #chk_term 체크되었을 때만 버튼이 눌러지고 아닐경우 alert창을 띄울 예정 -->
                					<div class="col-md-12 text-center">
                  						<button type="submit" onclick="insertFieldForm();">구장 등록</button>
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

		  <div class="col-lg-4" id="side-box-flex" data-aos="fade-up" data-aos-delay="200">

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

		  	<!-- 
            <div class="services-list">
              # img 파일을 선택하고 점부를 위한 공간입니다.
            </div>
           
            <h4>파일 첨부 규칙</h4>
            <p>10MB 이하의 파일만 업로드 가능하며, .jpg .jpeg .png만을 허용합니다.</p>
             -->
             
          </div>

        </div>

      </div>

    </section><!-- /Service Details Section -->

  </main>
  
  <script>
  	const insertFieldForm = function(){
    	const form = document.insert_field_end_form;
		let chkTerms = $("#chk_terms").is(":checked");
											
        if(!form.field_name.value) {
        	alert('구장 이름을 입력해주세요.');
        	form.field_name.focus();
        	event.preventDefault();
        } else if(!form.field_addr.value) {
            alert('구장 주소를 입력해주세요.');
            form.field_addr.focus();
            event.preventDefault();
        } else if(!form.field_limit.value) {
            alert('수용 인원을 입력해주세요.');
            form.field_limit.focus();
            event.preventDefault();
        } else if(!form.field_size_width.value) {
            alert('구장 크기(너비)를 입력해주세요.');
            form.field_size_width.focus();
            event.preventDefault();
        } else if(!form.field_size_height.value) {
            alert('구장 크기(길이)를 입력해주세요.');
            form.field_size_height.focus();
            event.preventDefault();
        } else if(!form.field_img.value) {
			alert('구장 대표 이미지를 선택해주세요.');
			form.field_img.focus();
			event.preventDefault();
        } else if(form.field_img.value) {
			const val = form.field_img.value;
			const idx = val.lastIndexOf(".");
			const type = val.substring(idx+1, val.length);
			
			if(!(type == 'png' || type == 'jpg' || type == 'jpeg')) {
				alert('이미지 파일 형식이 맞지 않습니다.');
				form.field_img.focus();
				event.preventDefault();
			}
        } else if(!chkTerms) {
            alert("약관을 읽고 체크해주세요.");
			event.preventDefault();
        }
  	};
  </script>

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