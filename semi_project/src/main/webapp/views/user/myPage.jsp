<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Starter Page - OnePage Bootstrap Template</title>
  <meta name="description" content="">
  <meta name="keywords" content="">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="<%= request.getContextPath() %>/resources/css/include/common.css" rel="stylesheet" type="text/css">

  <script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>

  <!-- =======================================================
  * Template Name: OnePage
  * Template URL: https://bootstrapmade.com/onepage-multipurpose-bootstrap-template/
  * Updated: Aug 07 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<style>
/* 등록한 일정표 CSS */
#reservation{
table {
    width: 100%; /* 너비를 70%에서 95%로 늘려 더 넓게 */
    max-width: 1300px; /* 최대 너비 제한으로 화면에 맞게 조정 */
    margin: 0 auto; /* 가운데 정렬 추가 */
    border-collapse: separate;
    border-spacing: 0;
    font-family: 'Poppins', sans-serif;
    font-size: 16px; /* 글자 크기 14px → 16px로 키움 */
    background-color: #fff;
    border-radius: 16px; /* 둥근 모서리 조금 더 크게 */
    overflow: hidden;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1); /* 그림자 더 부드럽고 입체적으로 */
    cursor: pointer;
    text-align: center;
}

thead {
    background: linear-gradient(135deg, #2487ce, #1a5f92); /* 그라데이션 유지 */
    color: #fff;
    text-transform: uppercase;
    letter-spacing: 1px; /* 글자 간격 넓혀 깔끔하게 */
    cursor: default;
}

th {
    padding: 16px 20px; /* 패딩을 10px 12px → 16px 20px로 늘려 더 큼직하게 */
    font-weight: 700; /* 글자 굵기 증가 */
    font-size: 17px; /* 헤더 글자 크기 살짝 키움 */
    border-bottom: 3px solid rgba(255, 255, 255, 0.3); /* 헤더 하단 라인 강조 */
}

td {
    padding: 14px 20px; /* 패딩을 8px 12px → 14px 20px로 늘려 여유롭게 */
    color: #333; /* 글자색 더 진하게 */
    border-bottom: 1px solid #eef2f6; /* 구분선 더 부드럽게 */
    transition: background-color 0.3s ease;
}

tbody tr {
    background-color: #fff;
}

tbody tr:nth-child(even) {
    background-color: #fafcff; /* 짝수 행에 아주 연한 파란 톤 */
}

tbody tr:hover {
    background-color: rgba(36, 135, 206, 0.08); /* 호버 시 부드러운 색상 변화 */
}

tbody tr.active {
    background-color: rgba(36, 135, 206, 0.15); /* 선택된 행 강조 */
}
}
/* 내 정보 수정 css */
#myDataChangeForm {
    max-width: 500px; /* 폼 너비 제한 */
    margin: 0 auto; /* 페이지 중앙 정렬 */
    padding: 20px;
    background-color: #f9f9f9; /* 배경색 추가 */
    border-radius: 8px; /* 모서리 둥글게 */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}

/* 섹션 제목 스타일 */
.section-title {
    text-align: center;
    margin-bottom: 20px;
}

.section-title h3 {
    color: #333;
    font-size: 24px;
}

/* 폼 스타일 */
#userProfileForm {
    display: flex;
    flex-direction: column;
    gap: 15px; /* 입력 필드 간격 */
}

/* 라벨 스타일 */
#userProfileForm label {
    display: flex;
    flex-direction: column;
    gap: 5px;
    font-weight: bold;
    color: #555;
}

/* 입력 필드 스타일 */
#userProfileForm input {
    padding: 8px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 16px;
    width: 100%; /* 입력 필드 너비 조정 */
    box-sizing: border-box; /* 패딩 포함 너비 계산 */
}

#userProfileForm input:focus {
    outline: none;
    border-color: #007bff;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
}

/* 전화번호 메시지 스타일 (기존 스타일 유지) */
#phoneMsg {
    text-align: center; /* 메시지 가운데 정렬 */
}

/* 버튼 스타일 */
#updateBtn, #cancleBtn {
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    margin: 5px; /* 버튼 간격 */
}

/* 버튼 그룹 가운데 정렬 */
#myDataChangeForm > button {
    display: inline-block;
}

#myDataChangeForm > button:nth-child(1) {
    margin-right: 10px; /* 수정 완료와 취소 버튼 간격 */
}

