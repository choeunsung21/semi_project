<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>가입 신청 목록</title>
</head>
<body>
    <h2>가입 신청 목록</h2>
    <c:if test="${not empty sessionScope.message}">
        <p style="color: green;">${sessionScope.message}</p>
        <c:remove var="message" scope="session"/> <!-- 메시지 한 번 표시 후 삭제 -->
    </c:if>
	<table border="1">
    <tr>
        <th>신청 번호</th>
        <th>사용자</th>
        <th>팀 이름</th>
        <th>포지션</th>
        <th>신청 지역</th>
        <th>설명</th>
        <th>상태</th>
        <th>승인/거절</th>
    </tr>
    <c:forEach var="apply" items="${applyList}">
        <tr>
            <td>${apply.applyNo}</td>
            <td>${apply.username}</td>
            <td>${apply.teamName}</td>
            <td>${apply.position}</td>
            <td>${apply.applyArea}</td>
            <td>${apply.applyExplanation}</td>
            <td>${apply.status}</td>
            <td>
                <form action="approveApply" method="post">
                    <input type="hidden" name="applyNo" value="${apply.applyNo}">
                    <button type="submit" name="action" value="APPROVED">승인</button>
                    <button type="submit" name="action" value="REJECTED">거절</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>