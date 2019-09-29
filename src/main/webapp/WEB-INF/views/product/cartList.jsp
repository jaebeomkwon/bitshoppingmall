<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.onload = function() {
		document.getElementById("deleteBtn").onclick = function() {
			if (confirm("장바구니를 비우시겠습니까?")) {
				location.href = "cartDeleteAll.do";
			};
		};
	};
</script>
</head>
<body>
<%@ include file="../include/menu2.jsp"%>
	<div id="app">
		<h2>장바구니</h2>
		<c:choose>
			<c:when test="${count == 0}">
				장바구니가 비었습니다.
			</c:when>
			<c:otherwise>
			<form action="cartUpdate.do" method="post">
				<div class="cart_content">
					<table class="table">
						<thead>
							<th>제품</th>
							<th class="cart_item_price">가격</th>
							<th class="cart_item_qty">수량 <input type="submit" value="전체수량변경"></th>
							<th class="cart_item_tprice">합계</th>
							<th class="cart_item_del"></th>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${list}">
							<input type="hidden" name="cartNo" value="${dto.cartNo}">
							<tr v-for="(item, index) in cartData">
								<!--<td class="cart_item_img"></td> -->
								<td>${dto.productName}</td>
								<td class="cart_item_price">${dto.productPrice}원</td>
								<td class="cart-item_qty">
									<input type="number" name="amount" min="1" value="${dto.amount}">
									<input type="submit" value="변경">
								</td>
								<td class="cart_item_tprice">${dto.money}원</td>
								<td class="list_item_del">
									<c:if test="${sessionScope.userId != null}">
									<a href="cartDelete.do?cartNo=${dto.cartNo}" style="text-decoration: none">삭제</a>
									</c:if>
								</td>
							 </tr>
							 </c:forEach>
						</tbody>
						<tfoot>
							<tr v-if="cartData.length &gt; 0">
                    			<td colspan="4"></td>
                    			<td class="cart_item_tprice">합계 : ${sumMoney}원</td>           
                    		</tr>
                			<tr v-if="cartData.length &gt; 0">
                    			<td colspan="4"></td>
                    			<td class="cart_item_1">배송료 : ${fee}원</td>
                    		</tr>  
                			<tr v-if="cartData.length &gt; 0">
                    			<td colspan="4"></td>
                    			<td class="cart_item_3">총합계 : ${sum}원</td>
                    		</tr>
						</tfoot>
					</table>
					<input type="button" id="deleteBtn" value="장바구니 비우기">
				</div>
			</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>