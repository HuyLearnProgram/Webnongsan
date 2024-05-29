<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/common.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>
	<div
		class="d-flex justify-content-center align-items-center min-vh-60 mb-5">
		<div class="container-fluid text-center">
			<div class="row justify-content-center">
				<div class="col-md-8 col-lg-7 col-xl-6">
					<div class="card mx-auto border-info">
						<div class="card-body">
							<h5 class="card-title text-success">Đặt hàng thành công!!!</h5>
							<p class="card-text">Cám ơn bạn đã đặt hàng! Shop sẽ xử lý
								đơn hàng của bạn trong thời gian nhanh nhất có thể!</p>
							<p class="card-text">
								Thời gian giao hàng dự kiến <span class="fw-bold"> <fmt:formatDate
										type="both" value="${orders.deliveryTime}"
										pattern="dd-MM-yyyy HH:mm" /> (nội thành HCM)
								</span> và từ 1-3 ngày với các tỉnh thành khác
							</p>
							<a class="btn btn-outline-success card-link" href="index.htm"
								role="button"> <i class="bi bi-house"></i> Quay về trang chủ
							</a> <a class="btn btn-outline-success card-link"
								href="account/OrderHistory.htm" role="button"> <i
								class="bi bi-list-check"></i> Danh sách đơn hàng
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>