#updateBtn {
    background-color: #007bff;
    color: white;
}

#updateBtn:hover {
    background-color: #0056b3;
}

#cancleBtn {
    background-color: #dc3545;
    color: white;
}

#cancleBtn:hover {
    background-color: #c82333;
}

/* 버튼 그룹 가운데 정렬을 위한 래퍼 */
#myDataChangeForm {
    text-align: center; /* 버튼을 가운데 정렬 */
}

/*비밀번호 변경 css  */
#passWord {
    max-width: 500px; /* 폼 너비 제한 */
    margin: 0 auto; /* 페이지 중앙 정렬 */
    padding: 20px;
    background-color: #f9f9f9; /* 배경색 추가 */
    border-radius: 8px; /* 모서리 둥글게 */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}

/* 섹션 제목 스타일 */
.section-title {
    text-align: center;
    margin-bottom: 20px;
}

.section-title h3 {
    color: #333;
    font-size: 24px;
}

/* Bootstrap 컬럼 스타일 */
.col-md-12 {
    margin-bottom: 15px; /* 각 입력 필드 간 간격 */
    text-align: center; /* 기본 정렬 (d-flex로 조정됨) */
}

/* d-flex 컨테이너 스타일 */
.col-md-12.d-flex {
    justify-content: center; /* 입력 필드와 버튼을 가로 중앙 정렬 */
    gap: 10px; /* 입력 필드와 버튼 간격 */
}

/* 입력 필드 스타일 */
#userPw, #checkUserPw {
    flex: 1; /* 입력 필드가 컨테이너에 맞게 확장 */
    max-width: 70%; /* 입력 필드 너비 제한 */
    padding: 8px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 16px;
}

#userPw:focus, #checkUserPw:focus {
    outline: none;
    border-color: #007bff;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
}

/* 토글 버튼 스타일 */
#togglePassword1, #togglePassword2 {
    padding: 8px;
    font-size: 16px;
    color: #007bff;
}

#togglePassword1:hover, #togglePassword2:hover {
    color: #0056b3;
    background-color: #e9ecef;
    border-radius: 4px;
}

/* 메시지 스타일 */
#passWord p {
    text-align: center; /* 메시지 가운데 정렬 */
    margin: 5px 0;
    color: #696969; /* 기존 색상 유지 */
}

#pwMsg2 {
    font-size: 14px;
}

#pwMsg {
    font-size: 12px;
}

/* 버튼 스타일 */
#updateBtn1, #cancleBtn1 {
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    margin: 5px;
    display: inline-block; /* 버튼을 인라인 블록으로 설정 */
}

#updateBtn1 {
    background-color: #007bff;
    color: white;
}

#updateBtn1:hover {
    background-color: #0056b3;
}

#cancleBtn1 {
    background-color: #dc3545;
    color: white;
}

#cancleBtn1:hover {
    background-color: #c82333;
}

/* 버튼 그룹 가운데 정렬 */
#passWord {
    text-align: center; /* 버튼을 가운데 정렬 */
}

/*내가 쓴 글 css  */
#write {
    max-width: 800px; /* 테이블 너비 제한 */
    margin: 0 auto; /* 페이지 중앙 정렬 */
    padding: 20px;
    background-color: #f9f9f9; /* 배경색 추가 */
    border-radius: 8px; /* 모서리 둥글게 */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}

/* 섹션 제목 스타일 */
.section-title {
    text-align: center;
    margin-bottom: 20px;
}

.section-title h3 {
    color: #333;
    font-size: 24px;
}

/* 테이블 스타일 */
.table {
    width: 100%; /* 테이블 너비를 컨테이너에 맞춤 */
    margin: 0 auto; /* 테이블을 가운데 정렬 */
    border-collapse: collapse;
}

/* 테이블 헤더 스타일 */
.table thead th {
    background-color: #007bff;
    color: white;
    padding: 12px;
    text-align: center; /* 헤더 텍스트 가운데 정렬 */
}

/* 테이블 셀 스타일 */
.table tbody td {
    padding: 10px;
    text-align: center; /* 셀 텍스트 가운데 정렬 */
    border-bottom: 1px solid #ddd;
}

/* 호버 효과 (Bootstrap table-hover 유지) */
.table-hover tbody tr:hover {
    background-color: #e9ecef; /* Bootstrap 기본 호버 색상 유지 */
}

