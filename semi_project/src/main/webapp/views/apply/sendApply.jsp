<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>보낸 신청 목록</title>
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
  ======================================================== -->>
</head>
<body>
    <%@ include file="/views/include/header.jsp" %>
    <main class="main">
        <div class="page-title accent-background">
            <div class="container">
                <h1 class="text-center">보낸 신청 목록</h1>
                <nav class="breadcrumbs">
					<ol>
						<li><a href="javascript:void(0);">가입 신청한 팀의 정보를 볼 수 있습니다.</a></li>
					</ol>
				</nav>
            </div>
        </div>
        <section class="section">
            <div class="container">
                <table class="table table-hover text-center">
                    <thead>
                        <tr>
                            <th>팀 이름</th>
                            <th>팀장 아이디</th>
                            <th>활동 지역</th>
                            <th>팀 수준</th>
                            <th>상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty applyList}">
                                <c:forEach var="applyList" items="${applyList}">
                                    <tr>
                                        <td>${applyList.teamName}</td>
                                        <td>${applyList.userId}</td>
                                        <td>${applyList.teamArea}</td>
										<td>
   											<c:choose>
       											<c:when test="${applyList.teamLevel == 1}">초보1</c:when>
        										<c:when test="${applyList.teamLevel == 2}">초보2</c:when>
        										<c:when test="${applyList.teamLevel == 3}">초보3</c:when>
       											<c:when test="${applyList.teamLevel == 4}">일반</c:when>
        										<c:when test="${applyList.teamLevel == 5}">중급</c:when>
        										<c:when test="${applyList.teamLevel == 6}">고급</c:when>
    										</c:choose>
										</td>
										<td>
    										<c:choose>
       											<c:when test="${applyList.status == 'PENDING'}">
            										<span style="color: orange; font-weight: bold;">대기중</span>
        										</c:when>
        										<c:when test="${applyList.status == 'APPROVED'}">
            										<span style="color: green; font-weight: bold;">수락</span>
        										</c:when>
        										<c:when test="${applyList.status == 'REJECTED'}">
            										<span style="color: red; font-weight: bold;">거절</span>
        										</c:when>
    										</c:choose>
										</td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="5">보낸 신청이 없습니다.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </section>
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