<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>보낸 신청 목록</title>
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/resources/css/include/common.css" rel="stylesheet" type="text/css">
</head>
<body>
    <%@ include file="/views/include/header.jsp" %>
    <main class="main">
        <div class="page-title accent-background">
            <div class="container">
                <h1 class="text-center">보낸 신청 목록</h1>
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
                            <th>상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty sentApplications}">
                                <c:forEach var="app" items="${sentApplications}">
                                    <tr>
                                        <td>${app.teamNo}</td>
                                        <td>${app.position}</td>
                                        <td>${app.activityArea}</td>
                                        <td>${app.introduction}</td>
                                        <td>${app.status}</td>
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
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/js/common.js"></script>
</body>
</html>