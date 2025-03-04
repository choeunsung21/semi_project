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
   <!--  부트스트랩 CSS --> <!-- 부트스트랩 cdn방식 나중에 수정 필요 -->
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<!--  kyk include css -->
	<link href="<%= request.getContextPath() %>/resources/css/kyk/kyk.css" rel="stylesheet">	
	<script src ="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
  <!-- =======================================================
  * Template Name: OnePage
  * Template URL: https://bootstrapmade.com/onepage-multipurpose-bootstrap-template/
  * Updated: Aug 07 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
    <title>글쓰기</title>
    <style>
        .container {
            display: flex;
            justify-content: center; 
            align-items: center; 
            height: 100vh; 
        }

        /* 입력 폼 스타일 */
        .form-box {
            width: 2000px; 
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            display: flex;
            flex-direction: column;
        }

        /* 입력 필드 스타일 */
        input, textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        /*  버튼 스타일 */
        button {
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
  
</head>

<body class="starter-page-page">

  <%@ include file="/views/include/header.jsp" %>

   <!-- 전체 페이지 가운데 정렬 -->
    <div class="container">
        <div class="form-box">
            <h2>글쓰기</h2>
            <form action="boardUpdateEndServlet" name="boardUpdate" method="post" enctype="multipart/form-data">
            	<input type="hidden" name="writerNo" value="<c:out value='${writerNo}' />" >
            	<input type="hidden" name="attachNo" value="<c:out value='${attachNo}' />" >
            	<input type="hidden" name="boardNo" value="<c:out value='${boardNo}' />" >
                <input type="text" name="title" value="<c:out value='${boardTitle}' />">
                <input type="file" name="file" accept=".png,.jpg,.jpeg">
                <textarea name="content" rows="5"><c:out value='${boardContent}' /></textarea>
                <button  class="btn btn-outline-primary" onclick="writeUpdate();">수정</button>
            </form>
        </div>
    </div>
    
    <script type="text/javascript">
    const writeUpdate = function(event){
        event.preventDefault(); // 이벤트 기본 동작 방지
        let form = document.boardUpdate;

        // 파일 확장자 검사
        if (form.file.value) {
            const val = form.file.value;
            const idx = val.lastIndexOf('.');
            const type = val.substring(idx + 1);

            if (type === 'jpg' || type === 'png' || type === 'jpeg') {
                updateBoardForm(); // 파일이 있으면 업데이트 함수 실행
            } else {
                alert('이미지 파일만 선택할 수 있습니다!');
                form.file.value = ''; // 잘못된 파일 선택 초기화
            }
        } else {
            updateBoardForm(); // 파일이 없을 때도 업데이트 실행
        }
    };

    const updateBoardForm = function(){
        let form = document.boardUpdate;
        const sendData = new FormData(form);

        $.ajax({
            url: '/boardUpdateEndServlet',
            type: 'post',
            enctype: 'multipart/form-data',
            cache: false,
            contentType: false,
            processData: false,
            data: sendData,
            dataType: 'json',
            success: function(data){
                if (data.res_code === 200) {
                    alert(data.res_msg);
                    location.reload();
                } else {
                    location.href = "/";
                }
            },
            error: function(xhr, status, error){
                console.error("업데이트 오류:", error);
                alert("업데이트 중 오류가 발생했습니다.");
            }
        });
    };
    
    
    </script>
    
    
 

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