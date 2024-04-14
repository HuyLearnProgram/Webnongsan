<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/user/common.jsp"%>
<head>
<style>
@import url(http://fonts.googleapis.com/css?family=Calibri:400,300,700);

.card-no-border .card {
	border: 0px;
	border-radius: 4px;
	-webkit-box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.05);
	box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.05)
}

.card-body {
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	padding: 1.25rem
}

.comment-widgets .comment-row:hover {
	background: rgba(0, 0, 0, 0.02);
	cursor: pointer;
}

.comment-widgets .comment-row {
	border-bottom: 1px solid rgba(120, 130, 140, 0.13);
	padding: 15px;
}

.comment-widgets {
	display: flex
}

.comment-text:hover {
	visibility: hidden;
}

.comment-text:hover {
	visibility: visible;
}

.label {
	padding: 3px 10px;
	line-height: 13px;
	color: #ffffff;
	font-weight: 400;
	border-radius: 4px;
	font-size: 75%;
}

.round img {
	border-radius: 100%;
}

.label-info {
	background-color: #1976d2;
}

.label-success {
	background-color: green;
}

.label-danger {
	background-color: #ef5350;
}

.action-icons a {
	padding-left: 7px;
	vertical-align: middle;
	color: #99abb4;
}

.action-icons a:hover {
	color: #1976d2;
}

.mt-100 {
	margin-top: 100px
}

.mb-100 {
	margin-bottom: 100px
}

.comment-footer .date {
	margin-right: 10px
}

.comment-text h5 {
	padding-top: 5px
}

