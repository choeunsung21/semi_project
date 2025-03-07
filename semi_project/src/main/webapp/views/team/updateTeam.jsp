<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.gn.team.vo.Team" %>
<%@ page import="com.gn.team.service.TeamService" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>팀 수정</title>
<link href='<%=request.getContextPath()%>/resources/css/kdy.css' rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
<div class="container mt-4">
    <h3 class="text-center">팀 수정</h3>
       <form action="<%=request.getContextPath()%>/updateTeamEnd" method="post">
        <input type="hidden" name="team_no" value="${team.teamNo}"> <!-- 팀 번호 추가 -->

        <label for="teamName">팀 이름 :</label>
        <input type="text" id="teamName" name="team_name" value="${team.teamName}" required><br>

        <label for="teamArea">활동 지역:</label>
        <input type="text" id="teamArea" name="team_area" value="${team.teamArea}" required><br>

        <button type="submit" class="btn btn-primary">수정 완료</button>
    </form>
</div>
</body>
</html>