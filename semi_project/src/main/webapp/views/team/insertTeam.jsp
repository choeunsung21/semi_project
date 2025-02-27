<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 생성</title>
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
        <textarea name="team_explanation" required></textarea><br>

        <input type="hidden" name="user_no" value="1">
        <button type="submit">팀 생성</button>
    </form>
</body>
</html>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 생성</title>
<link href='<%=request.getContextPath()%>/resources/css/kdy.css' rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
    <h1>팀 생성</h1>
    <form id="teamForm">
        <label for="teamName">팀 이름 :</label>
        <input type="text" id="teamName" name="team_name" maxlength="12" placeholder="12글자 이내 한글 또는 영어로 입력" required><br>
        
        <label for="teamArea">활동 지역:</label>
        <input type="text" id="teamArea" name="team_area" required placeholder="oo시 oo구까지만 주소가 나옵니다.">
        <button type="button" onclick="searchAddress()">주소 검색</button>
        <br>
        
        <label for="userGender">성별 :</label>
        <label for="male">남자</label>
        <input type="radio" value="1" id="male" name="prefer_gender">
        <label for="female">여자</label>
        <input type="radio" value="2" id="female" name="prefer_gender">
        <label for="gender">성별 무관</label>
        <input type="radio" value="3" id="gender" name="prefer_gender"><br>
        
        
        <label for="teamLimit">팀 정원 :</label>
        <input type="number" id="teamLimit" name="team_limit" placeholder="제한없음" required><br>

        <label for="teamExplanation">팀 설명 :</label>
        <textarea id="teamExplanation" name="team_explanation" maxlength="100" placeholder="100글자 이내" required></textarea><br>
        
        <button type="button" onclick="insertTeam()">팀 생성</button>
    </form>

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

        function insertTeam() {
            const genderRadios = document.getElementsByName('prefer_gender');
            let selectedGender = null;

            // 성별 체크 여부 확인
            for (const radio of genderRadios) {
                if (radio.checked) {
                    selectedGender = radio.value;
                    break;
                }
            }

            if (!selectedGender) {
                alert("성별을 선택해 주세요.");
                return;
            }

            // 폼 데이터 수집
            const formData = new FormData(document.getElementById('teamForm'));

            // AJAX 요청 (POST 방식)
            fetch('/insertTeam', {
                method: 'POST',
                body: formData
            })
            .then(response => response.text())
            .then(responseText => {
                if (responseText === "success") {
                    alert("팀 생성에 성공했습니다.");
                    window.location.href = "/success.jsp"; // 성공 페이지로 리다이렉트
                } else {
                    alert("팀 생성에 실패했습니다: " + responseText);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert("서버와의 통신 중 오류가 발생했습니다.");
            });
        }
    </script>
</body>
</html> --%>