.comment-widgets img {
	height: 40px !important;
	width: 40px !important;
}
</style>
</head>
<body>
	<!-- Hero Section Begin -->
	<section class="hero hero-normal">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>Danh mục</span>
						</div>
						<ul>
							<c:forEach var="item" items="${categories}">
								<li><a
									href="<c:url value="/product.htm?categoryId=${item.categoryId }"/>">${item.name }</a></li>
							</c:forEach>

						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="hero__search">
						<div class="hero__search__form">
							<form action="#">
								<div class="hero__search__categories">
									All Categories <span class="arrow_carrot-down"></span>
								</div>
								<input type="text" placeholder="What do yo u need?">
								<button type="submit" class="site-btn">SEARCH</button>
							</form>
						</div>
						<div class="hero__search__phone">
							<div class="hero__search__phone__icon">
								<i class="fa fa-phone"></i>
							</div>
							<div class="hero__search__phone__text">
								<h5>+65 11.188.888</h5>
								<span>support 24/7 time</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="<c:url value="/assets/user/img/breadcrumb.jpg"/>">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Organi Shop</h2>
						<div class="breadcrumb__option">
							<a href="<c:url value="/index.htm" />">Home</a> <span>Shop</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<img class="product__details__pic__item--large"
								src="<c:url value="/assets/user/img/products/${product.image }"/>"
								alt="">
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<h3>${product.productName }</h3>
						<div class="product__details__rating"
							style="display: flex; align-items: center; line-height: 1.2;">
							<div
								style="display: flex; align-items: end; padding: 0 15px 0 0;">
								<div
									style="color: #ee4d2d; border-bottom: 1px solid #ee4d2d; font-size: 1rem; margin-right: 5px">${product.ratingStar}</div>
								<c:set var="countStar" value="0"></c:set>
								<c:forEach begin="1" end="${product.ratingStar }">
									<i class="fa fa-star"
										style="font-size: 16px; height: 17px; width: 18px;"></i>
									<c:set var="countStar" value="${countStar + 1 }"></c:set>
								</c:forEach>
								<c:if test="${product.ratingStar > countStar }">
									<i class="fa fa-star-half-o"
										style="font-size: 16px; height: 17px; width: 18px;"></i>
								</c:if>

							</div>
							<div
								style="display: flex; border-left: 1px solid rgba(0, 0, 0, .14); align-items: end;; padding: 0 15px">
								<span
									style="color: #555; border-bottom: 1px solid #555; font-size: 1rem; margin-right: 5px">${product.reviews }</span>
								<span style="color: #555;">Đánh giá</span>
							</div>
						</div>

						<div class="product__details__price">${product.price }</div>
						<form action="AddCart.htm?productId=${product.productId }"
							method="post" style="display: inline-block;">
							<div class="product__details__quantity">
								<div class="quantity">
									<div class="pro-qty">
										<input name="quantity" type="text" value="1">
									</div>
								</div>
							</div>
							<button type="submit" class="primary-btn" style="border: none">ADD
								TO CARD</button>
						</form>
						<a
							href="<c:url value="/AddWishlist.htm?productId=${product.productId }"/>"
							class="heart-icon"><span class="icon_heart_alt"></span></a>
						<ul>
							<li><b>Đơn vị: </b> <span>${product.unit }</span></li>
							<li><b>Tồn kho: </b> <span>${product.quantity }</span></li>
							<li><b>Share on</b>
								<div class="share">
									<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
										class="fa fa-twitter"></i></a> <a href="#"><i
										class="fa fa-instagram"></i></a> <a href="#"><i
										class="fa fa-pinterest"></i></a>
								</div></li>
						</ul>
					</div>
				</div>

				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">Description</a>
							</li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-2" role="tab" aria-selected="false">Information</a>
							</li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-3" role="tab" aria-selected="false">Reviews <span>(${feedbacks.size() })</span></a>
							</li>
						</ul>

						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="product__details__tab__desc">
									<h6>Thông tin sản phẩm</h6>
									<div class="product-feedback-list">${product.detail }</div>
								</div>
							</div>
							<div class="tab-pane" id="tabs-2" role="tabpanel">
								<div class="product__details__tab__desc">
									<h6>Products Infomation</h6>
									<p>Vestibulum ac diam sit amet quam vehicula elementum sed
										sit amet dui. Pellentesque in ipsum id orci porta dapibus.
										Proin eget tortor risus. Vivamus suscipit tortor eget felis
										porttitor volutpat. Vestibulum ac diam sit amet quam vehicula
										elementum sed sit amet dui. Donec rutrum congue leo eget
										malesuada. Vivamus suscipit tortor eget felis porttitor
										volutpat. Curabitur arcu erat, accumsan id imperdiet et,
										porttitor at sem. Praesent sapien massa, convallis a
										pellentesque nec, egestas non nisi. Vestibulum ac diam sit
										amet quam vehicula elementum sed sit amet dui. Vestibulum ante
										ipsum primis in faucibus orci luctus et ultrices posuere
										cubilia Curae; Donec velit neque, auctor sit amet aliquam vel,
										ullamcorper sit amet ligula. Proin eget tortor risus.</p>
									<p>Praesent sapien massa, convallis a pellentesque nec,
										egestas non nisi. Lorem ipsum dolor sit amet, consectetur
										adipiscing elit. Mauris blandit aliquet elit, eget tincidunt
										nibh pulvinar a. Cras ultricies ligula sed magna dictum porta.
										Cras ultricies ligula sed magna dictum porta. Sed porttitor
										lectus nibh. Mauris blandit aliquet elit, eget tincidunt nibh
										pulvinar a.</p>
								</div>
							</div>
							<div class="tab-pane" id="tabs-3" role="tabpanel">
								<div class="product__details__tab__desc">
									<h6>Đánh giá</h6>
									<div class="d-flex comment-row" style="flex-direction: column">
										<c:forEach var="item" items="${feedbacks }" varStatus="loop">
											<div class="comment-widgets m-b-20">
												<div class="p-2">
													<span class="round"> <img
														src="<c:url value="/assets/user/img/account/${item.account.avatar }"/>"
														alt="User photo" class="user-nav__user-photo">
													</span>
												</div>
												<div class="comment-text w-100 active">
													<h5>${item.account.getName() }</h5>
													<div>
														<c:set var="countStar" value="0"></c:set>
														<c:forEach begin="1" end="${item.ratingStar }">
															<i class="fa fa-star"
																style="font-size: 16px;height:17px;width:18px;margin-right:-2px;color:#EDBB0E;"></i>
															<c:set var="countStar" value="${countStar + 1 }"></c:set>
														</c:forEach>
														<c:if test="${item.ratingStar > countStar }">
															<i class="fa fa-star-half-o"
																style="font-size: 16px; height: 17px; width: 18px;"></i>
														</c:if>
													</div>
													<div class="comment-footer">
														<span class="date">${item.postingDate }</span> <span
															class="label label-success">Đã mua hàng</span> <span
															class="action-icons"> <a href="#" data-abc="true"><i
																class="fa fa-heart"></i></a>
														</span>
													</div>
													<p class="m-b-5 m-t-10">${item.feedbackContent }</p>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Details Section End -->

	<!-- Related Product Section Begin -->
	<section class="related-product">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title related__product__title">
						<h2>Related Product</h2>
					</div>
				</div>
			</div>
			<div class="product__details__pic__slider owl-carousel">
				<c:forEach var="item" items="${relatedProducts }" varStatus="loop">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="<c:url value="/assets/user/img/products/${item.image }"/>">
							<ul class="product__item__pic__hover">
								<li><a
									href="<c:url value="/AddWishlist.htm?productId=${item.productId }"/>"><i
										class="fa fa-heart"></i></a></li>
								<li><a
									href="<c:url value="/product-detail.htm?productId=${item.productId }"/>"><i
										class="fa fa-retweet"></i></a></li>
								<li><a
									href="<c:url value="/AddCart.htm?productId=${item.productId }"/>"><i
										class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a
									href="<c:url value="/product-detail.htm?productId=${item.productId }"/>">${item.productName }</a>
							</h6>
							<h5>${item.price }</h5>
						</div>
					</div>

				</c:forEach>
			</div>

		</div>
	</section>
	<!-- Related Product Section End -->

</body>
