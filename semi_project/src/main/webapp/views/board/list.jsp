<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
 

<head>
<meta charset="UTF-8">
<title>자유게시판</title>
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
<link href="<%= request.getContextPath() %>/resources/css/include/common.css" rel="stylesheet" type="text/css"> 
 
 <!--  부트스트랩 CSS --> <!-- 부트스트랩 cdn방식 나중에 수정 필요 -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<!--  kyk include css -->
<link href="<%= request.getContextPath() %>/resources/css/kyk.css" rel="stylesheet">
<script src ="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
<%@ include file="/views/include/header.jsp" %>
<div class="custom-center">
    <h3 class="word mt-4">자유게시판</h3>
</div>
<br>

<table class="table table table-hover">
<thead>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일시</th>
	</tr>
</thead>
<tbody>

	<!-- 아직 데이터가 없음 -->
	<c:choose>
		<c:when test="${not empty list }">
			<c:forEach var="list" items="${list }" varStatus="vs">
				<tr data-board-no="${list.boardNo} ">
					<td>${(page.nowPage-1)*page.numPerPage+ (vs.index + 1) }</td>
					<td>${list.boardTitle }</td>
					<td>${list.userId }</td>
					<fmt:parseDate value="${list.regDate }" pattern="yyyy-MM-dd'T'HH:mm" var="strRegDate"/>
					<td><fmt:formatDate value="${strRegDate }" pattern="yy년MM월dd일 HH시mm분" /></td>
				</tr>
			</c:forEach> 
						</c:when>
					<c:otherwise>
					 <tr>	
						<td colspan="5">조회된 데이터가 없습니다</td>
					 <tr>	
					</c:otherwise>
					
	</c:choose>
</tbody>
</table>
  	<c:if test="${not empty page }">
		<div class="center">
			<div class="pagination">
				<c:if test="${page.prev }">
					<c:url var="testUrl" value="/selectBoardList">
						<c:param name="nowPage" value="${page.pageBarStart-1 }"/>
						<c:param name="board_title" value="${page.boardTitle }" />
					</c:url>
					<a href="${testUrl }">&laquo; </a>
				</c:if>
				<c:forEach var="i" begin="${page.pageBarStart }" end="${page.pageBarEnd }">
					<a href="selectBoardList?nowPage=${i }&board_title=${empty page.boardTitle ? '' : page.boardTitle}">${i } </a>
				</c:forEach>
				<c:if test="${page.next }">
					<a href="/selectBoardList?nowPage=${page.pageBarEnd+1 }&board_title=${empty page.boardTitle ? '' : page.boardTitle}">&raquo; </a>
				</c:if>
			</div>
		</div>
	</c:if>  
<div class="d-flex justify-content-between align-items-center mt-3">
    <!-- 검색창 (왼쪽 정렬) -->
    <form action="/selectBoardList" name="search_board_form" method="get" class="d-flex">
        <input type="text" name="boardTitle" class="search-form me-2"
            placeholder="검색">
        <button type="submit" class="btn btn-outline-primary">검색</button>
    </form>
	<!-- if문으로 세션이 있을 경우 글쓰기로 , 아니면 회원가입 페이지로  페이지로 -->
    <!-- 글쓰기 버튼 (오른쪽 정렬) -->
    <c:choose>
    	<c:when test="${not empty user }">
		    <a href="/boardWrite" class="btn btn-success">글쓰기</a> 	
    	</c:when>
    	<c:otherwise>
    		<a href="/login" class="btn btn-success">글쓰기</a> 	
    	</c:otherwise>
    </c:choose>
</div>
<script>
	//게시글 상세조회 script! -> boardDetail Servlet으로
	$('tbody tr').on('click',function(){
		const boardNo = $(this).data('board-no');
		console.log('게시글 번호가 출력되는가?' + boardNo);
		location.href='/boardDetail?board_no='+boardNo;
	})
</script>

</body>
</html>