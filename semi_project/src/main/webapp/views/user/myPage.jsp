<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>마이 페이지</title>
<meta name="description" content="">
<meta name="keywords" content="">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Main CSS File -->
<link
	href="<%=request.getContextPath()%>/resources/css/include/common.css"
	rel="stylesheet" type="text/css">

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
/* 전체구조 */
.wrapper {
	display: flex;
	justify-content: space-between;
	width: 100%;
	padding: 0 300px; /* 좌우 여백 줄임 */
}

#hideDiv {
	background-color: #ffffff; /* 흰색 배경 */
	width: 75%; /* 오른쪽 div의 너비 */
	padding: 20px; /* 내부 여백 */
	border: 1px solid #ddd; /* 연한 회색 테두리 */
	border-radius: 10px; /* 모서리 둥글게 */
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 효과 */
	color: #333; /* 글자 색상 */
	font-size: 16px; /* 글자 크기 */
	display: flex; /* 플렉스 박스 사용 */
	flex-direction: column; /* 세로 방향 정렬 */
	gap: 10px; /* 요소 간 간격 */
}

body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f8f9fa; /* 배경색 */
}

#containerLeft {
	max-width: 300px; /* 최대 너비 설정 */
	margin: 20px auto; /* 중앙 정렬 */
	padding: 15px; /* 내부 여백 줄임 */
	background-color: #ffffff; /* 흰색 배경 */
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
	border-radius: 8px; /* 모서리 둥글게 */
}

.starter-section {
	margin-bottom: 10px; /* 섹션 간 여백 줄임 */
}

.section-title {
	font-size: 24px; /* 제목 크기 */
	margin-bottom: 10px; /* 제목 아래 여백 줄임 */
	color: #333; /* 제목 색상 */
}

.action-panel {
	margin-top: 5px; /* 패널 위 여백 줄임 */
}

.action-panel a {
	display: flex; /* 아이콘과 텍스트 정렬 */
	align-items: center; /* 수직 정렬 */
	text-decoration: none; /* 밑줄 제거 */
	color: #007bff; /* 링크 색상 */
	padding: 5px 0; /* 링크 여백 줄임 */
	transition: color 0.3s; /* 색상 전환 효과 */
}

.action-panel a:hover {
	color: #0056b3; /* 호버 시 색상 변화 */
}

.link-icon {
	margin-right: 6px; /* 아이콘과 텍스트 간격 줄임 */
	font-size: 20px; /* 아이콘 크기 */
}

/* 사용자 정보 */
#myDataForm {
    background-color: #ffffff; /* 흰색 배경 */
    padding: 25px; /* 내부 여백 */
    border-radius: 10px; /* 모서리 둥글게 */
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 효과 */
    display: flex;
    flex-direction: column; /* 세로 방향으로 정렬 */
    gap: 15px; /* 요소 간 간격 */
}

.section-title h3 {
    margin: 0; /* 제목 아래 여백 제거 */
    font-size: 26px; /* 제목 크기 */
    color: #333; /* 제목 색상 */
    font-weight: 600; /* 제목 두께 */
    text-align: center; /* 중앙 정렬 */
}

.col-md-12 {
    background-color: #f8f9fa; /* 연한 회색 배경 */
    padding: 15px; /* 내부 여백 */
    border-radius: 8px; /* 모서리 둥글게 */
    border-left: 4px solid #007bff; /* 왼쪽 테두리 색상 */
    font-size: 18px; /* 폰트 크기 */
    color: #555; /* 글자 색상 */
}

.col-md-12 p {
    margin: 0; /* 문단 여백 제거 */
}

/* 내 정보 수정 */
#myDataChangeForm {
    background-color: #ffffff; /* 흰색 배경 */
    padding: 30px; /* 내부 여백 */
    border-radius: 10px; /* 모서리 둥글게 */
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* 깊은 그림자 효과 */
    display: flex;
    flex-direction: column; /* 세로 방향으로 정렬 */
    gap: 20px; /* 요소 간 간격 */
}

.section-title h3 {
    margin: 0; /* 제목 아래 여백 제거 */
    font-size: 26px; /* 제목 크기 */
    color: #333; /* 제목 색상 */
    font-weight: 600; /* 제목 두께 */
    text-align: center; /* 중앙 정렬 */
}

