<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>팀 신청</title>
    <link href='<%=request.getContextPath()%>/resources/css/kdy.css' rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
    <h1>팀 신청</h1>
    <form id="teamForm" action="<%=request.getContextPath()%>/createTeamEnd" method="post" onsubmit="return showAlert();">
        <label for="teamLevel">실력 :</label>
        <select name="team_level" required>
            <option value="">선택하세요.</option>
            <option value="1">초보1</option>
            <option value="2">초보2</option>
            <option value="3">초보3</option>
            <option value="4">일반</option>
            <option value="5">중급</option>
            <option value="6">고급</option>
        </select><br>
        
        <label for="teamArea">활동 지역:</label>
        <input type="text" id="teamArea" name="team_area" placeholder="oo시 oo구" required>
        <button type="button" onclick="searchAddress()">주소 검색</button><br>

        <label for="userGender">성별 :</label>
        <input type="radio" value="남" name="prefer_gender" required> 남
        <input type="radio" value="여" name="prefer_gender"> 여
        <br>

        <label for="teamExplanation">소개글 :</label>
        <textarea name="team_explanation" required></textarea><br>
        
        
        <input type="hidden" name="user_no" value="${team.userNo}">  
        <input type="hidden" name="team_no" value="${team.teamNo}">
        
        <button type="submit">신청하기</button>
    </form>

    <script>
        function searchAddress() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var city = data.sido; // 시/도
                    var district = data.sigungu; // 시/군/구
                    document.getElementById('teamArea').value = city + " " + district;
                }
            }).open();
        }

        function showAlert() {
            alert("신청 성공되었습니다.");
            return true; // 폼 제출을 허용
        }
    </script>
</body>
</html>