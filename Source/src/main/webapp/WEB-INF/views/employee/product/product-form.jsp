<%@include file="/WEB-INF/views/layouts/admin/admin-lib.jsp"%>
<c:if test="${not empty addProdBean }">
	<c:set var="crrBean" value="${addProdBean}" />
	<c:set var="beanName" value="addProdBean" />
	<c:set var="actionString" value="employee/products/create-product.htm" />
	<c:set var="title" value="Create Product" />
</c:if>
<c:if test="${not empty updateProdBean }">
	<c:set var="crrBean" value="${updateProdBean}" />
	<c:set var="beanName" value="updateProdBean" />
	<c:set var="actionString" value="employee/products/update_product/${crrBean.productId}.htm" />
	<c:set var="title" value="Update Product" />
</c:if>

<body>
	<c:if test="${not empty mess}">
		<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
			<div class="alert alert-success alert-dismissible fade show"
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
					file="/WEB-INF/views/layouts/employee/employee-headernav.jsp"%></div>
			<div class="col-lg-10 col-md-12">
				<div id="content-wrapper" class="d-flex flex-column">
					<!-- Main -->
					<div class="container">
						<div class="row mt-3">

							<div class="col-md-12 mb-4">
								<div
									class="d-md-flex justify-content-between align-items-center">
									<!-- pageheader -->
									<div>
										<h2>${title }</h2>
										<!-- breacrumb -->
										<nav aria-label="breadcrumb">
											<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
												<li class="breadcrumb-item  "><a
													href="employee/dashboard.htm" class="brc-link">Dashboard </a></li>
												<li class="breadcrumb-item "><a
													href="employee/products.htm" class="brc-link">Product </a>
												<li class="breadcrumb-item active" aria-current="page"
													class="text-decoration-none">${title }</li>
											</ol>
										</nav>
									</div>
								</div>
							</div>

							<div class=" col-md-6 offset-md-3 card p-5 mb-5">
								<form:form action="${actionString}" method="post"
									modelAttribute="${beanName}" enctype="multipart/form-data"
									class="row">
									<form:input type="hidden" path="productId" class="col-md-12" />
									<div class="col-md-12 mt-2">
										<label for="inputNameProduct" class="form-label mb-2 fw-bold">Product
											Name</label>
										<form:input path="productName" class="form-control"
											id="inputNameProduct" required="true"/>
											<form:errors path="productName" style="color: red;" />
											
									</div>
									<div class="col-md-5">
										<label for="inputCategory" class="form-label mb-2 fw-bold">Category
											Type</label>
										<form:select path="categoryId" id="inputCategory"
											class="form-select" items="${categories}"
											itemValue="categoryId" itemLabel="name"></form:select>
									</div>
									<div class="col-md-3 mt-2">
										<label for="inputQuantity" class="form-label mb-2 fw-bold">Quantity</label>
										<form:input path="quantity" type="number" class="form-control"
											id="inputQuantity" min="0"/>
											<form:errors path="quantity" style="color: red;" />
											
									</div>
									<div class="col-md-3 mt-2">
										<label for="inputUnit" class="form-label mb-2 fw-bold">Unit</label>
										<form:input path="unit" type="text" class="form-control"
											id="inputUnit" />
									</div>
									<c:if test="${not empty updateProdBean }">
										<div class="form-group mt-3">
											<p class="mb-2 fw-bold">Current Image</p>
											<img id="output" class="width-100" style="width: 100px"
												src="<c:url value="/assets/user/img/products/${crrBean.image}" />"
												alt="No Image" />
										</div>
									</c:if>
									<div class="col-md-6 mt-2">
										<label for="inputImage" class="form-label mb-2 fw-bold">Image</label>
										<form:input type="file" class="form-control" id="inputImage"
											path="imageFile" />
									</div>
									<div class="col-md-5 mt-2">
										<label for="inputPrice" class="form-label mb-2 fw-bold">Price</label>
										<form:input path="price" type="number" class="form-control"
											id="inputPrice" min="0" step="1000"/>
										<form:errors path="price" style="color: red;" />
										
									</div>
									<div class="col-md-12 mt-2">
										<div class="form-floating mb-3">
											<form:input type="text" class="form-control" path="detail"
												id="inputDetail" style="height: 60px" />
											<label for="inputDetail" class="form-label mb-2 fw-bold">Detail</label>
										</div>
									</div>
									<div
										class="col-12 mt-2 d-flex align-items-center justify-content-center">
										<button type="submit" class="btn btn-custom">Submit</button>
									</div>
								</form:form>

							</div>
						</div>
					</div>
					<!-- End Main -->
				</div>
			</div>
		</div>
	</div>


</body>
<script src="<c:url value="/assets/js/admin/AlertHandler.js"/>"></script>
</html>
