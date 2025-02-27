<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 가입 신청</title>
<link href='<%=request.getContextPath()%>/resources/css/kdy.css' rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
    <h1>팀 가입 신청</h1>
    <form action="<c:url value='/teamList'/>" method="post">
        <fieldset>
            <legend>가입 정보 입력</legend>
            <label for="teamNo">팀 번호:</label>
            <input type="number" id="teamNo" name="team_no" required><br>

            <label for="userNo">회원 번호:</label>
            <input type="number" id="userNo" name="user_no" required><br>

            <label for="message">가입 메시지:</label>
            <textarea id="message" name="message" placeholder="가입하고 싶은 이유를 적어주세요." required></textarea><br>

            <input type="submit" value="신청하기">
        </fieldset>
    </form>
</body>
</html>