label {
    display: flex; /* 레이블과 입력을 세로로 정렬 */
    flex-direction: column; /* 세로 방향으로 정렬 */
    font-size: 16px; /* 폰트 크기 */
    color: #555; /* 글자 색상 */
}

input[type="text"],
input[type="email"],
input[type="tel"] {
    padding: 12px; /* 내부 여백 */
    margin-top: 5px; /* 레이블과 입력 사이의 여백 */
    border: 1px solid #ccc; /* 테두리 색상 */
    border-radius: 5px; /* 둥근 모서리 */
    font-size: 16px; /* 입력 폰트 크기 */
    transition: border-color 0.3s; /* 테두리 색상 전환 효과 */
}

input[type="text"]:focus,
input[type="email"]:focus,
input[type="tel"]:focus {
    border-color: #007bff; /* 포커스 시 테두리 색상 */
    outline: none; /* 기본 아웃라인 제거 */
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* 포커스 시 그림자 효과 */
}

button {
    padding: 12px 20px; /* 버튼 내부 여백 */
    background-color: #007bff; /* 버튼 배경색 */
    color: white; /* 버튼 글자 색상 */
    border: none; /* 테두리 없음 */
    border-radius: 5px; /* 둥근 모서리 */
    cursor: pointer; /* 커서 모양 변경 */
    font-size: 16px; /* 버튼 폰트 크기 */
    transition: background-color 0.3s, transform 0.2s; /* 배경색과 변환 효과 */
    font-weight: 500; /* 버튼 글자 두께 */
}

button:hover {
    background-color: #0056b3; /* 호버 시 배경색 변화 */
    transform: scale(1.05); /* 호버 시 약간 확대 */
}

#phoneMsg {
    font-size: 14px; /* 메시지 폰트 크기 */
    color: red; /* 메시지 색상 */
    text-align: center; /* 중앙 정렬 */
}

/* 비밀번호 변경 */
#passWord {
    background-color: #ffffff; /* 흰색 배경 */
    padding: 25px; /* 내부 여백 */
    border-radius: 10px; /* 모서리 둥글게 */
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 효과 */
    display: flex;
    flex-direction: column; /* 세로 방향으로 정렬 */
    gap: 20px; /* 요소 간 간격 */
}

.section-title h3 {
    margin: 0; /* 제목 아래 여백 제거 */
    font-size: 26px; /* 제목 크기 */
    color: #333; /* 제목 색상 */
    font-weight: 600; /* 제목 두께 */
    text-align: center; /* 중앙 정렬 */
}

.col-md-12 {
    display: flex; /* 플렉스 박스 사용 */
    align-items: center; /* 세로 중앙 정렬 */
    gap: 10px; /* 입력 필드와 버튼 간의 간격 */
}

.form-control {
    flex: 1; /* 입력 필드가 가능한 공간을 모두 차지하도록 설정 */
    padding: 10px; /* 내부 여백 */
    border: 1px solid #ccc; /* 테두리 색상 */
    border-radius: 5px; /* 둥근 모서리 */
    font-size: 16px; /* 입력 폰트 크기 */
    transition: border-color 0.3s; /* 테두리 색상 전환 효과 */
}

.form-control:focus {
    border-color: #007bff; /* 포커스 시 테두리 색상 */
    outline: none; /* 기본 아웃라인 제거 */
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* 포커스 시 그림자 효과 */
}

.btn {
    padding: 10px; /* 버튼 내부 여백 */
    font-size: 16px; /* 버튼 폰트 크기 */
    cursor: pointer; /* 커서 모양 변경 */
}

#togglePassword1, #togglePassword2 {
    border: none; /* 테두리 없음 */
    background: transparent; /* 배경 투명 */
    font-size: 18px; /* 아이콘 크기 */
}

#togglePassword1:hover, #togglePassword2:hover {
    color: #007bff; /* 호버 시 색상 변화 */
}

#pwMsg2, #pwMsg {
    font-size: 14px; /* 메시지 폰트 크기 */
    color: rgb(105, 105, 105); /* 메시지 색상 */
    text-align: center; /* 중앙 정렬 */
}

