<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>보낸 가입 신청 목록</title>
    <link href='<%=request.getContextPath()%>/resources/css/kdy.css' rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
    <h1>보낸 가입 신청 목록</h1>
    <table border="1">
        <thead>
            <tr>
                <th>팀 이름</th>
                <th>활동 지역</th>
                <th>성별</th>
                <th>팀 실력</th>
                <th>최대 인원</th>
                <th>팀 설명</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="team" items="${sendTeamList}">
                <tr>
                    <td>${team.teamName}</td>
                    <td>${team.teamArea}</td>
                    <td>${team.userGender}</td>
                    <td>${team.teamLevel}</td>
                    <td>${team.teamCount}</td>
                    <td>${team.teamExplanation}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="<c:url value='/insertTeam.jsp'/>">팀 생성하기</a>
</body>
</html>