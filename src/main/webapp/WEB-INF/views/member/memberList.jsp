<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" href="${path}/resources/css/headStyle.css" rel="stylesheet">
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div align="center">
<h2>회원리스트</h2>
<table border="1">
	<tr>
		<td>아이디</td>
		<td>이름</td>
		<td>주소</td>
		<td>전화번호</td>
		<td>이메일</td>
		<td>생년월일</td>
		<td>가입일</td>
	</tr>
	<c:forEach items="${list}" var="dto">
	<tr>
		<td>${dto.userId}</td>
		<td>${dto.name}</td>
		<td>${dto.address}</td>
		<td>${dto.phone}</td>
		<td><a href="emailWrite.do?email=${dto.email}">${dto.email}</a></td>
		<td>${dto.birth}</td>
		<td>${dto.joinDate}</td>
	</tr>
	</c:forEach>
	
</table>
</div>
</body>
</html>