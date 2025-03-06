<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>팀 상세 정보</title>
    <meta name="description" content="">
    <meta name="keywords" content="">

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <!-- Vendor CSS Files (Bootstrap만 유지) -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

    <!-- Main CSS File -->
    <link href="<%= request.getContextPath() %>/resources/css/include/common.css" rel="stylesheet" type="text/css">

    <style>
        .centered-content {
            text-align: center;
        }
        .btn-block {
            display: block;
            margin: 10px auto;
            width: 200px;
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
                    <ol class="breadcrumb justify-content-center">
                        <li class="breadcrumb-item"><a href="index.jsp">메인으로</a></li>
                    </ol>
                </nav>
            </div>
        </div><!-- End Page Title -->

        <!-- Team Detail Section -->
        <section id="team-detail-section" class="section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <h2 class="centered-content mb-4">팀 상세 정보</h2>
                        <table class="table table-bordered text-center">
                            <tbody>
                                <tr>
                                    <th scope="row">팀 이름</th>
                                    <td>${team.teamName}</td>
                                </tr>
                                <tr>
                                    <th scope="row">팀장 번호</th>
                                    <td>${team.leaderNo}</td>
                                </tr>
                                <tr>
                                    <th scope="row">활동 지역</th>
                                    <td>${team.teamArea}</td>
                                </tr>
                                <tr>
                                    <th scope="row">현재 팀원 수</th>
                                    <td>${team.teamCount}</td>
                                </tr>
                            </tbody>
                        </table>

                        <h3 class="centered-content mb-3">팀 설명</h3>
                        <textarea class="form-control" rows="5" style="font-size: 16px; resize: none;" readonly>${team.teamExplanation}</textarea>

                        <!-- 버튼 그룹 -->
                        <div class="text-center mt-4">
                            <a href="${pageContext.request.contextPath}/teamList" class="btn btn-secondary btn-block">목록으로 돌아가기</a>
                            <!-- 팀 가입 신청 버튼 (모달 트리거) -->
                            <button type="button" class="btn btn-primary btn-block" data-bs-toggle="modal" data-bs-target="#joinTeamModal">팀 가입 신청</button>
                        </div>
                    </div>
                </div>
            </div>
        </section><!-- /Team Detail Section -->

        <!-- 팀 가입 신청 모달 -->
        <div class="modal fade" id="joinTeamModal" tabindex="-1" aria-labelledby="joinTeamModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="joinTeamModalLabel">팀 가입 신청</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="joinTeamForm" action="<%= request.getContextPath() %>/createTeamEnd" method="post">
                            <input type="hidden" name="teamNo" value="${team.teamNo}">
                            <input type="hidden" name="userNo" value="${sessionScope.userNo}">

                            <div class="mb-3">
                                <label for="position" class="form-label">포지션</label>
                                <input type="text" class="form-control" id="position" name="position" required>
                            </div>

                            <div class="mb-3">
                                <label for="activityArea" class="form-label">활동 지역</label>
                                <input type="text" class="form-control" id="activityArea" name="activityArea" required>
                            </div>

                            <div class="mb-3">
                                <label for="introduction" class="form-label">소개글</label>
                                <textarea class="form-control" id="introduction" name="introduction" rows="3" required></textarea>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                        <button type="submit" class="btn btn-primary" form="joinTeamForm">신청 완료</button>
                    </div>
                </div>
            </div>
        </div><!-- /팀 가입 신청 모달 -->
    </main>

    <%@ include file="/views/include/footer.jsp" %>

    <!-- Scroll Top -->
    <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- Preloader -->
    <div id="preloader"></div>

    <!-- Vendor JS Files (Bootstrap만 유지) -->
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Main JS File -->
    <script src="/resources/js/common.js"></script>

    <!-- 모달 제출 후 리다이렉션 스크립트 -->
    <script>
        document.getElementById('joinTeamForm').addEventListener('submit', function(event) {
            event.preventDefault(); // 기본 폼 제출 방지

            // 폼 데이터 전송 (AJAX 사용)
            const form = this;
            const formData = new FormData(form);

            fetch(form.action, {
                method: 'POST',
                body: formData
            })
            .then(response => {
                if (response.ok) {
                    alert('팀 가입 신청이 완료되었습니다.');
                    // 모달 닫기
                    const modal = bootstrap.Modal.getInstance(document.getElementById('joinTeamModal'));
                    modal.hide();
                    // 팀 목록 페이지로 리다이렉션
                    window.location.href = '<%= request.getContextPath() %>/teamList';
                } else {
                    alert('가입 신청에 실패했습니다.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('오류가 발생했습니다.');
            });
        });
    </script>
</body>
</html>