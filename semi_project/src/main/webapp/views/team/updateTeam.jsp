<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>팀 정보 수정</title>
</head>
<body>
    <h2>팀 정보 수정</h2>
    <form action="updateTeamProcess" method="post">
        <input type="hidden" name="teamNo" value="${team.teamNo}"/>
        <div>
            <label for="teamName">팀 이름:</label>
            <input type="text" id="teamName" name="teamName" value="${team.teamName}" required/>
        </div>
        <div>
            <label for="teamArea">활동 지역:</label>
            <input type="text" id="teamArea" name="teamArea" value="${team.teamArea}" required/>
        </div>
        <div>
            <label for="teamLevel">팀 실력:</label>
            <input type="text" id="teamLevel" name="teamLevel" value="${team.teamLevel}" required/>
        </div>
        <div>
            <label for="teamCount">현재 팀원 수:</label>
            <input type="number" id="teamCount" name="teamCount" value="${team.teamCount}" required/>
        </div>
        <button type="submit">수정</button>
        <a href="teamList.jsp">취소</a>
    </form>
</body>
</html>