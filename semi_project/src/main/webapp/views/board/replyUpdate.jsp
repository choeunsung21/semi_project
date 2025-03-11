<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>댓글수정</title>
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
  
  <script src ="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
  <link href="<%= request.getContextPath() %>/resources/css/include/common.css" rel="stylesheet" type="text/css">
  <style>
.container {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%; /* 전체 너비 사용 */
    height: 100vh; /* 화면 전체 높이 */
}

.form-box {
    width: 80%; /* 가로 크기를 줄임 */
    max-width: 600px; /* 최대 너비 설정 */
    padding: 40px; /* 패딩 줄이기 */
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    background-color: #fff;
    display: flex;
    flex-direction: column;
    align-items: center; /* 내부 요소를 중앙 정렬 */
}

input, textarea {
    width: 100%;
    padding: 15px; /* 패딩 줄이기 */
    margin: 10px 0;
    border: 1px solid #ddd;
    border-radius: 5px;
}

button {
    padding: 10px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    width: 100%;
}

button:hover {
    background-color: #0056b3;
}
.gobackbtn:hover{
	background-color: #dc3545; 
    border-color: #dc3545; 
    color: white; 
}
.form-box textarea:focus {
    border-color: #007bff; 
    outline: none; 
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.3); 
    border-width: 2px; 
}
</style>



</head>

<body class="index-page">
	<%@ include file="/views/include/header.jsp" %>
		<div class="container">
  		   <div class="form-box" style="border: 2px solid #007bff; padding: 20px; border-radius: 40px;">
    	  		<h2>댓글 수정</h2>
    	  	<form action="replyUpdateEndServlet" name="replyUpdateEndServlet" method="get">
    	  	<input type="hidden" name="replyno" value="<c:out value='${replyNo}' />" >
    	  	<input type="hidden" name="boardno" value="<c:out value='${boardNo}' />" >
    	  	<textarea name="replyContent" rows="2" cols="50" id="replyContent" ><c:out value='${replyContent }'/></textarea> <br>
    		<button type="button" class="btn btn-outline-primary" onclick="updateReply();">입력</button>
    		<button type="button" class="btn btn-outline-primary gobackbtn" onclick="goBackList();">취소</button>
    	  	</form>
    	  </div>
    	 </div>
    	 
	<script type="text/javascript">
		const goBackList = function(){
			location.href="/selectBoardList";
		}
		
		const updateReply = function(){
			let replyNo = $("input[name='replyno']").val();   // hidden input에서 값 가져오기
		    let replyContent = $("#replyContent").val();     // textarea에서 값 가져오기
		    let boardNo = $("input[name='boardno']").val();
		    console.log(replyNo);
		    console.log(replyContent);
		    
		    $.ajax({
		    	url:'/replyUpdateEndServlet',
		    	type:'post',
		    	data:{'replyNo':replyNo, 'replyContent':replyContent},
		    	dataType:'json',
		    	contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		    	success:function(data){
		    		if(data.res_code === 200){
		    			location.href = "<%= request.getContextPath() %>/boardDetail?board_no=" + boardNo;
		    			console.log("성공");
		    		}else{
		    			console.log("실패");
		    		}
		    	}
		    	
		    })
		}
	
	
	</script>



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