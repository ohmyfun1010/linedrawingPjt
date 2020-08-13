<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
.loginform {
	margin-bottom: 100px;
}
</style>

</head>

<body>

	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<div class="container loginform" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
					<h1 align=center>가격 정보</h1><br>
						
						
						<img src="./resources/images/logo.jpg" width = "500" />
						<h3>Line:4000원, Color:5000원</h3>
						
						<img src="./resources/images/cpb.jpg" width = "500"/>
						<h3>Color+Background:6000원</h3><br><br>
						
						<h3 align=center>※구매 전 유의사항※</h3>
						1.본 상품은 인화되는 상품이 아닙니다. 이메일로 (jpg파일) 보내드립니다.<br><br>
						2.고해상도(원본)사진을 보내주세요.<br>
						너무 작게 나온 전신사진(x)<br>
   						선명하게 나온 사진(o)<br>
   						필터가 너무 들어가지 않은 사진(o)<br><br>
   						
   						3.작가의 스타일이 들어가는 분야이기 때문에 원본사진과 조금 다르다는점 말씀드립니다.<br><br>

						4.복잡한 무늬,악세사리 등 묘사가 복잡한 부분은 단순해 질 수 있습니다.<br><br>
						
						5.작업이 들어간 후, 수정 및 사진을 교체하는건 어렵습니다.<br><br>
						
						6.인스타그램 업로드 or 샘플로 사용될 수 있습니다, 원치 않으신분 께선 미리 먼저 말씀해주세요.<br><br>
						
						7.6000원 상품은 고객님 사진의 인물만 드로잉 한 후 사진의 배경에 포토샵으로 자연스럽게 합성해드립니다.<br><br>
						
						8.수정하거나 판매하는 2차 가공행위는 절대 금합니다.<br><br>
						
						9.작업 순서는 입금 순 입니다.(빠른 시일에 작업물을 받으시려면 선입금 부탁드립니다)<br><br>
						
						<h3 align=center>※입금 계좌※</h3>
						<h5 align=center>부산은행 오지석 07512-0530-410</h5>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/bottom_info.jsp" />

	<!-- Bootstrap core JavaScript -->


</body>

</html>
