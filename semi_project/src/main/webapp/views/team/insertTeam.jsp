<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 생성</title>
<link href='<%=request.getContextPath()%>/resources/css/kdy.css' rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
    <h1>팀 생성</h1>
    <form id="teamForm" action="<%=request.getContextPath()%>/insertTeamEnd" method="post">
        <label for="teamName">팀 이름 :</label>
        <input type="text" id="teamName" name="team_name" required><br>

        <label for="teamArea">활동 지역:</label>
        <input type="text" id="teamArea" name="team_area" required>
        <button type="button" onclick="searchAddress()">주소 검색</button><br>

        <label for="userGender">성별 :</label>
        <input type="radio" value="남" name="prefer_gender" required> 남
        <input type="radio" value="여" name="prefer_gender"> 여
        <input type="radio" value="무관" name="prefer_gender"> 성별 무관<br>

        <label for="teamLevel">팀 실력 :</label>
        <select name="team_level" required>
            <option value="">선택하세요.</option>
            <option value="1">초보1</option>
            <option value="2">초보2</option>
            <option value="3">초보3</option>
            <option value="4">일반</option>
            <option value="5">중급</option>
            <option value="6">고급</option>
        </select><br>

        <label for="teamLimit">팀 정원 :</label>
        <input type="number" name="team_limit" required><br>

		<label for="teamExplanation">팀 설명 :</label>
		<textarea name="team_explanation" required oninput="checkLength(this)"></textarea>
<!-- 		<div id="charCount">0/100</div>
		<div id="message" style="color:red;"></div><br> -->
        <input type="hidden" name="user_no" value="1">
        <button type="submit">팀 생성</button>
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
</script>
<script>
		function checkLength(textarea) {
    		const maxLength = 100;
    		const currentLength = textarea.value.length;
    		const charCountDiv = document.getElementById('charCount');
    		const messageDiv = document.getElementById('message');

    			charCountDiv.textContent = `${currentLength}/${maxLength}`;

    	if (currentLength > maxLength) {
        	messageDiv.textContent = "100자를 초과할 수 없습니다.";
        	textarea.value = textarea.value.substring(0, maxLength);
    	} else {
        	messageDiv.textContent = "";
    	}
	}
</script>

</body>
</html>