/* 반응형 디자인 (선택 사항) */
@media (max-width: 768px) {
    #write {
        max-width: 100%; /* 작은 화면에서 전체 폭 사용 */
        padding: 10px;
    }

    .table {
        font-size: 14px; /* 작은 화면에서 글꼴 크기 조정 */
    }
}

/* 마이 팀 */
#team {
    max-width: 600px; /* 컨테이너 너비 제한 */
    margin: 0 auto; /* 페이지 중앙 정렬 */
    padding: 20px;
    background-color: #f9f9f9; /* 배경색 추가 */
    border-radius: 8px; /* 모서리 둥글게 */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}

/* 섹션 제목 스타일 */
.section-title {
    text-align: center;
    margin-bottom: 20px;
}

.section-title h3 {
    color: #333;
    font-size: 24px;
}

/* 내용 컨테이너 스타일 */
#myteamdiv {
    text-align: center; /* 내용 가운데 정렬 */
    margin-bottom: 20px; /* 버튼과의 간격 */
    padding: 15px;
    background-color: #fff; /* 내부 배경색 */
    border: 1px solid #ddd; /* 테두리 추가 */
    border-radius: 4px;
}

/* 버튼 스타일 */
#myteamleavebtn {
    display: block; /* 블록 요소로 설정 */
    margin: 0 auto; /* 버튼을 가로 중앙 정렬 */
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    background-color: #dc3545; /* 탈퇴 버튼 색상 (빨간색) */
    color: white;
    font-size: 16px;
    cursor: pointer;
}

#myteamleavebtn:hover {
    background-color: #c82333; /* 호버 시 색상 변화 */
}

/* 반응형 디자인 (선택 사항) */
@media (max-width: 768px) {
    #team {
        max-width: 100%; /* 작은 화면에서 전체 폭 사용 */
        padding: 10px;
    }

    #myteamleavebtn {
        width: 80%; /* 작은 화면에서 버튼 너비 조정 */
        font-size: 14px;
    }
}
</style>

<body class="starter-page-page">

  <%@ include file="/views/include/header.jsp" %>

  <main class="main">

    <!-- Page Title -->
    <div class="page-title accent-background">
      <div class="container">
        <h1>Starter Page</h1>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="index.html">Home</a></li>
            <li class="current">Starter Page</li>
          </ol>
        </nav>
      </div>
    </div><!-- End Page Title -->

    <!-- Starter Section Section -->
    <section id="starter-section" class="starter-section section">

   <div class="container">
    <section class="starter-section" data-aos="fade-up">
        <div class="content-wrapper">
            <h1 class="section-title">사용자의 바르셀로나</h1>
            <div class="action-panel">
                <a href="#" id="changeProfileBtn">
                    <i class="bi bi-person link-icon"></i>
                    내 정보 수정
                </a>
                <br>
                <a href="#" id="changePassWord">
                    <i class="bi bi-person-lock link-icon"></i>
                    비밀번호 변경
                </a>
                <br>
                <a href="#" id="updateWrite">
                    <i class="bi bi-pencil-square link-icon"></i>
                    내가 쓴 글
                </a>
                <br>
                <a href="#" id="myteam">
                    <i class="bi bi-people link-icon"></i>
                    마이팀 정보
                </a>
                <br>
                <a href="#" id="myReservation">
                    <i class="bi bi-list-task link-icon"></i>
                    예약 내역
                </a>
            </div>
        </div>
    </section>
</div>
 <!-- 마이페이지를 들어가면 보이는 초기 상태의 사용자 정보-->
<div id="myDataForm">
	<div class="section-title" data-aos="fade-up">
		<h3>사용자의 정보</h3>
	</div>
	<div class="col-md-12">
		<p>이름: ${user.userName }</p>
	</div>
	<div class="col-md-12">
		<p>이메일 정보: ${user.userEmail }</p>
	</div>
	<div class="col-md-12">
		<p>전화번호: ${user.userPhone }</p>
	</div> 
	<div class="col-md-12">
		<p>성별: ${user.userGender }</p>
	</div>
</div>
	<!-- 내 정보 수정 a 태그를 눌러야지만 보이는 곳. 초기 사용자 정보는 display-none 상태? 가 되고 밑에 div가 보이게 한다.-->
	<!-- 내 정보 수정 -->
