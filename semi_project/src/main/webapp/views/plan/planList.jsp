<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
<link href="<%=request.getContextPath()%>/resources/css/include/common.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/resources/css/cjs.css" rel="stylesheet" type="text/css">

<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>

<!-- =======================================================
  * Template Name: OnePage
  * Template URL: https://bootstrapmade.com/onepage-multipurpose-bootstrap-template/
  * Updated: Aug 07 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<style>
/* 등록한 일정표 CSS */
table {
	width: 95%; /* 너비를 70%에서 95%로 늘려 더 넓게 */
	max-width: 1300px; /* 최대 너비 제한으로 화면에 맞게 조정 */
	/*margin: 40px auto;  상하 여백 조금 더 늘림 */
	border-collapse: separate;
	border-spacing: 0;
	font-family: 'Poppins', sans-serif;
	font-size: 16px; /* 글자 크기 14px → 16px로 키움 */
	background-color: #fff;
	border-radius: 16px; /* 둥근 모서리 조금 더 크게 */
	overflow: hidden;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1); /* 그림자 더 부드럽고 입체적으로 */
	cursor: pointer;
	text-align: center;
}

thead {
	background: linear-gradient(135deg, #2487ce, #1a5f92); /* 그라데이션 유지 */
	color: #fff;
	text-transform: uppercase;
	letter-spacing: 1px; /* 글자 간격 넓혀 깔끔하게 */
	cursor: default;
}

th {
	padding: 16px 20px; /* 패딩을 10px 12px → 16px 20px로 늘려 더 큼직하게 */
	font-weight: 700; /* 글자 굵기 증가 */
	font-size: 17px; /* 헤더 글자 크기 살짝 키움 */
	border-bottom: 3px solid rgba(255, 255, 255, 0.3); /* 헤더 하단 라인 강조 */
}

td {
	padding: 14px 20px; /* 패딩을 8px 12px → 14px 20px로 늘려 여유롭게 */
	color: #333; /* 글자색 더 진하게 */
	border-bottom: 1px solid #eef2f6; /* 구분선 더 부드럽게 */
	transition: background-color 0.3s ease;
}

tbody tr {
	background-color: #fff;
}

tbody tr:nth-child(even) {
	background-color: #fafcff; /* 짝수 행에 아주 연한 파란 톤 */
}

tbody tr:hover {
	background-color: rgba(36, 135, 206, 0.08); /* 호버 시 부드러운 색상 변화 */
}

tbody tr.active {
	background-color: rgba(36, 135, 206, 0.15); /* 선택된 행 강조 */
}

/* 페이징 CSS (기존 유지) */
.pagination {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 6px;
	padding: 20px 0;
	font-family: 'Poppins', sans-serif;
}

.pagination a {
	padding: 8px 14px;
	background-color: #fff;
	color: #2487ce;
	border: 1px solid #2487ce;
	border-radius: 6px;
	text-decoration: none;
	font-size: 13px;
	font-weight: 500;
	transition: all 0.3s ease;
}

.pagination a:hover {
	background-color: #2487ce;
	color: #fff;
	border-color: #1a5f92;
	transform: translateY(-1px);
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.pagination a.disabled {
	background-color: #f5f5f5;
	color: #aaa;
	border-color: #ddd;
	pointer-events: none;
	transform: none;
	box-shadow: none;
}

.pagination a.active {
	background-color: #2487ce;
	color: #fff;
	border-color: #1a5f92;
	font-weight: 600;
	box-shadow: 0 3px 8px rgba(0, 0, 0, 0.15);
	transform: scale(1);
}

.pagination .ellipsis {
	padding: 8px 12px;
	color: #888;
	font-weight: 500;
	font-size: 13px;
}
/* 사이드바 고정 및 크기 조정 */
.fixed-sidebar {
	position: fixed; /* 위치 고정 유지 */
	top: 350px; /* 상단에서 350px 떨어짐 (헤더 고려) */
	right: 200px; /* 오른쪽에서 200px 간격 */
	width: 500px; /* 너비 유지 */
	height: auto; /* 높이는 내용에 맞게 자동 */
	max-height: 80vh; /* 화면 높이의 80%까지만 */
	background-color: #fff; /* 배경색 흰색 */
	border-radius: 10px; /* 둥근 모서리 */
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 */
	padding: 20px; /* 내부 여백 */
	overflow-y: auto; /* 내용이 길어지면 스크롤 */
	z-index: 0;
	다른
	요소
	위에
	표시
	*/
}

.fixed-sidebar h3 {
	font-size: 20px; /* 제목 크기 */
	margin-bottom: 15px;
}

.fixed-sidebar .info-item {
	margin-bottom: 15px; /* 각 항목 간 간격 */
}

.fixed-sidebar .info-item i {
	font-size: 20px; /* 아이콘 크기 */
	margin-right: 10px;
	color: #2487ce; /* 아이콘 색상 */
}

.fixed-sidebar .info-item h3 {
	font-size: 16px; /* 소제목 크기 */
	margin-bottom: 5px;
}

.fixed-sidebar .info-item p {
	font-size: 14px; /* 본문 크기 */
	color: #555;
}

/* 화면이 좁아질 때 사이드바 숨기기 */
@media ( max-width : 1600px) {
	.fixed-sidebar {
		display: none; /* 화면 너비 1600px 이하에서 숨김 */
	}
}
</style>
<body class="service-details-page">

	<%@ include file="/views/include/header.jsp"%>

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
						<h2>일정 조회</h2>

						<!-- Contact Section -->
						<section id="contact" class="contact section">

							<!-- Section Title -->
							<table>
								<thead>
									<tr>
										<th>구장 위치</th>
										<th>구장명</th>
										<th>일정 날짜</th>
										<th>일정 시간</th>
										<th>이용 시간</th>
										<th>예약 상태</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty planList}">
											<c:forEach var="plan" items="${planList}">
												<tr class="plan-row" data-plan-no="${plan.planNo}"
												data-field-addr="${plan.field.fieldAddr}"
												data-field-name="${plan.field.fieldName}"
												data-plan-date="${plan.planDate}"
												data-plan-time="${plan.planTime}"
												data-use-time="${plan.useTime}"
												onclick="location.href='/selectPlanDetail?planNo=${plan.planNo}'">
													<td>${plan.field.fieldAddr}</td>
													<td>${plan.field.fieldName}</td>
													<td>${plan.planDate}</td>
													<td>${plan.planTime}</td>
													<td>${plan.useTime}시간</td>
													<td>null</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="6">등록된 일정이 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>

							<!-- 페이징 버튼 -->
							<c:if test="${not empty paging}">
								<div class="center">
									<div class="pagination">
										<c:if test="${paging.prev}">
											<a href="/selectPlanList?nowPage=${paging.pageBarStart - 1}" class="prev"> &laquo; </a>
										</c:if>

										<c:forEach var="i" begin="${paging.pageBarStart}" end="${paging.pageBarEnd}" step="1">
											<c:choose>
												<c:when test="${i == paging.nowPage}">
													<a href="/selectPlanList?nowPage=${i}" class="active">${i}</a>
												</c:when>
												<c:otherwise>
													<a href="/selectPlanList?nowPage=${i}">${i}</a>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${paging.next}">
											<a href="/selectPlanList?nowPage=${paging.pageBarEnd + 1}" class="next"> &raquo; </a>
										</c:if>
									</div>
								</div>
							</c:if>

						</section>
						<!-- /Contact Section -->
					</div>

					<div class="col-lg-4 fixed-sidebar" data-aos="fade-up" data-aos-delay="200">
						
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
					<h3 style="text-align: left; padding-bottom: 20px;">Contact</h3>

						<div class="info-item d-flex" data-aos="fade-up" data-aos-delay="300">
							<i class="bi bi-geo-alt flex-shrink-0"></i>
							<div>
								<h3>Address</h3>
								<p>#임의의 주소</p>
							</div>
						</div>
						<!-- End Info Item -->
<!-- 
						<div class="info-item d-flex" data-aos="fade-up" data-aos-delay="400">
							<i class="bi bi-telephone flex-shrink-0"></i>
							<div>
								<h3>Call Us</h3>
								<p>#임의의 전화번호</p>
							</div>
						</div>
						<!-- End Info Item -->
<!-- 
						<div class="info-item d-flex" data-aos="fade-up" data-aos-delay="500">
							<i class="bi bi-envelope flex-shrink-0"></i>
							<div>
								<h3>Email Us</h3>
								<p>#임의의 이메일@example.com</p>
							</div>
						</div>
						<!-- End Info Item -->

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

		</section>
		<!-- /Service Details Section -->

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