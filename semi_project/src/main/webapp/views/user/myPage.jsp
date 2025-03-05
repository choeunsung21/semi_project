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
                    내가 쓴 글 수정
                </a>
                <br>
                <a href="">
                    <i class="bi bi-people link-icon"></i>
                    마이팀 정보
                </a>
                <br>
                <a href="">
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
	<!-- 내가 쓴 글 수정 아직 어떻게 할지 고민중..-->
<<div id="write" style="display: none;">
    <div class="section-title" data-aos="fade-up">
        <h3>내가 쓴 글 수정</h3>
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
	
 <!-- a태그를 누르면 변형이 되기 위한 script 태그 -->
 <script>					
 	document.getElementById("changeProfileBtn").addEventListener("click",function(){
 		event.preventDefault();	
 	document.getElementById("myDataForm").style.display = "none";
 	document.getElementById("passWord").style.display = "none";
 	document.getElementById("myDataChangeForm").style.display = "block";
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
 		document.getElementById("passWord").style.display = "block";
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
        console.log("updateWrite 클릭됨");
        // 다른 섹션 숨기고 "내가 쓴 글 수정" 섹션 표시
        document.getElementById("myDataForm").style.display = "none";
        document.getElementById("passWord").style.display = "none";
        document.getElementById("myDataChangeForm").style.display = "none";
        document.getElementById("write").style.display = "block";

        // AJAX 호출로 사용자 글 목록 가져오기
        $.ajax({
        	  url: "/MyPageBoardServlet",
        	  method: "GET",
        	  dataType: "JSON",

      		  success: function(response) {
				
        		for(let i=0; i<response.list.length; i++) {
        			console.log(response.list[i]);
        			document.getElementById('boardListContainer').innerHTML += '<tr id="test" href="#"><td>'+(i+1)+'</td><td>'+response.list[i].boardTitle+'</td><td>'+response.list[i].userId+'</td><td>'+response.list[i].regDate+'</td></tr>';
        		}
        	  },
        	  error: function(xhr, status, error) {
        	    console.error("AJAX 요청 오류:", error);
        	  }
        	});
    });
</script>
	<script>
		$(function(){
			$("#test").click(function(){
				console.log("test")
			})
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