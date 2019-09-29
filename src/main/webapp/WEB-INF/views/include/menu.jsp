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
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link href="${path}/resources/editor/summernote/summernote.css" rel="stylesheet">

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 


<script type="text/javascript">
$(function(){
	$('.h1').click(function(){
		//alert('aa');
		location.href="productList.do";
	});
	
	$('#productDesc').summernote();
});
</script>
</head>
<body>
<div class="top-Login">
	<c:choose>
		<c:when test="${sessionScope.userId == null }">
			<ul>
				<li><a href="adminLogin.do" style="text-decoration: none">관리자 로그인</a></li>
				<li><a href="memberLogin.do" style="text-decoration: none">로그인</a></li>
			</ul>
		</c:when>
		<c:otherwise>
			<ul>
				${sessionScope.name} 님이 로그인중입니다.
				<c:if test="${sessionScope.adminUserId == null}">
					<li><a href="updateLogin.do" style="text-decoration: none">회원정보수정</a></li>
					<li><a href="memberLogout.do" style="text-decoration: none">로그아웃</a></li>
				</c:if>
				<c:if test="${sessionScope.adminUserId != null}">
					<li><a href="adminLogout.do" style="text-decoration: none">로그아웃</a></li>
				</c:if>
			</ul>
		</c:otherwise>
	</c:choose>
</div>
<header class="header">
	<div class="container">
		<button class="toggle">
			<i class="fa fa-bars"></i>
		</button>
		<h2 class='h1'>
			<i class="fa fa-tree"></i>한솔이의 야채가게
		</h2>
	</div>
	<nav>
		<ul>
			<li><a href="${path}/">Home</a></li>
			<li><a href="boardList.do">Q&A</a></li>
			<li><a href="productList.do">상품리스트</a></li>
			<c:if test="${sessionScope.adminUserId != null}">
				<li><a href="productWrite.do">상품등록</a></li>
			</c:if>
			<c:if test="${sessionScope.adminUserId == null}">
				<c:if test="${sessionScope.userId != null}">
					<li><a href="cartList.do">장바구니</a></li>
				</c:if>
			</c:if>
			<c:if test="${sessionScope.adminUserId != null}">
				<li><a href="memberList.do">회원목록</a></li>
			</c:if>
		</ul>
	</nav>
</header>
</body>
</html>