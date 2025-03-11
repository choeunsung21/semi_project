<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>팀장 - 받은 신청 목록</title>
</head>
<body>
    <h2>받은 신청 목록</h2>
    <c:if test="${not empty sessionScope.message}">
        <p>${sessionScope.message}</p>
        <c:remove var="message" scope="session"/>
    </c:if>
    <table border="1">
        <tr><th>신청 번호</th><th>사용자</th><th>팀</th><th>포지션</th><th>지역</th><th>소개</th><th>처리</th></tr>
        <c:forEach var="apply" items="${applyList}">
            <tr>
                <td>${apply.applyNo}</td>
                <td>${apply.userNo}</td>
                <td>${apply.teamNo}</td>
                <td>${apply.position}</td>
                <td>${apply.applyArea}</td>
                <td>${apply.applyExplanation}</td>
                <td>
                    <form action="<%= request.getContextPath() %>/approveApply" method="post">
                        <input type="hidden" name="applyNo" value="${apply.applyNo}">
                        <input type="hidden" name="userNo" value="${apply.userNo}">
                        <input type="hidden" name="teamNo" value="${apply.teamNo}">
                        <button type="submit">승인</button>
                    </form>
                    <form action="<%= request.getContextPath() %>/rejectApply" method="post">
                        <input type="hidden" name="applyNo" value="${apply.applyNo}">
                        <button type="submit">거절</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>