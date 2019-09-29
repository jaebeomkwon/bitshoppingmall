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
<div class="layout">
		<section class="inner">
			<ul class="grid">
				<c:forEach items="${list}" var="dto">
				<li class="grid-tile">
					<div class="item">
						<a href="productDetail.do?productNo=${dto.productNo}">
						<div class="item-img" style="background-image: url('${path}/resources/images/${dto.pictureUrl}'); background-size: auto auto; background-size: 150%; background-position: center 30%;"></div>
							<div class="item-pnl">
								<div class="pnl-wrapper">
									<div class="pnl-description">
										<span class="pnl-price">${dto.productPrice}원</span>
										<span class="pnl-label">${dto.productName}</span>
										<c:if test="${sessionScope.adminUserId != null}">
										<a href="productEdit.do?productNo=${dto.productNo}">[상품수정]</a>
										</c:if>
									</div>
								</div>
							</div></a>
					</div>
				</li>
				</c:forEach>
			</ul>
		</section>
	</div>
</body>
</html>