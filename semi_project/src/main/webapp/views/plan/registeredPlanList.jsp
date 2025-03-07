<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<style>
/* 등록한 일정표 CSS */
table {
	width: 100%; /* 표 너비 유지 */
	border-collapse: separate; /* 둥근 모서리와 그림자 적용을 위해 변경 */
	border-spacing: 0; /* 셀 간격 제거 */
	font-family: 'Poppins', sans-serif;
	font-size: 16px; /* 글자 크기 약간 키움 */
	background-color: #fff; /* 배경색 흰색으로 통일 */
	border-radius: 16px; /* 모서리 둥글게 */
	overflow: hidden; /* 둥근 모서리 안쪽 잘림 방지 */
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1); /* 그림자 강화 */
	cursor: pointer;
	text-align: center;
}

thead {
	background: linear-gradient(135deg, #2487ce, #1a5f92); /* 테마 색상 그라데이션 */
	color: white;
	text-transform: uppercase;
	letter-spacing: 1px; /* 글자 간격 추가로 고급스러움 강조 */
	cursor: default;
}

th, td {
	padding: 12px 16px; /* 패딩을 늘려 여유롭게 */
	border-bottom: 1px solid #e0e0e0; /* 경계선 더 부드럽게 */
}

th {
	font-weight: 600; /* 글자 굵기 조정 */
}

td {
	color: #444; /* 텍스트 색상 약간 진하게 */
}

/* 홀수/짝수 행 배경색 및 호버 효과 */
tbody tr:nth-child(even) {
	background-color: #f8f9fa; /* 부드러운 회색 */
}

tbody tr:hover {
	background-color: rgba(36, 135, 206, 0.15); /* 호버 색상 약간 진하게 */
	transition: background-color 0.3s ease; /* 부드러운 전환 */
}

/* 추가 행 (+ 버튼) 스타일 */
.plus-row {
	background-color: #e9ecef; /* 회색 배경 */
	font-size: 18px; /* + 기호 크기 키움 */
	color: #2487ce; /* 테마 색상으로 변경 */
	font-weight: bold;
	text-align: center;
}

.plus-row:hover {
	background-color: #dee2e6; /* 호버 시 약간 어두워짐 */
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

/* 수정, 등록취소 <td> */
.updateTD, .cancelTD {
	cursor: default;
}
</style>

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
<link href="<%=request.getContextPath()%>/resources/css/include/common.css" rel="stylesheet" type="text/css">
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
.available {
	color: green;
	font-weight: bold;
}

.unavailable {
	color: gray;
	opacity: 0.7;
}

.disabled {
    color: gray;
    text-decoration: none;
    cursor: default;
    opacity: 0.7;
}

.selectDate, .selectDateAll {
	font-size: 10px;
}

/* 전체조회 및 날짜 선택을 위한 컨테이너 */
.selecetDateDiv {
    display: flex;
    justify-content: space-between; /* 양쪽으로 배치 */
    align-items: center; /* 세로로 가운데 정렬 */
    margin-bottom: 10px; /* 여유 공간 증가 */
}

/* 왼쪽 영역(전체조회) */
.left-div a {
    color: gray; /* 회색 글자 */
    opacity: 0.7; /* 투명도 */
    text-decoration: underline; /* 밑줄 */
    font-size: 14px; /* 글자 크기 */
    font-weight: normal; /* 글자 두께 */
    margin-left: 20px;
}

/* 오른쪽 영역(날짜 선택) */
.right-div {
    display: flex;
    justify-content: flex-end; /* 오른쪽 정렬 */
    margin-right: 20px;
}

.selectDateInput {
    border: 1px solid #e0e0e0; /* 테두리 색상 */
    border-radius: 16px; /* 둥글게 */
    padding: 8px; /* 여유 공간 */
    font-size: 14px;
    width: 160px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 */
    transition: border-color 0.3s ease;
}

.selectDateInput:focus {
    border-color: #1a5f92; /* 포커스 시 테두리 색상 */
    outline: none; /* 아웃라인 제거 */
}

</style>

<body class="starter-page-page">

	<%@ include file="/views/include/header.jsp"%>

	<main class="main">

		<!-- Page Title -->
		<div class="page-title accent-background">
			<div class="container">
				<h1>등록한 일정</h1>
				<nav class="breadcrumbs">
					<ol>
						<li><a href="index.jsp">Home</a></li>
					</ol>
				</nav>
			</div>
		</div>
		<!-- End Page Title -->

		<!-- Starter Section Section -->
		<section id="starter-section" class="starter-section section">

			<div class="container" data-aos="fade-up">
				<!-- 본문 작성 -->
				<div class="selecetDateDiv">
				    <div class="left-div">
				        <a href="/selectRegisteredPlanList">전체일정</a>
				    </div>
				    <div class="right-div">
				        <input type="date" class="selectDateInput" id="selectDateInput">
				    </div>
				</div>
				<table id="dataTable">
					<thead>
						<tr>
							<th>번호</th>
							<th>구장명</th>
							<th>일정 날짜</th>
							<th>일정 시간</th>
							<th>이용 시간</th>
							<th>예약 상태</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty registeredPlanList}">
								<c:forEach var="plan" items="${registeredPlanList}" varStatus="vs">
									<tr class="plan-row" data-plan-no="${plan.planNo}" onclick="location.href='/selectPlanDetail?planNo=${plan.planNo}'">
										<td style="display: none">
											<input id="hiddenPlanNo" value="${plan.planNo}">
										</td>
										<td>${vs.index + 1 + (paging.nowPage-1) * paging.numPerPage}</td>
										<td>${plan.field.fieldName}</td>
										<td>${plan.planDate}</td>
										<td>${plan.planTime}</td>
										<td>${plan.useTime}시간</td>
										<td>
											<c:choose>
												<c:when test="${plan.resStatus == 1}">
													<span class="available">예약</span>
												</c:when>
												<c:when test="${plan.resStatus == 0}">
													<span class="unavailable">없음</span>
												</c:when>
											</c:choose>
										</td>
										<td class="updateTD" onclick="event.stopPropagation();">
											<c:choose>
												<c:when test="${plan.resStatus == 1}">
													<a href="#" class="disabled" onclick="alert('예약상태인 일정은 수정이 불가능합니다.'); return false;">수정</a>
												</c:when>
												<c:otherwise>
													<a href="/updatePlan?planNo=${plan.planNo}" onclick="event.stopPropagation();">수정</a>
												</c:otherwise>
											</c:choose>
										</td>
										<td class="cancelTD" onclick="event.stopPropagation();">
											<c:choose>
												<c:when test="${plan.resStatus == 1}">
													<a href="#" class="disabled" onclick="alert('예약상태인 일정은 삭제가 불가능합니다.'); return false;">등록취소</a>
												</c:when>
												<c:otherwise>
													<a href="/deletePlan?planNo=${plan.planNo}" onclick="event.stopPropagation(); return confirm('등록한 일정을 삭제하시겠습니까?');">등록취소</a>
												</c:otherwise>
											</c:choose>
										</td>

									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="8">등록한 일정이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
						<tr class="plus-row" onclick="location.href='/insertPlan'">
							<td colspan="8">+</td>
						</tr>
					</tbody>
				</table>

				<!-- 페이징 버튼 -->
				<c:if test="${not empty paging}">
					<div class="center">
						<div class="pagination">
							<c:if test="${paging.prev}">
								<a href="/selectRegisteredPlanList?nowPage=${paging.pageBarStart - 1}" class="prev"> &laquo; </a>
							</c:if>

							<c:forEach var="i" begin="${paging.pageBarStart}" end="${paging.pageBarEnd}" step="1">
								<c:choose>
									<c:when test="${i == paging.nowPage}">
										<a href="/selectRegisteredPlanList?nowPage=${i}" class="active">${i}</a>
									</c:when>
									<c:otherwise>
										<a href="/selectRegisteredPlanList?nowPage=${i}">${i}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:if test="${paging.next}">
								<a href="/selectRegisteredPlanList?nowPage=${paging.pageBarEnd + 1}" class="next"> &raquo; </a>
							</c:if>
						</div>
					</div>
				</c:if>

			</div>

		</section>
		<!-- /Starter Section Section -->

	</main>

	<%@ include file="/views/include/footer.jsp"%>
	
	<!-- 직접 작성한 스크립트 -->
	<script>
	$(document).ready(function () {
	    $("#selectDateInput").on("change", function () {
	        let selectedDate = $(this).val();
	        
	        $.ajax({
	            url: "/selectPlanByDate",
	            type: "GET",
	            data: { planDate: selectedDate },
	            dataType: "JSON",
	            success: function (data) {
	            	console.log("서버 응답 데이터:", data); // 확인용
	                updateTable(data);
	            },
	            error: function () {
	                alert("일정 데이터를 불러오는데 실패했습니다.");
	            }
	        });
	    });
	});

	function updateTable(data) {
	    let tbody = $("#dataTable tbody");
	    tbody.empty(); // 기존 데이터 삭제

	    // 받은 데이터가 비어 있지 않다면
	    if (data.length > 0) {
	        data.forEach((plan, index) => {
	            let row = 
	                "<tr class='plan-row' data-plan-no='" + plan.planNo + "' onclick=\"location.href='/selectPlanDetail?planNo=" + plan.planNo + "'\">" +
	                    "<td style='display: none'>" +
	                        "<input id='hiddenPlanNo' value='" + plan.planNo + "'>" +
	                    "</td>" +
	                    "<td>" + (index + 1) + "</td>" +
	                    "<td>" + plan.fieldName + "</td>" +
	                    "<td>" + plan.planDate + "</td>" +
	                    "<td>" + plan.planTime + "</td>" +
	                    "<td>" + plan.useTime + "시간</td>" +
	                    "<td>" + 
	                        (plan.resStatus == 1 ? "<span class='available'>예약</span>" : "<span class='unavailable'>없음</span>") +
	                    "</td>" +
	                    "<td class='updateTD' onclick='event.stopPropagation();'>" +
	                        (plan.resStatus == 1 ? 
	                            "<a href='#' class='disabled' onclick=\"alert('예약상태인 일정은 수정이 불가능합니다.'); return false;\">수정</a>" : 
	                            "<a href='/updatePlan?planNo=" + plan.planNo + "'>수정</a>") +
	                    "</td>" +
	                    "<td class='cancelTD' onclick='event.stopPropagation();'>" +
	                        (plan.resStatus == 1 ? 
	                            "<a href='#' class='disabled' onclick=\"alert('예약상태인 일정은 삭제가 불가능합니다.'); return false;\">등록취소</a>" : 
	                            "<a href='/deletePlan?planNo=" + plan.planNo + "' onclick='return confirm(\"등록한 일정을 삭제하시겠습니까?\");'>등록취소</a>") +
	                    "</td>" +
	                "</tr>";
	            tbody.append(row);
	        });
	    } else {
	        // 일정이 없을 경우
	        tbody.append("<tr><td colspan='8'>선택된 날짜에 일정이 없습니다.</td></tr>");
	    }
	}

	</script>
	
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