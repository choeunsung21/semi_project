<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내 팀</title>
</head>
<body>
    <h2>내 팀</h2>
    <c:if test="${not empty sessionScope.message}">
        <p style="color: green;">${sessionScope.message}</p>
        <c:remove var="message" scope="session"/>
    </c:if>
    <table border="1">
        <tr>
            <th>팀 번호</th>
            <th>팀 이름</th>
            <th>작업</th>
        </tr>
        <c:forEach var="team" items="${myTeamList}">
            <tr>
                <td>${team.teamNo}</td>
                <td>${team.teamName}</td>
                <td>
 					<form action="<%= request.getContextPath() %>/deletePlayer" method="post">
    					<input type="hidden" name="teamNo" value="${team.teamNo}">
    					<button type="submit">팀 탈퇴</button>
					</form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>