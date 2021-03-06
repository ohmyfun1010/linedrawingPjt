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
		<div class="card shadow">
			<div class="card-body">
				<h4 class="card-title">리뷰 게시판</h4>
				<form action="${root }board/search_pro">
					<div style="float: right;">
						게시글 검색&nbsp;<input type="text" name="content_writer_name"
							value="작성자명을 입력하시오."> <input type="submit" value="검색"><br>
						<br>
					</div>
				</form>


				<%-- ${reviewContentBean.content_writer_name }
				<img scr="${reviewContentBean.content_file }"> --%>
				<table class="table table-hover" id='board_list'>
					<thead>
						<tr>
							<th class="text-center d-none d-md-table-cell">글번호</th>
							<th class="w-50">제목</th>
							<th class="text-center d-none d-md-table-cell">작성자</th>
							<th class="text-center d-none d-md-table-cell">작성날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var='obj' items="${reviewContentBean }">
							<tr>
								<td class="text-center d-none d-md-table-cell">${obj.content_idx }</td>
								<td><a
									href='${root }board/review_read?content_idx=${obj.content_idx}'>${obj.content_subject }</a></td>
								<td class="text-center d-none d-md-table-cell">${obj.content_writer_name }</td>
								<td class="text-center d-none d-md-table-cell">${obj.content_date }</td>

							</tr>
						</c:forEach>

					</tbody>
				</table>
				<div class="d-none d-md-block">
					<ul class="pagination justify-content-center">
						<c:choose>
							<c:when test="${pageButtonBean.prevPage <= 0 }">
								<li class="page-item disabled"><a href="#"
									class="page-link">이전</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a
									href="${root }board/search_pro?pagepage=${pageButtonBean.prevPage}&content_writer_name=${content_writer_name}"
									class="page-link">이전</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach var='idx' begin="${pageButtonBean.min }"
							end="${pageButtonBean.max }">
							<c:choose>
								<c:when test="${idx == pageButtonBean.currentPage }">
									<li class="page-item active"><a
										href="${root }board/search_pro?page=${idx}&content_writer_name=${content_writer_name}" class="page-link">${idx }</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a
										href="${root }board/search_pro?page=${idx}&content_writer_name=${content_writer_name}" class="page-link">${idx }</a>
									</li>
								</c:otherwise>
							</c:choose>

						</c:forEach>


						<c:choose>
							<c:when test="${pageButtonBean.max >= pageButtonBean.pageCnt }">
								<li class="page-item disabled"><a href="#"
									class="page-link">다음</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a
									href="${root }board/search_pro?page=${pageButtonBean.nextPage}&content_writer_name=${content_writer_name}"
									class="page-link">다음</a></li>
							</c:otherwise>
						</c:choose>

					</ul>
				</div>
				<div class="text-right">
					<a href="${root }board/review_write" class="btn btn-primary">글쓰기</a>
				</div>
			</div>
		</div>
	</div>


	<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
</body>
</html>