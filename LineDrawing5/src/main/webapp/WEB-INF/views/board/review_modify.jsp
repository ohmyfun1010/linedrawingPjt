<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
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
						<form:form action="review_modify_pro" method="post"
							modelAttribute="modifyReviewContentBean" enctype="multipart/form-data">
							<form:hidden path="content_idx" />
							<div class="form-group">
								<form:label path="content_writer_name">작성자</form:label>
								<form:input path="content_writer_name" class='form-control'
									readonly="true" />
							</div>
							<div class="form-group">
								<form:label path="content_date">작성날짜</form:label>
								<form:input path="content_date" class='form-control'
									readonly='true' />
							</div>
							<div class="form-group">
								<form:label path="content_subject">제목</form:label>
								<form:input path="content_subject" class='form-control' />
								<form:errors path='content_subject' style='color:red' />
							</div>
							<div class="form-group">
								<form:label path="content_text">내용</form:label>
								<form:textarea path="content_text" class="form-control"
									rows="10" style="resize:none" />
								<form:errors path='content_text' style='color:red' />
							</div>
							<div class="form-group">
								<label for="board_file">첨부 이미지</label>
								<c:if test="${modifyReviewContentBean.content_file != null }">
									<img src="${root }resources/upload/${modifyReviewContentBean.content_file}"
										width="100%" />
								</c:if>
								<form:input path="upload_file" type='file' class="form-control"
									accept="image/*" />
							</div>
							<div class="form-group">
								<div class="text-right">
									<form:button class='btn btn-primary'>수정하기</form:button>
								</div>
							</div>

						</form:form>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>



	<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
</body>
</html>