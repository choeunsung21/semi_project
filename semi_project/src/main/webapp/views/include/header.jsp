<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header id="header" class="header d-flex align-items-center sticky-top">
	<div class="container-fluid container-xl position-relative d-flex align-items-center">
		<a href="index.jsp" class="logo d-flex align-items-center me-auto">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <img src="/resources/img/logo.png" alt="logo">
        <!-- <h1 class="sitename">OnePage</h1> -->
      	</a>
		
		<nav id="navmenu" class="navmenu">
			<ul>
				<c:choose>
					<c:when test="${user eq null}">
						<!-- <li><a href="#hero" class="active">Home<br></a></li> -->
						<!-- 로그인이 되어있지 않은 상태라면 -->
						<li><a href="/login">로그인</a></li>
						<li><a href="/signup">회원가입</a></li>
						<li><img class="img-profile" src="/resources/img/sponge.png" alt="profile"></li>
					</c:when>
					<c:otherwise>
						<!-- 로그인이 되어있는 상태라면 -->
						<li><a href="/logout">로그아웃</a></li>
						<li><a href="#">[알림이미지]</a></li>
						<li class="dropdown"><a href="#"><c:out value="${user.userName}"/>님<i class="bi bi-chevron-down toggle-dropdown"></i></a>
							<ul>
								<!-- 모든 회원에게 보이는 드롭다운 메뉴 -->
								<li><a href="/myPage">마이페이지</a></li>

								<!-- 작업을 위한 임시 드롭다운 메뉴 -->
								<li><a href="/selectBoardList">게시판</a></li>
								<li><a href="/boardWrite">글쓰기</a></li>
								
								<li><a href="/insertReservation">스케줄 예약</a></li>
								
								<!-- 팀 관련 드롭다운 메뉴 -->
								<li class="dropdown"><a href="#"><span>팀 관리</span><i class="bi bi-chevron-down toggle-dropdown"></i></a>
									<ul>
										<li><a href="/insertTeam">새로운 팀 생성</a></li>
								   		<li><a href="/createTeam">팀 가입신청</a></li>
										<li><a href="/receiveTeamList">받은 가입신청 목록</a></li>
										<li><a href="/sendTeamList">보낸 가입신청 목록</a></li>
										<li><a href="/updateTeam">팀 정보 수정</a></li>
										<li><a href="/deleteTeam">팀 탈퇴 및 삭제</a></li>
									</ul>
								</li>
								
								<!-- 업체 회원이라면 보이는 드롭다운 메뉴 -->
								<c:choose>
									<c:when test="${user.userType eq 1}">
									<li class="dropdown"><a href="#"><span>구장 및 스케줄</span><i class="bi bi-chevron-down toggle-dropdown"></i></a>
										<ul>
											<li><a href="/insertField">구장 등록</a></li>
											<li><a href="/insertPlan">스케줄 직접 등록</a></li>

											<li><a href="/insertRule">스케줄 등록 규칙 설정</a></li>
											
											
											
											
											
											<!-- 헤더 변경 부분 -->
											<li><a href="/selectRegisteredPlanList">등록한 일정 조회</a></li>
											<li><a href="/selectRegisteredRuleList">등록한 규칙 조회</a></li>
											
											
											
											
											
											
											
											

											<li><a href="/selectPlanDetail">스케줄 상세 조회</a></li>
											<!-- <li><a href="#">Deep Dropdown 4</a></li> -->
											<!-- <li><a href="#">Deep Dropdown 5</a></li> -->
										</ul>
									</li>
									</c:when>
								</c:choose>

								<!-- <li><a href="#">Dropdown 3</a></li> -->
								<li><a href="/logout">로그아웃</a></li>
							</ul>
						</li>
						<li><img class="img-profile" src="/resources/img/dung.png" alt="profile"></li>
					</c:otherwise>
				</c:choose>

				<!-- <li><a href="#about">about</a></li> -->
				<!-- <li><a href="#contact">Contact</a></li> -->
			</ul>
			<i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
		</nav>

      	<!-- <a class="btn-getstarted" href="#about">LogIn</a> -->
      	<!-- <img class="img-profile" src="/resources/img/dung.png" alt="profile"> -->
    </div>
</header>