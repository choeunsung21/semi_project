<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>팀 목록</title>
</head>
<body>
    <form action="<c:url value='/receiveTeamList'/>" id="searchFrm">
        <fieldset>
            <legend>검색하기</legend>
            <input type="text" name="user_title" placeholder="제목">
            <input type="text" name="user_content" placeholder="내용">
            <input type="text" name="user_name" placeholder="작성자">
            <input type="submit" value="조회">
        </fieldset>
        <fieldset>
            <legend>정렬하기</legend>
            <select name="order_type" id="order_type">
                <option value="-1">선택</option>
                <option value="2">최신순</option>
                <option value="3">오래된순</option>
            </select>
        </fieldset>
    </form>
    <script>
        const orderType = document.getElementById('order_type');
        	orderType.onchange = function() {
            document.getElementById('searchFrm').submit();
        }
    </script>
    <table border="1">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>내용</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${empty resultList}">
                    <tr>
                        <td colspan="3">게시글이 없습니다.</td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${resultList}" var="u" varStatus="vs">
                        <tr>
                            <td><c:out value="${vs.index + 1 + (currentPage - 1) * pageSize}"/></td>
                            <td><c:out value="${u.userTitle}"/></td>
                            <td><c:out value="${u.userContent}"/></td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>

    <div>
        <c:if test="${totalPages > 1}">
            <nav>
                <ul class="pagination">
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="${i == currentPage ? 'active' : ''}">
                            <a href="<c:url value='/teamList'/>?page=${i}&user_title=${param.user_title}&user_content=${param.user_content}&user_name=${param.user_name}&order_type=${param.order_type}">${i}</a>
                        </li>
                    </c:forEach>
                </ul>
            </nav>
        </c:if>
    </div>
</body>
</html>