<div id="myDataChangeForm" style="display: none;">	
	<div class="section-title" data-aos="fade-up">
		<h3>내 정보 수정</h3>
	</div>
	<form id="userProfileForm">
	<input type="text" id="userId" value="${user.userId }" style="display : none">
   <label>이름 <input type="text" id="userName" value="${user.userName }"></label>
   <label>이메일 <input type="email" id="userEmail" value="${user.userEmail }"></label>
   <label>전화번호 <input type="tel" id="userPhone" name="user_phone" value="${user.userPhone }">
   </label>
   <div>
    <p id="phoneMsg" style="font-size: 14px; color: red;"></p>
	</div>
</form>
    <button type="button" id="updateBtn">수정 완료</button>
    <button type="button" id="cancleBtn">취소</button>
</div>	
<!-- 비밀번호 변경 -->
<div id="passWord" style="display : none;">
	<div class="section-title" data-aos="fade-up">
		<h3>비밀번호 변경</h3>
	</div>
	<div class="col-md-12 d-flex align-items-center">
                  <input type="password" id="userPw" class="form-control" name="user_pw" placeholder="비밀번호" required>
                	<button type="button" id="togglePassword1" class="btn btn-outline-secondary ms-2" 
          			style="border: none; background: transparent;">
    				👁️‍🗨️
  					</button>
  					</div>
  					<div>
                	<p style="font-size: 14px; margin-top: 5px; color: rgb(105, 105, 105);">비밀번호는 길이 8자 이상, 영문자,숫자,특수문자가 최소 하나씩은 포함되어야 합니다.</p>
               		<p id="pwMsg2" style="font-size: 14px; margin-top: 5px; color: rgb(105, 105, 105);"></p>
               		</div>
               	              	

                <div class="col-md-12 d-flex align-items-center">
                  <input type="password" id="checkUserPw" class="form-control" name="check_user_pw" placeholder="비밀번호 확인" required>
                	<button type="button" id="togglePassword2" class="btn btn-outline-secondary ms-2" 
          			style="border: none; background: transparent;">
    				👁️‍🗨️
  					</button>
                </div>
                 <div>
                	<p id="pwMsg" style="font-size: 12px; margin-top: 5px; color: rgb(105, 105, 105);"></p>
              	</div> 
  					<button type="button" id="updateBtn1">수정 완료</button>
    				<button type="button" id="cancleBtn1">취소</button>
                
</div>
	
<div id="write" style="display: none;">
    <div class="section-title" data-aos="fade-up">
        <h3>내가 쓴 글</h3>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일시</th>
                </tr>
            </thead>
            <tbody id="boardListContainer">
            	
            </tbody>
        </table>
    </div>	
</div>

	<div id="team" style="display: none;">
		<div class="section-title" data-aos="fade-up">
		<h3>마이팀 정보</h3>
		</div>
		<div id="myteamdiv">
		
		</div>
		<button id="myteamleavebtn">탈퇴</button>
	</div>
	<c:set var="user" value="${sessionScope.user}"/>
	
<div id="reservation" style="display: none;">
	<div class="section-title" data-aos="fade-up">
	<h3>예약 내역</h3>
	</div>
	<table>
		<thead>
			<tr>
				<th>구장 위치</th>
				<th>구장명</th>
				<th>일정 날짜</th>
				<th>일정 시간</th>
				<th>이용 시간</th>
				<th>예약 상태</th>
			</tr>
		</thead>
		<tbody id="reservationContent">
		
		</tbody>
	</table>
