<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>받은 신청 목록</title>
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
  <link href="<%= request.getContextPath() %>/resources/css/cjs.css" rel="stylesheet" type="text/css">

  <script src="<%= request.getContextPath() %>/resources/js/jquery-3.7.1.js"></script>

  <!-- =======================================================
  * Template Name: OnePage
  * Template URL: https://bootstrapmade.com/onepage-multipurpose-bootstrap-template/
  * Updated: Aug 07 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<body>
    <%@ include file="/views/include/header.jsp" %>
    <main class="main">
        <div class="page-title accent-background">
            <div class="container">
                <h1 class="text-center">받은 신청 목록</h1>
                <nav class="breadcrumbs">
					<ol>
						<li><a href="javascript:void(0);">내 팀에 가입신청한 유저의 정보를 볼 수 있습니다.</a></li>
					</ol>
				</nav>
            </div>
        </div>
        <section class="section">
            <div class="container">
                <table class="table table-hover text-center">
                    <thead>
                        <tr>
                        	<th>번호</th>
                        	<th>가입신청을 받은 팀</th>
                            <th>신청 유저 아이디</th>
                            <th>선호 포지션</th>
                            <th>하고 싶은 말</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:choose>
                    		<c:when test="${not empty applyList}">
                     			<c:forEach var="apply" items="${applyList}" varStatus="vs">
                       				<input type="hidden" name="apply_no" value="${apply.applyNo}">
                         			
                         			<tr>
                            			<td>${vs.index+1}</td>
                            			<td>${apply.teamName}</td>
                             			<td></td>
                            			<td>${apply.position}</td>
                          		    	<td>${apply.applyExplanation}</td>
                         		    	<td id="status-target-${apply.applyNo}">
    										<c:choose>
       											<c:when test="${apply.status == 'PENDING'}">
            										<button class="btn btn-success btn-sm" onclick="changeStatus(${apply.applyNo}, 'APPROVED')">승인</button>
            										<button class="btn btn-danger btn-sm" onclick="changeStatus(${apply.applyNo}, 'REJECTED')">거절</button>
        										</c:when>
        										<c:when test="${apply.status == 'APPROVED'}">
            										<span style="color: green; font-weight: bold;">승인됨</span>
        										</c:when>
        										<c:when test="${apply.status == 'REJECTED'}">
            										<span style="color: red; font-weight: bold;">거절됨</span>
        										</c:when>
    										</c:choose>
										</td>
                            		</tr>
                       			</c:forEach>
                       		</c:when>
                       		<c:otherwise>
                                <tr>
                                    <td colspan="6">받은 신청이 없습니다.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </section>
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
    
    <script>
    $(function(){
    	let applyNoList = [];
        $("input[name='apply_no']").each(function() {
        	applyNoList.push($(this).val());
        });
        
        $.ajax({
            url: "/SelectUserIdFromApply",
            type: "post",
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            data: {
            	"apply_no": applyNoList.join(',')
            },
            dataType: "json",
            success: function(data){
            	data.forEach(function(userId, index) {
                    $("tr").eq(index+1).find("td").eq(2).text(userId);
                });
            },
            error: function() {
			
            }
        });
    });
    // 버튼을 눌렀을 때 인서트 및 화면단 전환
    const changeStatus = function(applyNo, status){
    	$.ajax({
            url: "/receiveApplyEnd",
            type: "post",
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            data: {
                "apply_no": applyNo,
                "status": status
            },
            success: function(data) {
            	if (data.status === "APPROVED") {
                    $("#status-target-" + applyNo).html('<span style="color: green; font-weight: bold;">승인됨</span>');
                } else if (data.status === "REJECTED") {
                    $("#status-target-" + applyNo).html('<span style="color: red; font-weight: bold;">거절됨</span>');
                } else if (data.status === "PENDING") {
                    if(data.opt_msg == "정원초과") {
						alert("보류 : 해당 팀은 정원이 가득찼습니다.");
                    }
                }
            },
            error: function() {
			
            }
        });
    };
	</script>
</body>
</html>