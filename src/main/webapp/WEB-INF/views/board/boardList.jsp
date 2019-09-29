<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
	<div align="center">
		<c:choose>
			<c:when test="${sessionScope.userId != null }">
				<a href="boardForm">글쓰기</a>
			</c:when>
			<c:otherwise>

				<c:if test="${sessionScope.UserId != null}">
					<a href="boardForm">글쓰기</a>
				</c:if>

			</c:otherwise>
		</c:choose>

		<table class="table" border="1" style="width: 600px">
			<caption>게시판</caption>
			<colgroup>
				<col width='8%' />
				<col width='*%' />
				<col width='15%' />
				<col width='15%' />
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>등록자</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="listview" items="${listview}" varStatus="status">
					<c:url var="link" value="board1Read">
						<c:param name="brdno" value="${listview.brdno}" />
					</c:url>
					<tr>
						<td><c:out value="${listview.brdno}" /></td>
						<td><a href="${link}"><c:out value="${listview.brdtitle}" /></a></td>
						<td><c:out value="${listview.brdwriter}" /></td>
						<td><c:out value="${listview.brddate}" /></td>
						<td><c:out value="${listview.brdhit}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>