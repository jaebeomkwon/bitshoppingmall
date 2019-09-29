<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" href="${path}/resources/css/headStyle.css" rel="stylesheet">
<script>
window.onload=function(){
	document.getElementById("loginBtn").onclick=function(){
		var userId=document.getElementById("userId").value; 
		var password=document.getElementById("password").value;
		if(userId==""){
			alert("아이디를 입력하세요.");
			document.getElementById("userId").focus(); 
			return; 
		}
		if(password==""){
			alert("비밀번호를 입력하세요.");
			document.getElementById("password").focus();
			return;
		}
		document.getElementById("form").submit();
	}
};
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div align="center">
<h2>관리자 로그인</h2>
<form action="adminLoginCheck.do" id="form" method="post">
<table border="1">
	<tr>
		<td>아이디</td>
		<td><input type="text" name="userId" id="userId"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="password" id="password"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" id="loginBtn" value="로그인">
			<c:if test="${message == 'error'}">
				<div>아이디 또는 비밀번호가 일치하지 않습니다.</div>
			</c:if>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>
