<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>팀 상세 정보 - OnePage Bootstrap Template</title>
    <meta name="description" content="">
    <meta name="keywords" content="">

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Main CSS File -->
    <link href="<%= request.getContextPath() %>/resources/css/include/common.css" rel="stylesheet" type="text/css">

    <style>
        .centered-content {
            text-align: center;
        }
        .btn-block {
            display: block;
            margin: 10px auto; /* 버튼과 다른 요소 간의 간격 조정 */
            width: 200px; /* 버튼의 고정 너비 설정 */
        }
    </style>

</head>

<body class="starter-page-page">

    <%@ include file="/views/include/header.jsp" %>

    <main class="main">

        <!-- Page Title -->
        <div class="page-title accent-background">
            <div class="container">
                <h1 class="text-center">팀 상세 정보</h1>
                <nav class="breadcrumbs">
                    <ol>
                        <li><a href="${pageContext.request.contextPath}/index.html">Home</a></li>
                        <li class="current">팀 상세 정보</li>
                    </ol>
                </nav>
            </div>
        </div><!-- End Page Title -->

        <!-- Team Detail Section -->
        <section id="team-detail-section" class="team-detail-section section">
            <div class="container" data-aos="fade-up">
                <h2 class="centered-content">팀 상세 정보</h2>
                <table class="table text-center">
                    <tr>
                        <th>팀 이름:</th>
                        <td>${team.teamName}</td>
                    </tr>
                    <tr>
                        <th>팀장 번호:</th>
                        <td>${team.leaderNo}</td>
                    </tr>
                    <tr>
                        <th>활동 지역:</th>
                        <td>${team.teamArea}</td>
                    </tr>
                    <tr>
                        <th>현재 팀원 수:</th>
                        <td>${team.teamCount}</td>
                    </tr>
                </table>

                <h3 class="centered-content">팀 설명</h3>
                <textarea rows="5" cols="50" style="font-size: 16px; display: block; margin: 0 auto;" readonly>
                    ${team.teamExplanation}
                </textarea>
                
                <!-- 목록으로 돌아가기 버튼 -->
                <a href="${pageContext.request.contextPath}/teamList" class="btn btn-secondary btn-block">목록으로 돌아가기</a>
                
                <!-- 팀 가입 신청 버튼 -->
                <form action="<%= request.getContextPath() %>/createTeamEnd" method="post" class="centered-content">
                    <input type="hidden" name="teamNo" value="${team.teamNo}">
                    <input type="hidden" name="userNo" value="${sessionScope.userNo}">
                    <button type="submit" class="btn btn-primary btn-block">팀 가입 신청</button>
                </form>
            </div>
        </section><!-- /Team Detail Section -->

    </main>

    <%@ include file="/views/include/footer.jsp" %>

    <!-- Scroll Top -->
    <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- Preloader -->
    <div id="preloader"></div>

    <!-- Vendor JS Files -->
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/aos/aos.js"></script>
    <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

    <!-- Main JS File -->
    <script src="/resources/js/common.js"></script>

</body>

</html>