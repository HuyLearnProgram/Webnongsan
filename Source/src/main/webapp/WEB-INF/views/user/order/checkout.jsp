<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/common.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="<c:url value="/assets/user/img/breadcrumb.jpg"/>">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Checkout</h2>
						<div class="breadcrumb__option">
							<a href="./index.html">Home</a> <span>Checkout</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<div class="checkout__form">
			<div class="d-flex flex-fill">
				<h4>Thông tin</h4> 
				<a class="address-link mt-1 ml-4" href="account/ProfilePage.htm">Thay đổi</a>
			</div>
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<div class="row">
							<div class="col-lg-12">
								<div class="checkout__input">
									<p>Tên người mua hàng</p>
									<input type="text" value="${user.getName()}" readonly>
								</div>
							</div>

						</div>
						<div class="row mb-4">
							<div class="col-lg-12">
								<div class="checkout__input">
									<p>
										Address<span></span>
									</p>
									<c:choose>
										<c:when test="${empty user.defaultAddress.getFullAddress()}">
											<div class="d-flex justify-content-between">
												<p style="color: red">Chưa có địa chỉ mặc định</p>
												<a class="address-link" href="account/ProfilePage.htm">Thay
													đổi</a>
											</div>
										</c:when>
										<c:otherwise>
											<input type="text" id="address"
												value="${user.defaultAddress.getFullAddress()}" readonly>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>


						<div class="row">
							<div class="col-lg-6">
								<div class="checkout__input">
									<p>
										Phone<span></span>
									</p>

									<c:choose>
										<c:when test="${empty user.phoneNumber}">
											<div class="d-flex justify-content-between">
												<p style="color: red">Chưa có số điện thoại</p>
												<a class="address-link" href="account/ProfilePage.htm">Thay
													đổi</a>
											</div>
										</c:when>
										<c:otherwise>
											<input type="text" value="${user.phoneNumber}" readonly>
										</c:otherwise>
									</c:choose>

								</div>
							</div>
							<div class="col-lg-6">
								<div class="checkout__input">
									<p>
										Email<span></span>
									</p>
									<input type="text" value="${user.email}" readonly>
								</div>
							</div>
						</div>

					</div>

					<div class="col-lg-6 col-md-6">
						<div class="checkout__order">
							<h4>Đơn hàng</h4>
							<div
								class="checkout__order__products d-flex justify-content-between">
								Sản phẩm <span>Số lượng</span> <span>Thành tiền</span>
							</div>

							<ul>
								<c:set var="totalPrice" value="0" />
								<c:forEach var="item" items="${cart}">
									<c:set var="totalPrice"
										value="${totalPrice + item.product.getPrice() * item.quantity}" />
									<li class="d-flex justify-content-between">
										<p class="col-4 p-0">${item.product.getProductName()}</p> <span
										class="col-4  text-center">${ item.quantity}</span> <span
										class="col-4 p-0 text-right"><fmt:formatNumber
												value='${item.product.getPrice() * item.quantity}'
												type='currency' currencySymbol='đ' maxFractionDigits='0' /></span>
									</li>
								</c:forEach>

							</ul>
							<div class="checkout__order__subtotal">
								Tạm tính <span><fmt:formatNumber value='${totalPrice }'
										type='currency' currencySymbol='đ' maxFractionDigits='0' /></span>
							</div>
							<div class="checkout__order__total">
								Phí vận chuyển <span style="color: #1c1c1c;">15.000 đ</span>
							</div>
							<div class="checkout__order__total">
								Tổng <span><fmt:formatNumber
										value='${totalPrice + 15000 }' type='currency'
										currencySymbol='đ' maxFractionDigits='0' /></span>
							</div>


							<form id="paymentForm" onsubmit="return validateForm()">
								<p>Chọn hình thức thanh toán</p>
								<div>
									<input type="radio" id="cod" name="paymentMethod" value="cod">
									<span class="checkmark"></span> <label for="cod">Thanh
										toán khi nhận hàng</label>
								</div>
								<div>
									<input type="radio" id="banking" name="paymentMethod"
										value="banking"> <span class="checkmark"></span> <label
										for="banking">Chuyển khoản</label>
								</div>
								<c:set var="isDisabled" value="" />
								<c:if test="${empty user.defaultAddress.getFullAddress()}">
									<c:set var="isDisabled" value="disabled" />
								</c:if>
								<c:if test="${empty user.phoneNumber}">
									<c:set var="isDisabled" value="disabled" />
								</c:if>
								<button type="submit" class="site-btn btn ${isDisabled}"
									${isDisabled} id="paymentButton">Thanh toán</button>
							</form>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->
	<script>
		document
				.addEventListener(
						'DOMContentLoaded',
						function() {
							document
									.getElementById('paymentButton')
									.addEventListener(
											'click',
											function(event) {
												var codRadio = document
														.getElementById('cod');
												var bankingRadio = document
														.getElementById('banking');

												if (!codRadio.checked
														&& !bankingRadio.checked) {
													alert("Vui lòng chọn hình thức thanh toán.");
													event.preventDefault();
													return;
												}
											});

							document
									.querySelectorAll(
											'input[name="paymentMethod"]')
									.forEach(
											function(radio) {
												radio
														.addEventListener(
																'change',
																function() {
																	if (this.value === 'cod') {
																		document
																				.getElementById('paymentForm').action = 'order/checkout_success.htm';
																		document
																				.getElementById('paymentForm').method = 'post'
																	} else if (this.value === 'banking') {
																		document
																				.getElementById('paymentForm').action = 'order/checkout_banking.htm';
																		document
																				.getElementById('paymentForm').method = 'get'
																	}
																});
											});
						});
	</script>
</body>


</html>