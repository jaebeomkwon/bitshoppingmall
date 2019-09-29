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
<%@ include file="../include/menu.jsp"%>
<div class="shCMSshop">
	<div class="shopView">
		<div class="viewHeader">
			<!-- 상품이미지 -->
			<div class="productImg">
				<div class="mainImg">
					<div class="item-img1" style="background-image: url('${path}/resources/images/${dto.pictureUrl}'); background-size: auto auto; background-size: 150%; background-position: center 50%;"></div>
				</div>
			</div>
			<!-- 상품 설명 -->
			<div class="productInfo">
				<h3>${dto.productName}</h3>
				<div class="price">
					<span class="cost-price">${dto.productPrice}원</span>
				</div>
				<div class="manufact">제조사 <span>한솔주식회사</span></div>
				<div class="categori">판매원 <span>BIT</span></div>
				<div class="origin">상품설명 <span>${dto.productDesc}</span></div>
			<form action="cartInsert.do" method="post">
			<input type="hidden" name="productNo" value="${dto.productNo}">
				<div class="items">
				<div class="buy">구매수량 &nbsp;<input type="number" class="span1" name="amount" min="1" value="1" style="width:120px"/>
            </div>
			<div class="btn">
				<input type="submit" value="장바구니">
			</div>
			</form>
		</div>
	</div> 
</div>
<!-- 하단의 탭부분 시작 -->
<h1>후기</h1>
<div class="scone">
	<c:forEach items="${cList}" var="cDto">
	<div class="scone__jam">      
    	<div class="scone__name">${cDto.userId}</div>
        <div class="scone_date">${cDto.commentDate}</div>
 	 	<div class="scone_cream">
     		<div class="card__body">${cDto.commentContent}</div>
  		</div>
	</div>
	<div>
		<c:if test="${cDto.userId==sessionScope.userId}">
		<a href="commentDelete.do?commentNo=${cDto.commentNo}&productNo=${dto.productNo}">삭제</a>
		</c:if>
		<c:if test="${sessionScope.adminUserId != null}">
		<a href="commentDelete.do?commentNo=${cDto.commentNo}&productNo=${dto.productNo}">삭제</a>
		</c:if>
	</div>
	</c:forEach>
</div>  
<hr>
<c:if test="${sessionScope.userId !=null }">
<form action="commentWrite.do" id="feedback" method="post">
<input type="hidden" name="productNo" value="${dto.productNo}">
<div class="pinfo">후기 작성</div>
<div class="form-group">
	<div class="input-group">
  		<span class="input-group-addon">내용</span>
  		<textarea name="commentContent" class="form-control"></textarea>
    </div>
</div>
<input type="submit" class="btn btn-primary" value="등록">
</form>
</c:if>
</body>
</html>