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
            <th>번호</th>
            <th>사용자 번호</th>
            <th>팀 번호</th>
            <th>포지션</th>
            <th>활동 지역</th>
            <th>소개글</th>
        </tr>
        <c:forEach var="apply" items="${applyList}">
            <tr>
                <td>${apply.applyNo}</td>
                <td>${apply.userNo}</td>
                <td>${apply.teamNo}</td>
                <td>${apply.position}</td>
                <td>${apply.applyArea}</td>
                <td>${apply.applyExplanation}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>