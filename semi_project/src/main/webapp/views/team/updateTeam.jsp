<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.gn.team.vo.Team" %>
<%@ page import="com.gn.team.service.TeamService" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>팀 수정</title>
    <meta name="description" content="">
    <meta name="keywords" content="">

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Fonts (Bootstrap 템플릿에서 사용된 폰트) -->
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <!-- Vendor CSS Files (Bootstrap만 유지) -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

    <!-- Main CSS File -->
    <link href="<%= request.getContextPath() %>/resources/css/include/common.css" rel="stylesheet" type="text/css">
    <link href="<%= request.getContextPath() %>/resources/css/kdy.css" rel="stylesheet" type="text/css">

    <!-- jQuery (기존 유지) -->
    <script src="<%= request.getContextPath() %>/resources/js/jquery-3.7.1.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
    <%@ include file="/views/include/header.jsp" %>

    <main class="main">
        <!-- Page Title (Bootstrap 스타일 적용) -->
        <div class="page-title accent-background">
            <div class="container">
                <h1 class="text-center">팀 수정</h1>
                <nav class="breadcrumbs">
                    <ol class="breadcrumb justify-content-center">
                        <li class="breadcrumb-item"><a href="index.jsp">메인으로</a></li>
                    </ol>
                </nav>
            </div>
        </div><!-- End Page Title -->

        <!-- Team Update Section -->
        <section id="team-update" class="section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <h3 class="text-center mb-4">팀 수정</h3>
                        <form action="<%= request.getContextPath() %>/updateTeamEnd" method="post">
                            <input type="hidden" name="team_no" value="${team.teamNo}">

                            <div class="mb-3">
                                <label for="teamName" class="form-label">팀 이름:</label>
                                <input type="text" class="form-control" id="teamName" name="team_name" value="${team.teamName}" required>
                            </div>

                            <div class="mb-3">
                                <label for="teamArea" class="form-label">활동 지역:</label>
                                <input type="text" class="form-control" id="teamArea" name="team_area" value="${team.teamArea}" required>
                                <button type="button" onclick="searchAddress()">주소 검색</button><br>
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">수정 완료</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section><!-- /Team Update Section -->
    </main>

    <%@ include file="/views/include/footer.jsp" %>

    <!-- Scroll Top -->
    <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- Preloader -->
    <div id="preloader"></div>

    <!-- Vendor JS Files (Bootstrap만 유지) -->
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Main JS File -->
    <script src="<%= request.getContextPath() %>/resources/js/common.js"></script>
    <script>
       function searchAddress() {
           new daum.Postcode({
           oncomplete: function(data) {
             var city = data.sido; // 시/도
             var district = data.sigungu; // 시/군/구
                 document.getElementById('teamArea').value = city + " " + district;
               }
          }).open();
     }
</script>
</body>
</html>