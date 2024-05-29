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

	<div class="container mt-5">
		<div class="row">
			<div class="col-md-8">
				<div class="card border-secondary mb-3">
					<div class="card-body">
						<ol class="list-group list-group-numbered">
							<li class="list-group-item">Khách hàng nhập nội dung là <strong>DONHANG${orderID }</strong>
								khi thanh toán.
							</li>
							<li class="list-group-item">Sau khi thanh toán thành công,
								quý khách liên hệ <strong>SDT/Zalo: 0123456789</strong> để chúng
								tôi xử lý đơn hàng nhanh hơn.
							</li>
							<li class="list-group-item">Thông tin đơn hàng sẽ được cập
								nhật ngay sau khi xử lý đơn hàng.</li>
						</ol>
						<div class="card mt-3">
							<div class="card-body">
								<div class="d-flex align-items-center mb-3">
									<img
										src="https://play-lh.googleusercontent.com/MBMltTFMkP0uV2dmS2BopLdtokWLI1Qs6lI69wYzixldD4hqr93xTAJFvrw5f_I2mQ"
										alt="logo" class="img-fluid" style="max-width: 100px;">
									<h5 class="ml-3 mb-0">MSB - TNEX</h5>
								</div>
								<p>
									<strong>Chuyển khoản MSB - TNEX</strong>
								</p>
								<p>
									<strong>Số tài khoản: </strong>88898017364176
								</p>
								<p>
									<strong>Chủ tài khoản: </strong>PHAM VAN HUNG
								</p>
								<img src="<c:url value="/assets/user/img/banking_qr_code.png"/>"
									alt="QR Code" class="img-fluid">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card border-success mb-3">
					<div class="card-body">
						<h5 class="card-title text-success">Cảm ơn bạn. Đơn hàng của
							bạn đang chờ thanh toán.</h5>
						<p class="card-text">
							<strong>Mã đơn hàng: </strong>${orderID }
						</p>
						<%
						java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy");
						String formattedDate = sdf.format(new java.util.Date());
						%>
						<p class="card-text">
							<strong>Ngày: </strong><%=formattedDate%>
						</p>
						<p class="card-text">
							<strong>Tổng cộng: </strong>
							<fmt:formatNumber value='${total+ 15000 }' type='currency'
								currencySymbol='đ' maxFractionDigits='0' />
						</p>
						<p class="card-text">
							<strong>Phương thức thanh toán: </strong>Chuyển khoản ngân hàng
						</p>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-12">
				<h4>Chi tiết đơn hàng</h4>
				<table class="table table-bordered">
					<thead class="thead-light">
						<tr>
							<th>Sản phẩm</th>
							<th class="text-end">Tổng</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${ cart}">
						<tr>
							<td>${item.product.getProductName()}×${ item.quantity}</td>
							<td class="text-end"><fmt:formatNumber
									value='${item.product.getPrice() * item.quantity}'
									type='currency' currencySymbol='đ' maxFractionDigits='0' /></td>
						</tr>
						</c:forEach>

						<tr>
							<td>Tổng số phụ:</td>
							<td class="text-end"><fmt:formatNumber value='${total}'
									type='currency' currencySymbol='đ' maxFractionDigits='0' /></td>
						</tr>
						<tr>
							<td>Phương thức thanh toán:</td>
							<td class="text-end">Chuyển khoản ngân hàng</td>
						</tr>
						<tr>
							<td><strong>Tổng cộng:</strong></td>
							<td class="text-end"><strong><fmt:formatNumber
										value='${total+ 15000 }' type='currency' currencySymbol='đ'
										maxFractionDigits='0' /></strong></td>
						</tr>
					</tbody>
				</table>
				<div class="text-end mt-3 mb-3">
					<form id="paymentForm" method="post"
						action="order/checkout_success.htm">
						<button type="submit" class="btn btn-success"
							onclick="addParamAndSubmitForm('paymentMethod=banking')">Xác
							nhận đã thanh toán</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		function addParamAndSubmitForm(params) {
			var formAction = document.getElementById('paymentForm')
					.getAttribute('action');

			var urlWithParams = formAction + '?' + params;

			document.getElementById('paymentForm').setAttribute('action',
					urlWithParams);
		}
	</script>
</body>


</html>