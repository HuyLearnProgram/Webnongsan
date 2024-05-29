<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/common.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<style>
.featured__controls ul li a {
	list-style: none;
	font-size: 18px;
	color: #1c1c1c;
	display: inline-block;
	position: relative;
	cursor: pointer;
}
</style>
</head>
<body>
	<!-- Hero Section Begin -->
	<section class="hero">
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
									href="<c:url value="/product.htm?categoryId=${item.categoryId }&currentPage=1"/>">${item.name }</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>

				<div class="col-lg-9">
					<div class="hero__search">
						<%@ include file="/WEB-INF/views/layouts/user/searchbox.jsp"%>
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
					<div class="hero__item set-bg"
						data-setbg="<c:url value="/assets/user/img/hero/banner.jpg"/>">
						<div class="hero__text">
							<span>FRUIT FRESH</span>
							<h2>
								Vegetable <br />100% Organic
							</h2>
							<p>Free Pickup and Delivery Available</p>
							<a href="<c:url value="/product.htm"/>" class="primary-btn">SHOP
								NOW</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Categories Section Begin -->
	<section class="categories">
		<div class="container">
			<div class="row">
				<div class="categories__slider owl-carousel">
					<c:forEach var="item" items="${categories }" varStatus="loop">
						<div class="col-lg-3">
							<div class="categories__item set-bg"
								data-setbg="<c:url value="/assets/user/img/category/${item.image }"/>">
								<h5>
									<a
										href="<c:url value="/product.htm?categoryId=${item.categoryId }&currentPage=1"/>">${item.name }</a>
								</h5>
							</div>

						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
	<!-- Categories Section End -->

	<!-- Featured Section Begin -->
	<section class="featured spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>Featured Product</h2>
					</div>
					<div class="featured__controls">
						<ul style="justify-content: center; border-bottom: 0px"
							class="nav nav-tabs" role="tablist">
							<li class="active mixitup-control-active"><a href="#tabs-0"
								data-toggle="tab" role="tab" aria-selected="true">All</a></li>
							<c:forEach var="item" items="${categories }" varStatus="loop">
								<li><a href="#tabs-${item.categoryId }" data-toggle="tab"
									role="tab" aria-selected="false"> ${item.name }</a></li>
							</c:forEach>

						</ul>
					</div>

				</div>
			</div>



			<div class="tab-content">
				<div class="tab-pane active" id="tabs-0" role="tabpanel">
					<div class="row">
						<c:forEach var="item" items="${products }" begin="0" end="7">
							<div class="col-lg-3 col-md-4 col-sm-6">
								<div class="featured__item">
									<div class="featured__item__pic set-bg"
										data-setbg="<c:url value="/assets/user/img/products/${item.image }"/>">
										<ul class="featured__item__pic__hover">
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
									<div class="featured__item__text">
										<h6>
											<a
												href="<c:url value="/product-detail.htm?productId=${item.productId }"/>">${item.productName }</a>
										</h6>
										<h5>
											<c:set var="formattedPrice">
												<fmt:formatNumber value="${item.price}" type="number"
													maxFractionDigits="0" />
											</c:set>
											${formattedPrice}đ
										</h5>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>
				</div>
				<c:forEach var="category" items="${categories }">
					<div class="tab-pane" id="tabs-${category.categoryId }"
						role="tabpanel">
						<div class="row">
							<c:set var="count" value="0" />
							<c:forEach var="item" items="${products }">

								<c:if
									test="${item.category.categoryId == category.categoryId and count < 8}">
									<div class="col-lg-3 col-md-4 col-sm-6">
										<div class="featured__item">
											<div class="featured__item__pic set-bg"
												data-setbg="<c:url value="/assets/user/img/products/${item.image }"/>">
												<ul class="featured__item__pic__hover">
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
											<div class="featured__item__text">
												<h6>
													<a href="<c:url value="/assets/user/#"/>">${item.productName }</a>
												</h6>
												<h5>
													<c:set var="formattedPrice">
														<fmt:formatNumber value="${item.price}" type="number"
															maxFractionDigits="0" />
													</c:set>
													${formattedPrice}đ
												</h5>

											</div>
										</div>
									</div>
									<c:set var="count" value="${count+1 }" />
								</c:if>
							</c:forEach>

						</div>
					</div>


				</c:forEach>
			</div>
		</div>

	</section>
	<!-- Featured Section End -->

	<!-- Banner Begin -->
	<div class="banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="banner__pic">
						<img src="<c:url value="/assets/user/img/banner/banner-1.jpg"/>"
							alt="">
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="banner__pic">
						<img src="<c:url value="/assets/user/img/banner/banner-2.jpg"/>"
							alt="">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Banner End -->

	<!-- Latest Product Section Begin -->
	<section class="latest-product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6">

					<div class="latest-product__text">
						<h4>Latest Products</h4>

						<c:set var="limitLatestProduct" value="${latestProducts.size()}" />
						<c:if test="${limitLatestProduct > 5 }">
							<c:set var="limitLatestProduct" value="5" />
						</c:if>

						<div class="latest-product__slider owl-carousel">

							<div class="latest-prdouct__slider__item">
								<c:forEach var="item" items="${latestProducts}" varStatus="loop"
									begin="0" end="${limitLatestProduct }">
									<a
										href="<c:url value="/product-detail.htm?productId=${item.productId }"/>"
										class="latest-product__item">
										<div class="latest-product__item__pic">
											<img
												src="<c:url value="/assets/user/img/products/${item.image }"/>"
												alt="">
										</div>
										<div class="latest-product__item__text">
											<h6>${item.productName }</h6>
											<span><c:set var="formattedPrice">
														<fmt:formatNumber value="${item.price}" type="number"
															maxFractionDigits="0" />
													</c:set>
													${formattedPrice}đ
											</span>
										</div>
									</a>
									<c:if
										test="${(loop.index+1) % 3 == 0 || (loop.index+1) == latestProducts.size() }">
							</div>
							<c:if test="${(loop.index+1) < limitLatestProduct }">
								<div class="latest-prdouct__slider__item">
							</c:if>
							</c:if>
							</c:forEach>
						</div>
					</div>

				</div>
				<div class="col-lg-4 col-md-6">
					<div class="latest-product__text">
						<h4>Top Rated Products</h4>
						<div class="latest-product__slider owl-carousel">
							<div class="latest-prdouct__slider__item">
								<c:forEach var="item" items="${ratedProducts}" varStatus="loop"
									begin="0" end="${limitLatestProduct }">
									<a
										href="<c:url value="/product-detail.htm?productId=${item.productId }"/>"
										class="latest-product__item">
										<div class="latest-product__item__pic">
											<img
												src="<c:url value="/assets/user/img/products/${item.image }"/>"
												alt="">
										</div>
										<div class="latest-product__item__text">
											<h6>${item.productName }</h6>
											<span><c:set var="formattedPrice">
														<fmt:formatNumber value="${item.price}" type="number"
															maxFractionDigits="0" />
													</c:set>
													${formattedPrice}đ
											</span>
										</div>
									</a>
									<c:if
										test="${(loop.index+1) % 3 == 0 || (loop.index+1) == latestProducts.size() }">
							</div>
							<c:if test="${(loop.index+1) < limitLatestProduct }">
								<div class="latest-prdouct__slider__item">
							</c:if>
							</c:if>
							</c:forEach>

						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="latest-product__text">
						<h4>Review Products</h4>
						<div class="latest-product__slider owl-carousel">
							<div class="latest-prdouct__slider__item">
								<c:forEach var="item" items="${reviewProducts}" varStatus="loop"
									begin="0" end="${limitLatestProduct }">
									<a
										href="<c:url value="/product-detail.htm?productId=${item.productId }"/>"
										class="latest-product__item">
										<div class="latest-product__item__pic">
											<img
												src="<c:url value="/assets/user/img/products/${item.image }"/>"
												alt="">
										</div>
										<div class="latest-product__item__text">
											<h6>${item.productName }</h6>
											<span><c:set var="formattedPrice">
														<fmt:formatNumber value="${item.price}" type="number"
															maxFractionDigits="0" />
													</c:set>
													${formattedPrice}đ
											</span>
										</div>
									</a>
									<c:if
										test="${(loop.index+1) % 3 == 0 || (loop.index+1) == latestProducts.size() }">
							</div>
							<c:if test="${(loop.index+1) < limitLatestProduct }">
								<div class="latest-prdouct__slider__item">
							</c:if>
							</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Latest Product Section End -->

</body>