</div>
	
 <!-- a태그를 누르면 변형이 되기 위한 script 태그 -->
 <script>
 document.getElementById("myReservation").addEventListener("click", function(event) {
	    event.preventDefault();	
	    document.getElementById("myDataForm").style.display = "none";
	    document.getElementById("passWord").style.display = "none";
	    document.getElementById("myDataChangeForm").style.display = "none";
	    document.getElementById("write").style.display = "none";
	    document.getElementById("team").style.display = "none";
	    document.getElementById("reservation").style.display = "block";
	    $('#reservationContent').empty();

	    $.ajax({
	        url: "/MyPageReservationServlet",
	        method: "GET",
	        dataType: "json",
	        success: function(response) {
	            console.log("AJAX 요청 성공:", response);

	            let rows = "";
	            for (let i = 0; i < response.list.length; i++) {
	                let plan = response.list[i];

	                rows += '<tr data-planno="' + plan.planNo
	                + '" data-fieldaddr="' + plan.fieldAddr
	                + '" data-fieldname="' + plan.fieldName
	                + '" data-plandate="' + plan.planDate
	                + '" data-plantime="' + plan.planTime
	                + '" data-usetime="' + plan.useTime
	                + '" data-regdate="' + plan.regDate
	                + '" onclick="location.href=\'/selectPlanDetail?planNo=' + plan.planNo + '\'">'
	                + '<td>' + plan.fieldAddr + '</td>'
	                + '<td>' + plan.fieldName + '</td>'
	                + '<td>' + plan.planDate + '</td>'
	                + '<td>' + plan.planTime + '</td>'
	                + '<td>' + plan.useTime + '시간</td>'
	                + '<td>' + plan.regDate + '</td>'
	                + '</tr>';
	            }

	            $('#reservationContent').append(rows);
	        },
	        error: function(xhr, status, error) {
	            console.error("AJAX 요청 실패");
	            console.error("상태 코드:", xhr.status);
	            console.error("에러 메시지:", error);
	            console.error("응답 텍스트:", xhr.responseText);
	        }
	    });
	});
 	
 </script>
 
 <script>					
 	document.getElementById("changeProfileBtn").addEventListener("click",function(){
 	event.preventDefault();	
 	document.getElementById("myDataForm").style.display = "none";
 	document.getElementById("passWord").style.display = "none";
 	document.getElementById("myDataChangeForm").style.display = "block";
 	document.getElementById("write").style.display = "none";
 	document.getElementById("team").style.display = "none";
 	document.getElementById("reservation").style.display = "none";
 	
 	})
 	
 	$("#updateBtn").click(function(){
 		
 		var userId = $("#userId").val();
 		var userName = $("#userName").val();
 		var userEmail = $("#userEmail").val();
 		var userPhone = $("#userPhone").val();	
 		
 		if(!userName || !userEmail || !userPhone){
 			alert("수정하실 정보를 입력해주세요");
 			return;
 		}
 		
 		$.ajax({
 			url: "/MyPageUpdateServlet",
 			method: "POST",
 			data: {
 				userId: userId,
 				userName: userName,
 				userEmail: userEmail,
 				userPhone: userPhone,
 			},
 			success : function(response){
 				if(response.success){
 					alert("수정이 완료되었습니다.")
 					$("#myDataForm").show();
 					$("#myDataChangeForm").hide();
 				}else{
 					alert("수정 실패. 다시 시도해 주세요.")
 				}
 			}
 		});
 	});
 		
 	$("#cancleBtn").click(function(){
 		$("#myDataForm").show();
			$("#myDataChangeForm").hide();
 	})
 	
 	<!--전화번호 정규식  keyup으로 바꿔야 함-->
	document.getElementById("userPhone").addEventListener("keyup",phoneCheck);
	function phoneCheck(){
		const phone = document.getElementById("userPhone").value.trim();
		const checkP = document.getElementById("phoneMsg");
		const check_p_r =/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		
		if(!check_p_r.test(phone)){
			checkP.textContent = "올바른 전화번호 형식을 입력하세요. \n ex : 숫자와 - 만 입력해주세요."
			checkP.style.color = "red";
			true_false = false;
		}else{
			checkP.textContent = "올바른 전화번호 형식입니다."
			checkP.style.color = "green";
			true_false = true;
		}	
	}	
 </script>
 	<!-- 비번 변경 script -->
 	<script>
		document.getElementById("changePassWord").addEventListener("click", function(){
		event.preventDefault();
		document.getElementById("myDataChangeForm").style.display = "none";
 		document.getElementById("myDataForm").style.display = "none";
 		document.getElementById("write").style.display = "none";
 		document.getElementById("passWord").style.display = "block";
 		document.getElementById("team").style.display = "none";
 		document.getElementById("reservation").style.display = "none";
		})
 	$("#updateBtn1").click(function(){
 		console.log("수정 버튼 클릭됨")
 		var userId = $('#userId').val();
 		var userPw = $('#userPw').val();
 		
 		if(!userPw){
 			alert("수정하실 정보를 입력해주세요");
 			return;
 		}
 		$.ajax({
 			url: "/MyPageUpdatePassWordServlet",
 			method: "POST",
 			data: {
 				userId: userId,
 				userPw: userPw,
 			},
 			success : function(response){
 				if(response.success){
 					alert("수정이 완료되었습니다.")
 					$("#myDataForm").show();
 					$("#passWord").hide();
 				}else{
 					alert("수정 실패. 다시 시도해 주세요.")
 				}
 			}
 		});
 	});
 		
 	$("#cancleBtn1").click(function(){
 		$("#myDataForm").show();
			$("#passWord").hide();
 	})
 	
 	
 	
 	<!--비밀번호 중복 확인 keyup으로 바꿔야함 -->
 	document.getElementById("userPw").addEventListener("keyup",checkPw);
 	document.getElementById("checkUserPw").addEventListener("keyup",checkPw);
 	function checkPw(){
		const p = document.getElementById("userPw").value.trim();
		const p_c = document.getElementById("checkUserPw").value.trim();
		const p_m = document.getElementById("pwMsg");
		
		if(p_c === ""){
			p_m.textContent = "";
			
		}
		
		if(p === p_c){
			p_m.textContent = "비밀번호가 일치합니다.";
			p_m.style.color = "green";
			true_false = true;
		}else{
			p_m.textContent = "비밀번호가 일치하지 않습니다."
			p_m.style.color = "red";
			true_false = false;
		}
	}
 	
 	<!-- 비밀번호 정규식 keyup으로 바꿔야 함-->
	document.getElementById("userPw").addEventListener("keyup",regular_pw);
	function regular_pw(){
		const pw_value = document.getElementById("userPw").value.trim();
		const pw_check = document.getElementById("pwMsg2");
		const en = /[A-Za-z]/; <!--영문자 최소 1개 이상-->
		const num = /\d/; <!--숫자 최소 1개 이상-->
		const at = /[@$!%*?&]/; <!--특수문자 최소 1개 이상-->
		const lang = /^[A-Za-z\d@$!%*?&]{8,16}$/; <!--총 8자 이상, 16자 이하--> 
		
		if(!en.test(pw_value)){
			pw_check.textContent = "비밀번호는 최소 1개 이상의 영문자가 포함되어야 합니다."
			pw_check.style.color = "red";
			true_false = false;
		}else if(!num.test(pw_value)){
			pw_check.textContent = "비밀번호는 최소 1개 이상의 숫자가 포함되어야 합니다."
			pw_check.style.color = "red";
			true_false = false;
		}else if(!at.test(pw_value)){
			pw_check.textContent = "비밀번호는 최소 1개 이상의 특수문자가 포함되어야 합니다."
			pw_check.style.color = "red";
			true_false = false;
		}else if(!lang.test(pw_value)){
			pw_check.textContent = "비밀번호는 최소 8자 이상, 최대 16자 이하로 작성하셔야 합니다."
			pw_check.style.color = "red";
			true_false = false;
		}else{
			pw_check.textContent = "사용 가능한 비밀번호 입니다."
			pw_check.style.color = "green";
			true_false = true;
		}
	
	}
	
	<!-- 비밀번호 버튼 누르면 보이기 -->
	document.getElementById("togglePassword1").addEventListener("click",function(){
		const pw_eye = document.getElementById("userPw");
		pw_eye.type = pw_eye.type === "password" ? "text" : "password";
	})
	document.getElementById("togglePassword2").addEventListener("click",function(){
		const pw_eye = document.getElementById("checkUserPw");
		pw_eye.type = pw_eye.type === "password" ? "text" : "password";
	})	
 </script>
 	<!-- 내가 쓴 글 수정 ajax 작성할 예정-->
