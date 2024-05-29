<%@include file="/WEB-INF/views/layouts/admin/admin-lib.jsp"%>
<c:if test="${not empty addCate }">
	<c:set var="crrBean" value="${addCate}" />
	<c:set var="nameBean" value="addCate" />
	<c:set var="actionString" value="admin/category/addcategory.htm" />
	<c:set var="title" value="Create Category" />
</c:if>

<c:if test="${not empty updateCate }">
	<c:set var="crrBean" value="${updateCate}" />
	<c:set var="nameBean" value="updateCate" />
	<c:set var="actionString" value="admin/category/update_category.htm?id=${crrBean.id}" />
	<c:set var="title" value="Update Category" />
</c:if>
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
			<div class="col-lg-10">
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
													href="admin/dashboard.htm" class="brc-link">Dashboard </a></li>
												<li class="breadcrumb-item "><a
													href="admin/category.htm" class="brc-link">Category </a>
												<li class="breadcrumb-item active" aria-current="page">${title }</li>
											</ol>

										</nav>
									</div>

								</div>
							</div>

							<div class=" col-md-6 offset-md-3 card p-5 mb-5">
								<form:form action="${actionString }" method="post"
									modelAttribute="${nameBean }" enctype="multipart/form-data">
									<form:input type="hidden" path="id" />
									<div class="form-group ">
										<label for="name-category" class="mb-2 fw-bold">Name
											Category</label>
										<form:input type="text" class="form-control"
											id="name-category" path="name" required="true"/>
											<form:errors path="name" style="color: red;" />
											
									</div>
									<c:if test="${not empty updateCate }">
										<div class="form-group mt-3">
											<p class="mb-2 fw-bold">Current Image</p>
											<img id="output" class="width-100" style="width: 100px"
												src="<c:url value="/assets/user/img/category/${crrBean.image}" />"
												alt="No Image" />
										</div>
									</c:if>
									<div class="form-group mt-3">
										<label for="image" class="mb-2 fw-bold">Change Image</label>
										<form:input id="image" type="file" class="form-control"
											accept="image/*" path="fileImage" />
									</div>
									<button type="submit" class=" mt-3 btn btn-custom">Submit</button>
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