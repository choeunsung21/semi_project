<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>신청 성공</title>
</head>
<body>
    <h1>팀 가입 신청이 성공적으로 완료되었습니다!</h1>
    <p>팀 목록 페이지로 이동합니다...</p>
    <script>
        // 3초 후에 팀 목록으로 리다이렉트
        setTimeout(function() {
            window.location.href = "<%=request.getContextPath()%>/teamList";
        }, 3000);
    </script>
</body>
</html>