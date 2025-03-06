<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>팀 가입 신청</title>
</head>
<body>
    <h2>팀 가입 신청</h2>
    <form action="<%= request.getContextPath() %>/insertApply" method="post">
        <input type="hidden" name="teamNo" value="${teamNo}">
        <div>
            <label for="position">포지션:</label>
            <input type="text" id="position" name="position" required>
        </div>
        <div>
            <label for="applyArea">활동 지역:</label>
            <input type="text" id="applyArea" name="applyArea" required>
        </div>
        <div>
            <label for="applyExplanation">소개글:</label>
            <textarea id="applyExplanation" name="applyExplanation" required></textarea>
        </div>
        <button type="submit">신청</button>
    </form>
</body>
</html>