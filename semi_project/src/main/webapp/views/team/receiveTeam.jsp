<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>받은 신청 목록</title>
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/resources/css/include/common.css" rel="stylesheet" type="text/css">
</head>
<body>
    <%@ include file="/views/include/header.jsp" %>
    <main class="main">
        <div class="page-title accent-background">
            <div class="container">
                <h1 class="text-center">받은 신청 목록</h1>
            </div>
        </div>
        <section class="section">
            <div class="container">
                <table class="table table-hover text-center">
                    <thead>
                        <tr>
                            <th>팀 번호</th>
                            <th>포지션</th>
                            <th>활동 지역</th>
                            <th>소개글</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="app" items="${receivedApplications}">
                            <tr>
                                <td>${app.teamNo}</td>
                                <td>${app.position}</td>
                                <td>${app.activityArea}</td>
                                <td>${app.introduction}</td>
                                <td>
                                    <c:if test="${app.status == 'PENDING'}">
                                        <button class="btn btn-success btn-sm" onclick="updateStatus(${app.applicationId}, 'APPROVED')">승인</button>
                                        <button class="btn btn-danger btn-sm" onclick="updateStatus(${app.applicationId}, 'REJECTED')">거절</button>
                                    </c:if>
                                    <c:if test="${app.status != 'PENDING'}">
                                        ${app.status}
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>
    </main>
    <%@ include file="/views/include/footer.jsp" %>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/js/common.js"></script>
    <script>
        function updateStatus(applicationId, status) {
            if (confirm(status === 'APPROVED' ? '승인하시겠습니까?' : '거절하시겠습니까?')) {
                fetch('<%= request.getContextPath() %>/updateApplicationStatus', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                    body: 'applicationId=' + applicationId + '&status=' + status
                })
                .then(response => {
                    if (response.ok) {
                        alert(status === 'APPROVED' ? '승인되었습니다.' : '거절되었습니다.');
                        location.reload();
                    } else {
                        alert('상태 업데이트에 실패했습니다.');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('오류가 발생했습니다.');
                });
            }
        }
    </script>
</body>
</html>