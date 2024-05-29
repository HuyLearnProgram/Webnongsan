<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/common.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="<c:url value='/assets/user/img/breadcrumb.jpg'/>">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Order</h2>
						<div class="breadcrumb__option">
							<a href="./index.html">Home</a><span>Order detail</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	<c:if test="${not empty violate }">
		<div
			class="d-flex flex-column justify-content-center align-items-center m-5">
			<h5 class="text-danger text-center">${violate}</h5>
			<a href="account/OrderHistory.htm" class="btn btn-primary mt-3">Quay
				về</a>
		</div>
	</c:if>
	<c:if test="${empty violate }">
		<div class="container mt-5">
			<div class="order-details-header"
				style="background-color: #f8f9fa; padding: 20px; margin-bottom: 20px;">
				<div class="row">
					<div class="col-md-8">
						<h5>Đơn hàng: ${order.orderId }</h5>
						<p>
							<fmt:formatDate pattern="dd-MM-yyyy HH:mm"
								value="${order.orderTime}" />
						</p>
					</div>
					<div class="col-md-4 text-right">
						<c:choose>
							<c:when test="${order.status == 0 }">
								<c:set var="bargecolor" value="warning"></c:set>
								<c:set var="namestatus" value="Chờ xác nhận"></c:set>
							</c:when>
							<c:when test="${order.status == 1 }">
								<c:set var="bargecolor" value="primary"></c:set>
								<c:set var="namestatus" value="Chờ giao hàng"></c:set>
							</c:when>
							<c:when test="${order.status == 2 }">
								<c:set var="bargecolor" value="success"></c:set>
								<c:set var="namestatus" value="Đã giao hàng"></c:set>
							</c:when>
							<c:when test="${order.status == 3 }">
								<c:set var="bargecolor" value="danger"></c:set>
								<c:set var="namestatus" value="Đã hủy"></c:set>
							</c:when>
						</c:choose>
						<span class="badge badge-${bargecolor }">${namestatus }</span>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-8">
					<div class="card order-summary"
						style="background-color: #f8f9fa; padding: 20px;">
						<div class="card-body">
							<div class="row">
								<div class="col-md-12">
									<h6>Khách hàng</h6>
									<p>${order.account.getName() }</p>
									<p>${order.account.phoneNumber }</p>
									<p>${order.defaultAddress }</p>
								</div>
							</div>

							<table class="table order-items mt-4">
								<thead>
									<tr>
										<th>Tên sản phẩm</th>
										<th>Số lượng</th>
										<th>Đơn giá</th>
										<th>Tổng tiền</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach varStatus="status" var="o" items="${orderDetail}">
										<tr>
											<td>
												<div class="d-flex align-items-center">
													<img
														src="<c:url value='/assets/user/img/products/${o.product.image}'/>"
														alt="Product Image" class="product-img"
														style="width: 50px; height: 50px; margin-right: 10px;">
													<span>${o.product.productName }</span>
												</div>
											</td>
											<td>${o.quantity }</td>
											<td><fmt:formatNumber value="${o.product.price }"
													type="currency" currencySymbol="đ" maxFractionDigits="0" /></td>
											<td><fmt:formatNumber
													value="${o.product.price * o.quantity }" type="currency"
													currencySymbol="đ" maxFractionDigits="0" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-5">
					<div class="card payment-method"
						style="background-color: #f8f9fa; padding: 20px;">
						<div class="card-body">
							<h6>PHƯƠNG THỨC THANH TOÁN</h6>
							<p>${order.paymentMethod}</p>
							<hr>
							<p>
								Tạm tính:
								<fmt:formatNumber value="${order.price - 15000}" type="currency"
									currencySymbol="đ" maxFractionDigits="0" />
							</p>
							<p>
								Phí vận chuyển: <span class="text-success"><fmt:formatNumber
										value="${15000}" type="currency" currencySymbol="đ"
										maxFractionDigits="0" /></span>
							</p>
							<hr>
							<p class="total-amount text-danger"
								style="font-size: 1.2rem; font-weight: bold;">
								Tổng:
								<fmt:formatNumber value="${order.price}" type="currency"
									currencySymbol="đ" maxFractionDigits="0" />
							</p>
							<a href="account/OrderHistory.htm"
								class="btn btn-primary btn-block">Quay về</a>
							<c:if test="${order.status != 0 }">
								<c:set var="isDisabled" value="disabled" />
							</c:if>
							<form id="cancelOrderForm" action="" method="post">
								<a href="order/cancelRequest.htm?orderId=${o.orderId}"
									type="submit"
									class="btn btn-danger btn-block mt-3 ${isDisabled }">Hủy
									yêu cầu</a>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