<script>
  // "내가 쓴 글 수정" 버튼 클릭 시
  document.getElementById("updateWrite").addEventListener("click", function(event) {
    event.preventDefault();
    // 다른 섹션 숨기고 "내가 쓴 글 수정" 섹션 표시
    document.getElementById("myDataForm").style.display = "none";
    document.getElementById("passWord").style.display = "none";
    document.getElementById("myDataChangeForm").style.display = "none";
    document.getElementById("write").style.display = "block";
    document.getElementById("team").style.display = "none";
    document.getElementById("reservation").style.display = "none";
    $('#boardListContainer').empty();
    // AJAX 호출로 사용자 글 목록 가져오기
    $.ajax({
      url: "/MyPageBoardServlet",
      method: "GET",
      dataType: "JSON",

      success: function(response) {
    	  let rows = "";
        // 반복문으로 글 목록을 가져오기
        for (let i = 0; i < response.list.length; i++) {
          let board = response.list[i];
          
          rows += '<tr class="boardRow" data-attachno="' + board.attachNo 
          + '" data-boardtitle="' + board.boardTitle 
          + '" data-boardcontent="' + board.boardContent 
          + '" data-writerno="' + board.writerNo 
          + '" data-boardno="' + board.boardNo 
          + '" data-oriname="' + board.oriName + '">'
          + '<td>' + (i + 1) + '</td>'
          + '<td>' + board.boardTitle + '</td>'
          + '<td>' + board.userId + '</td>'
          + '<td>' + board.regDate + '</td>'
          + '</tr>';
        }
          $('#boardListContainer').append(rows);     

        // 클릭 이벤트를 for문 밖으로 뺄 수 있음
        $(document).on('click', '.boardRow', function() {
          // 클릭된 row의 board 객체를 저장
        			  let attachNo = $(this).data("attachno");
          			  let boardTitle = $(this).data("boardtitle");
          			  let boardContent = $(this).data("boardcontent");
          			  let writerNo = $(this).data("writerno");
          			  let boardNo = $(this).data("boardno");
          			  let oriName = $(this).data("oriname");

          // 상세 페이지로 이동
          			location.href = "/MyPageBoardEndServlet?attachNo=" + attachNo +
                    "&boardTitle=" + boardTitle + 
                    "&boardContent=" + boardContent + 
                    "&writerNo=" + writerNo +
                    "&boardNo=" + boardNo +
                    "&oriName=" + oriName;
        });

      },
      error: function(xhr, status, error) {
        console.error("AJAX 요청 오류:", error);
      }
    });
  });
