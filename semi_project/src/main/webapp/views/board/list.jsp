<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
 

<head>
<style>
@charset "UTF-8";

body {
    font-family: 'Poppins', sans-serif;
    background-color: #f8f9fa;
    margin: 0; 
    padding: 0 200px;
}

.form-select {
 	width: 50px;
    padding: 0.375rem 0.75rem;
    border-radius: 0.25rem;
    border: 1px solid #ced4da;
    box-sizing: border-box;
}

.form-select:focus {
    border-color: #2487ce; 
    outline: none;
    box-shadow: 0 0 5px rgba(36, 135, 206, 0.3); 
    border-width: 2px; 
}

.form-select:hover {
    border-color: #0069d9;
}


.custom-center {
    width: 100%;
    margin: 0 auto;
    text-align: center;
    margin-top: 2rem;
}


.board-table {
    width: 98%; 
    margin: 0 auto; 
    border-collapse: separate; 
    border-spacing: 0; 
    font-family: 'Poppins', sans-serif;
    font-size: 16px; 
    background-color: #fff; 
    border-radius: 16px; 
    overflow: hidden; 
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1); 
    cursor: pointer;
}

.board-table thead {
    background: linear-gradient(135deg, #2487ce, #1a5f92); 
    color: white;
    text-transform: uppercase;
    letter-spacing: 1px; 
    cursor: default;
}

.board-table th, .board-table td {
    padding: 12px 16px; 
    border-bottom: 1px solid #e0e0e0; 
}

.board-table th {
    font-weight: 600;
}

.board-table td {
    color: #444; 
}


.board-table tbody tr:nth-child(odd) {
    background-color: #ffffff; 
}

.board-table tbody tr:nth-child(even) {
    background-color: #f8f9fa; 
}


.board-table tbody tr:hover {
    background-color: rgba(36, 135, 206, 0.15); 
    transition: background-color 0.3s ease; 
}


.pagination {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 6px;
    padding: 20px 0;
    font-family: 'Poppins', sans-serif;
    list-style: none;
}

.pagination .page-item {
    margin: 0 2px; 
}

.pagination .page-link {
    padding: 8px 14px;
    background-color: #fff;
    color: #2487ce;
    border: 1px solid #2487ce;
    border-radius: 6px;
    text-decoration: none;
    font-size: 13px;
    font-weight: 500;
    transition: all 0.3s ease;
}

.pagination .page-link:hover {
    background-color: #2487ce;
    color: #fff;
    border-color: #1a5f92;
    transform: translateY(-1px);
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.pagination .page-item.disabled .page-link {
    background-color: #f5f5f5;
    color: #aaa;
    border-color: #ddd;
    pointer-events: none;
    transform: none;
    box-shadow: none;
}

.pagination .page-item.active .page-link {
    background-color: #2487ce;
    color: #fff;
    border-color: #1a5f92;
    font-weight: 600;
    box-shadow: 0 3px 8px rgba(0, 0, 0, 0.15);
    transform: scale(1);
}

/* 검색창 및 버튼 스타일 */
.search-form {
    width: 200px;
    padding: 0.375rem 0.75rem;
    border-radius: 0.25rem;
    border: 1px solid #ced4da;
    box-sizing: border-box;
}

.search-form:focus {
    border-color: #2487ce; 
    outline: none; 
    box-shadow: 0 0 5px rgba(36, 135, 206, 0.3); 
    border-width: 2px; 
}

.btn {
    width: 100px; 
    height: 40px;
    box-sizing: border-box;
    border-radius: 5px;
}

.btn-outline-primary {
    border-color: #2487ce; 
    color: #2487ce;
}

.btn-outline-primary:hover {
    background-color: #2487ce;
    color: white;
}

.btn-success {
    background-color: #2487ce; 
    border-color: #2487ce;
    color: white;
}

.btn-success:hover {
    background-color: #1a5f92; 
    border-color: #1a5f92;
}


.minitd {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 50px;

</style>


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
<script src ="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
<%@ include file="/views/include/header.jsp" %>
<div class="custom-center">
    <h3 class="word mt-4" id="freeboard">자유게시판</h3>
</div>
<br>

<table class="table table-hover board-table">
<thead>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일시</th>
	</tr>
</thead>
<tbody>

	<!-- 목록 조회 코드 -->
	<c:choose>
		<c:when test="${not empty list }">
			<c:forEach var="list" items="${list }" varStatus="vs">
				<tr data-board-no="${list.boardNo} ">
					<td>${(page.nowPage-1)*page.numPerPage+ (vs.index + 1) }</td>
					<td>${list.boardTitle }</td>
					<td>${list.userId }</td>
					<fmt:parseDate value="${list.regDate }" pattern="yyyy-MM-dd'T'HH:mm" var="strRegDate"/>
					<td><fmt:formatDate value="${strRegDate }" pattern="yyyy년MM월dd일 HH시mm분" /></td>
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
	<!-- 페이징 관련 코드 -->
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
	<!-- 정랼 select창 -->
	<form action="selectBoardList" name="ordertype" method="get" class="d-flex"  id="orderForm" >
      <select name="ordertype" id="ordertype" class="form-select">
    	<option value="-1">선택</option>
    	<option value="1"  <c:if test="${orderType == '1'}">selected</c:if>>최신순</option>
    	<option value="2"  <c:if test="${orderType == '2'}">selected</c:if>>오래된순</option>
      </select> 
	</form>
 
<div class="d-flex justify-content-between align-items-center mt-3">
    <!-- 검색창 (왼쪽 정렬) -->
    <form action="/selectBoardList" name="search_board_form" method="get" class="d-flex" >
        <input type="text" name="boardTitle" class="search-form me-2"
            placeholder="제목과 내용을 입력하세요">
        <button type="submit" class="btn btn-outline-primary">검색</button>
    </form> 
	<!-- if문으로 세션이 있을 경우 글쓰기로 , 아니면 회원가입 페이지로  페이지로 -->
    <!-- 글쓰기 버튼 (오른쪽 정렬) -->
    <c:choose>
    	<c:when test="${not empty user }">
		    <a href="/boardWrite" class="btn btn-success" style="background-color: #2487CE; color: white; border: none;">글쓰기</a> 	
    	</c:when>
    	<c:otherwise>
    		<a href="/login" class="btn btn-success" style="background-color: #2487CE; color: white; border: none;">글쓰기</a> 	
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
	
	//자유게시판을 클릭하면 목록조회로 이동
	$('#freeboard').on('click',function(){
		location.href="/selectBoardList";
	})
	
	//날짜 정렬 select
	$('#ordertype').on('change',function(){
		$('#orderForm').submit();
	})
	
	
	

</script>

</body>
</html>