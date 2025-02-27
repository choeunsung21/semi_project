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
            <h2>스케줄 등록 : 규칙 설정</h2>
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
            				<form action="#" method="post" class="submit-form" name="insert_rule_end_form" data-aos="fade-up" data-aos-delay="200">
              					<div class="row gy-4">
									
									<div class="col-md-12" style="display:none;">
                  						<input type="text" class="form-control" name="user_no" id="user-no-input" value="${user.userNo}" placeholder="담당 회원번호">
                					</div>
                					
                					<div class="col-md-12" style="display:none">
                						<c:forEach var="field_list" items="${fieldList}" varStatus="vs">

											<input id="" value=""/>

										</c:forEach>
                					</div>

									<div class="col-md-12">
										<label for="field-no-select" id="field-no-select-label">구장 선택*</label>
										<select id="field-no-select" name="field_no">
											<option value="0">구장선택</option>
											<c:forEach var="field_list" items="${fieldList}" varStatus="vs">
												<option value="${field_list.fieldNo}" id="field-no">
													<c:out value="(${vs.index+1}) ${field_list.fieldName}"/>
												</option>
											</c:forEach>
										</select>
                					</div>
									
                					<div class="col-md-6" id="rule-open-select">
                						<label for="rule-open-input" id="rule-open-label">오픈시간*</label>
                  						<input type="time" class="form-control" name="rule_open" id="rule-open-input" required>
                					</div>
                					
                					<div class="col-md-6" id="rule-close-select">
                						<label for="rule-close-input" id="rule-close-label">마감시간*</label>
                  						<input type="time" class="form-control" name="rule_close" id="rule-close-input" required>
                					</div>
                					
                					<div class="col-md-12">
                						<label for="rule-usetime-input" id="rule-usetime-label">이용시간 <span>(입력하지 않으면 2시간 기본입니다.)</span></label>
                  						<input type="text" class="form-control" name="rule_usetime" id="rule-usetime-input">
                					</div>
                					
                					<div class="col-md-12">
                						<label for="rule-price-input" id="rule-price-label">가격 <span>(입력하지 않으면 무료입니다.)</span></label>
                  						<input type="text" class="form-control" name="rule_price" id="rule-price-input">
                					</div>

									<p>
                						<input id="chk_terms" type="checkbox">&nbsp; 스케줄 등록 관련 약관입니다.
									</p>                					
									
									<!-- #chk_term 체크되었을 때만 버튼이 눌러지고 아닐경우 alert창을 띄울 예정 -->
                					<div class="col-md-12 text-center">
                  						<button type="submit" onclick="insertRuleForm();">스케줄 등록</button>
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
		  	 
            <div class="services-list" id="services-list-div">
              <a href="" class="active">구장명 : <span id="field-name-span"></span></a>
              <a href="" class="active">주소 : <span id="field-addr-span"></span></a>
              <a href="" class="active">구장크기 : <span id="field-size-span"></span></a>
              <a href="" class="active">수용인원 : <span id="field-limit-span"></span></a>
              <a href="" class="active">잔디타입 : <span id="field-type-span"></span></a>
              <a href="" class="active">실내/실외 : <span id="is-indoor-span"></span></a>
              <a href="" class="active">주차장 : <span id="is-park-span"></span></a>
              <a href="" class="active">샤워실 : <span id="is-shower-span"></span></a>
              <a href="" class="active">풋살화대여 : <span id="rent-price-span"></span></a>
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
  
    <script>
  	const insertRuleForm = function(){
    	const form = document.insert_rule_end_form;
		let chkTerms = $("#chk_terms").is(":checked");
							
		console.log(form.field_no.value);
		
        if(form.field_no.value == "0") {
        	alert('구장을 선택해주세요.');
        	form.field_no.focus();
        	event.preventDefault();
        } else if(!form.rule_open.value) {
        	alert('오픈 시간을 선택해주세요.');
        	form.rule_open.focus();
        	event.preventDefault();
        } else if(!form.rule_close.value) {
        	alert('마감 시간을 선택해주세요.');
        	form.rule_close.focus();
        	event.preventDefault();
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
  <script src="/resources/js/common.js"></script>

  <script>
  $(function(){
		$('#field-no-select').change(function(){
			const fieldIndex = $('#field-no-select option:selected').val();
			
			$.ajax({
				url : "/selectFieldEnd",
				type : "post",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				data : {
					"fieldIndex":fieldIndex
				},
				dataType : "JSON",
				success : function(data){
					document.getElementById("field-name-span").innerText = data["fieldName"];
					document.getElementById("field-addr-span").innerText = data["fieldAddr"];
					document.getElementById("field-size-span").innerText = data["fieldSize"];
					document.getElementById("field-limit-span").innerText = data["fieldLimit"];
					document.getElementById("field-type-span").innerText = data["fieldType"];
					document.getElementById("is-indoor-span").innerText = data["isIndoor"];
					document.getElementById("is-park-span").innerText = data["isPark"];
					document.getElementById("is-shower-span").innerText = data["isShower"];
					document.getElementById("rent-price-span").innerText = data["rentPrice"];
				},
				error : function(){
					alert('서버 요청 중 오류가 발생하였습니다.');
				}
			});
		});
	});
  </script>
</body>

</html>