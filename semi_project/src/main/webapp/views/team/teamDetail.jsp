<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>팀 상세 정보</title>
</head>
<body>
    <h2>팀 상세 정보</h2>
		<table border="1">
    <tr>
        <th>팀 이름:</th>
        <td>${team.teamName}</td>
    </tr>
    <tr>
        <th>팀장 번호:</th>
        <td>${team.leaderNo}</td>
    </tr>
    <tr>
        <th>활동 지역:</th>
        <td>${team.teamArea}</td>
    </tr>
    <tr>
        <th>현재 팀원 수:</th>
        <td>${team.teamCount}</td>
    </tr>
</table>

<h3>팀 설명</h3>
<textarea rows="5" cols="50" style="font-size: 16px;">
    ${team.teamExplanation}
</textarea>
    <br>
    <a href="teamList">팀 목록으로 돌아가기</a>
    <a href="createTeam">팀 가입신청</a>
</body>
</html>