</script>
	<script>
	document.getElementById("myteam").addEventListener("click", function(event) {   	
		event.preventDefault();
	    document.getElementById("myDataForm").style.display = "none";
	    document.getElementById("passWord").style.display = "none";
	    document.getElementById("myDataChangeForm").style.display = "none";
	    document.getElementById("write").style.display = "none";
	    document.getElementById("team").style.display = "block";
	    document.getElementById("reservation").style.display = "none";
	    $('#team').empty();
	   	console.log("a 태그 잘 눌러지니?")
	    let rows = "";
	    $.ajax({
	        url: "/MyPageMyTeamServlet",
	        method: "GET",
	        dataType: "JSON",
	        success: function(response) {
	        	 if (!response.list || response.list.length === 0) {
	                 document.querySelector("#team").innerHTML += "<p>팀 정보가 없습니다.</p>";
	                 return;
	             }
	        	 for (let i = 0; i < response.list.length; i++) {
	        		 let team = response.list[i];
	                 console.log(team);
		        	 rows+='<p>'+"팀 이름: " + team.teamName +'</p>'
	                 		+'<p>'+"지역: " + team.teamArea +'</p>'
	                 		+'<p>'+"팀 실력: " + team.teamLevel +'</p>'
	                 		+'<p>'+"인원 수: " + team.teamCount +'</p>'
	                 		+'<p>'+"지역: " + team.teamExplanation +'</p>'     
	 				 }
	        	 $('#myteamdiv').append(rows); 
	                 
	        }
		});
	});
	 document.getElementById("myteamleavebtn").addEventListener("click",function(){
		if(confirm("정말로 팀에서 탈퇴하시겠습니까?")){
			// 여기 수정.
			var userNo = ${user.userNo}; // JSP에서 로그인한 사용자의 userNo
			//var teamNo = ${team.teamNo}; // JSP에서 사용자의 팀 번호
			$.ajax({
				url: "/MyPageMyTeamBtnServlet",
				method: "POST",
				data: {
						"userNo" : userNo, // 전달할 데이터 (userNo)
						"teamNo" : teamNo  // 전달할 데이터 (teamNo)
				},
				success: function(response){
					if(response.success){
						alert("팀에서 탈퇴하셨습니다.")
						location.reload(); // 페이지 새로고침
					}else{
						alert("탈퇴 실패.")
					}
				},
				error: function(){
					alert("서버 오류가 발생했습니다.")
				}
			})
		}
	})
	</script>
	
	
    </section><!-- /Starter Section Section -->
  </main>

  <%@ include file="/views/include/footer.jsp" %>

  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>

  <!-- Main JS File -->
  <script src="/resources/js/common.js"></script>

</body>

</html>