<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	 <!-- 팀 이름 -->
    <form action="/insertTeam" method="post">
        <label for="teamName">팀 이름 :</label>
        <input type="text" id="teamName" name="teamName" maxlength="12" placeholder="12글자 이내 한글 또는 영어로 입력" required><br>
        
        <!--활동 지역  -->
        <label for="teamArea">활동 지역:</label>
		<input type="text" id="teamArea" name="teamArea" required placeholder="주소를 입력하세요">
		<button type="button" onclick="searchAddress()">주소 검색</button>
		<br>
		
		<!-- 오픈 주소API -->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
			function searchAddress() {
    		new daum.Postcode({
        		oncomplete: function(data) {
            // 선택된 주소를 입력 필드에 넣기
            var address = data.address; // 도로명 주소
            document.getElementById('teamArea').value = address; // 입력 필드에 주소 입력
        }
    }).open();
}
</script>

<!-- 		<label for="teamArea">활동 지역:</label>
			<select id="teamArea" name="teamArea" required>
    			<option value="">선택하세요</option>
    			<option value="서울">서울</option>
    			<option value="경기">경기</option>
    			<option value="부산">부산</option>
    			<option value="대구">대구</option>
    			<option value="인천">인천</option>
    			<option value="광주">광주</option>
		</select><br> -->
		
		<!-- 팀 생성시 남자만,여자만,둘다 할지 고르기 -->
		<label for="userGender">성별 :</label>
		<label for="male">남자</label>
		<input type="radio" value="1" id="male" name="gender">
		<label for="female">여자</label>
		<input type="radio" value="2" id="female" name="gender">
		<label for="gender">성별 무관</label>
		<input type="radio" value="3" id="gender" name="gender"><br>
		
		<!--팀 실력 -->
		<label for="teamLevel">팀 실력 :</label>
		<select>
			<option value="">선택하세요.</option>		
			<option value="1">초보1</option>		
			<option value="2">초보2</option>		
			<option value="3">초보3</option>		
			<option value="4">일반</option>
			<option value="4">중급</option>
			<option value="4">고급</option>
		</select><br>
		
		<!-- 인원수 제한 걸어야함(자바스크립트) -->
        <label for="teamCount">최대 인원 :</label>
        <input type="number" id="teamCount" name="teamCount" placeholder="최대 20명까지" required min="0" max="20"><br>

		<!-- 팀 설명(글자 제한수 최대100글자이내 자바스크립트로 코드 생성) -->
        <label for="teamExplanation">팀 설명 :</label>
        <textarea id="teamExplanation" name="teamExplanation" maxlength="100" placeholder="100글자 이내" required></textarea>
        <span id="charCount">0 / 100</span>
        <br>
		<!-- 생성을 하고 목록 조회로 넘어갈수있게 다하고나서 팀 조회를 시작한다 -->
		<button type="button" onclick="insertTeam()">팀 생성</button>
<!--         <button type="submit">생성</button> -->
    </form>
    
    <script>
        // 최대 인원 설정
        const teamCountInput = document.getElementById('teamCount');
        teamCountInput.addEventListener('input', function () {
            if (this.value > 20) {
                this.value = 20;
            }
            if (this.value < 0) {
                this.value = 0;
            }
        });
        teamCountInput.value = 0;

        // 팀 설명 글자 수 제한
        const teamExplanationInput = document.getElementById('teamExplanation');
        const charCount = document.getElementById('charCount');

        teamExplanationInput.addEventListener('input', function () {
            charCount.textContent = this.value.length + ' / 100';
        });
    </script>
    
<!--     <script>
	function insertTeam() {
    	const genderRadios = document.getElementsByName('gender');
    	let selectedGender;

    	// 선택된 성별 확인
    	for (const radio of genderRadios) {
        	if (radio.checked) {
            	selectedGender = radio.value;
            	break;
        }
    }

    if (selectedGender) {
        // 각 성별에 따라 팀 생성 로직을 추가합니다.
        if (selectedGender === "1") {
            alert("남자 팀을 생성합니다.");
            // 남자 팀 생성 로직 추가
        } else if (selectedGender === "2") {
            alert("여자 팀을 생성합니다.");
            // 여자 팀 생성 로직 추가
        } else if (selectedGender === "3") {
            alert("성별 무관 팀을 생성합니다.");
            // 성별 무관 팀 생성 로직 추가
        }
    } else {
        alert("성별을 선택해 주세요.");
    }
}
</script> -->
</body>
</html>