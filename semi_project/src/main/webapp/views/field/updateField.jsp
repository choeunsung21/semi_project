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
  <title>구장 수정 및 삭제</title>
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
            <h2>일정 규칙 수정 : 정보 입력</h2>
            <p id="h-p">하나의 구장에는 하나의 규칙만 등록할 수 있습니다.<br>
            			수정하고 싶은 항목만 변경하시면 됩니다.</p>
            	
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
            				<form action="/updateFieldEnd" method="post" class="submit-form" name="update_field_end_form" data-aos="fade-up" data-aos-delay="200">
              					<div class="row gy-4">
									
									<div class="col-md-12" style="display:none;">
                  						<input type="text" class="form-control" name="user_no" id="user-no-input" value="${user.userNo}" placeholder="담당 회원번호">
                					</div>
                					<div class="col-md-12" style="display:none;">
                  						<input type="text" class="form-control" name="field_no" id="field-no-input" value="${field.fieldNo}" placeholder="대상이 될 구장번호">
                					</div>
                					<!--
                					<div class="col-md-12" style="display:none;">
                  						<input type="text" class="form-control" name="rule_no" id="rule-no-input" value="${planRule.ruleNo}" placeholder="대상이 될 규칙번호">
                					</div>
                					-->

									<div class="col-md-12">
										<label for="field-name-select" id="field-name-select-label">적용할 구장명</label>
										<input type="text" class="form-control" name="field_name" id="field-name-input" value="${field.fieldName}" readonly>
										
										<br>
										
										<a href="javascript:void(0);" class="btn-visit align-self-start" style="padding-right:2px;" onclick="chgClass();">수정하기</a>
										<a href="/deleteFieldEnd?field_no=${field.fieldNo}" class="btn-visit cancel align-self-start" style="padding-left:2px;" onclick="return confirm('해당 구장을 삭제하시겠습니까?')">삭제하기</a>
                					</div>
									
									<div class="col-md-12 update-hidden" id="dayoff-select">
                						<fieldset>
                							<legend>휴무요일</legend>
                							<p>(체크하지 않을 시 모든 요일에 개장함을 의미합니다)</p>
                							<c:choose>
                								<c:when test='${sun eq "false"}'>
                									<input type="checkbox" name="dayoff_list" value="1">일요일 &nbsp;
                								</c:when>
                								<c:otherwise>
                									<input type="checkbox" name="dayoff_list" value="1" checked>일요일 &nbsp;
                								</c:otherwise>
                							</c:choose>
                							<c:choose>
                								<c:when test='${mon eq false}'>
                									<input type="checkbox" name="dayoff_list" value="2">월요일 &nbsp;
                								</c:when>
                								<c:otherwise>
                									<input type="checkbox" name="dayoff_list" value="2" checked>월요일 &nbsp;
                								</c:otherwise>
                							</c:choose>
                							<c:choose>
                								<c:when test='${tue eq false}'>
                									<input type="checkbox" name="dayoff_list" value="3">화요일 &nbsp;
                								</c:when>
                								<c:otherwise>
                									<input type="checkbox" name="dayoff_list" value="3" checked>화요일 &nbsp;
                								</c:otherwise>
                							</c:choose>
                							<c:choose>
                								<c:when test='${wed eq false}'>
                									<input type="checkbox" name="dayoff_list" value="4">수요일 &nbsp;
                								</c:when>
                								<c:otherwise>
                									<input type="checkbox" name="dayoff_list" value="4" checked>수요일 &nbsp;
                								</c:otherwise>
                							</c:choose>
                							<c:choose>
                								<c:when test='${thu eq false}'>
                									<input type="checkbox" name="dayoff_list" value="5">목요일 &nbsp;
                								</c:when>
                								<c:otherwise>
                									<input type="checkbox" name="dayoff_list" value="5" checked>목요일 &nbsp;
                								</c:otherwise>
                							</c:choose>
                							<c:choose>
                								<c:when test='${fri eq false}'>
                									<input type="checkbox" name="dayoff_list" value="6">금요일 &nbsp;
                								</c:when>
                								<c:otherwise>
                									<input type="checkbox" name="dayoff_list" value="6" checked>금요일 &nbsp;
                								</c:otherwise>
                							</c:choose>
                							<c:choose>
                								<c:when test='${sat eq false}'>
                									<input type="checkbox" name="dayoff_list" value="7">토요일 &nbsp;
                								</c:when>
                								<c:otherwise>
                									<input type="checkbox" name="dayoff_list" value="7" checked>토요일 &nbsp;
                								</c:otherwise>
                							</c:choose>
                						</fieldset>
                					</div>
									
									<div class="col-md-12 update-hidden" id="field-name-after-target">
										<label for="field-name-after-input" id="field-name-after-label">구장명</label>
                  						<input type="text" class="form-control" name="field_name_after" id="field-name-after-input" value="${field.fieldName}">
                					</div>
                					
                					<div class="col-md-3 update-hidden" id="field-addr1-target">
                						<label for="field-addr1-select" id="field-addr1-label">구장주소</label>
                  						<select name="addr_1" id="field-addr1-select">
                  							<option value="-1">선택</option>
                  							<c:forEach var="address1" items="${addr1List}">
                  								<option value="${address1.addr1}" ${address1.addr1 == field.fieldAddr1 ? 'selected' : ''}>${address1.addr1}</option>
                  							</c:forEach>
                  						</select>
                					</div>
                					
                					<div class="col-md-3 update-hidden" id="field-addr2-target">
                						<label for="field-addr2-select" id="field-addr2-label"></label>
                  						<select name="addr_2" id="field-addr2-select">
                  							<option value="${addr2}">${addr2}</option>
                  						</select>
                					</div>
                					
                					<div class="col-md-6 update-hidden" id="field-addr-target">
                						<label for="field-addr-input" id="field-addr-label"></label>
                  						<input type="text" class="form-control" name="field_addr" id="field-addr-input" value="${field.fieldAddr}">
                					</div>
                					
                					<div class="col-md-12 update-hidden" id="field-limit-target">
                						<label for="field-limit-input" id="field-limit-label">수용인원</label>
                  						<input type="number" class="form-control" name="field_limit" id="field-limit-input" value="${field.fieldLimit}" min="0">
                					</div>
                					
                					<div class="col-md-6 update-hidden" id="field-width-target">
                						<label for="field-size-width-input" id="field-size-width-label">가로(m)</label>
                  						<input type="number" class="form-control" name="field_size_width" id="field-size-width-input" value="${fieldWidth}" min="0">
                					</div>
	
                					<div class="col-md-6 update-hidden" id="field-height-target">
                						<label for="field-size-height-input" id="field-size-height-label">세로(m)</label>
                  						<input type="number" class="form-control" name="field_size_height" id="field-size-height-input" value="${fieldHeight}" min="0">
                					</div>
									
									<div class="col-md-6 update-hidden" id="is-indoor-target">
                						<label for="is-indoor-select" id="is-indoor-label">실내/실외</label>
                						<c:choose>
                							<c:when test='${field.isIndoor eq "실내"}'>
                								<select name="is_indoor" id="is-indoor-select">
                  									<option value="0" selected>실내</option>
                  									<option value="1">실외</option>
                  								</select>
                							</c:when>
                							<c:otherwise>
                								<select name="is_indoor" id="is-indoor-select">
                  									<option value="0">실내</option>
                  									<option value="1" selected>실외</option>
                  								</select>
                							</c:otherwise>
                						</c:choose>
                					</div>
                					
                					<div class="col-md-6 update-hidden" id="field-type-target">
                						<label for="field-type-select" id="field-type-label">잔디타입</label>
                  						
                  						<c:choose>
                  							<c:when test='${field.fieldType eq "인조잔디"}'>
                  								<select name="field_type" id="field-type-select">
                  									<option value="0" selected>인조잔디</option>
                  									<option value="1">천연잔디</option>
                  								</select>
                  							</c:when>
                  							<c:otherwise>
                  								<select name="field_type" id="field-type-select">
                  									<option value="0" >인조잔디</option>
                  									<option value="1" selected>천연잔디</option>
                  								</select>
                  							</c:otherwise>
                  						</c:choose>
                  							
                					</div>
                					
                					<div class="col-md-6 update-hidden" id="is-park-target">
                						<label for="is-park-select" id="is-park-label">주차장여부</label>
                						
                						<c:choose>
                							<c:when test='${field.isPark eq false}'>
                								<select name="is_park" id="is-park-select">
                									<option value="0" selected>없음</option>
                									<option value="1">있음</option>
                								</select>
                							</c:when>
                							<c:otherwise>
                								<select name="is_park" id="is-park-select">
                									<option value="0">없음</option>
                									<option value="1" selected>있음</option>
                								</select>
                							</c:otherwise>
                						</c:choose>

                					</div>
                					
                					<div class="col-md-6 update-hidden" id="is=shower-target">
                						<label for="is-shower-select" id="is-shower-label">샤워실여부</label>
                						<c:choose>
                							<c:when test='${field.isShower eq false}'>
                								<select name="is_shower" id="is-shower-select">
                									<option value="0" selected>없음</option>
                									<option value="1">있음</option>
                								</select>
                							</c:when>
                							<c:otherwise>
                								<select name="is_shower" id="is-shower-select">
                									<option value="0" selected>없음</option>
                									<option value="1" selected>있음</option>
                								</select>
                							</c:otherwise>
                						</c:choose>
                						
                					</div>
									
									<div class="col-md-12 update-hidden" id="rent-price-target">
                						<label for="rent-price-input" id="rent-price-label">풋살화 대여가격 <span>(대여서비스를 제공하지 않을 경우 비워두시면 됩니다.)</span></label>
                  						<input type="number" class="form-control" name="rent_price" id="rent-price-input" value="${field.rentPrice}" min="0">
                					</div>
                					
                					<!--
                					<div class="col-md-12 update-hidden" id="file-img-p">
                						<label for="field-img-input" id="field-img-label">구장 대표 이미지</label>
                						<p>10MB 이하의 파일만 업로드 가능하며, .jpg .jpeg .png만을 허용합니다.</p>
                  						<input type="file" class="form-control" name="field_img" id="field-img-input" accept=".png, .jpg, .jpeg">
                					</div>
                					 -->

                					<div class="col-md-12 update-hidden" id="message-target">
                						<label for="message-textarea" id="message-label">특이사항</label>
                 						<textarea class="form-control" name="message" id="message-textarea" rows="6">${field.message}</textarea>
                					</div>
									
									<p class="update-hidden" id="chk_terms_p">
                						<input id="chk_terms" type="checkbox">&nbsp; 구장 수정 관련 약관입니다.
									</p>                					
									
									<!-- #chk_term 체크되었을 때만 버튼이 눌러지고 아닐경우 alert창을 띄울 예정 -->
                					<div class="col-md-12 text-center update-hidden" id="update-btn-target">
                  						<button type="submit" onclick="updateFieldForm();">구장 정보 수정</button>
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
              <a href="javascript:void(0);" class="active">구장명 : <span id="field-name-span"></span></a>
              <a href="javascript:void(0);" class="active">주소 : <span id="field-addr-span"></span></a>
              <a href="javascript:void(0);" class="active">구장크기 : <span id="field-size-span"></span></a>
              <a href="javascript:void(0);" class="active">수용인원 : <span id="field-limit-span"></span></a>
              <a href="javascript:void(0);" class="active">잔디타입 : <span id="field-type-span"></span></a>
              <a href="javascript:void(0);" class="active">실내/실외 : <span id="is-indoor-span"></span></a>
              <a href="javascript:void(0);" class="active">주차장 : <span id="is-park-span"></span></a>
              <a href="javascript:void(0);" class="active">샤워실 : <span id="is-shower-span"></span></a>
              <a href="javascript:void(0);" class="active">풋살화대여 : <span id="rent-price-span"></span></a>
              <a href="javascript:void(0);" class="active">휴무요일 : <span id="dayoff-span"></span></a>
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
  	const updateFieldForm = function(){
    	const form = document.update_field_end_form;
		let chkTerms = $("#chk_terms").is(":checked");
		
		/*
		if(!form.field_name_after.value) {
        	alert('구장 이름을 입력해주세요.');
        	form.field_name_after.focus();
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
        } else if(form.field_img.value) {
			const val = form.field_img.value;
			const idx = val.lastIndexOf(".");
			const type = val.substring(idx+1, val.length);
			
			if(!(type == 'png' || type == 'jpg' || type == 'jpeg')) {
				alert('이미지 파일 형식이 맞지 않습니다.');
				form.field_img.focus();
				event.preventDefault();
			}
        } 
		 */
        
        if(!chkTerms) {
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
		const fieldNo = $('#field-no-input').val();

		$.ajax({
			url : "/selectFieldEnd",
			type : "post",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			data : {
				"fieldNo":fieldNo
			},
			dataType : "JSON",
			success : function(data){
				document.getElementById("field-name-span").innerText = data["fieldName"];
				document.getElementById("field-addr-span").innerText = data["fieldAddr1"]+' '+data["fieldAddr2"]+' '+data["fieldAddr"];
				document.getElementById("field-size-span").innerText = data["fieldSize"];
				document.getElementById("field-limit-span").innerText = data["fieldLimit"];
				document.getElementById("field-type-span").innerText = data["fieldType"];
				document.getElementById("is-indoor-span").innerText = data["isIndoor"];
				document.getElementById("is-park-span").innerText = data["isPark"];
				document.getElementById("is-shower-span").innerText = data["isShower"];
				document.getElementById("rent-price-span").innerText = data["rentPrice"];
				document.getElementById("dayoff-span").innerText = data["dayoff"];
			},
			error : function(){
				document.getElementById("field-name-span").innerText = "";
				document.getElementById("field-addr-span").innerText = "";
				document.getElementById("field-size-span").innerText = "";
				document.getElementById("field-limit-span").innerText = "";
				document.getElementById("field-type-span").innerText = "";
				document.getElementById("is-indoor-span").innerText = "";
				document.getElementById("is-park-span").innerText = "";
				document.getElementById("is-shower-span").innerText = "";
				document.getElementById("rent-price-span").innerText = "";
				document.getElementById("dayoff-span").innerText = "";
			}
		});
	});
  	
  	let chkHidden = true;
  	
    const chgClass = function(){
		if(chkHidden) {
			document.getElementById('dayoff-select').classList.remove('update-hidden');
			document.getElementById('field-name-after-target').classList.remove('update-hidden');
			document.getElementById('field-addr1-target').classList.remove('update-hidden');
			document.getElementById('field-addr2-target').classList.remove('update-hidden');
			document.getElementById('field-addr-target').classList.remove('update-hidden');
			document.getElementById('field-limit-target').classList.remove('update-hidden');
			document.getElementById('field-width-target').classList.remove('update-hidden');
			document.getElementById('field-height-target').classList.remove('update-hidden');
			document.getElementById('is-indoor-target').classList.remove('update-hidden');
			document.getElementById('field-type-target').classList.remove('update-hidden');
			document.getElementById('is-park-target').classList.remove('update-hidden');
			document.getElementById('is=shower-target').classList.remove('update-hidden');
			document.getElementById('rent-price-target').classList.remove('update-hidden');
			/* document.getElementById('file-img-p').classList.remove('update-hidden'); */
			document.getElementById('message-target').classList.remove('update-hidden');
			document.getElementById('chk_terms_p').classList.remove('update-hidden');
			document.getElementById('update-btn-target').classList.remove('update-hidden');
			
			chkHidden = false;
		} else {
			document.getElementById('dayoff-select').classList.add('update-hidden');
			document.getElementById('field-name-after-target').classList.add('update-hidden');
			document.getElementById('field-addr1-target').classList.add('update-hidden');
			document.getElementById('field-addr2-target').classList.add('update-hidden');
			document.getElementById('field-addr-target').classList.add('update-hidden');
			document.getElementById('field-limit-target').classList.add('update-hidden');
			document.getElementById('field-width-target').classList.add('update-hidden');
			document.getElementById('field-height-target').classList.add('update-hidden');
			document.getElementById('is-indoor-target').classList.add('update-hidden');
			document.getElementById('field-type-target').classList.add('update-hidden');
			document.getElementById('is-park-target').classList.add('update-hidden');
			document.getElementById('is=shower-target').classList.add('update-hidden');
			document.getElementById('rent-price-target').classList.add('update-hidden');
			/* document.getElementById('file-img-p').classList.add('update-hidden'); */
			document.getElementById('message-target').classList.add('update-hidden');
			document.getElementById('chk_terms_p').classList.add('update-hidden');
			document.getElementById('update-btn-target').classList.add('update-hidden');
			
			chkHidden = true;
		}
    };
  </script>
  <script>
    $(document).ready(function() {
        let selectedAddr2 = "${fieldAddr2.addr2}";

        if (selectedAddr2 && selectedAddr2 !== "-1") {
            $('#field-addr2-select').val(selectedAddr2);
        }
    });
  </script>
  <script>
  	$(function(){
  		$('#field-addr1-select').change(function(){
			let selectedAddr1 = $('#field-addr1-select option:selected').val();
			
			$.ajax({
				url : "/selectAddressEnd",
				type : "post",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				data : {
					"addr1":selectedAddr1
				},
				dataType : "JSON",
				success : function(data){
					let selectAddr2 = document.getElementById('field-addr2-select');

					selectAddr2.innerHTML = '<option value="-1">선택</option>';
					
				    data.forEach(function(item) {
				        let option = document.createElement('option');
				        option.value = item.addr2;
				        option.textContent = item.addr2;

				        selectAddr2.appendChild(option);
				    });

				},
				error : function(){

				}
			});
  		});
  	});
  </script>
</body>

</html>