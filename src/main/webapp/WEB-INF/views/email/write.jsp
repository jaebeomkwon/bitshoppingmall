<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" href="${path}/resources/css/headStyle.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="${path}/ckeditor/ckeditor.js"></script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<div align="center">
    <h2>이메일 보내기</h2>
   
	<form method="post" action="emailSend.do" id="sendForm" enctype="multipart/form-data">
		<table>
		<tr>
		<td>보내는 사람</td>
		<td><input name="senderName" value="${sessionScope.adminName}" size="90" style="width: 99%"></td>
		</tr>
		
		<tr>
		<td>받는 사람</td>
		<td><input name="receiveMail" value="${email}" size="90" style="width: 99%"></td>
		</tr>
		
		<tr>
		<td>제목</td>
		<td><input name="subject" size="91" style="width: 99%"></td>
		</tr>
		
		<tr>
		<td>이미지</td>
		<td><input type="file" name="file" id="file"></td>
		</tr>
		
		</table>
		<textarea rows="5" cols="80" name="message" id="message"></textarea>
		<script>
			CKEDITOR.replace('message', {
				height : 400,
				width : 700
			});
		</script>
		<input type="submit" value="보내기">
		
	</form>
	${message}
	</div>
</body>
</html>
