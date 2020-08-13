<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="en">

<head>

<title>Shop Homepage - Start Bootstrap Template</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap core CSS -->
<link href="${root }resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${root }resources/css/shop-homepage.css" rel="stylesheet">
<script src="${root }resources/vendor/jquery/jquery.min.js"></script>
<script
	src="${root }resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<style>
.margins{
	margin-top:50px;
}


</style>
</head>

<body>
	<!-- 팝업창 -->
 
  



	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-lg-3">

				
				<div class="list-group margins">
					<a href="menual" class="list-group-item trigger">주문 설명서</a> 
					<a href="https://www.instagram.com/ohmyartstorage/" class="list-group-item">인스타공식계정<img src='./resources/images/insta.png' width="50" height="50"></a> 
					
				</div>

			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">

				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block img-fluid"
								src="./resources/images/banner.jpg" alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid"
								src="./resources/images/banner2.jpg" alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid"
								src="./resources/images/banner3.jpg" alt="Third slide">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div><br><br><br>
				<h3 align=center>상품 예제</h3><br>
				
				<div class="row">

					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#"><img class="card-img-top"
								src="./resources/images/p1.jpg" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">효은님 사진</a>
								</h4>
								<h5>6000원 상품</h5>
								<!-- <p class="card-text">후기</p> -->
							</div>
							<!-- <div class="card-footer">
								<button>추천</button>
							</div> -->
						</div>
					</div>

					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#"><img class="card-img-top"
								src="./resources/images/p2.jpg" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">선희님 사진</a>
								</h4>
								<h5>6000원 상품</h5>
							
							</div>
							<!-- <div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div> -->
						</div>
					</div>

					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#"><img class="card-img-top"
								src="./resources/images/p4.jpg" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">진희님 사진</a>
								</h4>
								<h5>6000원 상품</h5>
								
							</div>
							
						</div>
					</div>

					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#"><img class="card-img-top"
								src="./resources/images/p5.jpg" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">동은님 사진</a>
								</h4>
								<h5>6000원 상품</h5>
								
							</div>
							
						</div>
					</div>

					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#"><img class="card-img-top"
								src="./resources/images/p6.jpg" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">소현님 사진</a>
								</h4>
								<h5>6000원 상품</h5>
								
							</div>
							
						</div>
					</div>

					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#"><img class="card-img-top"
								src="./resources/images/p7.jpg" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">민희님 사진</a>
								</h4>
								<h5>6000원 상품</h5>
								
							</div>
							
						</div>
					</div>

				</div>
				<!-- /.row -->

			</div>
			<!-- /.col-lg-9 -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<c:import url="/WEB-INF/views/include/bottom_info.jsp" />




</body>

</html>
