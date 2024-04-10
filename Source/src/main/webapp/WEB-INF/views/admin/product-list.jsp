<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/admin/admin-lib.jsp"%>

<body>
	<c:if test="${not empty mess}">
		<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
			<div class="  alert alert-success alert-dismissible fade show"
				role="alert">
				${mess }
				<button type="button" class="ms-auto btn-close"
					data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
		</div>
	</c:if>

	<div class="container-fluid">
		<div class="row">
			<!-- Sidebar -->
			<div class="col-lg-2 d-none d-lg-inline">
				<%@include file="/WEB-INF/views/layouts/admin/admin-headernav.jsp"%>
			</div>
			<!-- Content -->
			<div class="col-lg-10">
				<div id="content-wrapper" class="d-flex flex-column">
					<div class="container">
						<!-- Breadcrumb -->
						<div class="row mb-8">
							<div class="col-md-12">
								<div
									class="d-md-flex justify-content-between align-items-center">
									<div>
										<h2>Product</h2>
										<!-- Breadcrumb -->
										<nav aria-label="breadcrumb">
											<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
												<li class="breadcrumb-item"><a
													href="admin/dashboard.htm" class="brc-link">Dashboard</a></li>
												<li class="breadcrumb-item active text-decoration-none">Product</li>
											</ol>
										</nav>
									</div>
									<div>
										<a href="admin/products/create-product.htm"
											class="btn btn-custom">Add New Product</a>
									</div>
								</div>
							</div>
						</div>
						<!-- End Breadcrumb -->

						<!-- Search and Filter -->
						<div class="row">
							<div class="col-xl-12 col-12 mb-5">
								<div class="px-6 py-6 p-4">
									<div class="row justify-content-between">
										<div class="col-lg-4 col-md-6 col-12 mb-2 mb-md-0">
											<form class="d-flex" role="search"
												action="admin/products/searchProduct.htm">
												<input class="form-control" type="search"
													placeholder="Search Products" aria-label="Search"
													name="search">
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- End Search and Filter -->

						<!-- Table -->
						<div class="table-responsive">
							<table class="table">
								<thead class="position-sticky top-0">
									<tr class="table-success">
										<th>Image</th>
										<th>Name</th>
										<th>Category</th>
										<th>Posting Date</th>
										<th>Quantity</th>
										<th>Price</th>
										<th>Update</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach varStatus="status" var="item" items="${products}">
										<tr>
											<td class="align-middle"><a
												href="product/detail.htm?productId=${item.productId}"> <c:choose>
														<c:when test="${empty item.image}">
															<img src="assets/user/img/products/default-product.png"
																alt="Product Name" style="width: 80px">
														</c:when>
														<c:otherwise>
															<img src="assets/user/img/products/${item.image}"
																alt="Product Name" style="width: 80px">
														</c:otherwise>
													</c:choose>
											</a></td>

											<td class="align-middle"><a
												href="product/detail.htm?productId=${item.productId}"
												class="text-dark">${item.productName}</a></td>
											<td class="align-middle"><span>${item.category.name}</span></td>
											<td class="align-middle"><fmt:formatDate
													value="${item.postingDate}" pattern="dd-MM-yyyy" /> <input
												type="hidden" id="postingDate${item.productId}"
												value="${item.postingDate}"></td>
											<td class="align-middle"><span>${item.quantity }</span></td>
											<td class="align-middle"><span class="text-dark fw-bold">
													<fmt:formatNumber value="${item.price }" type="currency"
														currencySymbol="VND" maxFractionDigits="0" />
											</span></td>
											<td class="align-middle"><a
												href="admin/products/update_product/${item.productId}.htm"
												class="btn btn-warning btn-sm"> Update</a></td>
											<td class="align-middle">
												<form action="admin/products/delete.htm" method="post">
													<input type="hidden" name="id" value="${item.productId}">
													<button type="submit"
														class="btn btn-danger btn-sm ${item.orderDetails.size() > 0 ? 'disabled' : ''}">
														Delete</button>
												</form>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

					<div class="d-flex justify-content-center">
						<c:if test="${products.size() > 0 }">
							<!-- Pagination -->
							<nav>
								<ul class="pagination d-flex justify-content-center ms-2">
									<li
										class="page-item ${(paginate.currentPage == 1) ? 'disabled' : ''}">
										<a class="page-link mx-1" aria-label="Previous"
										href="admin/products.htm?crrPage=${paginate.currentPage - 1}">
											<span aria-hidden="true">&laquo;</span>
									</a>
									</li>
									<c:forEach var="i" begin="1" end="${paginate.totalPage}"
										varStatus="in">
										<li class="page-item"><a
											class="page-link mx-1 ${(paginate.currentPage == in.count) ? 'active' : '' }"
											href="admin/products.htm?crrPage=${in.count}">${in.count}</a>
										</li>
									</c:forEach>
									<li class="page-item"><a
										class="page-link mx-1 text-body ${(paginate.currentPage == paginate.totalPage) ? 'disabled' : '' }"
										aria-label="Next"
										href="admin/products.htm?crrPage=${paginate.currentPage + 1}">
											<span aria-hidden="true">&raquo;</span>
									</a></li>
								</ul>
							</nav>
						</c:if>
					</div>
					<!-- End Pagination -->
				</div>
			</div>
		</div>
	</div>

	<script src="<c:url value="/assets/admin/js/AlertHandler.js"/>"></script>
</body>
</html>