button {
    padding: 12px 20px; /* 버튼 내부 여백 */
    background-color: #007bff; /* 버튼 배경색 */
    color: white; /* 버튼 글자 색상 */
    border: none; /* 테두리 없음 */
    border-radius: 5px; /* 둥근 모서리 */
    cursor: pointer; /* 커서 모양 변경 */
    font-size: 16px; /* 버튼 폰트 크기 */
    transition: background-color 0.3s, transform 0.2s; /* 배경색과 변환 효과 */
}

button:hover {
    background-color: #0056b3; /* 호버 시 배경색 변화 */
    transform: scale(1.05); /* 호버 시 약간 확대 */
}

/* 내가 쓴 글 */
#write {
    background-color: #ffffff; /* 흰색 배경 */
    padding: 30px; /* 내부 여백 */
    border-radius: 12px; /* 모서리 둥글게 */
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 효과 */
    margin-top: 20px; /* 위쪽 여백 */
}

.section-title h3 {
    margin: 0 0 20px; /* 제목 아래 여백 */
    font-size: 28px; /* 제목 크기 */
    color: #333; /* 제목 색상 */
    font-weight: 600; /* 제목 두께 */
    text-align: center; /* 중앙 정렬 */
}

.table {
    width: 100%; /* 테이블 너비 */
    border-collapse: collapse; /* 테두리 합치기 */
    margin-top: 10px; /* 테이블 위 여백 */
}

.table th, .table td {
    padding: 12px; /* 셀 내부 여백 */
    text-align: left; /* 텍스트 왼쪽 정렬 */
    border-bottom: 1px solid #ddd; /* 셀 아래 테두리 */
}

.table th {
    background-color: #f8f9fa; /* 테이블 헤더 배경색 */
    color: #333; /* 헤더 글자 색상 */
    font-weight: bold; /* 헤더 두께 */
}

.table tr:hover {
    background-color: #f1f1f1; /* 행 호버 시 배경색 */
}

#boardListContainer {
    /* tbody의 스타일 설정 */
}

@media (max-width: 768px) {
    .table th, .table td {
        padding: 8px; /* 모바일에서 셀 내부 여백 조정 */
    }
}

/* 마이팀 정보 */
#team {
    background-color: #ffffff; /* 흰색 배경 */
    padding: 30px; /* 내부 여백 */
    border-radius: 12px; /* 모서리 둥글게 */
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 효과 */
    margin-top: 20px; /* 위쪽 여백 */
}

.section-title h3 {
    margin: 0 0 20px; /* 제목 아래 여백 */
    font-size: 28px; /* 제목 크기 */
    color: #333; /* 제목 색상 */
    font-weight: 600; /* 제목 두께 */
    text-align: center; /* 중앙 정렬 */
}

#myteamdiv {
    margin: 20px 0; /* 팀 정보와 버튼 간의 여백 */
    padding: 15px; /* 내부 여백 */
    border: 1px solid #ddd; /* 테두리 설정 */
    border-radius: 8px; /* 둥근 모서리 */
    background-color: #f9f9f9; /* 연한 배경색 */
}

/* 예약 내역 */
#reservation {
    background-color: #ffffff; /* 흰색 배경 */
    padding: 30px; /* 내부 여백 */
    border-radius: 12px; /* 모서리 둥글게 */
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 효과 */
    margin-top: 20px; /* 위쪽 여백 */
}

.section-title h3 {
    margin: 0 0 20px; /* 제목 아래 여백 */
    font-size: 28px; /* 제목 크기 */
    color: #333; /* 제목 색상 */
    font-weight: 600; /* 제목 두께 */
    text-align: center; /* 중앙 정렬 */
}

table {
    width: 100%; /* 테이블 너비 */
    border-collapse: collapse; /* 테두리 합치기 */
    margin-top: 10px; /* 테이블 위 여백 */
}

th, td {
    padding: 12px; /* 셀 내부 여백 */
    text-align: left; /* 텍스트 왼쪽 정렬 */
    border-bottom: 1px solid #ddd; /* 셀 아래 테두리 */
}

th {
    background-color: #f8f9fa; /* 헤더 배경색 */
    color: #333; /* 헤더 글자 색상 */
    font-weight: bold; /* 헤더 두께 */
}

tr:hover {
    background-color: #f1f1f1; /* 행 호버 시 배경색 */
}

#reservationContent {
    /* tbody의 스타일 설정 */
}

