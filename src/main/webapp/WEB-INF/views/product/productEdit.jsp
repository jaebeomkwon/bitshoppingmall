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
<script src="${path}/ckeditor/ckeditor.js"></script>
<script>
window.onload=function(){
	document.getElementById("productListBtn").onclick=function(){
		location.href="productList.do";
	}
		
	document.getElementById("editBtn").onclick=function(){
		var productName = document.getElementById("productName").value;
		var productPrice = document.getElementById("productPrice").value;
		var reqName = /[가-힣0-9]+/;
		var reqPrice = /[0-9]+/;
		if (productName == ""||!reqName.test(productName)) {
			alert("상품이름을 입력하세요");
			document.getElementById("productName").focus();
			return;
		}
		if (productPrice == ""||!reqPrice.test(productPrice)) {
			alert("가격을 입력하세요");
			document.getElementById("productPrice").focus();
			return;
		}
		document.getElementById("form").action="productUpdate.do";
		document.getElementById("form").submit();
	}
			
	document.getElementById("deleteBtn").onclick=function(){
		if(confirm("삭제하시겠습니까?")){
			 document.getElementById("form").action="productDelete.do";
			 document.getElementById("form").submit();
		} 
	}
};
</script>
</head>
<body>
<%@ include file="../include/menu.jsp"%>
<div align="center">
<h2>상품 정보 수정</h2>
<form id="form" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td>상품명</td>
			<td><input name="productName" id="productName" value="${dto.productName}"></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><input name="productPrice" id="productPrice" value="${dto.productPrice}"></td>
		</tr>
		<tr>
			<td>상품설명</td>
			<td><textarea rows="5" cols="60" name="productDesc" id="productDesc">${dto.productDesc}</textarea>
				<script>
					CKEDITOR.replace("productDesc", {filebrowserUploadUrl:"${path}/imageUpload.do"});
				</script>
			</td>
		</tr>
		<tr>
			<td>상품이미지</td>
			<td><img src="${path}/resources/images/${dto.pictureUrl}" width="150px" height="150px"><br>
				<input type="file" name="file" id="file"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="hidden" name="pictureUrl" value="${dto.pictureUrl}">
				<input type="hidden" name="productNo" value="${dto.productNo}">
				<input type="button" value="수정" id="editBtn">
				<input type="button" value="삭제" id="deleteBtn">
				<input type="button" value="목록" id="productListBtn">
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>
