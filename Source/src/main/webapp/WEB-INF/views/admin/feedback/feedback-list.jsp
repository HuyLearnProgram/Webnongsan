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
	<div class="container">
		<div class="row">
			<!-- Sidebar -->
			<div class="col-lg-2 d-none d-lg-block"><%@include
					file="/WEB-INF/views/layouts/admin/admin-headernav.jsp"%></div>
			<div class="col-lg-10 col-md-12">
				<div id="content-wrapper" class="d-flex flex-column">
					<div class="container">
						<!-- Breadcrum -->
						<div class="row mb-4">
							<div class="col-md-12">
								<div
									class="d-md-flex justify-content-between align-items-center">
									<div>
										<h2>Feedback</h2>
										<!-- breacrumb -->
										<nav aria-label="breadcrumb">
											<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
												<li class="breadcrumb-item  "><a
													href="admin/dashboard.htm" class="brc-link">Dashboard
												</a></li>
												<li class="breadcrumb-item active" aria-current="page"
													class="text-decoration-none">Feedback</li>
											</ol>

										</nav>
									</div>

								</div>
							</div>
						</div>
						<!--End Breadcrum -->


						<div class="row mb-4 mt-3">
							<div class="col-xl-12 col-12 mb-5">
								<div class="px-6 py-6">
									<div class="row justify-content-between">
										<div class="col-lg-4 col-md-6 col-12 mb-2 mb-md-0">
											<form class="d-flex" role="search"
												action="admin/feedback.htm">
												<label for="search"></label> <input class="form-control"
													type="search" placeholder="Search Review or ID"
													aria-label="Search" name="search" required>
											</form>
										</div>
										<div class="col-xl-2 col-md-4 col-12 d-flex flex-col">
											<p class="mr-4 p-1">Star</p>
											<div class="dropdown">

												<button class="btn btn-custom dropdown-toggle" type="button"
													data-bs-toggle="dropdown" aria-expanded="false">
													<c:if test="${star == null}">All</c:if>
													<c:if test="${star == 1 }">One</c:if>
													<c:if test="${star == 2 }">Two</c:if>
													<c:if test="${star == 3 }">Three</c:if>
													<c:if test="${star == 4 }">Four</c:if>
													<c:if test="${star == 5 }">Five</c:if>
												</button>
												<ul class="dropdown-menu">
													<c:set var="baseURL" value="admin/feedback.htm" />
													<c:if test="${not empty param.search}">
														<c:set var="baseURL"
															value="${baseURL}?search=${param.search}" />
													</c:if>
													<c:choose>
														<c:when test="${empty param.search}">
															<c:set var="separator" value="?" />
														</c:when>
														<c:otherwise>
															<c:set var="separator" value="&" />
														</c:otherwise>
													</c:choose>
													<li><a class="dropdown-item" href="${baseURL}">All</a></li>
													<li><a class="dropdown-item" href="${baseURL}${separator}star=1">One</a></li>
													<li><a class="dropdown-item" href="${baseURL}${separator}star=2">Two</a></li>
													<li><a class="dropdown-item" href="${baseURL}${separator}star=3">Three</a></li>
													<li><a class="dropdown-item" href="${baseURL}${separator}star=4">Four</a></li>
													<li><a class="dropdown-item" href="${baseURL}${separator}star=5">Five</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- End Search  Filter -->
						<!-- table -->
						<div class="table-responsive ">
							<table class="table ">
								<thead class="position-sticky top-0 ">
									<tr class="table-success">
										<th>Id</th>
										<th>Product</th>
										<th>Product Name</th>
										<th>Customer</th>
										<th>Review</th>
										<th>Rating</th>
										<th>Date</th>
										<th>Status</th>
										<th>Enable</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach varStatus="status" var="item" items="${feedbacks}">
										<tr>
											<td class="align-middle">${item.feedbackId }</td>
											<td class="align-middle"><a
												href="product/detail.htm?productId=${item.product.productId }"><img
													style="width: 100px"
													src="assets/user/img/products/${item.product.image}" /></a></td>
											<td class="align-middle"><h6>${item.product.productName}</h6></td>
											<td class="align-middle">${item.account.getName()}</td>
											<td class="align-middle"><div class="text-truncate">${item.feedbackContent}</div></td>

											<td class="align-middle"><c:forEach begin="1" end="5"
													varStatus="index">
													<c:choose>
														<c:when test="${index.count <= item.ratingStar}">
															<i class="bi bi-star-fill text-warning"></i>
														</c:when>
														<c:otherwise>
															<i class="bi bi-star-fill " style="color: #e6e6e6;"></i>
														</c:otherwise>
													</c:choose>
												</c:forEach></td>
											<td class="align-middle"><fmt:formatDate
													value="${item.postingDate}" pattern="dd-MM-yyyy" /></td>
											<td class="align-middle"><c:if
													test="${item.status == 0}">
													<span class="badge bg-danger">Disable</span>
												</c:if> <c:if test="${item.status == 1}">
													<span class="badge bg-success">Enable</span>
												</c:if></td>
											<td class="align-middle"><a
												href="admin/feedback/changestatus.htm?id=${item.feedbackId }"><button
														class="btn btn-success" type="button">
														<c:choose>
															<c:when test="${item.status == 0}">
																<i class="bi bi-lock-fill text-warning "></i>
															</c:when>
															<c:otherwise>
																<i class="bi bi-unlock-fill "></i>
															</c:otherwise>
														</c:choose>
													</button></a></td>


										</tr>
									</c:forEach>
								</tbody>
							</table>


						</div>
					</div>


				</div>

				<div class="d-flex justify-content-center ">
					<c:if test="${feedbacks.size() > 0}">
						<nav>
							<ul class="pagination d-flex justify-content-center ms-2">
								<li
									class="page-item ${(paginate.currentPage == 1) ? 'disabled' : ''}">
									<c:url var="prevPageURL" value="admin/feedback.htm">
										<c:param name="crrPage" value="${paginate.currentPage - 1}" />
										<c:if test="${not empty param.star}">
											<c:param name="star" value="${param.star}" />
										</c:if>
										<c:if test="${not empty param.search}">
											<c:param name="search" value="${param.search}" />
										</c:if>
									</c:url> <a class="page-link mx-1" aria-label="Previous"
									href="${prevPageURL}"> <span aria-hidden="true">&laquo;</span>
								</a>
								</li>
								<c:forEach var="i" begin="1" end="${paginate.totalPage}"
									varStatus="in">
									<li class="page-item"><c:url var="pageURL"
											value="admin/feedback.htm">
											<c:param name="crrPage" value="${in.count}" />
											<c:if test="${not empty param.star}">
												<c:param name="star" value="${param.star}" />
											</c:if>
											<c:if test="${not empty param.search}">
												<c:param name="search" value="${param.search}" />
											</c:if>
										</c:url> <a
										class="page-link mx-1 ${(paginate.currentPage == in.count) ? 'active' : '' }"
										href="${pageURL}"> ${in.count} </a></li>
								</c:forEach>
								<li
									class="page-item ${(paginate.currentPage == paginate.totalPage) ? 'disabled' : '' }">
									<c:url var="nextPageURL" value="admin/feedback.htm">
										<c:param name="crrPage" value="${paginate.currentPage + 1}" />
										<c:if test="${not empty param.star}">
											<c:param name="star" value="${param.star}" />
										</c:if>
										<c:if test="${not empty param.search}">
											<c:param name="search" value="${param.search}" />
										</c:if>
									</c:url> <a class="page-link mx-1 text-body" aria-label="Next"
									href="${nextPageURL}"> <span aria-hidden="true">&raquo;</span>
								</a>
								</li>
							</ul>

						</nav>
					</c:if>
				</div>
				<!--End pagination -->
			</div>
		</div>
	</div>
</body>
<script src="<c:url value="/assets/admin/js/AlertHandler.js"/>"></script>
</html>