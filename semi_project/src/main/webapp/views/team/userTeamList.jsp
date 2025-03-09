<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>일반 사용자 목록</title>
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/resources/css/include/common.css" rel="stylesheet" type="text/css">

    <!-- 부트스트랩 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- kyk include css -->
    <link href="<%= request.getContextPath() %>/resources/css/kdy.css" rel="stylesheet">
</head>
<body>
<%@ include file="/views/include/header.jsp" %>
<div class="container mt-4">
    <h3 class="text-center">일반사용자 목록</h3>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>번호</th>
                <th>팀 이름</th>
                <th>활동 지역</th>
                <th>팀 실력</th>
                <th>현재 인원</th>
                <th>관리</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty list}">
                    <%-- <c:set var="startNum" value="${(page.nowPage - 1) * page.numPerPage + 1}"/> --%>
                    <c:forEach var="team" items="${list}" varStatus="vs">
                        <tr>
                            <td>${startNum + vs.index}</td>
                            <td>${team.teamName}</td>
                            <td>${team.teamArea}</td>
                            <td>${team.teamLevel}</td>
                            <td>${team.teamCount}/${team.teamLimit}</td>
                            <td>
                                <a href="teamDetail?teamNo=${team.teamNo}" class="btn btn-primary">상세보기</a>
<%--                                 <a href="updateTeam?teamNo=${team.teamNo}" class="btn btn-warning">수정</a> --%>
<%--                                 <button class="btn btn-danger" onclick="deleteTeam(${team.teamNo})">삭제</button> --%>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="6" class="text-center">등록된 팀이 없습니다.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>

    <!-- 페이징 처리 -->
    <c:if test="${not empty page}">
        <div class="d-flex justify-content-center">
            <ul class="pagination">
                <c:if test="${page.prev}">
                    <li class="page-item"><a class="page-link" href="teamList?nowPage=${page.pageBarStart-1}&teamName=${empty page.teamName ? '' : page.teamName}">&laquo;</a></li>
                </c:if>
                <c:forEach var="i" begin="${page.pageBarStart}" end="${page.pageBarEnd}">
                    <li class="page-item"><a class="page-link" href="teamList?nowPage=${i}&teamName=${empty page.teamName ? '' : page.teamName}">${i}</a></li>
                </c:forEach>
                <c:if test="${page.next}">
                    <li class="page-item"><a class="page-link" href="teamList?nowPage=${page.pageBarEnd+1}&teamName=${empty page.teamName ? '' : page.teamName}">&raquo;</a></li>
                </c:if>
            </ul>
        </div>
    </c:if>
</div>

<script>
function deleteTeam(teamNo) {
    if (confirm("정말로 삭제하시겠습니까?")) {
        fetch('deleteTeam?teamNo=' + teamNo, {
            method: 'POST'
        })
        .then(response => {
            if (response.ok) {
                alert("삭제되었습니다.");
                location.reload();
            } else {
                alert("삭제 실패했습니다.");
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert("삭제 중 오류가 발생했습니다.");
        });
    }
}
</script>
</body>
</html>