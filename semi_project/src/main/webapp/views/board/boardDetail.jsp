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
  <title>플랜 상세 조회</title>
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
  <script src ="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
  

  <!-- =======================================================
  * Template Name: OnePage
  * Template URL: https://bootstrapmade.com/onepage-multipurpose-bootstrap-template/
  * Updated: Aug 07 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body class="portfolio-details-page">

  <%@ include file="/views/include/header.jsp" %>

  <main class="main">

    <!-- Portfolio Details Section -->
    <section id="portfolio-details" class="portfolio-details section">

      <div class="container" data-aos="fade-up">

		<div class="portfolio-details-slider swiper init-swiper">
          <script type="application/json" class="swiper-config">
            {
              "loop": true,
              "speed": 600,
              "autoplay": {
                "delay": 5000
              },
              "slidesPerView": "auto",
              "navigation": {
                "nextEl": ".swiper-button-next",
                "prevEl": ".swiper-button-prev"
              },
              "pagination": {
                "el": ".swiper-pagination",
                "type": "bullets",
                "clickable": true
              }
            }
          </script>
          <div class="swiper-wrapper align-items-center">

            <div class="swiper-slide">
              <img src="/resources/img/test_1920_1080.png" alt="">
            </div>

            <div class="swiper-slide">
              <img src="assets/img/portfolio/product-1.jpg" alt="">
            </div>

            <div class="swiper-slide">
              <img src="assets/img/portfolio/branding-1.jpg" alt="">
            </div>

            <div class="swiper-slide">
              <img src="assets/img/portfolio/books-1.jpg" alt="">
            </div>

          </div>
          <div class="swiper-button-prev"></div>
          <div class="swiper-button-next"></div>
          <div class="swiper-pagination"></div>
        </div>


              
              <div class="col-lg-3" data-aos="fade-up" data-aos-delay="100" style="inline-block;">
            	<div class="portfolio-info">
                    <h3>게시판 테스트중입니다</h3>
              		<ul>
               	 		<li><strong>제목</strong> ${board.boardTitle }</li>
                		<li><strong>작성자</strong>${board.userId }</li>
                		<fmt:parseDate value="${board.regDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="thisDate" />
                		<li><strong>등록일</strong><fmt:formatDate value="${thisDate }" pattern="yyyy-MM-dd" /></li>
                		<li><strong>내용</strong> ${board.boardContent }</li>
              		</ul>
            	</div>
          	  </div>
          	  	
          	 <div class="col-lg-3" data-aos="fade-up" data-aos-delay="100" style="display:inline-block;">
            	<div class="portfolio-info">
                     
                
              		<ul>  
              			<c:if test="${not empty board.attachNo }">              		
              			<li><img src="<c:url value='/filePath?attach_no=${board.attachNo }'/>"></li> 
                		</c:if>
              		 </ul> 
            	</div>
          	  </div>
          	  
          	       <div class="col-lg-3" data-aos="fade-up" data-aos-delay="100" style="inline-block;">
            	<div class="portfolio-info">
                    <h2>댓글 목록</h2>
              		<ul id="replayList">
               	 	<%-- 	 <li><strong>제목</strong> ${board.boardTitle }</li>
                		<li><strong>작성자</strong>${board.userId }</li>
                		<fmt:parseDate value="${board.regDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="thisDate" />
                		<li><strong>등록일</strong><fmt:formatDate value="${thisDate }" pattern="yyyy-MM-dd" /></li>
                		<li><strong>내용</strong> ${board.boardContent }</li>  --%>
              		</ul>
            	</div>
          	  </div>
          	  
         <div class="form-box">
          	  <h2>댓글</h2>
          	  <form action="addReplyEndServlet" name="addReply" method="get">
          	  	<input type=hidden id="boardNo" name="boardNo" value="${board.boardNo }">
          	  	<input type=hidden id="writerNo" name="writerNo" value="${sessionScope.user.userNo }">
          	  	<textarea name="replyContent" rows="2" cols="50" id="replyContent" placeholder="댓글을 입력하세요"></textarea> <br>
          	  	<c:choose>
          	  		<c:when test="${not empty sessionScope.user.userNo }">
          				<button type="submit" class="btn btn-outline-primary" onclick="writeReply();">입력</button>
          	  		</c:when>
          	  		<c:otherwise>
          	  			<a href="/login" class="btn btn-outline-primary">입력</a> 	
          	  		</c:otherwise>
          	  	</c:choose>
          	  </form>
         </div> 	
         <script type="text/javascript">
         $(document).ready(function(){
        	 const boardNo = $('#boardNo').val();
        	 console.log(boardNo)
        	 $.ajax({
        		 url:"/selectReplyList",
        		 type:"get",
        		 data:{"boardNo" : boardNo},
        		 dataType:"json",
        		 success:function(data){
        			$("#replyList").append("<li>" + "작성자:" + data.userId + " " + data.replyContent + "</li>" )
        		 	console.log(data);        			 
        		 }
        	 })
         })
         
         const writeReply = function(){
        	event.preventDefault();
         	let form = document.addReply;
            let boardNo = $("#boardNo").val();
            let writerNo = $("#writerNo").val();
            let replyContent = $("#replyContent").val();
         	if(!replyContent){
         		alert("댓글을 입력해주세요!");
         		form.replyContent.focus();
         	}else{
         		$.ajax({
         			url:"/addReplyEndServlet",
         			type:"get",
         			data:{"boardNo" : boardNo,
         				  "writerNo" : writerNo,
         				  "replyContent" : replyContent},
         			dataType:"JSON",
         			contentType:"application/x-www-form-urlencoded; charset=UTF-8",
         			success:function(data){
         				if(data.res_code === 200){
         					alert(data.res_msg);
         					location.reload();
         				}else{
         					location.href="/"
         				}
         			}
         		})
         		
         	}
        	 
         }
         
         
         
         
         
         </script>  
			

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