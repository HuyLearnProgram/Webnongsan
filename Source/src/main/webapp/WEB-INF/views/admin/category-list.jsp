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
		<div class="col-lg-10">
			<div id="content-wrapper" class="d-flex flex-column">
				<div class="container">
					<!-- Breadcrum -->
					<div class="row mb-8">
						<div class="col-md-12">
							<div class="d-md-flex justify-content-between align-items-center">
								<div>
									<h2>Categories</h2>
									<!-- breacrumb -->
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
											<li class="breadcrumb-item  "><a
												href="admin/dashboard.htm" class="brc-link">Dashboard </a></li>
											<li class="breadcrumb-item active" aria-current="page">Category</li>
										</ol>

									</nav>
								</div>
								<!-- button -->
								<div>
									<a href="admin/category/addcategory.htm"
										class="btn btn-custom">Add New Category</a>
								</div>
							</div>
						</div>
					</div>
					<!--End Breadcrum -->


					<div class="row  ">
						<div class="col-xl-12 col-12 mb-5">
							<div class=" px-6 py-6 p-4">
								<div class="row justify-content-between">
									<div class="col-lg-4 col-md-6 col-12 mb-2 mb-md-0">
										<form class="d-flex" role="search"
											action="admin/category/searchCategory.htm">
											<input class="form-control" type="search"
												placeholder="Search Category" aria-label="Search"
												name="search">
										</form>
									</div>
									<div class="col-xl-2 col-md-4 col-12">
										<div class="dropdown">
											<button class="btn btn-custom dropdown-toggle" type="button"
												data-bs-toggle="dropdown" aria-expanded="false">
												<c:if test="${filter == 0 }">All</c:if>
												<c:if test="${filter == 1 }">Unpublished</c:if>
												<c:if test="${filter == 2 }">Published</c:if>
											</button>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item"
													href="admin/category.htm?filter=0">All</a></li>
												<li><a class="dropdown-item"
													href="admin/category.htm?filter=1">Unpublished</a></li>
												<li><a class="dropdown-item"
													href="admin/category.htm?filter=2">Published</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- End Search  Filter -->
				<!-- table -->
				<div class="table-responsive ">
					<c:choose>
						<c:when test="${categories.size() == 0}">
							<p style="text-align: center; font-size: 22px; color: red;">Không
								có danh mục</p>
						</c:when>
						<c:otherwise>
							<table class="table ">
								<thead class="position-sticky top-0 ">
									<tr class="table-success">
										<th>Image</th>
										<th>Category</th>
										<th>Product Size</th>
										<th>Update</th>
										<th>Delete</th>
										<th>Status</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach varStatus="status" var="item" items="${categories}">
										<tr>
											<td class="align-middle"><c:choose>
													<c:when
														test="${item.image != null && !item.image.trim().isEmpty()}">
														<a href="product/index.htm?categoryId=${item.categoryId}">
															<img src="assets/user/img/category/${item.image}"
															alt="Category Name" style="width: 80px">
														</a>
													</c:when>
													<c:otherwise>
														<a href="product/index.htm?categoryId=${item.categoryId}">
															<img src="assets/user/img/category/default-cate.png"
															alt="Category Name" style="width: 80px">
														</a>
													</c:otherwise>
												</c:choose></td>
											<td class="align-middle"><a
												href="product/index.htm?categoryId=${item.categoryId}"
												class="text-dark">${item.name}</a></td>
											<td class="align-middle">${item.products.size()}</td>
											<td class="align-middle"><a
												href="admin/category/update_category${item.categoryId}.htm"
												class="btn btn-warning btn-sm"> Update</a></td>
											<td class="align-middle">
												<form action="admin/category/delete.htm" method="post">
													<input type="hidden" name="id" value="${item.categoryId}">
													<button type="submit"
														class="btn btn-danger btn-sm ${item.products.size() > 0 ? 'disabled' : ''}">
														Delete</button>
												</form>
											</td>

											<td class="align-middle"><c:if
													test="${item.products.size() > 0}">
													<span class="badge bg-success">Published</span>
												</c:if> <c:if test="${item.products.size() == 0}">
													<span class="badge bg-danger">Unpublished</span>
												</c:if></td>
										</tr>
									</c:forEach>


								</tbody>
							</table>
						</c:otherwise>
					</c:choose>

				</div>
			</div>
		</div>

		<div class="d-flex justify-content-center ">
			<c:if test="${categories.size() > 0 }">
				<nav>
					<ul class="pagination d-flex justify-content-center ms-2">
						<li
							class="page-item ${paginate.currentPage == 1 ? 'disabled' : ''}">
							<a class="page-link mx-1" aria-label="Previous"
							href="admin/category.htm?crrPage=${paginate.currentPage - 1}&filter=${filter}">
								<span aria-hidden="true">«</span>
						</a>
						</li>
						<c:forEach var="i" begin="1" end="${paginate.totalPage}"
							varStatus="in">
							<li class="page-item"><a
								class="page-link mx-1 ${paginate.currentPage == in.count ? 'active' : ''}"
								href="admin/category.htm?crrPage=${in.count}&filter=${filter}">
									${in.count} </a></li>
						</c:forEach>
						<li class="page-item"><a
							class="page-link mx-1 text-body ${paginate.currentPage == paginate.totalPage ? 'disabled' : ''}"
							aria-label="Next"
							href="admin/category.htm?crrPage=${paginate.currentPage + 1}&filter=${filter}">
								<span aria-hidden="true">»</span>
						</a></li>
					</ul>
				</nav>
			</c:if>
		</div>
		</div>
	</div>
</body>
<script src="<c:url value="/assets/js/admin/AlertHandler.js"/>"></script>
</html>