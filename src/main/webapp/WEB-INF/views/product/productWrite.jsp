<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
<script>

window.onload=function(){
	document.getElementById("writeBtn").onclick=function(){
		var productName = document.getElementById("productName").value;
		var productPrice = document.getElementById("productPrice").value;
		var reqName = /[가-힣]+/;
		var reqPrice = /[0-9]+/;
		if(productName==""||!reqName.test(productName)){
			alert("상품이름을 입력하세요");
			document.getElementById("productName").focus();
			return;
		}
		if(productPrice==""||!reqPrice.test(productPrice)){
			alert("가격을 입력하세요");
			document.getElementById("productPrice").focus();
			return;
		}
		document.getElementById("form").submit();
	}
}
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div align="center">
<h2>상품 등록</h2>
<script src="${path}/resources/editor/summernote/summernote.js"></script>
<form action="productInsert.do" id="form" method="post" enctype="multipart/form-data">
<table>
	<tr>
		<td>상품명</td>
		<td><input type="text" name="productName" id="productName"></td>
	</tr>
	<tr>
		<td>가격</td>
		<td><input type="text" name="productPrice" id="productPrice"></td>
	</tr>
	<tr>
		<td>상품설명</td>
		<td><textarea rows="5" cols="60" name="productDesc" id="productDesc"></textarea></td>
	</tr>
	<tr>
		<td>상품이미지</td>
		<td><input type="file" name="file " id="file"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" value="등록" id="writeBtn">
			<input type="button" value="목록" id="productListBtn" onclick="location.href='productList.do'">
		</td>
	</tr>
</table>	
</form>
</div>
</body>
</html>
