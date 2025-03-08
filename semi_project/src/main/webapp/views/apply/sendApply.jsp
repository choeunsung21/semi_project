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
                            <th>팀명</th>
                            <th>팀장</th>
                            <th>지역</th>
                            <th>수준</th>
                            <th>상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty applyList}">
                                <c:forEach var="applyList" items="${applyList}">
                                    <tr>
                                        <td>${applyList.teamName}</td>
                                        <td>${applyList.userName}</td>
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
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/js/common.js"></script>
</body>
</html>