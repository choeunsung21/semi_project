<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.gn.team.vo.Team" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>팀 목록</title>
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
    <link href="<%= request.getContextPath() %>/resources/css/kdy.css" rel="stylesheet">

    <style>
        .center {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .pagination {
            display: flex;
            gap: 10px; /* 링크 간 간격 */
        }
        .pagination a {
            padding: 8px 16px;
            text-decoration: none;
            color: #007bff;
            border-radius: 5px;
        }
        .pagination a:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body class="index-page">
    <%@ include file="/views/include/header.jsp" %>
    <% Team paging = (Team)request.getAttribute("paging"); %>
    <c:if test="${not empty message}">
        <script>
            alert("${message}");
            window.location.href = "${pageContext.request.contextPath}/teamList";
        </script>
    </c:if>

    <main class="main">
        <!-- Hero Section -->
        <section id="hero" class="hero section">
            <img src="assets/img/hero-bg-abstract.jpg" alt="" data-aos="fade-in" class="">

            <div class="container">
                <div class="row justify-content-center" data-aos="fade-up">
                    <div class="col-xl-7 col-lg-9 text-center">
                        <h1>팀 목록</h1>
                        <p>가입 가능한 팀 목록을 확인하세요</p>
                    </div>
                </div>

                <!-- Team List Table -->
                <div class="row gy-4 mt-5" data-aos="fade-up" data-aos-delay="100">
                    <div class="col-lg-12">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>팀 이름</th>
                                    <th>활동 지역</th>
                                    <th>팀 실력</th>
                                    <th>현재 인원</th>
                                    <th>관리</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty list}">
                                        <c:set var="startNum" value="${(page.nowPage - 1) * page.numPerPage}"/>
                                        <c:forEach var="team" items="${list}" varStatus="vs">
                                            <tr data-team-no="${team.teamNo}">
                                                <td>${(page.nowPage-1)*page.numPerPage + (vs.index + 1)}</td>
                                                <td>${team.teamName}</td>
                                                <td>${team.teamArea}</td>
                                                <td>${team.teamLevel}</td>
                                                <td>${team.teamCount}/${team.teamLimit}</td>
                                                <td>
                                                    <a href="/teamDetail?team_no=${team.teamNo}" class="btn btn-primary btn-sm">상세 보기</a>
                                                    <a href="/updateTeam?team_no=${team.teamNo}" class="btn btn-warning btn-sm">수정</a>
                                                    <button class="btn btn-danger btn-sm" onclick="deleteTeam(${team.teamNo})">삭제</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="6" class="text-center">등록된 팀이 없습니다.</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Pagination -->
                <c:if test="${not empty page}">
                    <div class="center" data-aos="fade-up" data-aos-delay="200">
                        <div class="pagination">
                            <c:if test="${page.prev}">
                                <c:url var="testUrl" value="/teamList">
                                    <c:param name="nowPage" value="${page.pageBarStart-1}"/>
                                    <c:param name="team_no" value="${page.teamNo}"/>
                                </c:url>
                                <a href="${testUrl}">«</a>
                            </c:if>
                            <c:forEach var="i" begin="${page.pageBarStart}" end="${page.pageBarEnd}">
                                <a href="/teamList?nowPage=${i}&team_no=${empty page.teamNo ? '' : page.teamNo}">${i}</a>
                            </c:forEach>
                            <c:if test="${page.next}">
                                <a href="/teamList?nowPage=${page.pageBarEnd+1}&team_no=${empty page.teamNo ? '' : page.teamNo}">»</a>
                            </c:if>
                        </div>
                    </div>
                </c:if>
            </div>
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
<!-- <script>
	function getTeamLevelName(level){
		switch(level){
		case 1 : return "초보1";
		case 2 : return "초보2";
		case 3 : return "초보3";
		case 4 : return "일반";
		case 5 : return "중급";
		case 6 : return "고급";
		default: return "준프로급";
		}
	}
	const teamLevel = 1;
	const teamLevelName = getTeamLevelName(teamLevel);
	console.log(teamLevelName);
</script> -->

    <script>
        function deleteTeam(teamNo) {
            if (confirm("정말로 삭제하시겠습니까?")) {
                fetch('deleteTeam?teamNo=' + teamNo, {
                    method: 'POST'
                })
                .then(response => {
                    if (response.ok) {
                        alert("삭제되었습니다.");
                        location.reload();
                    } else {
                        alert("삭제 실패했습니다.");
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert("삭제 중 오류가 발생했습니다.");
                });
            }
        }
    </script>
</body>
</html>