@media (max-width: 768px) {
    th, td {
        padding: 10px; /* 모바일에서 셀 내부 여백 조정 */
    }
}

</style>

<body class="starter-page-page">

	<%@ include file="/views/include/header.jsp"%>

	<main class="main">

		<!-- Starter Section Section -->
		<section id="starter-section" class="starter-section section">
			<div class="wrapper">
				<div class="containerLeft">
					<section class="starter-section" data-aos="fade-up">
						<div class="content-wrapper">
							<h1 class="section-title">사용자의 바르셀로나</h1>
							<div class="action-panel">
								<a href="#" id="changeProfileBtn"> <i
									class="bi bi-person link-icon"></i> 내 정보 수정
								</a> <br> <a href="#" id="changePassWord"> <i
									class="bi bi-person-lock link-icon"></i> 비밀번호 변경
								</a> <br> <a href="#" id="updateWrite"> <i
									class="bi bi-pencil-square link-icon"></i> 내가 쓴 글
								</a> <br> <a href="#" id="myteam"> <i
									class="bi bi-people link-icon"></i> 마이팀 정보
								</a> <br> <a href="#" id="myReservation"> <i
									class="bi bi-list-task link-icon"></i> 예약 내역
								</a>
							</div>
						</div>
					</section>
				</div>
				<!-- 마이페이지를 들어가면 보이는 초기 상태의 사용자 정보-->
				<div id="hideDiv">
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
							<input type="text" id="userId" value="${user.userId }"
								style="display: none"> <label>이름 <input
								type="text" id="userName" value="${user.userName }"></label> <label>이메일
								<input type="email" id="userEmail" value="${user.userEmail }">
							</label> <label>전화번호 <input type="tel" id="userPhone"
								name="user_phone" value="${user.userPhone }">
							</label>
							<div>
								<p id="phoneMsg" style="font-size: 14px; color: red;"></p>
							</div>
						</form>
						<button type="button" id="updateBtn">수정 완료</button>
						<button type="button" id="cancleBtn">취소</button>
					</div>
					<!-- 비밀번호 변경 -->
					<div id="passWord" style="display: none;">
						<div class="section-title" data-aos="fade-up">
							<h3>비밀번호 변경</h3>
						</div>
						<div class="col-md-12 d-flex align-items-center">
							<input type="password" id="userPw" class="form-control"
								name="user_pw" placeholder="비밀번호" required>
							<button type="button" id="togglePassword1"
								class="btn btn-outline-secondary ms-2"
								style="border: none; background: transparent;">👁️‍🗨️</button>
						</div>
						<div>
							<p
								style="font-size: 14px; margin-top: 5px; color: rgb(105, 105, 105);">비밀번호는
								길이 8자 이상, 영문자,숫자,특수문자가 최소 하나씩은 포함되어야 합니다.</p>
							<p id="pwMsg2"
								style="font-size: 14px; margin-top: 5px; color: rgb(105, 105, 105);"></p>
						</div>


						<div class="col-md-12 d-flex align-items-center">
							<input type="password" id="checkUserPw" class="form-control"
								name="check_user_pw" placeholder="비밀번호 확인" required>
							<button type="button" id="togglePassword2"
								class="btn btn-outline-secondary ms-2"
								style="border: none; background: transparent;">👁️‍🗨️</button>
						</div>
						<div>
							<p id="pwMsg"
								style="font-size: 12px; margin-top: 5px; color: rgb(105, 105, 105);"></p>
						</div>
						<button type="button" id="updateBtn1">수정 완료</button>
						<button type="button" id="cancleBtn1">취소</button>

					</div>
					
					<!-- 작성한 게시글 목록 -->
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
					
					<!-- 마이팀 정보 -->
					<div id="team" style="display: none;">
						<div class="section-title" data-aos="fade-up">
							<h3>마이팀 정보</h3>
						</div>
						<div id="myteamdiv"></div>
						<button id="myteamleavebtn">탈퇴</button>
					</div>
					<c:set var="user" value="${sessionScope.user}" />

					<!-- 예약내역 -->
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
				</div>
			</div>
		</section>

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
 				userPw: userPw
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

	</main>

	<%-- <%@ include file="/views/include/footer.jsp"%> --%>

	<!-- Scroll Top -->
	<a href="#" id="scroll-top"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

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