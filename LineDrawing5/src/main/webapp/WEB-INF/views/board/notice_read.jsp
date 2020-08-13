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
<script>
	 function deletereally()
	{
		var ret = confirm("게시글을 삭제하시겠습니까?");
		if(ret==true){
			location.href="${root }board/notice_delete?content_idx=${readnoticeContentBean.content_idx}";
		}
		else if(ret==false){
			location.href="${root}board/notice_read?content_idx=${readnoticeContentBean.content_idx}&page=${page}"
		}
	} 
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<div class="container loginform" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<div class="form-group">
							<label for="board_writer_name">작성자</label> <input type="text"
								id="board_writer_name" name="board_writer_name"
								class="form-control"
								value="관리자"
								disabled="disabled" />
						</div>
						<div class="form-group">
							<label for="board_date">작성날짜</label> <input type="text"
								id="board_date" name="board_date" class="form-control"
								value="${readnoticeContentBean.content_date }" disabled="disabled" />
						</div>
						<div class="form-group">
							<label for="board_subject">제목</label> <input type="text"
								id="board_subject" name="board_subject" class="form-control"
								value="${readnoticeContentBean.content_subject }" disabled="disabled" />
						</div>
						<div class="form-group">
							<label for="board_content">내용</label>
							<textarea id="board_content" name="board_content"
								class="form-control" rows="10" style="resize: none"
								disabled="disabled">${readnoticeContentBean.content_text }</textarea>
						</div>
						
						<div class="form-group">
							<div class="text-right">
								<a
									href="${root }board/notice?page=${page}"
									class="btn btn-primary">목록보기</a>
								<c:if
									test="${user_name eq '오지석'}">
									<a
										href="${root }board/notice_modify?&content_idx=${readnoticeContentBean.content_idx}&page=${page}"
										class="btn btn-info">수정하기</a>
									<%-- <a
										href="${root }board/notice_delete?content_idx=${readnoticeContentBean.content_idx}"
										class="btn btn-danger">삭제하기</a> --%>
										
										<a
										href="#"
										class="btn btn-danger" onclick="deletereally()">삭제하기</a>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>



	<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
</body>
</html>