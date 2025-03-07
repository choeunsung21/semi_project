<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>OnePage Bootstrap Template</title>
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/resources/css/include/common.css" rel="stylesheet">
</head>
<body class="team-management-page">
  <%@ include file="/views/include/header.jsp" %>
  <main class="main">
    <div class="page-title accent-background">
      <div class="container">
        <h1></h1>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="index.html"></a></li>
            <li class="current"></li>
          </ol>
        </nav>
      </div>
    </div>
    <section id="team-management" class="team-management section">
      <div class="container">
        <div class="row gy-4">
          <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
            <div class="services-list">
              <a href="/insertTeam"></a>
              <a href="/createTeam"></a>
              <a href="/teamList">ù</a>
              <a href="/receiveTeamList"></a>
              <a href="/sendTeamList">ù</a>
              <a href="/updateTeam">ï</a>
              <a href="/deleteTeam">ú</a>
            </div>
          </div>
          <div class="col-lg-8" data-aos="fade-up" data-aos-delay="200">
            <img src="assets/img/team-management.jpg" alt="ÌåÄ Í¥ÄÎ¶¨" class="img-fluid">
            <h3></h3>
            <p></p>
            <ul>
              <li><i class="bi bi-check-circle"></i> <span></span></li>
              <li><i class="bi bi-check-circle"></i> <span></span></li>
              <li><i class="bi bi-check-circle"></i> <span></span></li>
            </ul>
          </div>
        </div>
      </div>
    </section>
  </main>
  <%@ include file="/views/include/footer.jsp" %>
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  <div id="preloader"></div>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="/resources/js/common.js"></script>
</body>
</html>
