<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>팀 가입 신청</title>

  <link href="https://bootstrapmade.com/content/templatefiles/OnePage/OnePage-bootstrap-website-template.webp" rel="stylesheet" type="text/css">
  <link href='<%=request.getContextPath()%>/resources/css/kdy.css' rel="stylesheet" type="text/css">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  
  <script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body class="container">

  <header class="py-5">
    <h1 class="text-center">팀 가입 신청</h1>
  </header>

  <main>
  
  	<!-- cjs 데이터 받아서 insertApplyEnd 넘길 것 -->
    <form action="/insertApplyEnd" method="post" class="form-group">
      <input type="hidden" id="user-no-input" name="user_no" value="${userNo}">
      <input type="hidden" id="team-no-input" name="team_no" value="${teamNo}">
      <input type="hidden" id="leader-no-input" name="leader_no" value="${team.leaderNo}">
      <input type="hidden" id="team-count-input" name="team_count" value="${team.teamCount}">
      <input type="hidden" id="team-limit-input" name="team_limit" value="${team.teamLimit}">
      
      <c:choose>
      	<c:when test="${not empty myTeamList}">
      		<c:forEach var="team" items="${myTeamList}">
      			<input type="hidden" id="my-team-no-input" name="my_team_no" value="${team.teamNo}">
      		</c:forEach>
	  	</c:when>
	  </c:choose>
      
      <label for="position">선호 포지션</label>
      <input type="text" id="position" name="position" class="form-control" placeholder="선호 포지션">

	  <!--
      <label for="applyArea">선호 지역</label>
      <input type="text" id="applyArea" name="apply_area" class="form-control" placeholder="선호 지역">
      <button type="button" class="btn btn-secondary mt-2" onclick="searchAddress();">주소 검색</button><br>
	  -->

      <label for="applyExplanation">소개글</label>
      <textarea name="apply_explanation" id="applyExplanation" class="form-control" placeholder="소개글"></textarea>
      <button type="submit" class="btn btn-primary mt-3" onclick="submitForm();">신청하기</button>
    </form>
  </main>

  <script>
	const submitForm = function(){
    	let userNo = document.getElementById("user-no-input").value;
    	let leaderNo = document.getElementById("leader-no-input").value;
    	let teamCount = Number(document.getElementById("team-count-input").value);
    	let teamLimit = Number(document.getElementById("team-limit-input").value);
    	
    	let myTeamInputElements = document.querySelectorAll("#my-team-no-input"); // 모든 teamNo를 가져옵니다
    	let currentTeamNo = document.getElementById("team-no-input").value;
    	
    	if(userNo === leaderNo) {
    		alert("본인 팀에는 신청할 수 없습니다.");
    		event.preventDefault();
    		history.back();
    		return false;
    	}
    	
    	for(let i=0; i<myTeamInputElements.length; i++) {
            let teamNo = myTeamInputElements[i].value;

            if (teamNo === currentTeamNo) {
                alert("이미 해당 팀 소속입니다.");
                event.preventDefault();
                history.back();
                return false;
            }
        }
    	
    	if(teamCount >= teamLimit) {
			alert("현재 팀원 수가 제한 인원에 도달하였습니다.");
			event.preventDefault();
			history.back();
			return false;
    	}

    	document.querySelector("form").submit();
	};
  </script>

  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/js/common.js"></script>

</body>

</html>