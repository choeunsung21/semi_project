<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

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
  
  <!-- Summernote CSS & JS (Lite 버전) -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-lite.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-lite.min.js"></script>
  

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

		

<style>
.reply-list li {
		    padding: 15px;
		    margin-bottom: 10px;
		    background-color: #f9f9f9;
		    border-radius: 8px;
		    border: 1px solid #e0e0e0;
		    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
		    transition: all 0.3s ease;
		    display: flex; 
		    align-items: center; 
}

.reply-list .edit-btn, .reply-list .delete-btn {
    		margin-left: 10px;
    		padding: 5px 12px;
    		font-size: 14px;
   		 	line-height: 1.2;
   		 	display: inline-block;

}
.reply-list div {
    display: flex;
    justify-content: flex-start; 
    gap: 10px; 
}

.deletereplybtn, .debtn:hover {
            background-color: #dc3545; 
            border-color: #dc3545; 
            color: white; 
}
.deletebtn, .debtn:hover{
			background-color: #dc3545; 
            border-color: #dc3545; 
            color: white; 
}


</style>       

              
              <div class="col-lg-3" data-aos="fade-up" data-aos-delay="100" style="inline-block;">
            	<div class="portfolio-info">
                    
              		<ul>
              			<li id="boardno" style="display: none;">${board.boardNo }</li>
               	 		<li><strong>제목</strong> ${board.boardTitle }</li>
                		<li><strong>작성자</strong>${board.userId }</li>
                		<fmt:parseDate value="${board.regDate }" pattern="yyyy-MM-dd'T'HH:mm" var="thisDate" />
                		<li><strong>등록일</strong><fmt:formatDate value="${thisDate }" pattern="yyyy-MM-dd HH:mm" /></li>
                		<c:if test="${board.regDate != board.modDate }">
                		<fmt:parseDate value="${board.modDate }" pattern="yyyy-MM-dd'T'HH:mm" var="upDate" />
                		<li><strong>수정일</strong><fmt:formatDate value="${upDate }" pattern="yyyy-MM-dd HH:mm" /></li>
                		</c:if>
                		<li><strong>조회수</strong>${board.boardHit }</li>
              		</ul>
                		<%-- <textarea id="summernote" class="" ><c:out>${board.boardContent }</c:out></textarea> --%>
                		<c:out value="${board.boardContent }" escapeXml="false"/>
            	</div>
          	  </div>
          	  
          	  <BR><BR>
          	  
          	  <!-- 게시글을 쓴 사람만 삭제 수정버튼을 보이게 함  -->
          	  <div>
          	  	<c:if test="${sessionScope.user.userNo eq board.writerNo }">
          	  	<button type="submit" class="btn btn-outline-primary updatebtn"  data-boardno="${board.boardNo }">수정</button>
          	  	<button type="submit" class="btn btn-outline-primary deletebtn" data-boardno="${board.boardNo }">삭제</button>
          	  	</c:if>
          	  </div>
          	  
          	  <script type="text/javascript">
          	  	const content = $('#summernote').val();
            	$(document).ready(function() {
              		$('#summernote').summernote({
                		toolbar: false,  
                		airMode: true,   
                		disableDragAndDrop: true 
              		});
            	});
            	
            
             
            	
          	  // 수정 버튼을 누를시
          	  $(function(){
          		  $(".updatebtn").click(function(){
          			  let attachNo = $(this).data("attachno");
          			  let boardTitle = $(this).data("boardtitle");
          			  let boardContent = $(this).data("boardcontent");
          			  let writerNo = $(this).data("writerno");
          			  let boardNo = $(this).data("boardno");
          			  let oriName = $(this).data("oriname");

          			 // console.log("boardno" + boardNo);
          			 // console.log("내가 몇번이니?" + attachNo);
          			  location.href = "/boardUpdate?attachNo=" + attachNo + 
                      "&boardTitle=" + boardTitle + 
                      "&boardContent=" +boardContent + 
                      "&writerNo=" + writerNo +
                      "&boardNo=" + boardNo +
                      "&oriName=" + oriName;
          			  
          		  })
          	  })

     		/* 게시글 삭제 버튼 */
          	$(function() {
          	    $(".deletebtn").click(function() {
          	        let boardNo = $(this).data("boardno");
          	       /*  console.log(boardNo); */
          	       
          	        if (!confirm("정말 삭제하시겠습니까?")) return;

          	        $.ajax({
          	            url: "/boardDelete",
          	            type: "POST",
          	            data: { boardNo: boardNo },
          	          success: function(data) {
          	            if(data.res_code === 200) {
          	                alert("글이 삭제되었습니다!");
          	                location.href = "/selectBoardList";
          	            } else {
          	                location.href = "/";
          	            }
          	        },
          	            error: function(xhr, status, error) {
          	                alert("삭제 실패: " + error);
          	            }
          	        });
          	    });
          	});
          	  
          	  
          	  </script>
          
          	  	<br><br>
          	  	
          	  		<!-- 댓글 목록 파트 -->
          	       <div class="col-lg-3" data-aos="fade-up" data-aos-delay="100" style="inline-block;">
            			<div class="portfolio-info">
                    		<h2>댓글 목록</h2>
              					<ul id="replayList" class="reply-list">
               					
              					</ul>
            			</div>
          	  	  </div>
          	  
   
    	  
  	 <div class="form-box">
    	  <h2>댓글</h2>
    	  <form action="addReplyEndServlet" name="addReply" method="get">
    	  	<input type=hidden id="boardNo" name="boardNo" value="${board.boardNo }">
    	  	<input type=hidden id="attachNo" name="attachNo" value="${board.attachNo }">
    	  	<input type=hidden id="writerNo" name="writerNo" value="${sessionScope.user.userNo }">
    	  	<textarea name="replyContent" rows="2" cols="50" id="replyContent" placeholder="댓글을 입력하세요"></textarea> <br>
    	  	 <br>
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
   //댓글 목록 , userNo 와 writerNo가 같다면 수정 삭제 버튼이 나타남
   $(document).ready(function(){
  	 const boardNo = $('#boardNo').val();
  	 const userNo = $('#writerNo').val();	
  	 $.ajax({
  		    url: "/selectReplyList",
  		    type: "post",
  		    data: { "boardNo": boardNo },
  		    dataType: "json",
  		    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
  		    success: function(data) {
  		        console.log(data);
  		        if (data.list.length === 0) {
  		            $("#replayList").append("<li>댓글이 없습니다</li>");
  		        } else {
  		            for (let i = 0; i < data.list.length; i++) {
  		                let reply = data.list[i];

  		                let replyList = "<li class='replyNo${i}'>" +
  		              		"<textarea id='updatereply' class='updatereply' rows='2' cols='35' style='display: none'>" + reply.replyContent + "</textarea>" +
  		              		" <button type='button' class='btn btn-outline-primary upbtn edit-btn' style='display: none' "  +
          				 	" data-replyno='" + reply.replyNo + "' " +
         				 	" data-replycontent='" + reply.replyContent + "' " +
         				 	" data-boardno='" + reply.boardNo + "' >수정완료</button>" + 
         				 	" <button type='button' class='btn btn-outline-primary debtn delete-btn' style='display: none' " +
         				 	"data-replyno='" + reply.replyNo + "' " +
         				 	"data-boardno='" + reply.boardNo + "'>취소</button>"+
  		                	"<input type='hidden' value='${reply.replyNo}'>" +
  		                    "<span class='writer'>작성자: " + reply.userId + "</span> " +
  		                    "<span class='content'>" + reply.replyContent + "</span> " +
  		                    "<span class='regdate' id='regdate' style='display: block'>" + reply.regDate + "</span>" +
  		                    "<span class='moddate' style='display: none' id='moddate'>" + reply.modDate + "</span>";
  		                   
  		          

  		                if (userNo == reply.writerNo) {
  		                    replyList += " <button type='button' class='btn btn-outline-primary deletereplybtn delete-btn' data-replyno='" 
  		                               + reply.replyNo + "'>삭제</button>";
  		                    replyList += " <button type='button' class='btn btn-outline-primary updatereplybtn edit-btn' " +
  		                 				 " data-replyno='" + reply.replyNo + "' " +
  		                				 " data-replycontent='" + reply.replyContent + "' " +
  		                				 " data-boardno='" + reply.boardNo + "' >수정</button>";
  		                }
  		                replyList += "</li>";
  		                $("#replayList").append(replyList);
  		            }
  		        }
  		    },
  		    complete: function() {
  		        console.log("확인");
  		    },
  		    error: function() {
  		        console.log("에러");
  		    }
  		});
  	 		
  	 		//댓글 수정 버튼
	 	$(document).on("click", ".updatereplybtn", function() {
    		let replyNo = $(this).data("replyno");
    		let replyContent = $(this).data("replycontent");
    		let boardNo = $(this).data("boardno");
    		console.log(replyNo);
    		console.log(replyContent);
    		console.log(boardNo);
    		$(".updatereply").show();
    		
    		//그냥 페이지에 들어가면 보이는 수정 삭제 버튼
    		$(".deletereplybtn").hide();
    		$(".updatereplybtn").hide();
    		
    		//진짜로 내가 댓글수정  버튼
    		$(".debtn").show();
    		$(".upbtn").show();
    		
		});
  	 	
  	 	// 수정완료 말고 수정 들어가서 취소 버튼!
  	 	$(document).on("click",".debtn",function(){
    		$(".deletereplybtn").show();
    		$(".updatereplybtn").show();
    		$(".debtn").hide();
    		$(".upbtn").hide();
    		$(".updatereply").hide();
<%--   	 		let boardNo = $(this).data("boardno");
  	 		location.href = "<%= request.getContextPath() %>/boardDetail?board_no=" + boardNo; --%>
  	 	})
  	 	
  	 	//수정완료 버튼!!!
  	 	$(document).on("click",".upbtn",function(){
  	  		let replyNo = $(this).data("replyno");
    		/* let replyContent = $(this).data("replycontent"); */
    		let replyContent = document.getElementById("updatereply").value;
    		let boardNo = $(this).data("boardno");
  	 		$.ajax({
  	 			url:"/updateReply",
  	 			type:"post",
  	 			data:{"boardNo" : boardNo,
   				  "replyNo" : replyNo,
 				  "replyContent" : replyContent
  	 			},
  	 			dataType:"json",
  	 			contentType:"application/x-www-form-urlencoded; charset=UTF-8",
  	 			success:function(data){
  	 				if(data.res_code === 200){
  	 					alert(data.res_msg);
  	 					location.reload();
  	 				}else{
  	 					alert("댓글수정실패");
  	 				}
  	 			}
  	 		})
  	 	})
  	 		

        	//댓글 삭제 버튼
         $(document).on("click", ".deletereplybtn", function() {
        	let replyNo = $(this).data("replyno");
        	console.log("삭제할 댓글 번호:", replyNo);
        	$.ajax({
        	  url: "/deleteReply",
        	  type: "post",
        	  dataType:"json",
        	  data: { "replyNo": replyNo },
              success: function(data) {
        		   if (data.res_code === 200) {
        		          alert("댓글이 삭제되었습니다");
        		          location.reload();
        		    } else {
        		          alert("댓글 삭제 실패");
        		           }
        		    },
        		    error: function(xhr, status, error) {
        		         console.error("삭제 오류: " + error);
        		    }
        		  });
        	  });
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