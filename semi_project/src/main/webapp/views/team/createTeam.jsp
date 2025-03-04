<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 신청</title>
<link href='<%=request.getContextPath()%>/resources/css/kdy.css' rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
        <input type="hidden" name="user_no" value="1">
	    <button type="submit">신청하기</button>
</form>

<script>
    function showAlert() {
        alert("신청 성공되었습니다.");
        window.location.href = "<%=request.getContextPath()%>/teamList"; // 팀 목록 페이지로 이동
        return false; // 폼 제출을 방지
    }
</script>
</body>
</html>
    
<!--     		
 		<label for="position">포지션:</label>
           <select id="position" name="position" required>
               <option value="1">미드필더</option>
               <option value="2">서포터</option>
               <option value="3">슈터</option>
           </select><br>
        <label for="activityTime">활동 시간:</label>
         	<select id="activityTime" name="activityTime" required>
                <option value="1">10:00-12:00</option>
                <option value="2">12:00-14:00</option>
                <option value="3">14:00-16:00</option>
                <option value="4">16:00-18:00</option>
                <option value="5">18:00-20:00</option>
         	</select><br>
         <label for="content">소개글:</label>
         <textarea id="content" name="content" placeholder="자기소개를 적어주세요." required></textarea><br> -->