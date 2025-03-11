<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내 신청 목록</title>
</head>
<body>
    <h2>내가 보낸 신청 목록</h2>
    <table border="1">
        <tr><th>신청 번호</th><th>팀</th><th>포지션</th><th>지역</th><th>소개</th><th>상태</th></tr>
        <c:forEach var="apply" items="${applyList}">
            <tr>
                <td>${apply.applyNo}</td>
                <td>${apply.teamNo}</td>
                <td>${apply.position}</td>
                <td>${apply.applyArea}</td>
                <td>${apply.applyExplanation}</td>
                <td>${apply.status}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>