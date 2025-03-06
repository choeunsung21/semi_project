<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>보낸 가입 신청 목록</title>
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/resources/css/include/common.css" rel="stylesheet">
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <%@ include file="/views/include/header.jsp" %>
    <div class="container mt-5">
        <h3 class="text-center mb-4">보낸 가입 신청 목록</h3>
        <table class="table table-hover text-center">
            <thead class="table-dark">
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
                    <c:when test="${not empty receiveList}">
                        <c:forEach var="user" items="${receiveList}" varStatus="vs">
                            <tr>
                                <td>${vs.index + 1}</td>
                                <td>${user.userName}</td>
                                <td>${user.userPhone}</td>
                                <td>${user.regDate}</td>
                                <td>
                                    <button class="btn btn-success btn-sm" onclick="updateTeam(${user.userNo})">수정</button>
                                    <button class="btn btn-danger btn-sm" onclick="deleteTeam(${user.userNo})">삭제</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="5">등록된 결과가 없습니다.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>